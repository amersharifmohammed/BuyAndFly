using bnf.users.api.Models;
using bnf.users.api.Repository;

namespace bnf.users.api.Providers
{
    public interface IUserLocationProvider
    {
        Task<UserLocationResponseModel> GetUserLocationAsync(int userId);
        Task<bool> UpdateUserLocationAsync(UserLocationRequestModel location);
    }
    public class UserLocationProvider : IUserLocationProvider
    {
        private readonly IUserLocationRepository _repository;

        public UserLocationProvider(IUserLocationRepository repository)
        {
            _repository = repository;
        }

        public async Task<UserLocationResponseModel> GetUserLocationAsync(int userId)
        {
            return await _repository.GetUserLocationAsync(userId);
        }

        public async Task<bool> UpdateUserLocationAsync(UserLocationRequestModel location)
        {
            return await _repository.UpdateUserLocationAsync(location);
        }
    }
}
