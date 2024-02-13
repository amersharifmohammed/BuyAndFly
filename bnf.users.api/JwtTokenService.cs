using bnf.users.api.Models;
using bnf.users.api.Providers;
using bnf.users.api.Repository;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace bnf.users.api
{
   
    public class JwtTokenService
    {
        private readonly IConfiguration _configuration;
        

        public JwtTokenService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public string GenerateJwtToken(UserLoginResponse user) // Only userId is required
        {
          

            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var claims = new[]
            {
                new Claim("UserId", user.UserId.ToString()),
                new Claim("FirstName", user.FirstName.ToString()),
                new Claim("LastName", user.LastName.ToString()),
                new Claim("Email", user.Email.ToString()),
                new Claim("BirthDate", user.BirthDate.ToString()),
        
                new Claim("PhoneNumber", user.PhoneNumber.ToString()),
                new Claim("UserRole", user.UserRole ?? "User"),
                new Claim("Username", user.Username.ToString()),



                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
                // Removed username related claims
            };

            var token = new JwtSecurityToken(
                issuer: _configuration["Jwt:Issuer"],
                audience: _configuration["Jwt:Audience"],
                claims: claims,
                expires: DateTime.Now.AddMinutes(120),
                signingCredentials: credentials
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
