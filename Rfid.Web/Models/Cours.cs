using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class Cours
    {
        public Cours()
        {
            UsersCoursRole = new HashSet<UsersCoursRole>();
        }

        public int IdCours { get; set; }
        public string Libelle { get; set; }
        public int MaxParticipant { get; set; }
        public DateTime Date { get; set; }
        public int IdTypeCours { get; set; }

        public virtual TypeCours TypeCours { get; set; }
        public virtual ICollection<UsersCoursRole> UsersCoursRole { get; set; }
    }
}
