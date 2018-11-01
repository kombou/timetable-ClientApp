using System;
using System.Collections.Generic;

namespace ServerApp.donnees
{
    public partial class Profil
    {
        public Profil()
        {
            Compte = new HashSet<Compte>();
            DroitAccess = new HashSet<DroitAccess>();
        }

        public int Id { get; set; }
        public string Role { get; set; }

        public ICollection<Compte> Compte { get; set; }
        public ICollection<DroitAccess> DroitAccess { get; set; }
    }
}
