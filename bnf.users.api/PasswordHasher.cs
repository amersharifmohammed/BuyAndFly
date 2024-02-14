using BCrypt.Net;

public static class PasswordHasher
{
    /// <summary>
    /// Hashes a password using bcrypt.
    /// </summary>
    /// <param name="password">The plain text password to hash.</param>
    /// <returns>The hashed password.</returns>
    public static string HashPassword(string password)
    {
        // The HashPassword method automatically generates a salt and applies a default work factor
        return BCrypt.Net.BCrypt.HashPassword(password);
    }

    /// <summary>
    /// Verifies a password against a given hash.
    /// </summary>
    /// <param name="password">The plain text password to verify.</param>
    /// <param name="hashedPassword">The hash to verify against.</param>
    /// <returns>true if the password matches the hash, false otherwise.</returns>
    public static bool VerifyPassword(string password, string hashedPassword)
    {
        return BCrypt.Net.BCrypt.Verify(password, hashedPassword);
    }
}
