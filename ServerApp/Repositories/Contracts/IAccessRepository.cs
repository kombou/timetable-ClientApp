﻿using ServerApp.entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ServerApp.Repositories.Contracts
{
    public interface IAccessRepository : IRepository<DroitAccess,int>
    {
    }
}
