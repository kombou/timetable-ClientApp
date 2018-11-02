using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using ServerApp.entity;
using ServerApp.Repositories.Contracts;

namespace ServerApp.Controllers
{
    [Route("api/comptes")]
    public class CompteController : Controller
    {
        ICompteRepository repository;
        public CompteController(ICompteRepository repository)
        {
            this.repository = repository;
        }
        [HttpPost]
        public async Task<IActionResult> Login([FromBody] Compte compte)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("compte", "Invalide");
                return BadRequest(ModelState);
            }

            if (!repository.FindByMatricule(compte.Matricule))
            {
                ModelState.AddModelError("Matricule", "Ce matricule ne possède pas de compte");
                return BadRequest(ModelState);
            }

            var current = await repository.Find(compte.Matricule);

            if (compte.Passhash != current.Passhash)
            {
                ModelState.AddModelError("Passhash", $"Mot de passe incorrect {compte.Passhash} et {current.Passhash}");
                return BadRequest(ModelState);
            }

            HttpContext.Session.SetString("compte", JsonConvert.SerializeObject(current));

            return Ok(current);

        }

        [HttpGet("session")]
        public Compte GetSession()
        {
            string stringcompte = HttpContext.Session.GetString("compte");


            if (stringcompte != null)
            {
                Compte compte = JsonConvert.DeserializeObject<Compte>(stringcompte);

                return compte;

            }

            return new Compte();
        }

        
        [HttpGet]
        public async Task<IActionResult> Logout()
        {
            HttpContext.Session.Remove("compte");

            return Ok();
        }

        
        public async Task<IActionResult> Create([FromBody] Compte compte)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("create", "Formulaire invalide");

                return View();
            }

            if (!repository.FindEtudiant(compte.Matricule))
            {
                ModelState.AddModelError("Matricule", "Ce matricule n'existe pas");

                return BadRequest(ModelState);
            }

            if (repository.FindByMatricule(compte.Matricule))
            {
                ModelState.AddModelError("Matricule", "Ce matricule possède déja un compte");

                return BadRequest(ModelState);
            }

            if (compte.Passhash == null || compte.Passhash.Length < 4)
            {
                ModelState.AddModelError("Passhash", "Ce mot de passe est  faible");
                return BadRequest(ModelState);
            }

            compte = repository.Save(compte);

            return Ok(compte);
        }
    }
}