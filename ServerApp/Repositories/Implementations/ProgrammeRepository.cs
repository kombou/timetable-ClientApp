using Microsoft.EntityFrameworkCore;
using ServerApp.entity;
using ServerApp.Repositories.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ServerApp.Repositories.Implementations
{
    public class ProgrammeRepository : Repository<Programme, int>, IProgrammeRepository
    {
        public ProgrammeRepository(bd_timetableContext context): base(context) {}

        public override DbSet<Programme> Collections => context.Programme;

        public override Programme this[int id]
        {
            get
            {
                Programme programme = context.Programme
                    .Include(p => p.EnseignantNavigation)
                    .Include(p => p.IdueNavigation)
                    .FirstOrDefault(p => p.Id == id);
                return programme;
            }
        }
        public override IEnumerable<Programme> List()
        {
            return context.Programme
                .Include(p => p.EnseignantNavigation)
                .Include(p => p.IdueNavigation)
                .ToArray();
        }

        public bool ProgrammeExists(int id)
        {
            return context.Programme.Any(p => p.Id == id);
        }

        public Programme Get(int Idue, int idClasse, int annee)
        {
            Programme programme = context.Programme.Find(Idue, idClasse, annee);
            return programme;
        }
    }
}
