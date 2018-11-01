﻿using System;
using System.Collections.Generic;

namespace ServerApp.donnees
{
    public partial class Jour
    {
        public Jour()
        {
            Time = new HashSet<Time>();
        }

        public int Id { get; set; }
        public string Nom { get; set; }

        public ICollection<Time> Time { get; set; }
    }
}
