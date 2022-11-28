
package com.example.hybrid_cloud_.algo;

import java.security.MessageDigest;

public class MessageDigest5Base {
    
    public static String bytesToHex(byte[] b) {
        char hexDigit[] = {'0', '1', '2', '3', '4', '5', '6', '7',
                           '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        StringBuffer buf = new StringBuffer();
        for (int j=0; j<b.length; j++) {
           buf.append(hexDigit[(b[j] >> 4) & 0x0f]);
           buf.append(hexDigit[b[j] & 0x0f]);
        }
        return buf.toString();
     }
      public String getMD5(byte[] seed)
      {
      	byte[] output =null;
      	String s=null;
          try {
          	MessageDigest md = MessageDigest.getInstance("MD5"); 
           md.update(seed); 
           output = md.digest();  
           s=bytesToHex(output);
        } catch (Exception e) {
           System.out.println("Exception: "+e);
        }
          return s;
      }
      
      public static void main(String[] args) {
    	  MessageDigest5Base oBase=new MessageDigest5Base();
    	  String hdata=oBase.getMD5("".getBytes());
    	
    	  System.out.println(hdata);
		
	}
      
}



