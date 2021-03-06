﻿using ServerApp.entity;
using ServerApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ServerApp.services
{
    public interface ITimeService
    {
        IEnumerable<ModelPeriode> ModelPeriodes(IEnumerable<Time> times);
    }
}
