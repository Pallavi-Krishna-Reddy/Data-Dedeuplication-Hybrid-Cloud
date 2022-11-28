package com.example.hybrid_cloud_.algo;
import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;

import javax.crypto.Cipher;

public class EncryptionUtil {

  public static final String ALGORITHM = "RSA";

   public static final String PRIVATE_KEY_FILE = "private.txt";

  public static final String PUBLIC_KEY_FILE = "public.txt";

  public static void generateKey() {
    try {
      final KeyPairGenerator keyGen = KeyPairGenerator.getInstance(ALGORITHM);
      keyGen.initialize(1024);
      final KeyPair key = keyGen.generateKeyPair();

      File privateKeyFile = new File(PRIVATE_KEY_FILE);
      File publicKeyFile = new File(PUBLIC_KEY_FILE);

      // Create files to store public and private key
      if (privateKeyFile.getParentFile() != null) {
        privateKeyFile.getParentFile().mkdirs();
      }
      privateKeyFile.createNewFile();

      if (publicKeyFile.getParentFile() != null) {
        publicKeyFile.getParentFile().mkdirs();
      }
      publicKeyFile.createNewFile();

      // Saving the Public key in a file
      ObjectOutputStream publicKeyOS = new ObjectOutputStream(
          new FileOutputStream(publicKeyFile));
      publicKeyOS.writeObject(key.getPublic());
      System.out.println("public"+key.getPublic().getEncoded());
      publicKeyOS.close();

      // Saving the Private key in a file
      ObjectOutputStream privateKeyOS = new ObjectOutputStream(
      new FileOutputStream(privateKeyFile));
      privateKeyOS.writeObject(key.getPrivate());
      System.out.println("private"+key.getPrivate().getEncoded());
      //System.out.println(key.getPrivate());
      privateKeyOS.close();
    } catch (Exception e) {
      e.printStackTrace();
    }

  }

  public static boolean areKeysPresent() {

    File privateKey = new File(PRIVATE_KEY_FILE);
    File publicKey = new File(PUBLIC_KEY_FILE);

    if (privateKey.exists() && publicKey.exists()) {
      return true;
    }
    return false;
  }

  public static byte[] encrypt(byte[]bs, PublicKey key) {
    byte[] cipherText = null;
    try {
      // get an RSA cipher object and print the provider
      final Cipher cipher = Cipher.getInstance(ALGORITHM);
      // encrypt the plain text using the public key
      cipher.init(Cipher.ENCRYPT_MODE, key);
      cipherText = cipher.doFinal(bs);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return cipherText;
  }

  public static String decrypt(byte[] text, PrivateKey key) {
    byte[] dectyptedText = null;
    try {
      // get an RSA cipher object and print the provider
      final Cipher cipher = Cipher.getInstance(ALGORITHM);

      // decrypt the text using the private key
      cipher.init(Cipher.DECRYPT_MODE, key);
      dectyptedText = cipher.doFinal(text);

    } catch (Exception ex) {
      ex.printStackTrace();
    }

    return new String(dectyptedText);
  }

  public static void main(String[] args)throws IOException {
	 
	 
    try {
   	
        generateKey();
        File f=new File("test.txt"); //file is to encrypt
        byte[] contents = new byte[(int)f.length()];
        BufferedInputStream bis = null;
        try
        {
            bis = new BufferedInputStream(new FileInputStream(f));
            DataInputStream dis = new DataInputStream(bis);
            dis.readFully(contents);
        }
        finally
        {
            if(bis != null)
            {
                bis.close();
            }
        }           
        

     // final String originalText = "Text to be encrypted";
     

      // Encrypt the string using the public key
      ObjectInputStream  inputStream = new ObjectInputStream(new FileInputStream(PUBLIC_KEY_FILE));
      final PublicKey publicKey = (PublicKey) inputStream.readObject();
      final byte[] cipherText = encrypt(contents, publicKey);
      inputStream.close();
      // Decrypt the cipher text using the private key.
      ObjectInputStream inputStream1 = new ObjectInputStream(new FileInputStream(PRIVATE_KEY_FILE));
      final PrivateKey privateKey = (PrivateKey) inputStream1.readObject();
      final String plainText = decrypt(cipherText, privateKey);
      
      // Printing the Original, Encrypted and Decrypted Text
     
      System.out.println("Original Text: " + contents.toString());
      System.out.println("Encrypted Text: " +cipherText);
      System.out.println("Decrypted Text: " + plainText);
      inputStream.close();
      inputStream1.close();
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    finally
    {
    	
    }
    
    }
  }