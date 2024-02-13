using bnf.users.api.Models;
using Dapper;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration; // Make sure to include this if not already included for IConfiguration

namespace bnf.users.api.Repository
{
    public interface IUserRepository
    {
        Task<UserDetailsResponse> GetUserDetails(string email);
        Task<UserRegistrationResponse> RegisterUser(UserRegistrationRequest user);
        Task<UserLoginResponse> ValidateUser(UserLoginRequest login); // Updated to be async
    }

    public class UserRepository : IUserRepository
    {
        private readonly string _connectionString;

        public UserRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<UserDetailsResponse> GetUserDetails(string email)
        {
            using var connection = new SqlConnection(_connectionString);
            return await connection.QueryFirstOrDefaultAsync<UserDetailsResponse>(
                "spGetUserDetails", new { Email = email }, commandType: CommandType.StoredProcedure);
        }

        public async Task<UserRegistrationResponse> RegisterUser(UserRegistrationRequest user)
        {
            //Check for username



            using var connection = new SqlConnection(_connectionString);

            var parametersCheck = new DynamicParameters();
            parametersCheck.Add("@Username", user.Email);
            UserModel? userCheck = await CheckUserName(connection, parametersCheck);

            // Add a null check for userCheck before accessing its properties
            if (userCheck != null && userCheck.Username == user.Email)
            {
                return new UserRegistrationResponse
                {
                    Success = false,
                    Message = "Email Address already exists. Please choose a different email"
                };
            }



            var parameters = new DynamicParameters();
            parameters.Add("@FirstName", user.FirstName);
            parameters.Add("@LastName", user.LastName);
            parameters.Add("@BirthDate", user.BirthDate);
            parameters.Add("@Email", user.Email);
            parameters.Add("@PhoneNumber", user.PhoneNumber);
            
            parameters.Add("@Username", user.Email);
            // Assuming the email as username. Change as required.

            // Ensure this is an encrypted password in a real application
            string encryptedPassword = AesEncryptionService.EncryptString(user.Password);
            parameters.Add("@Password", encryptedPassword); // Storing encrypted password

            var result = await connection.ExecuteAsync("spRegisterUser", parameters, commandType: CommandType.StoredProcedure);
            return new UserRegistrationResponse
            {
                Success = result > 0,
                Message = result > 0 ? "Registration successful" : "Registration failed"
            };
        }

        public async Task<UserLoginResponse> ValidateUser(UserLoginRequest login) // Made async
        {

            using var connection = new SqlConnection(_connectionString);
            var parameters = new DynamicParameters();
            parameters.Add("@Username", login.Username);
            
            UserModel? user = await CheckUserName(connection, parameters);

            if (user != null)
            {
                string encryptedInputPassword = AesEncryptionService.EncryptString(login.Password);
                if (encryptedInputPassword == user.Password)
                {
                    return new UserLoginResponse
                    {
                        Success = true,
                        UserRole = user.UserRole,
                        UserId = user.UserId,
                        BirthDate = user.BirthDate,
                        
                        Email = user.Email,
                        Password = user.Password, // Consider not returning the password
                        FirstName = user.FirstName,
                        LastName = user.LastName,
                        PhoneNumber = user.PhoneNumber,
                        Username = user.Username
                    };
                }
                else
                {
                    return new UserLoginResponse { Success = false, Message = "Invalid login attempt." };
                }
            }
            else
            {
                return new UserLoginResponse { Success = false, Message = "User not found." };
            }
        }

        private static async Task<UserModel?> CheckUserName(SqlConnection connection, DynamicParameters parameters)
        {
            return await connection.QuerySingleOrDefaultAsync<UserModel>(
                "spFetchUserByUsername",
                parameters,
                commandType: CommandType.StoredProcedure);
        }
    }
}
