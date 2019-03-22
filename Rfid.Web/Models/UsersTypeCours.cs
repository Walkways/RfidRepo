using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class UsersTypeCours
    {
        public int IdTypeCours { get; set; }
        public int IdUsers { get; set; }

        public virtual TypeCours IdTypeCoursNavigation { get; set; }
        public virtual Users IdUsersNavigation { get; set; }
    }
}
