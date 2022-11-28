<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="com.example.hybrid_cloud_.algo.DbConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
</head>
<body>
<form method="POST" action="--WEBBOT-SELF--">
	<table border="0" width="100%">
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">Add New Cloud </td>
		</tr>
		<tr>
			<td width="25%">Cloud Service Providers</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
		<%
			DbConnection db=DbConnection.getDbConnection();
			db.mkcon();
			String sq="select * from csp";
			ResultSet rs=db.fetch(sq);
			while(rs.next())
			{
		%>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;<%=rs.getString(1)%></td>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
		<%}%>
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