package alogithm;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;

import java.io.FileInputStream;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import javax.crypto.Cipher;

public class RSACipher {
    
    	public static String TRANSFORMATION = "RSA/ECB/PKCS1Padding";
	
	public static String ENCODING = "UTF-8";

    public String encrypt(String rawText, String publicKeyPath)//, String transformatio)//, String encoding)
            throws IOException, GeneralSecurityException {

        X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(IOUtils.toByteArray(new FileInputStream(publicKeyPath)));

        Cipher cipher = Cipher.getInstance(TRANSFORMATION);
        cipher.init(Cipher.ENCRYPT_MODE, KeyFactory.getInstance("RSA").generatePublic(x509EncodedKeySpec));

        return Base64.encodeBase64String(cipher.doFinal(rawText.getBytes("UTF-8")));
    }

    public String decrypt(String cipherText, String privateKeyPath)//, String transformation)//, String encoding)
            throws IOException, GeneralSecurityException {

        PKCS8EncodedKeySpec pkcs8EncodedKeySpec = new PKCS8EncodedKeySpec(IOUtils.toByteArray(new FileInputStream(privateKeyPath)));

        Cipher cipher = Cipher.getInstance(TRANSFORMATION);
        cipher.init(Cipher.DECRYPT_MODE, KeyFactory.getInstance("RSA").generatePrivate(pkcs8EncodedKeySpec));

        return new String(cipher.doFinal(Base64.decodeBase64(cipherText)), ENCODING);
    }
}
