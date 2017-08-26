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
	
	//获取传递过来的参数
	String khbh = su.getRequest().getParameter("khbh");
	String grxm = java.net.URLDecoder.decode(su.getRequest().getParameter("grxm"),"UTF-8");

	String fileExt = "";
	int fileSize = 0;
	String AllowedExtensions = su.getRequest().getParameter("ext");//允许上传的文件类型
	double maxFileSize = 1024*30;//单文件最大大小，单位KB
	//校验文件类型和大小
	for (int i=0; i<su.getFiles().getCount();i++)
	{
		suFile = su.getFiles().getFile(i);
		if (suFile.isMissing())
			continue;
		//校验文件大小
		fileSize = suFile.getSize()/1024;//字节转换成KB
		if(fileSize==0) fileSize=1;
		if(maxFileSize<fileSize) out.println("单个上传相片的容量不能超过["+maxFileSize+"KB]");

		//校验文件类型
		if (suFile.getFileExt() == null	|| "".equals(suFile.getFileExt())) 
		{
			fileExt = ",,";
		} 
		else {
			fileExt = "," + suFile.getFileExt().toLowerCase() + ",";
		}

		if (!"".equals(AllowedExtensions) && AllowedExtensions.indexOf(fileExt) == -1) 
		{
			out.println("您上传的文件[" + suFile.getFileName()+ "]的类型为系统禁止上传的文件类型，不能上传！");
		}

		fileCount++;
	}

	if (fileCount==0) out.println("请选择上传的文件");
	
	
	String filePath="";
	for (int i=0; i<su.getFiles().getCount();i++) 
	{
		suFile = su.getFiles().getFile(i);
		loadname=khbh+"-"+grxm+"-"+suFile.getFileName();

//		loadname=URLEncoder.encode(loadname);
//		loadname=URLDecoder.decode(loadname,"utf-8");
		System.out.println(loadname);

		filePath=ls+"/yblimg/grsh/"+loadname;
		suFile.saveAs(filePath,SmartUpload.SAVE_PHYSICAL);//保存文件

		String inF=filePath;
		String outF=filePath;
		int outWidth=200;
		int outHeight=200;
		boolean rateIs=true;

		ybl.common.ImgDeal.compressPic(inF,outF,outWidth,outHeight,rateIs);  

		//插入数据库
		ls_sql="update crm_grxx set zpmc=?,shr='"+yhmc+"',shsj=SYSDATE";
		ls_sql+=" where khbh='"+khbh+"' and grxm='"+grxm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,loadname);
		ps.executeUpdate();
		ps.close();
	}

	String pgrshbz="";//1：未审核；2：审核
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

	System.out.print("<BR>出错:" + e);
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