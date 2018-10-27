using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ServerApp.entity;
using ServerApp.Repositories.Contracts;

namespace ServerApp.Controllers
{
    [Route("api/jours")]
    public class JourController : Controller
    {
        IJourRepository repository;
        public JourController(IJourRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet("{id}")]
        public Jour Get(int id) => repository[id];

        [HttpGet]
        public IEnumerable<Jour> List() => repository.List();
    }
}