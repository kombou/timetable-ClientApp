using Microsoft.EntityFrameworkCore;
using ServerApp.entity;
using ServerApp.Models;
using ServerApp.Repositories.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ServerApp.Repositories.Implementations
{
    public class PeriodeRepository: Repository<Periode,int>, IPeriodeRepository
    {
        ITimeRepository timeRepository;
        IClasseRepository classeRepository;

        public PeriodeRepository
            (
            bd_timetableContext context, 
            ITimeRepository timeRepository, 
            IClasseRepository classeRepository
            ) : base(context)
        {
            this.timeRepository = timeRepository;
            this.classeRepository = classeRepository;
        }

        public override DbSet<Periode> Collections => context.Periode;

        public bool PeriodeExists(int id)
        {
            return context.Periode.Any(e => e.Id == id);
        }
    }
}
