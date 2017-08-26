<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="com.jspsmart.upload.*,java.sql.*,java.net.*,java.util.* "%>
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
	Vector vector = new Vector();

	su = new SmartUpload();
	su.initialize(pageContext);
	su.upload();

	//----------------------------
	File suFile = null;
	int fileCount = 0;
	
	//获取传递过来的参数
	String xjjlh = su.getRequest().getParameter("xjjlh");
	String zpml = su.getRequest().getParameter("zpml");
	String lx = su.getRequest().getParameter("lx");
	String zpgjz = java.net.URLDecoder.decode(su.getRequest().getParameter("zpgjz"),"UTF-8");
	String zpsm = java.net.URLDecoder.decode(su.getRequest().getParameter("zpsm"),"UTF-8");

	String fileExt = "";
	int fileSize = 0;
	String AllowedExtensions = su.getRequest().getParameter("ext");//允许上传的文件类型
	double maxFileSize = 1024*3;//单文件最大大小，单位KB
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
		loadname=xjjlh.toUpperCase()+"-"+suFile.getFileName();

		loadname=URLEncoder.encode(loadname);
		loadname=URLDecoder.decode(loadname,"utf-8");
		System.out.println(loadname);


		filePath=ls+"/yblimg/xjgd/"+zpml+"/"+loadname;
		suFile.saveAs(filePath,SmartUpload.SAVE_PHYSICAL);//保存文件

		vector.add(loadname);

		String inF=filePath;
		String outF=filePath;
		int outWidth=800;
		int outHeight=800;
		boolean rateIs=true;

		ybl.common.ImgDeal.compressPic(inF,outF,outWidth,outHeight,rateIs);  
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
		String xjzpmc=(String)iterator.next();
		//插入数据库
		ls_sql="insert into kp_xjgdjlzp(xjzpmc,xjjlh,zpsm,lx,zpgjz,zpml,kkzpbz,zpshbz) values(?,?,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,xjzpmc);
		ps.setString(2,xjjlh);
		ps.setString(3,zpsm);
		ps.setString(4,lx);
		ps.setString(5,zpgjz);
		ps.setString(6,zpml);
		ps.setString(7,kkzpbz);
		ps.setString(8,"N");//Y：审核；N：未审核
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
	//------------------------------
}
catch(Exception e)
{
	pageErrorInfo = e.getMessage();

	out.print("<BR>出错:" + e);
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