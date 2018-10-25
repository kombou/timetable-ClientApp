using ServerApp.entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ServerApp.Repositories.Contracts
{
    public interface IEnseignantRepository: IRepository<Enseignant,int>
    {
        bool EnseignantExists(int id);

    }
}
