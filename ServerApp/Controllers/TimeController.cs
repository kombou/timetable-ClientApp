using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ServerApp.entity;
using ServerApp.Models;
using ServerApp.Repositories.Contracts;
using ServerApp.services;

namespace ServerApp.Controllers
{
    [Route("api/times")]
    public class TimeController : Controller
    {
        private ITimeRepository repository;
        private IPeriodeRepository periodeRepository;
        private IJourRepository jourRepository;
        private ISalleRepository salleRepository;
        private IProgrammeRepository programmeRepository;
        private IEnseignantRepository enseignantRepository;
        ITimeService service;

        public TimeController(
            ITimeRepository repository,
            IPeriodeRepository periodeRepository,
            IJourRepository jourRepository,
            ISalleRepository salleRepository,
            IProgrammeRepository programmeRepository,
            IEnseignantRepository enseignantRepository,
            ITimeService service
            )
        {
            this.repository = repository;
            this.periodeRepository = periodeRepository;
            this.jourRepository = jourRepository;
            this.salleRepository = salleRepository;
            this.programmeRepository = programmeRepository;
            this.enseignantRepository = enseignantRepository;
            this.service = service;
        }

        [HttpPost(Name ="/classe")]
        public IEnumerable<Time> TimeTableOfClasse([FromBody] Classe classe, int semestre) => repository.TimeTableOfClasse(classe,semestre);

        [HttpPost("enseignant/{semestre}")]
        public IEnumerable<Time> TimeTableOfEnseignant([FromBody] Enseignant enseignant, int semestre) => repository.TimeTableOfEnseignant(enseignant,semestre);

        [HttpPost("salle/{semestre}")]
        public IEnumerable<Time> TimeTableOfSalwle([FromBody] Salle salle, int semestre) => repository.TimeTableOfSalle(salle,semestre);

        [HttpPost("{semestre}")]
        public async Task<IActionResult> Add([FromBody] Time time, int semestre)
        {

            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("time", "formulaire invalide");

                return BadRequest(ModelState);
            }

            if (!periodeRepository.PeriodeExists(time.Idperiode))
            {
                ModelState.AddModelError("periode", "Cette periode n'existe pas");

                return BadRequest(ModelState);
            }

            if (!jourRepository.JourExists(time.Idjour))
            {
                ModelState.AddModelError("jour", "Ce jour n'existe pas");

                return BadRequest(ModelState);
            }

            if (!salleRepository.SalleExists(time.Idsalle))
            {
                ModelState.AddModelError("salle", "Cet salle n'existe pas");

                return BadRequest(ModelState);
            }

            if (!programmeRepository.ProgrammeExists(time.Idprogramme))
            {
                ModelState.AddModelError("programme", "Cet ue n'existe pas");

                return BadRequest(ModelState);
            }

            Periode periode = periodeRepository[time.Idperiode];
            Jour jour = jourRepository[time.Idjour];

            ModelPeriode modelPeriode = new ModelPeriode();
            modelPeriode.SetModelPeriode(periode, jour);

            Salle salle = salleRepository[time.Idsalle];
            Programme programme = programmeRepository[time.Idprogramme];
            Enseignant enseignant = enseignantRepository[programme.Enseignant];

            //verifion que la salle est libre

            foreach (var t in repository.TimeTableOfSalle(salle, semestre))
            {
                Periode p = periodeRepository[t.Idperiode];
                Jour j = jourRepository[t.Idjour];

                ModelPeriode model = new ModelPeriode();
                model.SetModelPeriode(p, j);

                if (modelPeriode.OverLap(model))
                {
                    ModelState.AddModelError("salle", $"La salle {salle.Nom} n'est pas libre le {j.Nom} de {model.Debut.Hour}h{model.Debut.Minute} à {model.Fin.Hour}h{model.Fin.Minute}.");
                    return BadRequest(ModelState);

                }
            }

            //verifion si l'enseigiant es libre
            foreach (var t in repository.TimeTableOfEnseignant(enseignant, semestre))
            {
                Periode p = periodeRepository[t.Idperiode];
                Jour j = jourRepository[t.Idjour];

                ModelPeriode model = new ModelPeriode();
                model.SetModelPeriode(p, j);

                if (modelPeriode.OverLap(model))
                {
                    ModelState.AddModelError("enseignant", $"L'enseignant {enseignant.Nom} n'est pas libre le {j.Nom} de {model.Debut.Hour}h{model.Debut.Minute} à {model.Fin.Hour}h{model.Fin.Minute}.");
                    return BadRequest(ModelState);

                }
            }

            //time = repository.Save(time);

            return Ok(time);
        }
    }
}