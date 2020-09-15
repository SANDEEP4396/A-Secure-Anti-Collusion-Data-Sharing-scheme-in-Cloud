package alogithm;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
 
/**
 * A utility class that encrypts or decrypts a file.
 * @author www.codejava.net
 *
 */
public class CryptoUtils {
    private static final String ALGORITHM = "AES";
    private static final String TRANSFORMATION = "AES";
 
    public static String encrypt(String key, File inputFile, File outputFile){
        return(doCrypto(Cipher.ENCRYPT_MODE, key, inputFile, outputFile));
    }
 
    public static String decrypt(String key, File inputFile, File outputFile){
    	return(doCrypto(Cipher.DECRYPT_MODE, key, inputFile, outputFile));
    }
 
    private static String doCrypto(int cipherMode, String key, File inputFile,
            File outputFile) {
        try {
            Key secretKey = new SecretKeySpec(key.getBytes(), ALGORITHM);
            Cipher cipher = Cipher.getInstance(TRANSFORMATION);
            cipher.init(cipherMode, secretKey);
             
            FileInputStream inputStream = new FileInputStream(inputFile);
            byte[] inputBytes = new byte[(int) inputFile.length()];
            inputStream.read(inputBytes);
             
            byte[] outputBytes = cipher.doFinal(inputBytes);
             
            FileOutputStream outputStream = new FileOutputStream(outputFile);
            outputStream.write(outputBytes);
             
            inputStream.close();
            outputStream.close();
             
        } catch(Exception e) {
        	e.printStackTrace();
        	return("failure");
        }
        return("success");
    }
    
   
}