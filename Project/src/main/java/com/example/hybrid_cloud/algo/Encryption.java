package com.example.hybrid_cloud.algo;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class Encryption {

	public static byte[] encrypt(byte[] edata,byte[] key) {
		byte[] S_encrypted = null;
		try {
			// Using symmetric-key
			Cipher cipher= Cipher.getInstance("AES");
			SecretKeySpec skeySpec = new SecretKeySpec(key, "AES");
			cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
			S_encrypted =cipher.doFinal(edata);
			System.out.println("encrypted data First byte : "+S_encrypted[0]);
			return S_encrypted;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return S_encrypted;
	}
}
