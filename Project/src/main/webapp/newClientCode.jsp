<%@page import="com.example.hybrid_cloud_.algo.DbConnection"%>
<%@page import="com.example.hybrid_cloud_.algo.MessageDigest5Base"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String pwd=request.getParameter("pwd");
System.out.println("pwd :"+pwd);
String sex=request.getParameter("sex");
String phone=request.getParameter("phone");
MessageDigest5Base oDigest5Base=new MessageDigest5Base();
String sql="insert into _user values('"+name+"','"+email+"','"+oDigest5Base.getMD5(pwd.getBytes())+"','"+sex+"','"+phone+"')";
System.out.println("sql :"+sql);
DbConnection db=DbConnection.getDbConnection();
db.mkcon();
int i=db.dbUpdate(sql);
if(i>0)
{
%>
<script type="text/javascript">
alert('Thank you for Registration ');
</script>
<jsp:include page="index.jsp"></jsp:include>
<%
}
else
{
%>
<script type="text/javascript">
alert('Sorry ! Try Again... ');
history.back(0);
</script>
<%
}
%>
</body>
</html>