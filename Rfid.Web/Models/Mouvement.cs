using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class Mouvement
    {
        public int IdMouvement { get; set; }
        public DateTime Date { get; set; }
        public string UidPass { get; set; }
        public int IdTypeMouvement { get; set; }
        public int? IdUsers { get; set; }
        public int IdLecteur { get; set; }

        public virtual Lecteur IdLecteurNavigation { get; set; }
        public virtual TypeMouvement IdTypeMouvementNavigation { get; set; }
        public virtual Users IdUsersNavigation { get; set; }
    }
}
