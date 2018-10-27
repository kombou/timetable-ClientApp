using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ServerApp.entity;
using ServerApp.Repositories.Contracts;

namespace ServerApp.Controllers
{
    [Route("api/programmes")]
    public class ProgrammeController : Controller
    {
        IProgrammeRepository repository;
        public ProgrammeController(IProgrammeRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet("{id}")]
        public Programme Get(int id) => repository[id];

        [HttpGet]
        public IEnumerable<Programme> List() => repository.List();
    }
}