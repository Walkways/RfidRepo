using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class TypeMouvement
    {
        public TypeMouvement()
        {
            Mouvement = new HashSet<Mouvement>();
        }

        public int IdTypeMouvement { get; set; }
        public string Libelle { get; set; }

        public virtual ICollection<Mouvement> Mouvement { get; set; }
    }
}
