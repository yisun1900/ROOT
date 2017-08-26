<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="com.jspsmart.upload.*,java.sql.*,java.net.* "%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

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
	String khbh = su.getRequest().getParameter("khbh");
	String grxm = java.net.URLDecoder.decode(su.getRequest().getParameter("grxm"),"UTF-8");

	String fileExt = "";
	int fileSize = 0;
	String AllowedExtensions = su.getRequest().getParameter("ext");//�����ϴ����ļ�����
	double maxFileSize = 1024*30;//���ļ�����С����λKB
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
		loadname=khbh+"-"+grxm+"-"+suFile.getFileName();

//		loadname=URLEncoder.encode(loadname);
//		loadname=URLDecoder.decode(loadname,"utf-8");
		System.out.println(loadname);

		filePath=ls+"/yblimg/grsh/"+loadname;
		suFile.saveAs(filePath,SmartUpload.SAVE_PHYSICAL);//�����ļ�

		String inF=filePath;
		String outF=filePath;
		int outWidth=200;
		int outHeight=200;
		boolean rateIs=true;

		ybl.common.ImgDeal.compressPic(inF,outF,outWidth,outHeight,rateIs);  

		//�������ݿ�
		ls_sql="update crm_grxx set zpmc=?,shr='"+yhmc+"',shsj=SYSDATE";
		ls_sql+=" where khbh='"+khbh+"' and grxm='"+grxm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,loadname);
		ps.executeUpdate();
		ps.close();
	}

	String pgrshbz="";//1��δ��ˣ�2�����
	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_grxx";
	ls_sql+=" where khbh='"+khbh+"' and shsj is null";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		pgrshbz="1";
	}
	else {
		pgrshbz="2";
	}

	ls_sql="update crm_khxx set pgrshbz=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pgrshbz);
	ps.executeUpdate();
	ps.close();
		

	//------------------------------
}
catch(Exception e)
{
	pageErrorInfo = e.getMessage();

	System.out.print("<BR>����:" + e);
	System.out.print("<BR>SQL=" + ls_sql);
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