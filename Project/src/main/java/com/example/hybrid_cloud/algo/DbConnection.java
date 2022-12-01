package com.example.hybrid_cloud.algo;
import java.sql.*;

public class  DbConnection
{
	private Connection con=null;
	private Statement st=null;
	private ResultSet rs=null;
	private int i=0;
	private static DbConnection db=null;

	private DbConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch(Exception e) {
			System.out.println(e);
		}
	}

	static {
		if(db==null){
			db=new DbConnection();
		}
	}
	public static DbConnection getDbConnection(){
		return db;
	}

	public void mkcon() {
		try {
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hybrid_cloud?user=root&password=rootroot");
			st=con.createStatement();
		} catch(Exception e) {
			System.out.println(e);
		}
	}
	public int dbUpdate(String str) {
		try {
			i=st.executeUpdate(str);
		} catch(Exception e) {
			i=0;
			System.out.println(e);
		}
		return(i);
	}

	public ResultSet fetch(String str) {
		try {
			rs=st.executeQuery(str);
		} catch(Exception e) {
			System.out.println(e);
		}
		return(rs);
	}
	public void close() {
		try {
			con.close();
			st.close();
			rs.close();
		} catch(Exception e) {
			System.out.println(e);
		}
	}

}
