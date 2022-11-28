<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.hybrid_cloud_.algo.ReadWriteFile"%>
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
<title>Insert title here</title>
</head>
<body>
<%
String email=(String)session.getAttribute("email");
String sql="select * from share_data where to_email='"+email+"'";
System.out.println("sql :"+sql);
DbConnection db=DbConnection.getDbConnection();
db.mkcon();
ResultSet rs=db.fetch(sql);
%>
<form method="POST" name="frm" action="approve.jsp">

<table border="0" width="100%">
	<tr>
		<td width="100%" align="center" colspan="3">
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
		<td width="50%" align="center">
		&nbsp;</td>
		<td width="25%" align="center">&nbsp;</td>
		<td width="25%" align="center">&nbsp;</td>
	</tr>
	<tr>
		<td width="50%" align="center">
		<p align="left"><i><font color="#FF3300"><u><b>Received Request Status....</b></u></font></i></td>
		<td width="25%" align="center">&nbsp;</td>
		<td width="25%" align="center">&nbsp;</td>
	</tr>
	<tr>
		<td width="50%" align="center" style="border-right-style: solid; border-right-width: 1px; border-bottom-style: solid; border-bottom-width: 1px"><u>From </u></td>
		<td width="25%" align="center" style="border-right-style: solid; border-right-width: 1px; border-bottom-style: solid; border-bottom-width: 1px"><u>File ID</u></td>
		<td width="25%" align="center" style="border-bottom-style: solid; border-bottom-width: 1px">Approved ?</td>
	</tr>
	<%
	while(rs.next())
	{
	String fromMail=rs.getString(2);
	int fid=rs.getInt(3);
	String st=rs.getString(4);
	%>
	<tr>
		<td width="50%" align="center" style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px">&nbsp;<%=fromMail%><input type="hidden" name="fid" size="20" value="<%=fid%>"></td>
		<td width="25%" align="center" style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px">&nbsp;<%=fid%></td>
		<%
		if(st.equals("No"))
		{
		%>
		<td width="25%" align="center" style="border-top-style: solid; border-top-width: 1px"><%=st%><input type="radio" value="<%=fromMail%>" checked name="R1"><input type="submit" value="Approve" name="B1"></td>
		<%
		}
		else
		{
		%>
		<td width="25%" align="center"><%=st%></td>
		<%
		}
		%>
	</tr>
	<%
	}
	%>
</table>

	<p align="center"></p>
</form>

<%
String sql1="select * from share_data where from_email='"+email+"'";
System.out.println("sql :"+sql1);
db.mkcon();
ResultSet rss=db.fetch(sql1);
%>
<form method="POST" name="frm1" action="approve.jsp">

<table border="0" width="100%">
	<tr>
		<td width="50%" align="center" style="border-top-style: solid; border-top-width: 1px" bgcolor="#99CCFF">
		&nbsp;</td>
		<td width="25%" align="center" style="border-top-style: solid; border-top-width: 1px" bgcolor="#99CCFF">&nbsp;</td>
		<td width="25%" align="center" style="border-top-style: solid; border-top-width: 1px" bgcolor="#99CCFF">&nbsp;</td>
	</tr>
	<tr>
		<td width="50%" align="center" style="border-top-style: solid; border-top-width: 1px">
		<p align="left"><i><font color="#663300"><u><b>Sent Request Status....</b></u></font></i></td>
		<td width="25%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
		<td width="25%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
	</tr>
	<tr>
		<td width="50%" align="center" style="border-right-style: solid; border-right-width: 1px; border-bottom-style: solid; border-bottom-width: 1px"><u>From </u></td>
		<td width="25%" align="center" style="border-right-style: solid; border-right-width: 1px; border-bottom-style: solid; border-bottom-width: 1px"><u>File ID</u></td>
		<td width="25%" align="center" style="border-bottom-style: solid; border-bottom-width: 1px">Approved ?</td>
	</tr>
	<%
	while(rss.next())
	{
	String fromMail=rss.getString(1);
	int fid=rss.getInt(3);
	String st=rss.getString(4);
	%>
	<tr>
		<td width="50%" align="center" style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px">&nbsp;<%=fromMail%></td>
		<td width="25%" align="center" style="border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1px">&nbsp;<%=fid%></td>
	
		<td width="25%" align="center" style="border-top-style: solid; border-top-width: 1px"><%=st%></td>
		
	</tr>
	<%
	}
	%>
</table>

	<p align="center">&nbsp;</p>
</form>


</body>
</html>