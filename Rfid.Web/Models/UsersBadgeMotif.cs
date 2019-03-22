using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class UsersBadgeMotif
    {
        public int IdMotif { get; set; }
        public int IdBadge { get; set; }
        public int IdUsers { get; set; }
        public DateTime DateAffectation { get; set; }
        public DateTime DateRetour { get; set; }

        public virtual Badge IdBadgeNavigation { get; set; }
        public virtual Motif IdMotifNavigation { get; set; }
        public virtual Users IdUsersNavigation { get; set; }
    }
}
