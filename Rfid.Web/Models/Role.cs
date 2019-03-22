using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class Role
    {
        public Role()
        {
            UsersCoursRole = new HashSet<UsersCoursRole>();
            UsersRole = new HashSet<UsersRole>();
        }

        public int IdRole { get; set; }
        public string Libelle { get; set; }

        public virtual ICollection<UsersCoursRole> UsersCoursRole { get; set; }
        public virtual ICollection<UsersRole> UsersRole { get; set; }
    }
}
