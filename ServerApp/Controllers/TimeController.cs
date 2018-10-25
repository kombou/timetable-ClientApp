using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ServerApp.entity;
using ServerApp.Repositories.Contracts;

namespace ServerApp.Controllers
{
    [Route("api/times")]
    public class TimeController : Controller
    {
        private ITimeRepository repository;
        public TimeController(ITimeRepository repository)
        {
            this.repository = repository;
        }

        [HttpPost("classe/{semestre}")]
        public IEnumerable<Time> TimeTableOfClasse([FromBody] Classe classe, int semestre) => repository.TimeTableOfClasse(classe,semestre);

        [HttpPost("enseignant/{semestre}")]
        public IEnumerable<Time> TimeTableOfEnseignant([FromBody] Enseignant enseignant, int semestre) => repository.TimeTableOfEnseignant(enseignant,semestre);

        [HttpPost("salle/{semestre}")]
        public IEnumerable<Time> TimeTableOfSalle([FromBody] Salle salle, int semestre) => repository.TimeTableOfSalle(salle,semestre);
    }
}