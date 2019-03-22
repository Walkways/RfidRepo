using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class Badge
    {
        public Badge()
        {
            UsersBadgeMotif = new HashSet<UsersBadgeMotif>();
        }

        public int IdBadge { get; set; }
        public string Uid { get; set; }

        public virtual ICollection<UsersBadgeMotif> UsersBadgeMotif { get; set; }
    }
}
