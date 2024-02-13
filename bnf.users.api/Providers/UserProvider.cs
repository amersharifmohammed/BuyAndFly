
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
        Task<UserDetailsResponse> GetUserDetails(string email);
        Task<UserRegistrationResponse> RegisterUser(UserRegistrationRequest user);
        Task<string> AuthenticateUser(UserLoginRequest login);
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

        public async Task<UserDetailsResponse> GetUserDetails(string email)
        {
            try
            {
                return await _userRepository.GetUserDetails(email);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        public async Task<UserRegistrationResponse> RegisterUser(UserRegistrationRequest user)
        { 

            return await _userRepository.RegisterUser(user);
        }

        public async Task<string> AuthenticateUser(UserLoginRequest login)
        {
            var userLoginResponse = await _userRepository.ValidateUser(login); // Properly await the async call
            if (userLoginResponse != null && userLoginResponse.Success)
            {
                // Generate JWT token
                // Assuming GenerateJwtToken method is correctly implemented to accept UserLoginResponseModel or some property of it
                return _jwtTokenService.GenerateJwtToken(userLoginResponse);  // Adjust this call as necessary
            }
            return null;
        }
    }

}
