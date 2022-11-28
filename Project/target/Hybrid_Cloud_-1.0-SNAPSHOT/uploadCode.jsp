<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.hybrid_cloud_.algo.ReadWriteFile"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="com.example.hybrid_cloud_.algo.EData"%>
<%@page import="com.example.hybrid_cloud_.algo.KeyGen"%>
<%@page import="com.example.hybrid_cloud_.algo.FilesFingerprint"%>
<%@page import="com.example.hybrid_cloud_.algo.Mypath"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.DataInput"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.example.hybrid_cloud_.algo.DbConnection"%>
<%@page import="com.example.hybrid_cloud_.algo.Encryption"%>
<%@page import="com.example.hybrid_cloud_.algo.MessageDigest5Base"%>
<%@ page import="javax.xml.bind.DatatypeConverter" %>
<html>
<head>
	<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
	<meta name="ProgId" content="FrontPage.Editor.Document">
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
</head>
<body>
<table border="0" width="100%">
	<tr>
		<td width="20%" style="border-style: outset; border-width: 1px; padding: 1px" bgcolor="#FF0000">
			<p align="center"><font face="Bodoni MT Black" color="#FFFF00">
				<a href="home.jsp">
			<span style="text-decoration: none; font-weight: 700">
			<font color="#FFFF00">Home&nbsp; </font></span></a></font></td>
		<td width="20%" style="border-style: outset; border-width: 1px; padding: 1px" bgcolor="#FF0000">
			<p align="center"><a href="user_upload.jsp">
				<font face="Bodoni MT Black" color="#FFFF00">
					<span style="text-decoration: none; font-weight: 700">Upload </span>
				</font></a></td>
		<td width="20%" style="border-style: outset; border-width: 1px; padding: 1px" bgcolor="#FF0000">
			<p align="center"><font face="Bodoni MT Black" color="#FFFF00">
				<a href="user_download.jsp">
			<span style="text-decoration: none; font-weight: 700">
			<font color="#FFFF00">Download</font></span></a> </font></td>
		<td width="20%" style="border-style: outset; border-width: 1px; padding: 1px" bgcolor="#FF0000">
			<p align="center"><font face="Bodoni MT Black" color="#FFFF00">
				<a href="ShareRequest.jsp"><font color="#FFFF00">
					<span style="text-decoration: none; font-weight: 700">Share Request</span></font></a>&nbsp; </font></td>
		<td width="20%" style="border-style: outset; border-width: 1px; padding: 1px" bgcolor="#FF0000"><font face="Bodoni MT Black" color="#FFFF00">
			&nbsp;<a href="logout.jsp"><span style="text-decoration: none"><font color="#FFFF00">Logout</font></span></a></font></td>
	</tr>
</table>
<p align="center">
	&nbsp;<%
	String email=(String)session.getAttribute("email");
	DbConnection db=DbConnection.getDbConnection();
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
	db.mkcon();
	int fid;
	ResultSet rs8=null;
	rs8=db.fetch("select max(file_id) from _fingerprint");
	if(rs8.next())
	{
		fid=rs8.getInt(1);
		if(fid<200)
			fid=200;
		fid++;
	}
	else
	{
		fid=201;
	}

	System.out.println("new file id :"+fid);


//to get the content type information from JSP Request Header
	String contentType = request.getContentType();

	//here we are checking the content type is not equal to Null and as well as the passed data from mulitpart/form-data is greater than or equal to 0
	if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0))
	{
		DataInputStream in = new DataInputStream(request.getInputStream());

		//we are taking the length of Content type data
		int formDataLength = request.getContentLength();
		//	System.out.println("file lenth========"+formDataLength );
		byte dataBytes[] = new byte[formDataLength];
		int byteRead = 0;
		int totalBytesRead = 0;
		//this loop converting the uploaded file into byte code
		while (totalBytesRead < formDataLength) {
			byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
			totalBytesRead += byteRead;
		}

		String file = new String(dataBytes, "CP1256");
		//for saving the file name
		String saveFile = file.substring(file.indexOf("filename=\"") + 10);
		saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
		//			System.out.println("save file1===="+saveFile);

		saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
		int lastIndex = contentType.lastIndexOf("=");
		String boundary = contentType.substring(lastIndex + 1,contentType.length());
		//			System.out.println("1");

		int pos;
		//System.out.println("2");
		//extracting the index of file 
		pos = file.indexOf("filename=\"");
		//System.out.println("3");
		pos = file.indexOf("\n", pos) + 1;
		//System.out.println("4");
		pos = file.indexOf("\n", pos) + 1;
		//	System.out.println("5");
		pos = file.indexOf("\n", pos) + 1;
		//System.out.println("6");
		int boundaryLocation = file.indexOf(boundary, pos) - 4;
		///	System.out.println("7");
		int startPos = ((file.substring(0, pos)).getBytes("CP1256")).length;
		//System.out.println("8");
		int endPos = ((file.substring(0, boundaryLocation)).getBytes("CP1256")).length;
		//	System.out.println("9");

		// creating a new file with the same name and writing the content in new file
		Mypath.setPath(spath.toString());
		KeyGen oGen=new KeyGen();
		byte[] ekey=KeyGen.getEKey();
		String ek= DatatypeConverter.printBase64Binary(ekey);
		Encryption oEn=new Encryption();
		byte[] edata=Encryption.encrypt(dataBytes, ekey);
		final String sEdata=DatatypeConverter.printBase64Binary(edata);
		System.out.println(sEdata);
		String tempPath="\\\\localhost\\Buckets\\cloud_temp";
		FileOutputStream fileOut = new FileOutputStream(tempPath+"\\"+"temp_");
		fileOut.write(dataBytes, startPos, (endPos - startPos));
		fileOut.close();
		InputStream fis =  new FileInputStream(tempPath+"\\"+"temp_");

		byte[] buffer = new byte[4024];
		MessageDigest complete = MessageDigest.getInstance("SHA-256");
		int numRead;

		do {
			numRead = fis.read(buffer);
			if (numRead > 0) {
				complete.update(buffer, 0, numRead);
			}
		} while (numRead != -1);

		fis.close();
		byte[] b =complete.digest();
		String result = "";

		for (int i=0; i < b.length; i++) {
			result += Integer.toString( ( b[i] & 0xff ) + 0x100, 16).substring( 1 );
		}
		System.out.println("hash :"+result);
		// check for same data
		db.mkcon();
		System.out.println("select * from _fingerprint where _fingerprint='"+result+"'");
		ResultSet r=db.fetch("select * from _fingerprint where _fingerprint='"+result+"'");
		if(r.next())
		{
			System.out.println("We found duplicate data !");
			String to_email=r.getString("_email");
			String old_file_id=r.getString("file_id");
%>
	<font size="5" face="Baskerville Old Face" color="#FF0000">
		We found duplicate data !</font></p>
<p align="center">

	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<font color="#FF0000">Do you want share storage
		&amp; key for this data ?</font></p>
<form method="POST" action="saveAgain.jsp">
	<table border="0" width="100%">
		<tr>
			<td width="50%" rowspan="6">
				<p align="center">Current Encrypted Data .<textarea rows="6" name="edata" cols="74"><%=sEdata%></textarea></td>
			<td width="50%" colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td width="50%" colspan="2">
				<input type="hidden" name="ekey" size="65" value="<%=ek%>">
				<input type="hidden" name="hash" size="65" value="<%=result%>">
				<input type="hidden" name="saveFile" size="65" value="<%=saveFile%>">

				<input type="hidden" name="fid" size="65" value="<%=fid%>">
				<input type="hidden" name="old_file_id" size="65" value="<%=old_file_id%>">
				<input type="hidden" name="spath" size="65" value="<%=spath.toString()%>">
				<input type="hidden" name="sp" size="65" value="<%=startPos%>">
				<input type="hidden" name="ep" size="65" value="<%=endPos%>">
				<input type="hidden" name="te" size="65" value="<%=to_email%>">
			</td>
		</tr>
		<tr>
			<td width="50%" colspan="2">Yes
				<input type="radio" value="Yes" name="R1">&nbsp; <font size="2">[
					send key request to other user ]</font></td>
		</tr>
		<tr>
			<td width="25%">No <input type="radio" name="R1" value="No" checked></td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td width="25%"><input type="submit" value="Go" name="B1"></td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td width="25%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
	</table>
</form>



<%
}
else
{
	System.out.println("new file upload");

	ReadWriteFile text = new ReadWriteFile();
	List<String> oList=new ArrayList<String>();
	oList.add(sEdata);
	text.writeFile(spath.toString()+"\\"+fid+".hye", sEdata);

	in.close();
	System.out.println("insert into _fingerprint values('"+result+"','"+email+"','"+saveFile+"',"+fid+",'"+ek+"',"+startPos+","+endPos+")");
	db.dbUpdate("insert into _fingerprint values('"+result+"','"+email+"','"+saveFile+"',"+fid+",'"+ek+"',"+startPos+","+endPos+")");
	db.dbUpdate("insert into users_files values('"+email+"',"+fid+")");


%>
<script type="text/javascript">
	history.back(1);

	alert('Data Uploaded Succesfully');
</script>
<%
		}


		// end of data check



	}

%>
</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>

</html>