using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class UsersAppRole
    {
        public int IdAppRole { get; set; }
        public int IdUsers { get; set; }

        public virtual AppRole IdAppRoleNavigation { get; set; }
        public virtual Users IdUsersNavigation { get; set; }
    }
}
