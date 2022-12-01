<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.example.hybrid_cloud.algo.DbConnection"%>
<%@page import="com.example.hybrid_cloud.algo.MessageDigest5Base"%>
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
String id=request.getParameter("aid");
String pwd=request.getParameter("pwd");

DbConnection db=DbConnection.getDbConnection();
db.mkcon();	
MessageDigest5Base oDigest5Base=new MessageDigest5Base();

String sql="select * from admin where admin_id='"+id+"' and admin_pwd='"+oDigest5Base.getMD5(pwd.getBytes())+"'";
System.out.println("sql :"+sql);
ResultSet rs=db.fetch(sql);
try {
if(rs.next())
{
//String session_id=session.getId();

//request.getSession().setAttribute("se_id",session_id); 
// System.out.println("session _id : "+session_id);
  request.getRequestDispatcher("welcome.jsp").forward(request, response);


}
else
{
request.getRequestDispatcher("Errors.jsp").forward(request, response);
 
}
} catch (SQLException e) {
// TODO Auto-generated catch block
e.printStackTrace();
}
%>
</body>
</html>