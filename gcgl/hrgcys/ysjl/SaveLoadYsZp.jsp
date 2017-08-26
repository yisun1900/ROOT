<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="com.jspsmart.upload.*,java.sql.*,java.net.*,java.util.* "%>
<%@ page import='ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String pageErrorInfo = null;
SmartUpload su = null;
String ls=getServletContext().getRealPath("");
String loadname=null;


Vector vector = new Vector();


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try{
	su = new SmartUpload();
	su.initialize(pageContext);
	su.upload();

	
	//----------------------------
	File suFile = null;
	int fileCount = 0;
	
	//获取传递过来的参数
	String ysjlh = su.getRequest().getParameter("ysjlh");
	String zpml = su.getRequest().getParameter("zpml");
	String zplx = su.getRequest().getParameter("zplx");
	String zpxm = java.net.URLDecoder.decode(su.getRequest().getParameter("zpxm"),"UTF-8");
	String zpsm = java.net.URLDecoder.decode(su.getRequest().getParameter("zpsm"),"UTF-8");



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
	//准备保存文件
	// String filePath="D:\\tomcat\\webapps\\ROOT\\gcgl\\gcjdgz\\fxys\\fxysimages\\";//这里填写项目中存放上传文件的物理路径
	String filePath="";
	for (int i=0; i<su.getFiles().getCount();i++) 
	{
	
		suFile = su.getFiles().getFile(i);
		loadname=ysjlh.toUpperCase()+"-"+zpxm+"-"+suFile.getFileName();

		loadname=URLEncoder.encode(loadname);
		loadname=URLDecoder.decode(loadname,"utf-8");


		filePath=ls+"/yblimg/gcys/"+zpml+"/"+loadname;
		System.out.println("/yblimg/gcys/"+zpml+"/"+loadname);

		suFile.saveAs(filePath,SmartUpload.SAVE_PHYSICAL);//保存文件

		String inF=filePath;
		String outF=filePath;
		int outWidth=800;
		int outHeight=800;
		boolean rateIs=true;

		ybl.common.ImgDeal.compressPic(inF,outF,outWidth,outHeight,rateIs);  

		vector.add(loadname);

	}

	conn=cf.getConnection();


	String khbh = "";
	ls_sql="SELECT khbh";
	ls_sql+=" FROM crm_heysjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
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

	String zpsfxsh = "";//照片是否需审核  Y：需审核；N：不需
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

	
	String kkzpbz="0";//0不可看   1可看

	if (zpsfxsh.equals("N"))//Y：需审核；N：不需
	{
		kkzpbz="1";
	}

	Iterator iterator = vector.iterator();

	while(iterator.hasNext())
	{
		String yszpmc=(String)iterator.next();

		//插入数据库
		ls_sql =" delete from crm_heyszp  ";
		ls_sql+=" where yszpmc='"+yszpmc+"' and khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into crm_heyszp(yszpmc,ysjlh,zplx,zpxm,zpsm,kkzpbz,khbh,zpml,zpshbz) values(?,?,?,?,?,?,?,?,'N')";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yszpmc);
		ps.setString(2,ysjlh);
		ps.setString(3,zplx);
		ps.setString(4,zpxm);
		ps.setString(5,zpsm);
		ps.setString(6,kkzpbz);
		ps.setString(7,khbh);
		ps.setString(8,zpml);
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