using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class AppRole
    {
        public AppRole()
        {
            UsersAppRole = new HashSet<UsersAppRole>();
        }

        public int IdAppRole { get; set; }
        public string Nom { get; set; }

        public virtual ICollection<UsersAppRole> UsersAppRole { get; set; }
    }
}
