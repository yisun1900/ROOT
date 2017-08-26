<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String ssfgs = request.getParameter("ssfgs");

String[] ygbh =request.getParameterValues("ygbh");

String[] jbgz =request.getParameterValues("jbgz");
String[] gwgz =request.getParameterValues("gwgz");
String[] khgz =request.getParameterValues("khgz");
String[] buzhu =request.getParameterValues("buzhu");
String[] glgz =request.getParameterValues("glgz");
String[] jtbt =request.getParameterValues("jtbt");
String[] dhbt =request.getParameterValues("dhbt");
String[] cb =request.getParameterValues("cb");
String[] gzlb =request.getParameterValues("gzlb");
  
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	for (int i=0;i<ygbh.length ;i++ )
	{
		int count=0;
		sql="select count(*)";
		sql+=" from  sq_yhxx";
		sql+=" where ygbh='"+ygbh[i]+"' and ssfgs='"+ssfgs+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count<1)
		{
			conn.rollback();
			out.println("错误！该[员工序号]【"+ygbh[i]+"】不存在："+sql);
			return;
		}
		
		sql="update rs_ygjbgzb set jbgz=?,gwgz=?,khgz=?,buzhu=?,glgz=?,jtbt=?,dhbt=?,cb=?,gzlb=?";
		sql+=" where ygbh='"+ygbh[i]+"'";
		ps= conn.prepareStatement(sql);
		ps.setString(1,jbgz[i]);
		ps.setString(2,gwgz[i]);
		ps.setString(3,khgz[i]);
		ps.setString(4,buzhu[i]);
		ps.setString(5,glgz[i]);
		ps.setString(6,jtbt[i]);
		ps.setString(7,dhbt[i]);
		ps.setString(8,cb[i]);
		ps.setString(9,gzlb[i]);
		ps.executeUpdate();
		ps.close();

	}
	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
