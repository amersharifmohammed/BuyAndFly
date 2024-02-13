using bnf.users.api.Models;
using Dapper;
using System.Data;
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

            var parameters = new DynamicParameters();
            parameters.Add("@Address", location.Address);
            parameters.Add("@City", location.City);
            parameters.Add("@State", location.State);
            parameters.Add("@Country", location.Country);
            parameters.Add("@UserId", location.UserId);

            using (var connection = new SqlConnection(_connectionString))
            {
               var result =  await connection.ExecuteAsync(
                "UpdateUserLocation",
                parameters,
                commandType: CommandType.StoredProcedure);
                
                return result > 0;
            }
        }
    }
}
