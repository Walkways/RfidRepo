using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class TypeAbonnement
    {
        public TypeAbonnement()
        {
            Abonnement = new HashSet<Abonnement>();
        }

        public int IdTypeAbonnement { get; set; }
        public string Nom { get; set; }
        public int SoldeInitial { get; set; }
        public string Duree { get; set; }

        public virtual ICollection<Abonnement> Abonnement { get; set; }
    }
}
