<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,org.apache.commons.fileupload.FileItem,org.apache.commons.fileupload.disk.DiskFileItemFactory,org.apache.commons.fileupload.servlet.ServletFileUpload' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>上传图片到数据库</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<%
Vector vector = new Vector();
String ysjlh=null;
String zpxm=null;
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setSizeThreshold(1024 * 10);
	factory.setRepository(new java.io.File("D:\\temp\\"));
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax(1024 * 1024 * 100);
	List<FileItem> fileItems = null;
	try {
		fileItems = upload.parseRequest(request);
	} catch (Exception e) {
		e.printStackTrace();
	}
	Iterator<FileItem> iterable = fileItems.iterator();
	FileItem fileItem;
	while (iterable.hasNext()) {
		fileItem = (FileItem) iterable.next();
		if (fileItem.isFormField()) {
			String name = fileItem.getFieldName();
			String value = fileItem.getString("GBK");
			if("ysjlh".equals(name)){
				ysjlh=value;
			}
			if("zpxm".equals(name)){
				zpxm=value;
			}
		} else {
			String fileName = fileItem.getName();
			if (fileName != null&&fileName!="") {
				// 如果文件存在则上传
				java.io.File fullFile = new java.io.File(fileItem.getName());
				java.io.File fileOnServer = new java.io.File(request.getRealPath("/")+"gcgl/pzgl/sgjdb/images/"
						+ ysjlh+"-"+fullFile.getName());
				try {
					fileItem.write(fileOnServer);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				finally{
					fileItem.delete();
				}
				vector.add(fileOnServer.getName());
			}
	
		}
	}
	
	Connection conn  = null;
	PreparedStatement ps=null;
	String ls_sql=null;
	try {
		conn=cf.getConnection();
		conn.setAutoCommit(false);
		Iterator iterator = vector.iterator();
		while(iterator.hasNext()){
			ls_sql="insert into crm_yszp(yszpmc,ysjlh,zplx,zpxm) values(?,?,1,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,(String)iterator.next());
			ps.setString(2,ysjlh);
			ps.setString(3,zpxm);
			ps.executeUpdate();
			ps.close();
		}
		conn.commit();
		%>
		<SCRIPT language=javascript >
		<!--
		alert("上传文件成功！");
		history.go(-1);
		//-->
		</SCRIPT>	
        <%	
		
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
</body>
</html>
