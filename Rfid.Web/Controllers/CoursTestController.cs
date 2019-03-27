﻿using System;
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
    public class CoursTestController : ControllerBase
    {
        private readonly RfidContext _context;

        public CoursTestController(RfidContext context)
        {
            _context = context;
        }

        // GET: api/CoursTest
        [HttpGet]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<IEnumerable<Cours>>> GetCours()
        {
            


            return await _context.Cours.ToListAsync();
        }

        // GET: api/CoursTest/5
        [HttpGet("{id}")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<Cours>> GetCours(int id)
        {
            var cours = await _context.Cours.FindAsync(id);

            if (cours == null)
            {
                return NotFound();
            }

            return cours;
        }

        // PUT: api/CoursTest/5
        [HttpPut("{id}")]
        //[Authorize(Roles = "Admin")]
        public async Task<IActionResult> PutCours(int id, Cours cours)
        {
            if (id != cours.IdCours)
            {
                return BadRequest();
            }

            _context.Entry(cours).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CoursExists(id))
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

        // POST: api/CoursTest
        [HttpPost]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<Cours>> PostCours(Cours cours)
        {
            _context.Cours.Add(cours);

            //Cours _cours= new Cours();

            //_cours.IdCours = cours.IdCours;
            //_cours.Libelle = cours.Libelle;
            //_cours.MaxParticipant = cours.MaxParticipant;
            //_cours.Date = cours.Date;
            //_cours.IdTypeCours =  5;
            //_cours.IdTypeCours = cours.IdTypeCours;

            //_context.Cours.Add(_cours);
            
            //_context.SaveChanges();
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCours", new { id = cours.IdCours }, cours);
        }

        // DELETE: api/CoursTest/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Cours>> DeleteCours(int id)
        {
            var cours = await _context.Cours.FindAsync(id);
            if (cours == null)
            {
                return NotFound();
            }

            _context.Cours.Remove(cours);
            await _context.SaveChangesAsync();

            return cours;
        }

        private bool CoursExists(int id)
        {
            return _context.Cours.Any(e => e.IdCours == id);
        }
    }
}