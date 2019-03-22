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
    public class CoursController : ControllerBase
    {
        private readonly IDataRepository<Cours, CoursDto> _dataRepository;

        public CoursController(IDataRepository<Cours, CoursDto> dataRepository)
        {
            _dataRepository = dataRepository;
        }

        // GET: api/Cours
        [HttpGet]
        public IActionResult Get()
        {
            var cours = _dataRepository.GetAll();

            return Ok(cours);
        }

    }
}
