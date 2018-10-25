using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ServerApp.entity;
using ServerApp.Repositories.Contracts;

namespace ServerApp.Controllers
{
    [Route("api/periodes")]
    public class PeriodeController : Controller
    {
        readonly IPeriodeRepository repository;
        readonly ITimeRepository timeRepository;
        public PeriodeController(
            IPeriodeRepository repository,
             ITimeRepository timeRepository
            )
        {
            this.repository = repository;
            this.timeRepository = timeRepository;
        }

        public Periode Add([FromBody] Periode periode) => repository.Save(periode);

        [HttpGet("classe/{idClasse}")]
        public IEnumerable<Periode> PeriodesOfClasse(int idClasse) => timeRepository.PeriodesOfClasse(idClasse);

        [HttpGet("salle/{idSalle}")]
        public IEnumerable<Periode> PeriodesOfSalle(int idSalle) => timeRepository.PeriodesOfSalle(idSalle);

        [HttpGet("enseignant/{idEnseignant}")]
        public IEnumerable<Periode> PeriodesOfEnseignant(int idEnseignant) => timeRepository.PeriodesOfEnseignant(idEnseignant);
    }
}