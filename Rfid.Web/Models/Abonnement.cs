using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class Abonnement
    {
        public Abonnement()
        {
            UsersAbonnement = new HashSet<UsersAbonnement>();
        }

        public int IdAbonnement { get; set; }
        public DateTime DateFin { get; set; }
        public int Solde { get; set; }
        public int IdTypeAbonnement { get; set; }

        public virtual TypeAbonnement IdTypeAbonnementNavigation { get; set; }
        public virtual ICollection<UsersAbonnement> UsersAbonnement { get; set; }
    }
}
