using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ServerApp.entity;
using ServerApp.Repositories.Contracts;

namespace ServerApp.Controllers
{
    [Route("api/enseignants")]
    public class EnseignantController : Controller
    {
        readonly IEnseignantRepository repository;
        public EnseignantController(IEnseignantRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet]
        public IEnumerable<Enseignant> List() => repository.List();
    }
}