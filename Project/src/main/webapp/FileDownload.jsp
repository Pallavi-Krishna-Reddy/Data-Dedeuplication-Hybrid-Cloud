<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.example.hybrid_cloud.algo.DbConnection"%>
<%@page import="com.example.hybrid_cloud.algo.EData"%>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.example.hybrid_cloud.algo.Decryption"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@ page import="com.example.hybrid_cloud.algo.ReadWriteFile" %>
<%@ page import="javax.xml.bind.DatatypeConverter" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Path" %>
<%@ page import="org.apache.commons.io.LineIterator" %>
<%@ page import="org.apache.commons.io.FileUtils" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    String tempPath="\\\\localhost\\Buckets\\cloud_temp";
    String fid=request.getParameter("fidP");

    DbConnection db=DbConnection.getDbConnection();
    db.mkcon();
    String email=(String)session.getAttribute("email");

    ResultSet rs=db.fetch("select * from _fingerprint where file_id="+fid+"");
    rs.next();
    String file_name=rs.getString("file_name");
    String sKey=rs.getString("_key");
    int sp=rs.getInt("startPos");
    System.out.println("sp-->"+sp);
    int ep=rs.getInt("endPos");
    System.out.println("ep-->"+ep);


// ******************** find coud link

    String query="select * from csp where csp='public_cloud'";
    db.mkcon();
    StringBuffer spath=new StringBuffer();
    ResultSet rset=db.fetch(query);
    try
    {
        rset.next();
        spath=spath.append("\\\\"+rset.getString(2)+"\\Buckets\\public_cloud");
    }
    catch(Exception e)
    {

    }
    String fileName=spath+"\\"+fid+".hye";
    System.out.println("save file Path===="+fileName);
    String fileType=fileName.substring(  fileName.lastIndexOf('.') + 1) ;
    System.out.println("save file Type===="+fileType);

    String saveFile  = fileName.substring(fileName.lastIndexOf("\\") + 1,fileName.indexOf(fileType));
    System.out.println("save file name===="+saveFile);

    File file1 = new File(fileName);
    if(fileName == null || fileName.equals("")){
        throw new ServletException("File Name can't be null or empty");
    }

    if(!file1.exists()){
        throw new ServletException("File doesn't exists on cloud.");
    }
    System.out.println("File location on cloud::"+file1.getAbsolutePath());
//***************************

    byte[] eKey= DatatypeConverter.parseBase64Binary(sKey);
    ReadWriteFile text = new ReadWriteFile();
    List<String> oList=new ArrayList<String>();
    StringBuffer tempData=text.readLargerTextFile(file1.getAbsolutePath());
    System.out.println("Size"+tempData.length());
    byte[] edata= DatatypeConverter.parseBase64Binary(tempData.toString());
    byte[] oData=Decryption.decrypt(edata, eKey);
    FileOutputStream fileOut = new FileOutputStream(tempPath+"\\"+file_name);
    fileOut.write(oData, sp, (ep - sp));
    fileOut.close();

    response.setStatus(HttpServletResponse.SC_TEMPORARY_REDIRECT );
    response.addHeader("fn",file_name);
    response.sendRedirect("tempDownload.jsp?fn="+file_name);


//***************************
// 	File file = new File(tempPath+"\\"+file_name);
// 	if(!file.exists()){
// 	    throw new ServletException("File doesn't exists on server.");
// 	}
// 	System.out.println("File location on server::"+file1.getAbsolutePath());
// ServletContext ctx = getServletContext();

// InputStream fis = new FileInputStream(file);
//  ObjectInputStream oStream=new ObjectInputStream(fis);
// Object obj = oStream.readObject();
// String mimeType = ctx.getMimeType(file.getAbsolutePath());
// response.setContentType(mimeType != null? mimeType:"application/octet-stream");
// response.setContentLength((int) file.length());
// response.setHeader("Content-Disposition", "attachment; filename=\"" + file_name+""+fileType + "\"");

// ServletOutputStream os       = response.getOutputStream();
// byte[] bufferData = new byte[4096];
// int read=0;
// while((read = fis.read(bufferData))!= -1){
//     os.write(bufferData, 0, read);
// }
// os.flush();
// os.close();
// fis.close();
// System.out.println("File downloaded at client successfully");

%>
