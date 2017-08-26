<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String ddbh = request.getParameter("ddbh");
if (yhdlm.length()>8)
{
	yhdlm=yhdlm.substring(0,8);
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

Connection conn1  = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql1=null;

String rootPath=getServletContext().getRealPath("");
String DBFSourece=rootPath+"/DBF/NEWYBL.DBF";
String DownFile=rootPath+"/DBF/"+yhdlm+".DBF";
String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
String url = "jdbc:odbc:dbf";
String user = "";
String passwd = "";

try {
	String khbh=null;
	String hth=null;
	String khxm=null;
	String lxfs=null;
	String fwdz=null;
	String cgsjs=null;

	FileInputStream fis=new FileInputStream(DBFSourece);
	FileOutputStream fos=new FileOutputStream(DownFile);
	byte[] buffer=new byte[1024];
	int len=0;
	while ((len=fis.read(buffer))!=-1)
	{
		fos.write(buffer,0,len);
	}
	fis.close();
	fos.close();

	conn1=cf.getConnection();    //得到连接
	
	Class.forName (driver);
	conn = DriverManager.getConnection(url, user, passwd);


	ls_sql1 = "select jc_cgdd.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,cgsjs";
	ls_sql1+= "  from jc_cgdd,crm_khxx ";
	ls_sql1+= "  where jc_cgdd.khbh=crm_khxx.khbh and ddbh='"+ddbh+"'";
	ps= conn1.prepareStatement(ls_sql1);
	rs=ps.executeQuery();
	if(rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		cgsjs=cf.fillNull(rs.getString("cgsjs"));
	}
	rs.close(); 
	ps.close();



	ls_sql = "insert into "+yhdlm+"(ddbh,khbh,hth,khxm,lxfs,fwdz,cgsjs)";
	ls_sql+= " values(?,?,?,?,?,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddbh);
	ps.setString(2,khbh);
	ps.setString(3,hth);
	ps.setString(4,khxm);
	ps.setString(5,lxfs);
	ps.setString(6,fwdz);
	ps.setString(7,cgsjs);
	ps.executeUpdate();
	ps.close();


	out.print("<BR>成功生成条码文件："+yhdlm+".DBF");
	out.print("<BR>点击鼠标右键下载" );
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
<BR><BR><A HREF="/DBF/<%=yhdlm%>.DBF">点击鼠标右键下载客户资料</A>