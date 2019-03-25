using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Rfid.Web.Models;

namespace Rfid.Web.Controllers  //NE PAS UTILISER!
{
    [Route("api/[controller]")]
    [ApiController]
    public class MdpOublieController : ControllerBase
    {
        private readonly RfidContext _context;

        public MdpOublieController(RfidContext context)
        {
            _context = context;
        }

        // GET: api/MdpOublie
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Users>>> GetUsers()
        {


            return await _context.Users.ToListAsync();
        }

        // GET: api/MdpOublie/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Users>> GetUsers(int id)
        {
            var users = await _context.Users.FindAsync(id);

            if (users == null)
            {
                return NotFound();
            }

            //string hashedPassword;
            //string submittedPassword;

            //var query = from RfidContext in _context.Users
                        //where RfidContext.IdUsers == id
                        //select RfidContext.Passe;

            users.Passe= BCrypt.Net.BCrypt.HashPassword(users.Passe);

            /*
            foreach (string mdp in query)
            {
                var tmp = BCrypt.Net.BCrypt.HashPassword(mdp);
                mdp.Insert(id, tmp);                
                
                // Insert any additional changes to column values.
            }
            */

            // Submit the changes to the database.
            try
            {
                //_context.SubmitChanges();
                _context.SaveChanges();
                
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                // Provide for exceptions.
            }



            return users;
        }

        // PUT: api/MdpOublie/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutUsers(int id, Users users)
        {
            if (id != users.IdUsers)
            {
                return BadRequest();
            }

            _context.Entry(users).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UsersExists(id))
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

        // POST: api/MdpOublie
        [HttpPost]
        public async Task<ActionResult<Users>> PostUsers(Users users)
        {
            _context.Users.Add(users);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetUsers", new { id = users.IdUsers }, users);
        }

        // DELETE: api/MdpOublie/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Users>> DeleteUsers(int id)
        {
            var users = await _context.Users.FindAsync(id);
            if (users == null)
            {
                return NotFound();
            }

            _context.Users.Remove(users);
            await _context.SaveChangesAsync();

            return users;
        }

        private bool UsersExists(int id)
        {
            return _context.Users.Any(e => e.IdUsers == id);
        }
    }
}
