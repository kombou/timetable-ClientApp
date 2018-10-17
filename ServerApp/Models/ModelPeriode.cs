using NodaTime;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ServerApp.Models
{
    public class ModelPeriode
    {
        public LocalTime Debut { get; set; }
        public LocalTime Fin { get; set; }
        public DayOfWeek Jour { get; set; }
    }
}
