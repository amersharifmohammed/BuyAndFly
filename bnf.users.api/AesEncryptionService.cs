using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

public static class AesEncryptionService
{
    private static readonly byte[] AesKey = GenerateSecureKey(256); // 256 bits for AES-256
    private static readonly byte[] AesIV = GenerateSecureIV(128); // 128 bits for IV

    public static string EncryptString(string plainText)
    {
        using (var aes = Aes.Create())
        {
            aes.Key = AesKey;
            aes.IV = AesIV;

            ICryptoTransform encryptor = aes.CreateEncryptor(aes.Key, aes.IV);

            using (var msEncrypt = new MemoryStream())
            {
                using (var csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                using (var swEncrypt = new StreamWriter(csEncrypt))
                {
                    swEncrypt.Write(plainText);
                }

                return Convert.ToBase64String(msEncrypt.ToArray());
            }
        }
    }

    public static string DecryptString(string cipherText)
    {
        using (var aes = Aes.Create())
        {
            aes.Key = AesKey;
            aes.IV = AesIV;

            ICryptoTransform decryptor = aes.CreateDecryptor(aes.Key, aes.IV);

            using (var msDecrypt = new MemoryStream(Convert.FromBase64String(cipherText)))
            {
                using (var csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                using (var srDecrypt = new StreamReader(csDecrypt))
                {
                    return srDecrypt.ReadToEnd();
                }
            }
        }
    }

    private static byte[] GenerateSecureKey(int bitSize)
    {
        var key = new byte[bitSize / 8];
        using (var rng = new RNGCryptoServiceProvider())
        {
            rng.GetBytes(key);
        }
        return key;
    }

    private static byte[] GenerateSecureIV(int bitSize)
    {
        var iv = new byte[bitSize / 8];
        using (var rng = new RNGCryptoServiceProvider())
        {
            rng.GetBytes(iv);
        }
        return iv;
    }
}
