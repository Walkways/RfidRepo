using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class TypeCours
    {
        public TypeCours()
        {
            Cours = new HashSet<Cours>();
            UsersTypeCours = new HashSet<UsersTypeCours>();
        }

        public int IdTypeCours { get; set; }
        public string Libelle { get; set; }

        public virtual ICollection<Cours> Cours { get; set; }
        public virtual ICollection<UsersTypeCours> UsersTypeCours { get; set; }
    }
}
