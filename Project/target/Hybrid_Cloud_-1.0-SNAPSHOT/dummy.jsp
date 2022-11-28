<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.InputStream"%>
<%@page import="com.example.hybrid_cloud_.algo.DbConnection"%>
<%@page import="com.example.hybrid_cloud_.algo.EData"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@ page import="javax.xml.bind.DatatypeConverter" %>
<%@ page import="com.example.hybrid_cloud_.algo.Decryption" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%

String fileName=request.getParameter("fidP");
System.out.println("save file Path===="+fileName);
String fileType=fileName.substring(  fileName.lastIndexOf('.') + 1) ;
System.out.println("save file Type===="+fileType);

String saveFile  = fileName.substring(fileName.lastIndexOf("\\") + 1,fileName.indexOf(fileType));
		System.out.println("save file name===="+saveFile);


if(fileName == null || fileName.equals("")){
    throw new ServletException("File Name can't be null or empty");
}
File file = new File(fileName);
if(!file.exists()){
    throw new ServletException("File doesn't exists on server.");
}
System.out.println("File location on server::"+file.getAbsolutePath());
ServletContext ctx =
        getServletContext();

InputStream fis = new FileInputStream(file);
ObjectInputStream oStream=new ObjectInputStream(fis);
Object obj = oStream.readObject();
EData oEdat=(EData)obj;
byte[] eedata=oEdat.geteData();
String mimeType = ctx.getMimeType(file.getAbsolutePath());
response.setContentType(mimeType != null? mimeType:"application/octet-stream");
response.setContentLength((int) file.length());
response.setHeader("Content-Disposition", "attachment; filename=\"" + "121.jpg"+""+fileType + "\"");
 
ServletOutputStream os       = response.getOutputStream();
byte[] bufferData = new byte[4096];
DbConnection db=DbConnection.getDbConnection();
db.mkcon();
String email=(String)session.getAttribute("email");

ResultSet rs=db.fetch("select * from _fingerprint where _email='"+email+"'");
rs.next();
String sKey=rs.getString("_key");
byte[] eKey= DatatypeConverter.parseBase64Binary(sKey);

byte[] eData= Decryption.decrypt(eedata, eKey);


int read=0;
while((read = fis.read(eData))!= -1){
    os.write(eData, 0, read);
}
os.flush();
os.close();
fis.close();
System.out.println("File downloaded at client successfully");
 // return;

/**
System.out.println("Current file Path :"+fidP);
File oFile=new File(fidP);
OutputStream outS = response.getOutputStream();
FileInputStream in=new FileInputStream(oFile);

byte[] buffer = new byte[4096];
int length;
while ((length = in.read(buffer)) > 0){
	outS.write(buffer, 0, length);
}
in.close();
out.flush();
*/
%>
