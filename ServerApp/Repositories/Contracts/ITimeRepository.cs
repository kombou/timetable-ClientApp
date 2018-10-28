using ServerApp.entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ServerApp.Repositories.Contracts
{
    public interface ITimeRepository: IRepository<Time,int>
    {
        IEnumerable<Time> TimeTableOfClasse(Classe classe, int semestre);
        IEnumerable<Time> TimeTableOfSalle(Salle salle, int semestre);
        IEnumerable<Time> TimeTableOfEnseignant(Enseignant enseignant, int semestre);

        IEnumerable<Periode> PeriodesOfClasse(int idClasse);
        IEnumerable<Periode> PeriodesOfSalle(int idSalle);
        IEnumerable<Periode> PeriodesOfEnseignant(int idEnseignant);

        //bool SalleIsFree(Periode periode, Jour jour);
    }
}
