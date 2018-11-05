using System;
using System.Collections.Generic;

namespace ServerApp.entity
{
    public partial class DroitAccess
    {
        public int Id { get; set; }
        public int IdProfil { get; set; }
        public int IdModule { get; set; }

        public Module IdModuleNavigation { get; set; }
        public Profil IdProfilNavigation { get; set; }
    }
}
