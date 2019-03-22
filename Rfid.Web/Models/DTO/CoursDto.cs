using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Rfid.Web.Models.DataManager
{
    public class CoursDto
    {
        public CoursDto()
        {
        }

        public int IdCours { get; set; }
        public string Libelle { get; set; }
        public int MaxParticipant { get; set; }
        public DateTime Date { get; set; }
        public int IdTypeCours { get; set; }

       
    }
}
