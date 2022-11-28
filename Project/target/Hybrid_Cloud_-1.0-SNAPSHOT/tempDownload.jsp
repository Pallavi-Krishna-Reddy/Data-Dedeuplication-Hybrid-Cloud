<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.example.hybrid_cloud_.algo.ReadWriteFile"%>
<%@page import="com.example.hybrid_cloud_.algo.EData"%>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.example.hybrid_cloud_.algo.DbConnection"%>
<%@page import="com.example.hybrid_cloud_.algo.Decryption"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String file_name=request.getParameter("fn");

String tempPath="\\\\localhost\\Buckets\\cloud_temp";
String fileName=tempPath+"\\"+file_name;
System.out.println("save file Path===="+fileName);
String fileType=fileName.substring(  fileName.lastIndexOf('.') + 1) ;
System.out.println("save file Type===="+fileType);

String saveFile  = fileName.substring(fileName.lastIndexOf("\\") + 1,fileName.indexOf(fileType));
		System.out.println("save file name===="+saveFile);

		
File file = new File(tempPath+"\\"+file_name);
if(!file.exists()){
    throw new ServletException("File doesn't exists on server.");
}
System.out.println("File location on server::"+file.getAbsolutePath());
ServletContext ctx = getServletContext();

InputStream fis = new FileInputStream(file);
String mimeType = ctx.getMimeType(file.getAbsolutePath());
response.setContentType(mimeType != null? mimeType:"application/octet-stream");
response.setContentLength((int) file.length());
response.setHeader("Content-Disposition", "attachment; filename=\"" + saveFile+""+fileType + "\"");
 
ServletOutputStream os       = response.getOutputStream();
byte[] bufferData = new byte[4096];
int read=0;
while((read = fis.read(bufferData))!= -1){
    os.write(bufferData, 0, read);
}
os.flush();
os.close();
fis.close();
System.out.println("File downloaded at client successfully");
%>
<jsp:forward page="home.jsp"/>