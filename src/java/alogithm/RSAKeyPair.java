package alogithm;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;

public final class RSAKeyPair {
    
    private int keyLength;
    
    private PrivateKey privateKey;
    
    private PublicKey publicKey;
    
    public RSAKeyPair(int keyLength)
            throws GeneralSecurityException {
        
        this.keyLength = keyLength;
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        keyPairGenerator.initialize(this.keyLength);
        KeyPair keyPair = keyPairGenerator.generateKeyPair();
        privateKey = keyPair.getPrivate();
        publicKey = keyPair.getPublic();
    }
    
    public final PrivateKey getPrivateKey() {
        return privateKey;
    }
    
    public final PublicKey getPublicKey() {
        return publicKey;
    }
    
    public final void toFileSystem(String privateKeyPathName, String publicKeyPathName)
            throws IOException {
        
        FileOutputStream privateKeyOutputStream = null;
        FileOutputStream publicKeyOutputStream = null;
        
        try {
        
            File privateKeyFile = new File(privateKeyPathName);
            File publicKeyFile = new File(publicKeyPathName);

            privateKeyOutputStream = new FileOutputStream(privateKeyFile);
            privateKeyOutputStream.write(privateKey.getEncoded());

            publicKeyOutputStream = new FileOutputStream(publicKeyFile);
            publicKeyOutputStream.write(publicKey.getEncoded());
            
        } catch(IOException ioException) {
            throw ioException;
        } finally {
        
            try {
                
                if (privateKeyOutputStream != null) {
                    privateKeyOutputStream.close();
                }
                if (publicKeyOutputStream != null) {
                    publicKeyOutputStream.close();
                }   
                
            } catch(IOException ioException) {
                throw ioException;
            }
        }
    }
    
    
    public static void main(String args[]){
    	 String privateKeyPathName = "key/private.key";
    	 String publicKeyPathName = "key/public.key";
    	 String transformation = "RSA/ECB/PKCS1Padding";
    	 String encoding = "UTF-8";
    	 try{
	    	RSAKeyPair rsaKeyPair = new RSAKeyPair(2048);
	        rsaKeyPair.toFileSystem(privateKeyPathName, publicKeyPathName);
	        
	        RSACipher rsaCipher = new RSACipher();
            String encrypted = rsaCipher.encrypt("John has a long mustache.", publicKeyPathName);//, transformation, encoding);
            String decrypted = rsaCipher.decrypt(encrypted, privateKeyPathName);//, transformation, encoding);
	        
            System.out.println("Encrypt::"+encrypted);
            System.out.println("Decrypt::"+decrypted);
      
            
    	 }catch (Exception e) {
    		 e.printStackTrace();
		}
    }
}