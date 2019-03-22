using Rfid.Web.Models.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Rfid.Web.Models.DataManager
{
    public class TypeCoursDataManager : IDataRepository<TypeCours, TypeCoursDto>
    {
        readonly RfidContext _rfidContext;

        public TypeCoursDataManager(RfidContext rfidContext)
        {
            _rfidContext = rfidContext;
        }

        public void Add(TypeCours entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(TypeCours entity)
        {
            throw new NotImplementedException();
        }

        public TypeCours Get(long id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<TypeCours> GetAll()
        {
            return _rfidContext.TypeCours.ToList();
        }

        public TypeCoursDto GetDto(long id)
        {
            throw new NotImplementedException();
        }

        public void Update(TypeCours entityToUpdate, TypeCours entity)
        {
            throw new NotImplementedException();
        }
    }
}
