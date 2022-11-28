<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.example.hybrid_cloud_.algo.DbConnection"%>
<%@page import="com.example.hybrid_cloud_.algo.MessageDigest5Base"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Welcome !</title>
</head>
<body>
<%
String c=request.getParameter("c");
String sql="select * from csp where csp='"+c+"'";
DbConnection db=DbConnection.getDbConnection();
db.mkcon();	
ResultSet rs=db.fetch(sql);
String ip="";
String port="";
try
{
rs.next();
ip=rs.getString(2);
port=rs.getString(3);
}
catch(Exception e)
{
}
%>
<form method="POST" action="saveCloudPath.jsp">
	<table border="0" width="100%">
		<tr>
			<td width="100%" colspan="4">
			<p align="right"><a href="logout.jsp">
			<font color="#000080" face="Bodoni MT Black">Logout</font></a></td>
		</tr>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;<%=c%></td>
			<td width="25%">
			<input type="hidden" name="c" size="20" value="<%=c%>"></td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="50%" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td width="100%" colspan="4">Cloud Link : &quot;http://<input type="text" name="ip" size="21" value="<%=ip%>">:/Cloud 
			Services&quot;</td>
		</tr>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%"><input type="submit" value="Save" name="B1"></td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
	</table>
</form>

</body>
</html>