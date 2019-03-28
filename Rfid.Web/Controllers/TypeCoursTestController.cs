using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Rfid.Web.Models;

namespace Rfid.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TypeCoursTestController : ControllerBase
    {
        private readonly RfidContext _context;

        public TypeCoursTestController(RfidContext context)
        {
            _context = context;
        }

        // GET: api/TypeCoursTest
        [HttpGet]
        [Authorize(Roles = "admin")]
        public async Task<ActionResult<IEnumerable<TypeCours>>> GetTypeCours()
        {
            return await _context.TypeCours.ToListAsync();
        }

        // GET: api/TypeCoursTest/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TypeCours>> GetTypeCours(int id)
        {
            var typeCours = await _context.TypeCours.FindAsync(id);

            if (typeCours == null)
            {
                return NotFound();
            }

            return typeCours;
        }

        // PUT: api/TypeCoursTest/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTypeCours(int id, TypeCours typeCours)
        {
            if (id != typeCours.IdTypeCours)
            {
                return BadRequest();
            }

            _context.Entry(typeCours).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TypeCoursExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/TypeCoursTest
        [HttpPost]
        public async Task<ActionResult<TypeCours>> PostTypeCours(TypeCours typeCours)
        {
            _context.TypeCours.Add(typeCours);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTypeCours", new { id = typeCours.IdTypeCours }, typeCours);
        }

        // DELETE: api/TypeCoursTest/5
        [HttpDelete("{id}")]
        //[Authorize(Roles = "Admin")]
        public async Task<ActionResult<TypeCours>> DeleteTypeCours(int id)
        {
            var typeCours = await _context.TypeCours.FindAsync(id);
            
            if (typeCours == null)
            {
                return NotFound();
            }

            _context.TypeCours.Remove(typeCours);
            await _context.SaveChangesAsync();

            return typeCours;
        }

        private bool TypeCoursExists(int id)
        {
            return _context.TypeCours.Any(e => e.IdTypeCours == id);
        }
    }
}
