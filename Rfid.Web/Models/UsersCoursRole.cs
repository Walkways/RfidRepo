using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class UsersCoursRole
    {
        public int IdUsers { get; set; }
        public int IdCours { get; set; }
        public int IdRole { get; set; }

        public virtual Cours IdCoursNavigation { get; set; }
        public virtual Role IdRoleNavigation { get; set; }
        public virtual Users IdUsersNavigation { get; set; }
    }
}
