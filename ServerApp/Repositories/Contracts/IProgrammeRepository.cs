using ServerApp.entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ServerApp.Repositories.Contracts
{
    public interface IProgrammeRepository: IRepository<Programme,int>
    {
        bool ProgrammeExists(int id);
        Programme Get(int Idue, int idClasse, int annee);
    }
}
