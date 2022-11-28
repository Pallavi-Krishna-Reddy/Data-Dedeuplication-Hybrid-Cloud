<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.hybrid_cloud_.algo.ReadWriteFile"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
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
String sql="select * from share_data where from_email='"+email+"'";
System.out.println("sql :"+sql);
DbConnection db=DbConnection.getDbConnection();
db.mkcon();
ResultSet rs=db.fetch(sql);
%>
<form method="POST" action="approve.jsp">

<table border="0" width="100%">
	<tr>
		<td width="50%" align="center"><u>From </u></td>
		<td width="25%" align="center"><u>File ID</u></td>
		<td width="25%" align="center">Approved ?</td>
	</tr>
	<%
	while(rs.next())
	{
	String fromMail=rs.getString(1);
	int fid=rs.getInt(3);
	String st=rs.getString(4);
	%>
	<tr>
		<td width="50%" align="center">&nbsp;<%=fromMail%></td>
		<td width="25%" align="center">&nbsp;<%=fid%></td>
	
		<td width="25%" align="center"><%=st%></td>
		
	</tr>
	<%
	}
	%>
</table>

	<p align="center">&nbsp;</p>
</form>

</body>
</html>