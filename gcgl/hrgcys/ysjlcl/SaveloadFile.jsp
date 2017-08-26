<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="com.jspsmart.upload.*,java.sql.*,java.net.* "%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String pageErrorInfo = null;
SmartUpload su = null;
String ls=getServletContext().getRealPath("");
String loadname=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try{
	su = new SmartUpload();
	su.initialize(pageContext);
	su.upload();

	conn=cf.getConnection();
	//----------------------------
	File suFile = null;
	int fileCount = 0;
	
	//��ȡ���ݹ����Ĳ���
	String ysjlh = su.getRequest().getParameter("ysjlh");
	String zplx = su.getRequest().getParameter("zplx");
	String zpxm = java.net.URLDecoder.decode(su.getRequest().getParameter("zpxm"),"UTF-8");
	String zpsm = java.net.URLDecoder.decode(su.getRequest().getParameter("zpsm"),"UTF-8");

	String khbh = "";
	ls_sql="SELECT khbh";
	ls_sql+=" FROM crm_heysjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString(1);
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
		zpsfxsh=rs.getString(1);
	}
	rs.close();
	ps.close();

	
	String fileExt = "";
	int fileSize = 0;
	String AllowedExtensions = su.getRequest().getParameter("ext");//�����ϴ����ļ�����
	double maxFileSize = 1024*3;//���ļ�����С����λKB
	//У���ļ����ͺʹ�С
	for (int i=0; i<su.getFiles().getCount();i++)
	{
		suFile = su.getFiles().getFile(i);
		if (suFile.isMissing())
			continue;
		//У���ļ���С
		fileSize = suFile.getSize()/1024;//�ֽ�ת����KB
		if(fileSize==0) fileSize=1;
		if(maxFileSize<fileSize) out.println("�����ϴ���Ƭ���������ܳ���["+maxFileSize+"KB]");

		//У���ļ�����
		if (suFile.getFileExt() == null	|| "".equals(suFile.getFileExt())) 
		{
			fileExt = ",,";
		} 
		else {
			fileExt = "," + suFile.getFileExt().toLowerCase() + ",";
		}

		if (!"".equals(AllowedExtensions) && AllowedExtensions.indexOf(fileExt) == -1) 
		{
			out.println("���ϴ����ļ�[" + suFile.getFileName()+ "]������Ϊϵͳ��ֹ�ϴ����ļ����ͣ������ϴ���");
		}

		fileCount++;
	}

	if (fileCount==0) out.println("��ѡ���ϴ����ļ�");

	
	
	String filePath="";
	for (int i=0; i<su.getFiles().getCount();i++) 
	{
		suFile = su.getFiles().getFile(i);
		loadname=ysjlh.toUpperCase()+"-ys-"+suFile.getFileName();

		loadname=URLEncoder.encode(loadname);
		loadname=URLDecoder.decode(loadname,"utf-8");
		System.out.println(loadname);

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_heyszp";
		ls_sql+=" where yszpmc='"+loadname+"'";
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
			System.out.println(ysjlh+":�������ѣ�[��Ƭ����:"+loadname+"]�Ѵ��ڣ�����Ƭ�ϴ���ȡ��");
			continue;
		}

		filePath=ls+"/imggcys/"+loadname;
		suFile.saveAs(filePath,SmartUpload.SAVE_PHYSICAL);//�����ļ�

		String kkzpbz="N"//0���ɿ�   1�ɿ�
		if (zpsfxsh.equals("N"))//Y������ˣ�N������
		{
			kkzpbz="Y";
		}
		//�������ݿ�
		ls_sql="insert into crm_heyszp(yszpmc,ysjlh,zpsm,zplx,zpxm,kkzpbz,zpshbz) values(?,?,?,?,?,?,'N')";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,loadname);
		ps.setString(2,ysjlh);
		ps.setString(3,zpsm);
		ps.setString(4,zplx);
		ps.setString(5,zpxm);
		ps.setString(6,kkzpbz);
		ps.executeUpdate();
		ps.close();
	}

	int zpsl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_heyszp";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zpsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="update crm_heysjl set zpsl=?";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,zpsl);
	ps.executeUpdate();
	ps.close();
	//------------------------------
}
catch(Exception e)
{
	pageErrorInfo = e.getMessage();

	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}

	su = null;
	if(pageErrorInfo!=null){
		System.out.print(pageErrorInfo);
	}
}
%>