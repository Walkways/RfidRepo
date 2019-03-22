using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Rfid.Web.Models;
using Rfid.Web.Models.DataManager;
using Rfid.Web.Models.Repository;

namespace Rfid.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TypeCoursController : ControllerBase
    {
        private readonly IDataRepository<TypeCours, TypeCoursDto> _dataRepository;

        public TypeCoursController(IDataRepository<TypeCours, TypeCoursDto> dataRepository)
        {
            _dataRepository = dataRepository;
        }

        // GET: api/TypeCours
        [HttpGet]
        public IEnumerable<TypeCours> GetTypeCours()
        {
            return _dataRepository.GetAll();
        }

        //// GET: api/TypeCours/5
        //[HttpGet("{id}")]
        //public async Task<ActionResult<TypeCours>> GetTypeCours(int id)
        //{
        //    var typeCours = await _context.TypeCours.FindAsync(id);

        //    if (typeCours == null)
        //    {
        //        return NotFound();
        //    }

        //    return typeCours;
        //}

        //// PUT: api/TypeCours/5
        //[HttpPut("{id}")]
        //public async Task<IActionResult> PutTypeCours(int id, TypeCours typeCours)
        //{
        //    if (id != typeCours.IdTypeCours)
        //    {
        //        return BadRequest();
        //    }

        //    _context.Entry(typeCours).State = EntityState.Modified;

        //    try
        //    {
        //        await _context.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!TypeCoursExists(id))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return NoContent();
        //}

        //// POST: api/TypeCours
        //[HttpPost]
        //public async Task<ActionResult<TypeCours>> PostTypeCours(TypeCours typeCours)
        //{
        //    _context.TypeCours.Add(typeCours);
        //    await _context.SaveChangesAsync();

        //    return CreatedAtAction("GetTypeCours", new { id = typeCours.IdTypeCours }, typeCours);
        //}

        //// DELETE: api/TypeCours/5
        //[HttpDelete("{id}")]
        //public async Task<ActionResult<TypeCours>> DeleteTypeCours(int id)
        //{
        //    var typeCours = await _context.TypeCours.FindAsync(id);
        //    if (typeCours == null)
        //    {
        //        return NotFound();
        //    }

        //    _context.TypeCours.Remove(typeCours);
        //    await _context.SaveChangesAsync();

        //    return typeCours;
        //}

        //private bool TypeCoursExists(int id)
        //{
        //    return _context.TypeCours.Any(e => e.IdTypeCours == id);
        //}
    }
}
