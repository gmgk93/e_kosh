package ekosh;

import java.io.IOException;
import java.io.InputStream;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
 



import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.io.IOUtils;
 

public class cryptClass {
    private static final String ALGORITHM = "AES";
    private static final String TRANSFORMATION = "AES";
    private static byte[] outputBytes;
 
    public static byte[] encrypt(String key, InputStream inputFile)
            throws Exception {
        return doCrypto(Cipher.ENCRYPT_MODE, key, inputFile);
    }
 
    public static byte[] decrypt(String key, InputStream inputFile)
            throws Exception {
        return doCrypto(Cipher.DECRYPT_MODE, key, inputFile);
    }
 
    private static byte[] doCrypto(int cipherMode, String key, InputStream inputFile) 
    		throws Exception {
        try {
            Key secretKey = new SecretKeySpec(key.getBytes(), ALGORITHM);
            Cipher cipher = Cipher.getInstance(TRANSFORMATION);
            cipher.init(cipherMode, secretKey);
            
            //convert inputStream to inputBytes
            byte[] inputBytes = IOUtils.toByteArray(inputFile);
             
            //encrypt
            outputBytes = cipher.doFinal(inputBytes);
             
        } catch (NoSuchPaddingException | NoSuchAlgorithmException
                | InvalidKeyException | BadPaddingException
                | IllegalBlockSizeException | IOException ex) {
            throw new Exception("Error encrypting/decrypting file", ex);
        }
		return outputBytes;
    }
}