using ServerApp.entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ServerApp.Repositories.Contracts
{
    public interface ICompteRepository: IRepository<Compte, int>
    {
        bool FindByMatricule(string matricule);

        Task<Compte> Find(string matricule);
        bool FindEtudiant(string matricule);
    }
}
