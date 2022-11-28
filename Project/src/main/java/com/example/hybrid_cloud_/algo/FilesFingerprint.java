package com.example.hybrid_cloud_.algo;

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class FilesFingerprint {
	
	public static String getFileFingerprint(DataInputStream fis,byte[] data)
	{
		byte[] dataBytes =data;
       System.out.println("length of databyte[] : "+dataBytes.length);
		//fis.readFully(b, off, len)
		 
	    int nread = 0; 
	    MessageDigest md=null;;
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    try {
			while ((nread = fis.read(dataBytes)) != -1) {
			  md.update(dataBytes, 0, dataBytes.length);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
	 
	    byte[] mdbytes = md.digest();
	 
	    //convert the byte to hex format
	    StringBuffer sb = new StringBuffer("");
	    for (int i = 0; i < mdbytes.length; i++) {
	    	sb.append(Integer.toString((mdbytes[i] & 0xff) + 0x100, 16).substring(1));
	    }
	 
	    System.out.println("FileFingerprint:: " + sb.toString());
	    
	    return sb.toString();
		
	}
	
	public static void main(String[] args) {
		
		//FilesFingerprint.getFileFingerprint(fis, data)
	}

}
