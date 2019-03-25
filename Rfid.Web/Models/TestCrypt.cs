using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Rfid.Web.Models
{
    public class TestCrypt
    {
        // hash and save a password
        static string submittedPassword = "loool";
       
        static string hashedPassword = BCrypt.Net.BCrypt.HashPassword(submittedPassword);

        // check a password
        bool validPassword = BCrypt.Net.BCrypt.Verify(submittedPassword, hashedPassword);

        public static void test()
        {
            Console.WriteLine("Test");
        }
    }
}
