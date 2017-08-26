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
	
	//获取传递过来的参数
	String ysjlh = su.getRequest().getParameter("ysjlh");

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
		loadname=ysjlh.toUpperCase()+"-"+suFile.getFileName();

		String oldysjlh="";
		loadname=URLEncoder.encode(loadname);
		loadname=URLDecoder.decode(loadname,"utf-8");
		System.out.println(loadname);

		ls_sql="SELECT ysjlh";
		ls_sql+=" FROM crm_yszp";
		ls_sql+=" where yszpmc='"+loadname+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			oldysjlh=rs.getString(1);

			if (!oldysjlh.equals(ysjlh))
			{
				rs.close();
				ps.close();

				out.println("错误！[照片名称]已存在");
				return;
			}
		}
		rs.close();
		ps.close();

		filePath=ls+"/gcgl/pzgl/sgjdb/images/"+loadname;
		suFile.saveAs(filePath,SmartUpload.SAVE_PHYSICAL);//保存文件

		//插入数据库
		if (!oldysjlh.equals(ysjlh))
		{
			ls_sql="insert into crm_yszp(yszpmc,ysjlh) values(?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,loadname);
			ps.setString(2,ysjlh);
			ps.executeUpdate();
			ps.close();

			/*int zpsl=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_yszp";
			ls_sql+=" where ysjlh='"+ysjlh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zpsl=rs.getInt(1);
			}
			rs.close();
			ps.close();
		
			ls_sql="update crm_gcfxysjl set zpsl=?";
			ls_sql+=" where ysjlh='"+ysjlh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,zpsl);
			ps.executeUpdate();
			ps.close();*/
		}
	}
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