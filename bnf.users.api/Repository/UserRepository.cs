
using bnf.users.api.Models;
using Dapper;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace bnf.users.api.Repository
{
    public interface IUserRepository
    {
        Task<UserDetailsResponseModel> GetUserDetails(string email);
        Task<UserRegistrationResponseModel> RegisterUser(UserRegistrationRequestModel user);
        Task<UserLoginResponseModel> ValidateUser(UserLoginRequestModel login);
    }
    public class UserRepository : IUserRepository
    {
        private readonly string _connectionString;

        public UserRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<UserDetailsResponseModel> GetUserDetails(string email)
        {
            using var connection = new SqlConnection(_connectionString);
            return await connection.QueryFirstOrDefaultAsync<UserDetailsResponseModel>(
                "spGetUserDetails", new { Email = email }, commandType: CommandType.StoredProcedure);
        }

        public async Task<UserRegistrationResponseModel> RegisterUser(UserRegistrationRequestModel user)
        {
            using var connection = new SqlConnection(_connectionString);
            var parameters = new DynamicParameters();
            parameters.Add("@FirstName", user.FirstName);
            parameters.Add("@LastName", user.LastName);
            parameters.Add("@BirthDate", user.BirthDate);
            parameters.Add("@Email", user.Email);
            parameters.Add("@PhoneNumber", user.PhoneNumber);
            parameters.Add("@Country", user.Country);
            parameters.Add("@Username", user.Email); // Assuming the email as username. Change as required.
            parameters.Add("@Password", user.Password); // Ensure this is a hashed password in a real application

            var result = await connection.ExecuteAsync("spRegisterUser", parameters, commandType: CommandType.StoredProcedure);
            return new UserRegistrationResponseModel
            {
                Success = result > 0,
                Message = result > 0 ? "Registration successful" : "Registration failed"
            };
        }

        public async Task<UserLoginResponseModel> ValidateUser(UserLoginRequestModel login)
        {
            using var connection = new SqlConnection(_connectionString);
            var parameters = new DynamicParameters();
            parameters.Add("@Username", login.Username);
            parameters.Add("@Password", login.Password); // Ensure this is a hashed password in a real application

            // Execute the stored procedure and get the user data
            var user = await connection.QuerySingleOrDefaultAsync<UserModel>(
                "spValidateUser", parameters, commandType: CommandType.StoredProcedure);

            // Check if user exists and return appropriate response
            if (user != null)
            {
                return new UserLoginResponseModel
                {
                    Success = true,
                    UserRole = user.UserRole // Assuming UserRole is part of your UserModel
                };
            }
            else
            {
                return new UserLoginResponseModel { Success = false };
            }
        }
    }
}


