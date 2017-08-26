<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,org.apache.commons.fileupload.FileItem,org.apache.commons.fileupload.disk.DiskFileItemFactory,org.apache.commons.fileupload.servlet.ServletFileUpload' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�ϴ�ͼƬ�����ݿ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	Vector vector = new Vector();

	String xjjlh = null;
	String lx = null;
	String zpgjz = null;
	String zpsm = null;
	String zpml = null;

	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setSizeThreshold(1024 * 10);
	factory.setRepository(new java.io.File("D:\\temp\\"));
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax(1024 * 1024 * 100);
	List<FileItem> fileItems = null;
	try {
		fileItems = upload.parseRequest(request);
	} 
	catch (Exception e) {
		e.printStackTrace();
	}
	Iterator<FileItem> iterable = fileItems.iterator();
	FileItem fileItem;
	while (iterable.hasNext()) 
	{
		fileItem = (FileItem) iterable.next();

		if (fileItem.isFormField()) 
		{
			String name = fileItem.getFieldName();
			String value = fileItem.getString("GBK");
			if(name.equals("xjjlh"))
			{
				xjjlh=value;
			}
			else if(name.equals("lx"))
			{
				lx=value;
			}
			else if(name.equals("zpml"))
			{
				zpml=value;
			}
			else if(name.equals("zpgjz"))
			{
				zpgjz=value;
			}
			else if(name.equals("zpsm"))
			{
				zpsm=value;
			}
		} 
		else 
		{
			String fileName = fileItem.getName();


			if (fileName != null&&fileName!="") 
			{
				// ����ļ��������ϴ�
				java.io.File fullFile = new java.io.File(fileItem.getName());

				String filename=request.getRealPath("/")+"yblimg/xjgd/"+zpml+"/"+ xjjlh+"-"+fullFile.getName();
				System.out.println(filename);

				java.io.File fileOnServer = new java.io.File(filename);

				try {
					fileItem.write(fileOnServer);
				} 
				catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				finally{
					fileItem.delete();
				}

				vector.add(fileOnServer.getName());
				
				String inF=filename;
				String outF=filename;
				int outWidth=800;
				int outHeight=800;
				boolean rateIs=true;

				ybl.common.ImgDeal.compressPic(inF,outF,outWidth,outHeight,rateIs);  
			}
	
		}
	}
	

	conn=cf.getConnection();

	String khbh = "";
	ls_sql="SELECT khbh";
	ls_sql+=" FROM kp_xjgdjl";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
	}
	rs.close();
	ps.close();


	String fgsbh = "";
	ls_sql="SELECT fgsbh";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=rs.getString(1);
	}
	rs.close();
	ps.close();

	String zpsfxsh = "";//��Ƭ�Ƿ������  Y������ˣ�N������
	ls_sql="SELECT zpsfxsh";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zpsfxsh=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	String kkzpbz="0";//0���ɿ�   1�ɿ�

	if (zpsfxsh.equals("N"))//Y������ˣ�N������
	{
		kkzpbz="1";
	}


	Iterator iterator = vector.iterator();
	while(iterator.hasNext())
	{
		String xjzpmc=(String)iterator.next();

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM kp_xjgdjlzp";
		ls_sql+=" where xjzpmc='"+xjzpmc+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			out.println("<P>�������ѣ�[��Ƭ����:"+xjzpmc+"]�Ѵ��ڣ�����Ƭ�ϴ���ȡ��");
			continue;
		}

		ls_sql="insert into kp_xjgdjlzp(xjzpmc,xjjlh,zpsm,lx,zpgjz,zpml,kkzpbz,zpshbz) values(?,?,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,xjzpmc);
		ps.setString(2,xjjlh);
		ps.setString(3,zpsm);
		ps.setString(4,lx);
		ps.setString(5,zpgjz);
		ps.setString(6,zpml);
		ps.setString(7,kkzpbz);
		ps.setString(8,"N");//Y����ˣ�N��δ���
		ps.executeUpdate();
		ps.close();
	}

	int zpsl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM kp_xjgdjlzp";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zpsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="update kp_xjgdjl set zpsl=?";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,zpsl);
	ps.executeUpdate();
	ps.close();



	%>
	<SCRIPT language=javascript >
	<!--
	alert("�ϴ��ļ��ɹ���");
	history.go(-1);
	//-->
	</SCRIPT>	
	<%	
		
}
catch (Exception e) {
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
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
