<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.example.hybrid_cloud_.algo.ReadWriteFile"%>
<%@page import="com.example.hybrid_cloud_.algo.DbConnection"%>
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

String phone=(String)session.getAttribute("phone");
String edata=request.getParameter("edata");
String ekey=request.getParameter("ekey");
String hash=request.getParameter("hash");
String saveFile=request.getParameter("saveFile");
String fid=request.getParameter("fid");
String old_file_id=request.getParameter("old_file_id");
String spath=request.getParameter("spath");
String startPos=request.getParameter("sp");
String endPos=request.getParameter("ep");
String to_email=request.getParameter("te");
String s=request.getParameter("R1");
DbConnection db=DbConnection.getDbConnection();

System.out.println("user want to share storage : "+s);
if(s.equals("Yes"))
{
	
	// send request to other user for share key
	
	 db.mkcon();
	 System.out.println("insert into share_data values('"+to_email+"','"+email+"',"+old_file_id+",'No')");

	 db.dbUpdate("insert into share_data values('"+to_email+"','"+email+"',"+old_file_id+",'No')");
	// db.dbUpdate("insert into users_files values('"+email+"',"+old_file_id+")");
}
else
{
	// store as new file
	
	 ReadWriteFile text = new ReadWriteFile();
	 List<String> oList=new ArrayList<String>();
	 oList.add(edata);
	 text.writeLargerTextFile(spath+"\\"+fid+".hye", oList);
	 
	 db.mkcon();
 	 db.dbUpdate("insert into _fingerprint values('"+hash+"','"+email+"','"+saveFile+"',"+fid+",'"+ekey+"',"+startPos+","+endPos+")");
  	 db.dbUpdate("insert into users_files values('"+email+"',"+fid+")");
}

%>
<jsp:forward page="homeAgain.jsp"></jsp:forward>

</body>
</html>