using System;
using System.Collections.Generic;

namespace ServerApp.entity
{
    public partial class Enseignant
    {
        public int Id { get; set; }
        public string Matricule { get; set; }
        public string Nom { get; set; }
        public string Prenom { get; set; }
    }
}
