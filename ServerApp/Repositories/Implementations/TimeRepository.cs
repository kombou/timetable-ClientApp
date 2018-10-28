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
    public class TimeRepository : Repository<Time, int>, ITimeRepository
    {
        IClasseRepository classeRepository;
        ISalleRepository salleRepository;
        IEnseignantRepository enseignantRepository;

        public TimeRepository(
            bd_timetableContext context, 
            IClasseRepository classeRepository,
            ISalleRepository salleRepository,
            IEnseignantRepository enseignantRepository
            ) : base(context)
        {
            this.classeRepository = classeRepository;
            this.salleRepository = salleRepository;
            this.enseignantRepository = enseignantRepository;
        }
        public override DbSet<Time> Collections => context.Time;


        public IEnumerable<Time> TimeTableOfClasse(Classe classe, int semestre)
        {

            return Collections
                .Include(p => p.IdprogrammeNavigation)
                .Include(p => p.IdprogrammeNavigation.EnseignantNavigation)
                .Include(p => p.IdprogrammeNavigation.IdueNavigation)
                .Where(p => p.IdprogrammeNavigation.Semestre == semestre)
                .Include(c => c.IdperiodeNavigation)
                .Include(j => j.IdjourNavigation)
                .Include(s => s.IdsalleNavigation)
                .Where(p => p.IdprogrammeNavigation.IdclasseNavigation.Idfiliere == classe.Idfiliere)
                .Where(p => p.IdprogrammeNavigation.IdclasseNavigation.Codgrade == classe.Codgrade)
                .Where(p => p.IdprogrammeNavigation.IdclasseNavigation.Niveau == classe.Niveau)
                .OrderBy(p => p.Idperiode)
                .ToArray();
        }

        public IEnumerable<Time> TimeTableOfSalle(Salle salle, int semestre)
        {
            return Collections
                .Include(p => p.IdprogrammeNavigation)
                .Include(p => p.IdprogrammeNavigation.EnseignantNavigation)
                .Include(p => p.IdprogrammeNavigation.IdueNavigation)
                .Where(p => p.IdprogrammeNavigation.Semestre == semestre)
                .Include(c => c.IdperiodeNavigation)
                .Include(j => j.IdjourNavigation)
                .Include(s => s.IdsalleNavigation)
                .Where(p => p.Idsalle == salle.Id)
                .OrderBy(p => p.Idperiode)
                .ToArray();
        }

        public IEnumerable<Time> TimeTableOfEnseignant(Enseignant enseignant, int semestre)
        {
            return Collections
                 .Include(p => p.IdprogrammeNavigation)
                 .Include(p => p.IdprogrammeNavigation.EnseignantNavigation)
                 .Include(p => p.IdprogrammeNavigation.IdueNavigation)
                 .Where(p => p.IdprogrammeNavigation.Semestre == semestre)
                 .Include(c => c.IdperiodeNavigation)
                 .Include(j => j.IdjourNavigation)
                 .Include(s => s.IdsalleNavigation)
                 .Where(p => p.IdprogrammeNavigation.Enseignant == enseignant.Id)
                 .OrderBy(p => p.Idperiode)
                 .ToArray();
        }

        public IEnumerable<Periode> PeriodesOfClasse(int idClasse)
        {
            if (!classeRepository.ClasseExists(idClasse))
            {
                return new List<Periode>();
            }
            Classe classe = classeRepository[idClasse];

            return Collections
                .Where(p => p.IdprogrammeNavigation.IdclasseNavigation.Idfiliere == classe.Idfiliere)
                .Where(p => p.IdprogrammeNavigation.IdclasseNavigation.Codgrade == classe.Codgrade)
                .Where(p => p.IdprogrammeNavigation.IdclasseNavigation.Niveau == classe.Niveau)
                .Select(p => p.IdperiodeNavigation);
        }

        public IEnumerable<Periode> PeriodesOfSalle(int idSalle)
        {
            if (!salleRepository.SalleExists(idSalle))
            {
                return new List<Periode>();
            }
            Salle salle = salleRepository[idSalle];

            return Collections
                .Where(p => p.Idsalle == salle.Id)
                .Select(p => p.IdperiodeNavigation);
        }

        public IEnumerable<Periode> PeriodesOfEnseignant(int idEnseignant)
        {
            if (!enseignantRepository.EnseignantExists(idEnseignant))
            {
                return new List<Periode>();
            }
            Enseignant enseignant = enseignantRepository[idEnseignant];

            return Collections
                 .Include(p => p.IdprogrammeNavigation)
                 .Where(p => p.IdprogrammeNavigation.Enseignant == enseignant.Id)
                 .Select(p => p.IdperiodeNavigation);
        }
    }
}
