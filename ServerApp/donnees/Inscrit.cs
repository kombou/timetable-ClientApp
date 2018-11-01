﻿using System;
using System.Collections.Generic;

namespace ServerApp.donnees
{
    public partial class Inscrit
    {
        public int Idclasse { get; set; }
        public string Matricule { get; set; }
        public int Annee { get; set; }

        public Classe IdclasseNavigation { get; set; }
        public Etudiant MatriculeNavigation { get; set; }
    }
}
