package com.example.hybrid_cloud_.algo;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class Decryption {

	public static byte[] decrypt(byte[] msg,byte[] key)
	{
		String Omsg=null;
		byte[] original=null;
		try
		{
			// Using S-key
			Cipher cipher= Cipher.getInstance("AES");
			SecretKeySpec skeySpec = new SecretKeySpec(key, "AES");
			cipher.init(Cipher.DECRYPT_MODE, skeySpec);
			original =cipher.doFinal(msg);
			// Omsg=new String(original);			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return original;
	}
}