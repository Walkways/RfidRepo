using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Rfid.Web.Models;

namespace Rfid.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly RfidContext _context;

        public UsersController(RfidContext context)
        {
            _context = context;
        }

        // GET: api/Users
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Users>>> GetUsers()
        {
            return await _context.Users.ToListAsync();
        }

        // GET: api/Users/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Users>> GetUsers(int id)
        {
            var users = await _context.Users.FindAsync(id);

            if (users == null)
            {
                return NotFound();
            }

            return users;
        }

        // PUT: api/Users/5
        [HttpPut("{id}")]
        public async Task<ActionResult<Users>> PutUsers(int id, Users users)
        {
            if (id != users.IdUsers)
            {
                return BadRequest();
            }

            //_context.Entry(users).State = EntityState.Modified;

            var Mon_usr = _context.Users.Find(id);

            

            Mon_usr.Nom = users.Nom;
            Mon_usr.Prenom = users.Prenom;
            Mon_usr.Passe = users.Passe;
            Mon_usr.Tel = users.Tel;
            Mon_usr.Email = users.Email;
            Mon_usr.Actif = users.Actif;

             _context.SaveChanges();

            
            var adresse = await _context.Adresse.FindAsync(Mon_usr.IdAdresse);
            adresse.Libelle = users.IdAdresseNavigation.Libelle;
            adresse.Complement = users.IdAdresseNavigation.Complement;
            adresse.Cp = users.IdAdresseNavigation.Cp;
            adresse.Ville = users.IdAdresseNavigation.Ville;


            await _context.SaveChangesAsync();



            return NoContent();
        }

        // POST: api/Users
        [HttpPost]
        public async Task<ActionResult<Users>> PostUsers(Users users)
        {
            users.Passe = BCrypt.Net.BCrypt.HashPassword(users.Passe);            

            _context.Adresse.Add(users.IdAdresseNavigation);

            users.IdAdresse = users.IdAdresseNavigation.IdAdresse;
            _context.Users.Add(users);

            

            ////////////////////////////////////////////////////////////

            //Users usr = new Users();
            //usr  = _context.Users.Find(users);
            //usr.IdUsers;



            //Adresse adr = new Adresse();
            //adr = _context.Adresse.Find(users.IdAdresseNavigation);
            //adr.IdAdresse;
            //////////////////////////////////////////////////////
            

            
            
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetUsers", new { id = users.IdUsers }, users);
        }

        // DELETE: api/Users/5
        [HttpDelete("{id}")]        
        public async Task<ActionResult<Users>> DeleteUsers(int id)
        {
            var users = await _context.Users.FindAsync(id);
            var adresse = await _context.Adresse.FindAsync(users.IdAdresse);
            if (users == null)
            {
             return NotFound();
            }


            _context.Adresse.Remove(adresse);
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
