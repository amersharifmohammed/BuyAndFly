using bnf.users.api.Models;
using Dapper;
using System.Data.SqlClient;

namespace bnf.users.api.Repository
{
    public interface IUserLocationRepository
    {
        Task<UserLocationResponseModel> GetUserLocationAsync(int userId);
        Task<bool> UpdateUserLocationAsync(UserLocationRequestModel location);
    }
    public class UserLocationRepository : IUserLocationRepository
    {
        private readonly string _connectionString;

        public UserLocationRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<UserLocationResponseModel> GetUserLocationAsync(int userId)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "SELECT * FROM UserLocations WHERE UserId = @UserId";
                return await connection.QueryFirstOrDefaultAsync<UserLocationResponseModel>(query, new { UserId = userId });
            }
        }

        public async Task<bool> UpdateUserLocationAsync(UserLocationRequestModel location)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "UPDATE UserLocations SET Address = @Address, City = @City, State = @State, Country = @Country, ZipCode = @ZipCode WHERE UserId = @UserId";
                var result = await connection.ExecuteAsync(query, location);
                return result > 0;
            }
        }
    }
}
