using System;
using System.Collections.Generic;

namespace ServerApp.donnees
{
    public partial class Enseignant
    {
        public Enseignant()
        {
            Programme = new HashSet<Programme>();
        }

        public int Id { get; set; }
        public string Matricule { get; set; }
        public string Nom { get; set; }
        public string Prenom { get; set; }

        public ICollection<Programme> Programme { get; set; }
    }
}
