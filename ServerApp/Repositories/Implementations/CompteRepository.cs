using Microsoft.EntityFrameworkCore;
using ServerApp.entity;
using ServerApp.Repositories.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ServerApp.Repositories.Implementations
{
    public class CompteRepository : Repository<Compte, int>, ICompteRepository
    {
        public CompteRepository(bd_timetableContext context) : base(context) { }

        public override DbSet<Compte> Collections => context.Compte;

        public async Task<Compte> Find(string matricule)
        {
            return  context.Compte.First(c => c.Matricule == matricule);
        }

        public bool FindByMatricule(string matricule)
        {
            return context.Compte.Any(e => e.Matricule == matricule);
        }

        public bool FindEtudiant(string matricule)
        {
            return context.Etudiant.Any(e => e.Matricule == matricule);
        }
    }
}
