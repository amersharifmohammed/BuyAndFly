
using bnf.users.api.Models;
using bnf.users.api.Repository;
using Microsoft.AspNetCore.SignalR;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;


namespace bnf.users.api.Providers
{
    public interface IUserProvider
    {
        Task<UserDetailsResponseModel> GetUserDetails(string email);
        Task<UserRegistrationResponseModel> RegisterUser(UserRegistrationRequestModel user);
        Task<UserLoginResponseModel> ValidateUser(UserLoginRequestModel login);
        Task<string> AuthenticateUser(UserLoginRequestModel login);
    }
    public class UserProvider : IUserProvider
    {
        private readonly IUserRepository _userRepository;
        private readonly JwtTokenService _jwtTokenService;

        public UserProvider(IUserRepository userRepository, JwtTokenService jwtTokenService)
        {
            _userRepository = userRepository;
            _jwtTokenService = jwtTokenService;
        }

        public async Task<UserDetailsResponseModel> GetUserDetails(string email)
        {
            return await _userRepository.GetUserDetails(email);
        }

        public async Task<UserRegistrationResponseModel> RegisterUser(UserRegistrationRequestModel user)
        {
            return await _userRepository.RegisterUser(user);
        }

        public async Task<UserLoginResponseModel> ValidateUser(UserLoginRequestModel login)
        {
            return await _userRepository.ValidateUser(login);
        }
        public async Task<string> AuthenticateUser(UserLoginRequestModel login)
        {
            var userLoginResponse = await _userRepository.ValidateUser(login);
            if (userLoginResponse != null && userLoginResponse.Success)
            {
                // Generate JWT token
                return _jwtTokenService.GenerateJwtToken(login.Username);  // Ensure 'login.Username' is correct
            }
            return null;
        }

    }
}
