using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ServerApp.entity;
using ServerApp.Repositories.Contracts;

namespace ServerApp.Controllers
{
    [Route("api/salles")]
    public class SalleController : Controller
    {
        readonly ISalleRepository repository;

        public SalleController(ISalleRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet]
        public IEnumerable<Salle> List() => repository.List();

        [HttpGet("{id}")]
        public Salle Get(int id) => repository[id];
    }
}