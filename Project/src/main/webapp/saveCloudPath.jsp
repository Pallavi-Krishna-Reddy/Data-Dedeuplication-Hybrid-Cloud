<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.example.hybrid_cloud_.algo.MessageDigest5Base"%>
<%@page import="com.example.hybrid_cloud_.algo.DbConnection"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Welcome !</title>
</head>

<body>
<%
String cip=request.getParameter("ip");
String c=request.getParameter("c");
String sql="update csp set csp_ip='"+cip+"' where csp='"+c+"'";
DbConnection db=DbConnection.getDbConnection();
db.mkcon();	
int i =db.dbUpdate(sql);
if(i>0)
{
%>
<script>
alert('Cloud Link Saved...');
</script>
<jsp:include page="welcome.jsp"/>
<%
}
else
{
%>
<script>
alert('Sorry ! Try Again...');
history.back();
</script>
<%
}
%>
</body>

</html>
