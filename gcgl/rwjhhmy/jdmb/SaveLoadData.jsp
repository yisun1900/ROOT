<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String mbbm = request.getParameter("mbbm");

String[] rwxh =request.getParameterValues("rwxh");
String[] rwbm =request.getParameterValues("rwbm");
String[] rwsfsj =request.getParameterValues("rwsfsj");
String[] rwts =request.getParameterValues("rwts");


//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	for (int i=0;i<rwbm.length ;i++ )
	{
		int count=0;
		sql=" select count(*)" ;
		sql+=" from gdm_mbsjjd " ;
		sql+=" where mbbm='"+mbbm+"' and rwbm='"+rwbm[i]+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			conn.rollback();
			out.println("错误！任务编码["+rwbm[i]+"]有多个");
			return;
		}
		

		sql ="insert into gdm_mbsjjd (mbbm,rwbm,rwsfsj,rwts,rwxh)";
		sql+=" values('"+mbbm+"','"+rwbm[i]+"','"+rwsfsj[i]+"','"+rwts[i]+"','"+rwxh[i]+"')";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

	}


	
	//调整序号
	int pxxh=0;
	String getrwbm=null;
	sql="SELECT rwbm";
	sql+=" FROM gdm_mbsjjd";
	sql+=" where mbbm='"+mbbm+"'";
	sql+=" order by rwxh";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getrwbm=rs.getString(1);

		pxxh++;

		sql="update gdm_mbsjjd set rwxh="+pxxh;
		sql+=" where mbbm='"+mbbm+"' and rwbm='"+getrwbm+"'";
		ps1= conn.prepareStatement(sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
