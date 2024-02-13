using bnf.users.api.Models;
using bnf.users.api.Providers;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace bnf.users.api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UserController : ControllerBase
    {
        private readonly IUserProvider _userProvider;
        private readonly JwtTokenService _jwtTokenService;

        public UserController(IUserProvider userProvider, JwtTokenService jwtTokenService)
        {
            _userProvider = userProvider;
            _jwtTokenService = jwtTokenService;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] UserRegistrationRequest request)
        {
            
            var response = await _userProvider.RegisterUser(request); 
            return Ok(response);
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] UserLoginRequest request)
        {
             var token = await _userProvider.AuthenticateUser(request); 
            if (!string.IsNullOrEmpty(token))
            {
                return Ok(new { Token = token });
            }
            else
            {
                return Unauthorized("Invalid username or password.");
            }
        }

        [HttpGet("details")]
        public async Task<IActionResult> GetUserDetails([FromQuery] UserDetailsRequest request)
        {
            var response = await _userProvider.GetUserDetails(request.Email);
            if (response != null)
                return Ok(response);
            else
                return NotFound();
        }

    }
}
