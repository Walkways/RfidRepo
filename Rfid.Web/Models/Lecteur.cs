using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class Lecteur
    {
        public Lecteur()
        {
            Mouvement = new HashSet<Mouvement>();
        }

        public int IdLecteur { get; set; }
        public string Localisation { get; set; }

        public virtual ICollection<Mouvement> Mouvement { get; set; }
    }
}
