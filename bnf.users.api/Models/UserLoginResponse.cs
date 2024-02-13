namespace bnf.users.api.Models
{
    public class UserLoginResponse
    {
        public bool Success { get; set; }
        public string Message { get; set; }
        public string UserRole { get; set; }
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime BirthDate { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
       
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
