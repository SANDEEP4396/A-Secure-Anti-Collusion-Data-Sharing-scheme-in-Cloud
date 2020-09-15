/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import alogithm.CryptoUtils;
import alogithm.RSACipher;
import alogithm.RSAKeyPair;
import java.io.File;
import java.util.Random;

/**
 *
 * @author Sangamesh
 */
public class EncryptRsa {
    
    public static String generateKey(){
		String str="abcdefghijklmnopqrstuvwxyz1234567890";
		String key="";
		for(int i=0;i<16;i++){
			key=key+""+str.charAt(new Random().nextInt(36));
		}
		return(key);
	}
    // user has to generate a key and store it in db and givi it for encryption and same key is requiered to decrypt
    
    public String encrypt(String UserName,String UsrKey,String Data){
        
        String encdata="";
        
        try{
        	RSAKeyPair rsaKeyPair = new RSAKeyPair(2048);
						String privateKey="S:/key/private-"+UserName+".key";
						String publicKey="S:/key/public-"+UserName+".key";
				        rsaKeyPair.toFileSystem(privateKey,publicKey);
				        CryptoUtils.encrypt(UsrKey, new File(privateKey),new File(privateKey+".secret"));
				       RSACipher cip = new RSACipher();
                                      encdata =  cip.encrypt(Data, publicKey);
                                     System.out.printf("Enc data======="+encdata);
                                     return encdata;
                    
                }catch(Exception e){
                              e.printStackTrace();
                }
        return encdata;
        }
    
    
    public String dencrypt(String UserName,String UsrKey,String encData){
        
        String DData="";
        try{
        String privateKey="S:/key/private-"+UserName+".key";
          RSACipher cip=new RSACipher();
	     DData=cip.decrypt(encData, privateKey);//, SecureUtil.TRANSFORMATION, SecureUtil.ENCODING);
        
        }catch(Exception e){
            e.printStackTrace();
        }			
        
        return DData;
    }
    
//    public static void main(String[] argv){
//        
//        EncryptRsa e = new EncryptRsa();
//    
//       String  key = e.generateKey();
//      System.out.println("key----------1----"+key);
//      
//      
//      String encData = e.encrypt("sangamesh", key,"");
//      
//      
//      System.out.println("key-----------2---"+key);
//      
//      
//      e.dencrypt("sangamesh", key, encData);
//        
//        
//        
//    }
    
}
