using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class Motif
    {
        public Motif()
        {
            UsersBadgeMotif = new HashSet<UsersBadgeMotif>();
        }

        public int IdMotif { get; set; }
        public string Libelle { get; set; }

        public virtual ICollection<UsersBadgeMotif> UsersBadgeMotif { get; set; }
    }
}
