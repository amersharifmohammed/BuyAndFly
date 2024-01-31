using bnf.users.api.Models;
using bnf.users.api.Providers;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace bnf.users.api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UserLocationController : ControllerBase
    {
        private readonly IUserLocationProvider _provider;

        public UserLocationController(IUserLocationProvider provider)
        {
            _provider = provider;
        }

        [HttpGet("{userId}")]
        public async Task<IActionResult> GetUserLocation(int userId)
        {
            var location = await _provider.GetUserLocationAsync(userId);
            return Ok(location);
        }

        [HttpPost]
        public async Task<IActionResult> UpdateUserLocation([FromBody] UserLocationRequestModel location)
        {
            var success = await _provider.UpdateUserLocationAsync(location);
            if (success)
                return Ok();
            else
                return BadRequest();
        }
    }
}
