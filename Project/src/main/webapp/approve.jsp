<%@page import="java.sql.ResultSet"%>
<%@page import="com.example.hybrid_cloud.algo.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome ! </title>
</head>
<body>
<%
String email=(String)session.getAttribute("email");

String fromMail=request.getParameter("R1");
String fid=request.getParameter("fid");
DbConnection db=DbConnection.getDbConnection();
db.mkcon();
db.dbUpdate("insert into users_files values('"+fromMail+"',"+fid+")");
db.dbUpdate("update share_data set _status='Approved' where from_email='"+fromMail+"' and file_id="+fid+"");
String sql="select * from _fingerprint where _email='"+email+"' and file_id='"+fid+"'";
db.mkcon();
ResultSet rs=db.fetch(sql);
rs.next();
String _fingerprint=rs.getString("_fingerprint");
String file_name=rs.getString("file_name");
String _key=rs.getString("_key");
int startPos=rs.getInt("startPos");
int endPos=rs.getInt("endPos");

 db.dbUpdate("insert into _fingerprint values('"+_fingerprint+"','"+fromMail+"','"+file_name+"',"+fid+",'"+_key+"',"+startPos+","+endPos+")");


%>
<jsp:forward page="homeAgain.jsp"></jsp:forward>
</body>
</html>