using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Rfid.Web.Models.DataManager
{
    public class TypeCoursDto
    {
        public TypeCoursDto()
        {
        }

        public int IdTypeCours { get; set; }
        public string Libelle { get; set; }

        public virtual ICollection<Cours> Cours { get; set; }
        public virtual ICollection<UsersTypeCours> UsersTypeCours { get; set; }
    }
}
