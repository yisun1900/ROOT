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
Vector zgjlh = new Vector();
Vector jhjjsj = new Vector();
Vector zgsm = new Vector();
Vector zg_jlh = new Vector();
String xjjlh=null;
String _zgjlh = null;
String lrr = (String)session.getAttribute("yhmc");
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
			if("xjjlh".equals(name)){
				xjjlh=value;
			}
			if("zgjlh".equals(name)){
				zgjlh.add(value);
				_zgjlh=value;
			}
			if("jhjjsj".equals(name)){
				jhjjsj.add(value);
			}
			if("zgsm".equals(name)){
				zgsm.add(value);
			}
		} else {
			String fileName = fileItem.getName();
			if (fileName != null&&fileName!="") {
				// 如果文件存在则上传
				java.io.File fullFile = new java.io.File(fileItem.getName());
				java.io.File fileOnServer = new java.io.File(request.getRealPath("/")+"sgdgl/xjgd/images/"
						+ _zgjlh+"-"+fullFile.getName());
				try {
					fileItem.write(fileOnServer);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				finally{
					fileItem.delete();
				}
				zg_jlh.add(_zgjlh);
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
		Iterator izgjlh = zgjlh.iterator();
		Iterator ijhjjsj = jhjjsj.iterator();
		Iterator izgsm = zgsm.iterator();
		Iterator izg_jlh = zg_jlh.iterator();
		while(izgjlh.hasNext()){
			ls_sql="update kp_zggdmx set jhjjsj=?,zgsm=? where zgjlh='"+(String)izgjlh.next()+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,java.sql.Date.valueOf((String)ijhjjsj.next()));
			ps.setString(2,(String)izgsm.next());
			ps.executeUpdate();
			ps.close();
		}
		while(izg_jlh.hasNext()){
			ls_sql="update kp_zggdmx set zgzp=? where zgjlh='"+(String)izg_jlh.next()+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,(String)iterator.next());
			ps.executeUpdate();
			ps.close();
		}
		conn.commit();
		%>
		<SCRIPT language=javascript >
		<!--
		alert("保存成功！");
		window.close();
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
