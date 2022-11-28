package com.example.hybrid_cloud_.algo;

import java.io.Serializable;

public class EData implements Serializable {
	
	private byte[] eData=null;
	
	public EData()
	{
		
		
	}
	
	public byte[] geteData() {
		return eData;
	}

	public void seteData(byte[] eData) {
		this.eData = eData;
	}



}
