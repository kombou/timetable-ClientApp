using Microsoft.EntityFrameworkCore;
using ServerApp.entity;
using ServerApp.Repositories.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ServerApp.Repositories.Implementations
{
    public class AccessRepository : Repository<DroitAccess, int>, IAccessRepository
    {
        public AccessRepository(bd_timetableContext context): base(context) {}

        public override DbSet<DroitAccess> Collections => context.DroitAccess;

        public  IEnumerable<DroitAccess> List(int idProfile)
        {
            return Collections.Include(d => d.IdModuleNavigation).Where(d => d.IdProfil == idProfile);
        }
    }
}
