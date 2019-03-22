using Microsoft.EntityFrameworkCore;

namespace Rfid.Web.Models
{
    public partial class RfidContext : DbContext
    {
        public RfidContext()
        {
        }

        public RfidContext(DbContextOptions<RfidContext> options)
            : base(options)
        {
            ChangeTracker.LazyLoadingEnabled = false;
        }

        public virtual DbSet<Abonnement> Abonnement { get; set; }
        public virtual DbSet<Adresse> Adresse { get; set; }
        public virtual DbSet<AppRole> AppRole { get; set; }
        public virtual DbSet<Badge> Badge { get; set; }
        public virtual DbSet<Cours> Cours { get; set; }
        public virtual DbSet<Lecteur> Lecteur { get; set; }
        public virtual DbSet<Motif> Motif { get; set; }
        public virtual DbSet<Mouvement> Mouvement { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<TypeAbonnement> TypeAbonnement { get; set; }
        public virtual DbSet<TypeCours> TypeCours { get; set; }
        public virtual DbSet<TypeMouvement> TypeMouvement { get; set; }
        public virtual DbSet<Users> Users { get; set; }
        public virtual DbSet<UsersAbonnement> UsersAbonnement { get; set; }
        public virtual DbSet<UsersAppRole> UsersAppRole { get; set; }
        public virtual DbSet<UsersBadgeMotif> UsersBadgeMotif { get; set; }
        public virtual DbSet<UsersCoursRole> UsersCoursRole { get; set; }
        public virtual DbSet<UsersRole> UsersRole { get; set; }
        public virtual DbSet<UsersTypeCours> UsersTypeCours { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder
                    .UseLazyLoadingProxies()
                    .UseSqlServer("Server=(localdb)\\MSSQLLocalDB;Database=Rfid2;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.3-servicing-35854");

            modelBuilder.Entity<Abonnement>(entity =>
            {
                entity.HasKey(e => e.IdAbonnement)
                    .HasName("abonnement_PK");

                entity.ToTable("abonnement");

                entity.Property(e => e.IdAbonnement).HasColumnName("id_abonnement");

                entity.Property(e => e.DateFin)
                    .HasColumnName("date_fin")
                    .HasColumnType("datetime");

                entity.Property(e => e.IdTypeAbonnement).HasColumnName("id_type_abonnement");

                entity.Property(e => e.Solde).HasColumnName("solde");

                entity.HasOne(d => d.IdTypeAbonnementNavigation)
                    .WithMany(p => p.Abonnement)
                    .HasForeignKey(d => d.IdTypeAbonnement)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("abonnement_type_abonnement_FK");
            });

            modelBuilder.Entity<Adresse>(entity =>
            {
                entity.HasKey(e => e.IdAdresse)
                    .HasName("adresse_PK");

                entity.ToTable("adresse");

                entity.Property(e => e.IdAdresse).HasColumnName("id_adresse");

                entity.Property(e => e.Complement)
                    .IsRequired()
                    .HasColumnName("complement")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Cp)
                    .IsRequired()
                    .HasColumnName("cp")
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Libelle)
                    .IsRequired()
                    .HasColumnName("libelle")
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Ville)
                    .IsRequired()
                    .HasColumnName("ville")
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<AppRole>(entity =>
            {
                entity.HasKey(e => e.IdAppRole)
                    .HasName("app_role_PK");

                entity.ToTable("app_role");

                entity.Property(e => e.IdAppRole).HasColumnName("id_app_role");

                entity.Property(e => e.Nom)
                    .IsRequired()
                    .HasColumnName("nom")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Badge>(entity =>
            {
                entity.HasKey(e => e.IdBadge)
                    .HasName("badge_PK");

                entity.ToTable("badge");

                entity.Property(e => e.IdBadge).HasColumnName("id_badge");

                entity.Property(e => e.Uid)
                    .IsRequired()
                    .HasColumnName("uid")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Cours>(entity =>
            {
                entity.HasKey(e => e.IdCours)
                    .HasName("cours_PK");

                entity.ToTable("cours");

                entity.Property(e => e.IdCours).HasColumnName("id_cours");

                entity.Property(e => e.Date)
                    .HasColumnName("date")
                    .HasColumnType("datetime");

                entity.Property(e => e.IdTypeCours).HasColumnName("id_type_cours");

                entity.Property(e => e.Libelle)
                    .IsRequired()
                    .HasColumnName("libelle")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.MaxParticipant).HasColumnName("max_participant");

                entity.HasOne(d => d.TypeCours)
                    .WithMany(p => p.Cours)
                    .HasForeignKey(d => d.IdTypeCours)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("cours_type_cours_FK");
            });

            modelBuilder.Entity<Lecteur>(entity =>
            {
                entity.HasKey(e => e.IdLecteur)
                    .HasName("lecteur_PK");

                entity.ToTable("lecteur");

                entity.Property(e => e.IdLecteur).HasColumnName("id_lecteur");

                entity.Property(e => e.Localisation)
                    .IsRequired()
                    .HasColumnName("localisation")
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Motif>(entity =>
            {
                entity.HasKey(e => e.IdMotif)
                    .HasName("motif_PK");

                entity.ToTable("motif");

                entity.Property(e => e.IdMotif).HasColumnName("id_motif");

                entity.Property(e => e.Libelle)
                    .IsRequired()
                    .HasColumnName("libelle")
                    .HasMaxLength(2545)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Mouvement>(entity =>
            {
                entity.HasKey(e => e.IdMouvement)
                    .HasName("mouvement_PK");

                entity.ToTable("mouvement");

                entity.Property(e => e.IdMouvement).HasColumnName("id_mouvement");

                entity.Property(e => e.Date)
                    .HasColumnName("date")
                    .HasColumnType("datetime");

                entity.Property(e => e.IdLecteur).HasColumnName("id_lecteur");

                entity.Property(e => e.IdTypeMouvement).HasColumnName("id_type_mouvement");

                entity.Property(e => e.IdUsers).HasColumnName("id_users");

                entity.Property(e => e.UidPass)
                    .IsRequired()
                    .HasColumnName("uid_pass")
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdLecteurNavigation)
                    .WithMany(p => p.Mouvement)
                    .HasForeignKey(d => d.IdLecteur)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("mouvement_lecteur1_FK");

                entity.HasOne(d => d.IdTypeMouvementNavigation)
                    .WithMany(p => p.Mouvement)
                    .HasForeignKey(d => d.IdTypeMouvement)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("mouvement_type_mouvement_FK");

                entity.HasOne(d => d.IdUsersNavigation)
                    .WithMany(p => p.Mouvement)
                    .HasForeignKey(d => d.IdUsers)
                    .HasConstraintName("mouvement_users0_FK");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.HasKey(e => e.IdRole)
                    .HasName("role_PK");

                entity.ToTable("role");

                entity.Property(e => e.IdRole).HasColumnName("id_role");

                entity.Property(e => e.Libelle)
                    .IsRequired()
                    .HasColumnName("libelle")
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TypeAbonnement>(entity =>
            {
                entity.HasKey(e => e.IdTypeAbonnement)
                    .HasName("type_abonnement_PK");

                entity.ToTable("type_abonnement");

                entity.Property(e => e.IdTypeAbonnement).HasColumnName("id_type_abonnement");

                entity.Property(e => e.Duree)
                    .IsRequired()
                    .HasColumnName("duree")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Nom)
                    .IsRequired()
                    .HasColumnName("nom")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.SoldeInitial).HasColumnName("solde_initial");
            });

            modelBuilder.Entity<TypeCours>(entity =>
            {
                entity.HasKey(e => e.IdTypeCours)
                    .HasName("type_cours_PK");

                entity.ToTable("type_cours");

                entity.Property(e => e.IdTypeCours).HasColumnName("id_type_cours");

                entity.Property(e => e.Libelle)
                    .IsRequired()
                    .HasColumnName("libelle")
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TypeMouvement>(entity =>
            {
                entity.HasKey(e => e.IdTypeMouvement)
                    .HasName("type_mouvement_PK");

                entity.ToTable("type_mouvement");

                entity.Property(e => e.IdTypeMouvement).HasColumnName("id_type_mouvement");

                entity.Property(e => e.Libelle)
                    .IsRequired()
                    .HasColumnName("libelle")
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Users>(entity =>
            {
                entity.HasKey(e => e.IdUsers)
                    .HasName("users_PK");

                entity.ToTable("users");

                entity.Property(e => e.IdUsers).HasColumnName("id_users");

                entity.Property(e => e.Actif).HasColumnName("actif");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasColumnName("email")
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.IdAdresse).HasColumnName("id_adresse");

                entity.Property(e => e.Nom)
                    .IsRequired()
                    .HasColumnName("nom")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Passe)
                    .IsRequired()
                    .HasColumnName("passe")
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Prenom)
                    .IsRequired()
                    .HasColumnName("prenom")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Tel)
                    .IsRequired()
                    .HasColumnName("tel")
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdAdresseNavigation)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.IdAdresse)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("users_adresse_FK");
            });

            modelBuilder.Entity<UsersAbonnement>(entity =>
            {
                entity.HasKey(e => new { e.IdAbonnement, e.IdUsers })
                    .HasName("users_abonnement_PK");

                entity.ToTable("users_abonnement");

                entity.Property(e => e.IdAbonnement).HasColumnName("id_abonnement");

                entity.Property(e => e.IdUsers).HasColumnName("id_users");

                entity.Property(e => e.DateDebut)
                    .HasColumnName("date_debut")
                    .HasColumnType("datetime");

                entity.Property(e => e.DateFin)
                    .HasColumnName("date_fin")
                    .HasColumnType("datetime");

                entity.HasOne(d => d.IdAbonnementNavigation)
                    .WithMany(p => p.UsersAbonnement)
                    .HasForeignKey(d => d.IdAbonnement)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("users_abonnement_abonnement_FK");

                entity.HasOne(d => d.IdUsersNavigation)
                    .WithMany(p => p.UsersAbonnement)
                    .HasForeignKey(d => d.IdUsers)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("users_abonnement_users0_FK");
            });

            modelBuilder.Entity<UsersAppRole>(entity =>
            {
                entity.HasKey(e => new { e.IdAppRole, e.IdUsers })
                    .HasName("users_app_role_PK");

                entity.ToTable("users_app_role");

                entity.Property(e => e.IdAppRole).HasColumnName("id_app_role");

                entity.Property(e => e.IdUsers).HasColumnName("id_users");

                entity.HasOne(d => d.IdAppRoleNavigation)
                    .WithMany(p => p.UsersAppRole)
                    .HasForeignKey(d => d.IdAppRole)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("users_app_role_app_role_FK");

                entity.HasOne(d => d.IdUsersNavigation)
                    .WithMany(p => p.UsersAppRole)
                    .HasForeignKey(d => d.IdUsers)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("users_app_role_users0_FK");
            });

            modelBuilder.Entity<UsersBadgeMotif>(entity =>
            {
                entity.HasKey(e => new { e.IdMotif, e.IdBadge, e.IdUsers })
                    .HasName("users_badge_motif_PK");

                entity.ToTable("users_badge_motif");

                entity.Property(e => e.IdMotif).HasColumnName("id_motif");

                entity.Property(e => e.IdBadge).HasColumnName("id_badge");

                entity.Property(e => e.IdUsers).HasColumnName("id_users");

                entity.Property(e => e.DateAffectation)
                    .HasColumnName("date_affectation")
                    .HasColumnType("datetime");

                entity.Property(e => e.DateRetour)
                    .HasColumnName("date_retour")
                    .HasColumnType("datetime");

                entity.HasOne(d => d.IdBadgeNavigation)
                    .WithMany(p => p.UsersBadgeMotif)
                    .HasForeignKey(d => d.IdBadge)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("users_badge_motif_badge0_FK");

                entity.HasOne(d => d.IdMotifNavigation)
                    .WithMany(p => p.UsersBadgeMotif)
                    .HasForeignKey(d => d.IdMotif)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("users_badge_motif_motif_FK");

                entity.HasOne(d => d.IdUsersNavigation)
                    .WithMany(p => p.UsersBadgeMotif)
                    .HasForeignKey(d => d.IdUsers)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("users_badge_motif_users1_FK");
            });

            modelBuilder.Entity<UsersCoursRole>(entity =>
            {
                entity.HasKey(e => new { e.IdUsers, e.IdCours, e.IdRole })
                    .HasName("users_cours_role_PK");

                entity.ToTable("users_cours_role");

                entity.Property(e => e.IdUsers).HasColumnName("id_users");

                entity.Property(e => e.IdCours).HasColumnName("id_cours");

                entity.Property(e => e.IdRole).HasColumnName("id_role");

                entity.HasOne(d => d.IdCoursNavigation)
                    .WithMany(p => p.UsersCoursRole)
                    .HasForeignKey(d => d.IdCours)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("users_cours_role_cours0_FK");

                entity.HasOne(d => d.IdRoleNavigation)
                    .WithMany(p => p.UsersCoursRole)
                    .HasForeignKey(d => d.IdRole)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("users_cours_role_role1_FK");

                entity.HasOne(d => d.IdUsersNavigation)
                    .WithMany(p => p.UsersCoursRole)
                    .HasForeignKey(d => d.IdUsers)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("users_cours_role_users_FK");
            });

            modelBuilder.Entity<UsersRole>(entity =>
            {
                entity.HasKey(e => new { e.IdRole, e.IdUsers })
                    .HasName("users_role_PK");

                entity.ToTable("users_role");

                entity.Property(e => e.IdRole).HasColumnName("id_role");

                entity.Property(e => e.IdUsers).HasColumnName("id_users");

                entity.HasOne(d => d.IdRoleNavigation)
                    .WithMany(p => p.UsersRole)
                    .HasForeignKey(d => d.IdRole)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("users_role_role_FK");

                entity.HasOne(d => d.IdUsersNavigation)
                    .WithMany(p => p.UsersRole)
                    .HasForeignKey(d => d.IdUsers)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("users_role_users0_FK");
            });

            modelBuilder.Entity<UsersTypeCours>(entity =>
            {
                entity.HasKey(e => new { e.IdTypeCours, e.IdUsers })
                    .HasName("users_type_cours_PK");

                entity.ToTable("users_type_cours");

                entity.Property(e => e.IdTypeCours).HasColumnName("id_type_cours");

                entity.Property(e => e.IdUsers).HasColumnName("id_users");

                entity.HasOne(d => d.IdTypeCoursNavigation)
                    .WithMany(p => p.UsersTypeCours)
                    .HasForeignKey(d => d.IdTypeCours)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("users_type_cours_type_cours_FK");

                entity.HasOne(d => d.IdUsersNavigation)
                    .WithMany(p => p.UsersTypeCours)
                    .HasForeignKey(d => d.IdUsers)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("users_type_cours_users0_FK");
            });
        }
    }
}
