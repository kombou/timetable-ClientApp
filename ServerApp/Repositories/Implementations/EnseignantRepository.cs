using Microsoft.EntityFrameworkCore;
using ServerApp.entity;
using ServerApp.Repositories.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ServerApp.Repositories.Implementations
{
    public class EnseignantRepository : Repository<Enseignant, int>, IEnseignantRepository
    {
        public EnseignantRepository(bd_timetableContext context): base(context) {}

        public override DbSet<Enseignant> Collections => context.Enseignant;

        public bool EnseignantExists(int id)
        {
            return context.Enseignant.Any(e => e.Id == id);
        }
    }
}
