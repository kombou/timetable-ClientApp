﻿using System;
using System.Collections.Generic;

namespace ServerApp.entity
{
    public partial class Programme
    {
        public Programme()
        {
            Time = new HashSet<Time>();
        }

        public int Id { get; set; }
        public int Idclasse { get; set; }
        public uint Idue { get; set; }
        public string Enseignant { get; set; }
        public int Annee { get; set; }
        public int Semestre { get; set; }
        public int Categorie { get; set; }
        public uint Credit { get; set; }

        public Etudiant EnseignantNavigation { get; set; }
        public Classe IdclasseNavigation { get; set; }
        public Ue IdueNavigation { get; set; }
        public Semestre SemestreNavigation { get; set; }
        public ICollection<Time> Time { get; set; }
    }
}
