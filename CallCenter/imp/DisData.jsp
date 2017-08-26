<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String yhdlm=(String)session.getAttribute("yhdlm");

String rootPath=getServletContext().getRealPath("");
String filename=null;
java.io.FileOutputStream f=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

Connection conn1  = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql1=null;

String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
String url = "jdbc:odbc:dbf";
String user = "";
String passwd = "";

int count=0;

try {

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"/DBF/"+yhdlm+".DBF";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	conn1=cf.getConnection();    //得到连接
	
	Class.forName (driver);
	conn = DriverManager.getConnection(url, user, passwd);
	

	String c1=null;
	String c2=null;
	String c21=null;
	String c22=null;
	String c23=null;
	String c24=null;
	java.sql.Date c25=null;
	String c26=null;
	String c27=null;
	String c28=null;
	String c29=null;
	int row=0;
	ls_sql = "select *";
	ls_sql+= "  from "+yhdlm;
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while(rs.next())
	{
		c1=cf.fillNull(rs.getString(1));
		c2=cf.fillNull(rs.getString(2));
		c21=cf.fillNull(rs.getString(21));
		c22=cf.fillNull(rs.getString(22));
		c23=cf.fillNull(rs.getString(23));
		c24=cf.fillNull(rs.getString(24));
		c25=rs.getDate(25);
		c26=cf.fillNull(rs.getString(26));
		c27=cf.fillNull(rs.getString(27));
		c28=cf.fillNull(rs.getString(28));
		c29=cf.fillNull(rs.getString(29));

		String clzt="1";
		if (c23.equals("不需要处理"))
		{
			clzt="9";
		}

		ls_sql="insert into yzf_hjzx (xh,khbh,fywt,hfjg,clfs,hfbm,hfsj,zxy,zxz,xgbmclqk  ,zdy,clzt,lrr,lrsj,lrbm)";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,SYSDATE,? ) ";
		ps1= conn1.prepareStatement(ls_sql);
		ps1.setString(1,c1);
		ps1.setString(2,c2);
		ps1.setString(3,c21);
		ps1.setString(4,c22);
		ps1.setString(5,c23);
		ps1.setString(6,c24);
		ps1.setDate(7,c25);
		ps1.setString(8,c26);
		ps1.setString(9,c27);
		ps1.setString(10,c28);

		ps1.setString(11,c29);
		ps1.setString(12,clzt);//1：未处理；2：处理；9：不需处理
		ps1.setString(13,yhmc);
		ps1.setString(14,lrbm);
		ps1.executeUpdate();
		ps1.close();

		row++;
	}
	rs.close(); 
	ps.close();

	out.print("导入成功！共导入记录数：" + row);

}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) conn.close();
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn1 != null) cf.close(conn1);    //释放连接
	}
	catch (Exception e){
//		out.println("关闭连接出错,Exception:"+e.getMessage());
	}
}
%>
