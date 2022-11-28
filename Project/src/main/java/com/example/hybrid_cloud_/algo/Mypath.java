/*
 * Mypath.java
 * Created on February 6, 2010, 10:30 PM
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.example.hybrid_cloud_.algo;
import java.io.*;

public class Mypath 
{
	public static String setPath(String dir) 
	{
		File directory = new File(dir);
		//"savedFrame\\"+x+".jpg"
		String path=null;
		if (directory.exists() )
		{
			path="AbsolutePath";
		}
		else
		{
			try
			{
             System.out.println("Directory : "+dir);
			directory.mkdirs();
			path="AbsolutePath";
			}
			catch(Exception e)
			{
				System.out.println("exception is :"+e);
			}
		}
		return path;
	}
	
	/*public static void main(String[] args)
	{
		Mypath oMypath=new Mypath();
		String a=oMypath.setPath("12_21_32");

	}
         */
	
}