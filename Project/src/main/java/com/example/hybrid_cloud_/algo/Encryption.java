package com.example.hybrid_cloud_.algo;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class Encryption {

	public static byte[] encrypt(byte[] edata,byte[] key)
	{
		try
		{
			// Using semmetric-key
			Cipher cipher= Cipher.getInstance("AES");
			SecretKeySpec skeySpec = new SecretKeySpec(key, "AES");
			cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
			byte[] S_encrypted =cipher.doFinal(edata);
			System.out.println("encrypted data First byte : "+S_encrypted[0]);
			return S_encrypted;
		}
		catch(Exception e)
		{
			String s="Sorry";
			e.printStackTrace();
			return s.getBytes();
		}
	}

}
