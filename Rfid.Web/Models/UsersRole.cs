using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class UsersRole
    {
        public int IdRole { get; set; }
        public int IdUsers { get; set; }

        public virtual Role IdRoleNavigation { get; set; }
        public virtual Users IdUsersNavigation { get; set; }
    }
}
