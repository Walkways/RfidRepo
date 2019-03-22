using Microsoft.EntityFrameworkCore;
using Rfid.Web.Models.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Rfid.Web.Models.DataManager
{
    public class CoursDataManager : IDataRepository<Cours, CoursDto>
    {

        readonly RfidContext _rfidContext;



        public CoursDataManager(RfidContext rfidContext)
        {
            _rfidContext = rfidContext;
        }

        public void Add(Cours entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(Cours entity)
        {
            throw new NotImplementedException();
        }

        public Cours Get(long id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Cours> GetAll()
        {
            return _rfidContext.Cours.ToList();

        }

        public CoursDto GetDto(long id)
        {
            throw new NotImplementedException();
        }

        public void Update(Cours entityToUpdate, Cours entity)
        {
            throw new NotImplementedException();
        }
    }
}
