using System;
using System.Collections.Generic;

namespace Rfid.Web.Models
{
    public partial class Users
    {
        public Users()
        {
            Mouvement = new HashSet<Mouvement>();
            UsersAbonnement = new HashSet<UsersAbonnement>();
            UsersAppRole = new HashSet<UsersAppRole>();
            UsersBadgeMotif = new HashSet<UsersBadgeMotif>();
            UsersCoursRole = new HashSet<UsersCoursRole>();
            UsersRole = new HashSet<UsersRole>();
            UsersTypeCours = new HashSet<UsersTypeCours>();
        }

        public int IdUsers { get; set; }
        public string Nom { get; set; }
        public string Prenom { get; set; }
        public string Passe { get; set; }
        public string Tel { get; set; }
        public string Email { get; set; }
        public bool Actif { get; set; }
        public int IdAdresse { get; set; }

        public virtual Adresse IdAdresseNavigation { get; set; }
        public virtual ICollection<Mouvement> Mouvement { get; set; }
        public virtual ICollection<UsersAbonnement> UsersAbonnement { get; set; }
        public virtual ICollection<UsersAppRole> UsersAppRole { get; set; }
        public virtual ICollection<UsersBadgeMotif> UsersBadgeMotif { get; set; }
        public virtual ICollection<UsersCoursRole> UsersCoursRole { get; set; }
        public virtual ICollection<UsersRole> UsersRole { get; set; }
        public virtual ICollection<UsersTypeCours> UsersTypeCours { get; set; }
    }
}
