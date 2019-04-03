using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Security.Claims;
using System.IdentityModel.Tokens.Jwt;
using System.Text;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Rfid.Web.Models;


namespace Rfid.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController: ControllerBase
    {

        

        private readonly RfidContext _context;
        

        public AuthController(RfidContext context)
        {
            _context = context;
        }

        
        // GET api/values
        [HttpPost, Route("login")]
        public IActionResult Login([FromBody]LoginModel user)
        {
            if (user == null)
            {
                return BadRequest("Invalid client request");
            }

            

            var query = from RfidContext in _context.Users
                        where RfidContext.Email == user.UserMail                        
                        select RfidContext.Nom; // check corespondance mail/mdp

            
            var query4 = from RfidContext in _context.Users
                        where RfidContext.Email == user.UserMail                        
                        select RfidContext.Passe;
            


            var query3 = from RfidContext in _context.Users
                         where RfidContext.Email == user.UserMail                         
                         select RfidContext.IdUsers; // recupere l'id

            

            var tmp = query3.ToList();
            var id = tmp[0]; // recuperé l'id pour, plus tars, racueprer les roles associés


            var query2 = from RfidContext in _context.AppRole
                       join UsersAppRole in _context.UsersAppRole on RfidContext.IdAppRole equals UsersAppRole.IdAppRole
                       where UsersAppRole.IdUsers == id
                       select  RfidContext.Nom;

            var list = query2.ToList();  // recuperre la liste de roles

            

            /* ////a remplacer par une requette sur 3 tables
            var query3 = from UserContext in _context.Users
                         where UserContext.Nom == user.UserName
                         select UserContext.Role;
                         */

            //var tmp_role = query3.ToList();
            //string role = tmp_role[0];

            var username = query.ToList();
            

            var tmp_hashedPassword = query4.ToList();
            var hashedPassword = tmp_hashedPassword[0];
            bool validPassword = false;
            var submittedPassword = user.Password;

            
                // check the password using bcrypt
                validPassword = BCrypt.Net.BCrypt.Verify(submittedPassword, hashedPassword);
            

            //if (username.Count != 0)
            if (validPassword)
            {
                var secretKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("superSecretKey@345"));
                var signinCredentials = new SigningCredentials(secretKey, SecurityAlgorithms.HmacSha256);

                /*
                var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Name, user.UserName),
                        new Claim(ClaimTypes.Role, role)
                    };
                    */

                var claims2 = new List<Claim>();
                claims2.Add(new Claim(ClaimTypes.Name, user.UserMail)); //mail ou username?

                for (int i = 0; i<list.Count; i++)
                {                    
                    
                    claims2.Add(new Claim(ClaimTypes.Role, list[i]));
                }

                /*
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, user.UserName),
                    //new Claim(ClaimTypes.Role, list),
                    //new Claim(ClaimTypes.Role, "Admin"),
                    //new Claim(ClaimTypes.Role, "Manager")///
                    


            };*/

                var tokeOptions = new JwtSecurityToken(
                    issuer: "http://192.168.1.174:58000",
                    audience: "http://192.168.1.174:58000",
                    claims: claims2,
                    expires: DateTime.Now.AddDays(1),
                    signingCredentials: signinCredentials
                );

                var tokenString = new JwtSecurityTokenHandler().WriteToken(tokeOptions);
                return Ok(new { Token = tokenString });
            }
            else
            {
                return Unauthorized();
            }

            
        }
        
    }
}
