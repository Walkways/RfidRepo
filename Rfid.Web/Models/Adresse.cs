using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class Adresse
    {
        public Adresse()
        {
            Users = new HashSet<Users>();
        }

        public int IdAdresse { get; set; }
        public string Libelle { get; set; }
        public string Complement { get; set; }
        public string Cp { get; set; }
        public string Ville { get; set; }

        public virtual ICollection<Users> Users { get; set; }
    }
}
