using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace ServerApp.entity
{
    public partial class Module
    {
        public Module()
        {
            DroitAccess = new HashSet<DroitAccess>();
        }

        public int Id { get; set; }
        public string Nom { get; set; }
        public string Route { get; set; }
        public string Img { get; set; }

        [JsonIgnore]
        public ICollection<DroitAccess> DroitAccess { get; set; }
    }
}
