using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class UsersAbonnement
    {
        public int IdAbonnement { get; set; }
        public int IdUsers { get; set; }
        public DateTime DateDebut { get; set; }
        public DateTime DateFin { get; set; }

        public virtual Abonnement IdAbonnementNavigation { get; set; }
        public virtual Users IdUsersNavigation { get; set; }
    }
}
