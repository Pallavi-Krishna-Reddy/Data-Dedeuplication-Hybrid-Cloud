<%@page import="java.io.File"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="com.example.hybrid_cloud_.algo.EData"%>
<%@page import="com.example.hybrid_cloud_.algo.KeyGen"%>
<%@page import="com.example.hybrid_cloud_.algo.FilesFingerprint"%>
<%@page import="com.example.hybrid_cloud_.algo.Mypath"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.DataInput"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.example.hybrid_cloud_.algo.DbConnection"%>
<%@page import="com.example.hybrid_cloud_.algo.Encryption"%>
<%@page import="com.example.hybrid_cloud_.algo.MessageDigest5Base"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

<table border="0" width="100%">
<%
String email=(String)session.getAttribute("email");

%>
	<tr>
		<td width="100%" colspan="5">
	
	<table border="0" width="100%">
		<tr>
			<td width="20%" style="border-style: outset; border-width: 1px; padding: 1px" bgcolor="#FF0000">
			<p align="center"><font face="Bodoni MT Black" color="#FFFF00">
			<a href="home.jsp">
			<span style="text-decoration: none; font-weight: 700">
			<font color="#FFFF00">Home&nbsp; </font></span></a></font></td>
			<td width="20%" style="border-style: outset; border-width: 1px; padding: 1px" bgcolor="#FF0000">
			<p align="center"><a href="user_upload.jsp">
			<font face="Bodoni MT Black" color="#FFFF00">
			<span style="text-decoration: none; font-weight: 700">Upload </span>
			</font></a></td>
			<td width="20%" style="border-style: outset; border-width: 1px; padding: 1px" bgcolor="#FF0000">
			<p align="center"><font face="Bodoni MT Black" color="#FFFF00">
			<a href="user_download.jsp">
			<span style="text-decoration: none; font-weight: 700">
			<font color="#FFFF00">Download</font></span></a> </font></td>
			<td width="20%" style="border-style: outset; border-width: 1px; padding: 1px" bgcolor="#FF0000">
			<p align="center"><font face="Bodoni MT Black" color="#FFFF00">
			<a href="ShareRequest.jsp"><font color="#FFFF00">
			<span style="text-decoration: none; font-weight: 700">Share Request</span></font></a>&nbsp; </font></td>
			<td width="20%" style="border-style: outset; border-width: 1px; padding: 1px" bgcolor="#FF0000"><font face="Bodoni MT Black" color="#FFFF00">
			&nbsp;<a href="logout.jsp"><span style="text-decoration: none"><font color="#FFFF00">Logout</font></span></a></font></td>
		</tr>
	</table>
	
		</td>
	</tr>
	<tr>
		<td width="20%">&nbsp;</td>
		<td width="20%">&nbsp;</td>
		<td width="20%">
		&nbsp;</td>
		<td width="20%">&nbsp;</td>
		<td width="20%">&nbsp;</td>
	</tr>
<%

DbConnection db=DbConnection.getDbConnection();
db.mkcon();
	ResultSet r=db.fetch("select * from users_files where email='"+email+"'");

	while(r.next())
	{
		String new_fName=r.getString(2);
		int j;
		
				db.mkcon();
				
				
				ResultSet rss=db.fetch("select * from _fingerprint where file_id LIKE '"+new_fName.substring(0, 3)+"%'");
				System.out.println("select * from _fingerprint where file_id LIKE '"+new_fName.substring(0, 3)+"%'");
				rss.next();
				String fname=rss.getString("file_name");
				String f_id=rss.getString("file_id");
				System.out.println("File name :"+fname);
				%>
								<td width="20%" align="center">
								<a href="FileDownload.jsp?fidP=<%=f_id%>">
					<img border="0" src="image/cloudapp.png" width="79" height="75"></a><br><%=fname%></td>
				<%
				
				
			
		
		%>
		
		</tr>
<%
	

	}
	

%>
</table>
</body>
</html>