<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String dqbm = request.getParameter("dqbm");
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));

String[] bjjbbm =request.getParameterValues("bjjbbm");
String[] hxbm =request.getParameterValues("hxbm");
String[] jgwzbm =request.getParameterValues("jgwzbm");
String[] kbwlbm =request.getParameterValues("kbwlbm");
String[] kbcpbm =request.getParameterValues("kbcpbm");
String[] sl =request.getParameterValues("sl");
String[] dj =request.getParameterValues("dj");
String[] sfksc =request.getParameterValues("sfksc");
String[] sfkth =request.getParameterValues("sfkth");
String[] jldw =request.getParameterValues("jldw");
String[] bz =request.getParameterValues("bz");

//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);


	for (int i=0;i<kbwlbm.length ;i++ )
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  tckb_zck";
		ls_sql+=" where kbwlbm='"+kbwlbm[i]+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			conn.rollback();
			out.println("错误！没有此[科宝物料编码]:"+kbwlbm[i]);
			return;
		}

		String getkbcpbm="";
		ls_sql="select kbcpbm";
		ls_sql+=" from  tckb_zck";
		ls_sql+=" where kbwlbm='"+kbwlbm[i]+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getkbcpbm=cf.fillNull(rs.getString(1));
		}
		rs.close();
		ps.close();

		if (!getkbcpbm.equals(kbcpbm[i]))
		{
			conn.rollback();
			out.println("错误！[科宝物料编码]:"+kbwlbm[i]+"对应[科宝产品编码]不正确，应为："+getkbcpbm);
			return;
		}

		
		
		ls_sql="insert into tckb_bpzcxm (bjbbh,dqbm,bjjbbm,hxbm,jgwzbm,kbwlbm,kbcpbm,jldw,sl,dj,sfksc,sfkth,bz,lrr,lrsj)  ";
		ls_sql+=" values('"+bjbbh+"','"+dqbm+"','"+bjjbbm[i]+"','"+hxbm[i]+"','"+cf.GB2Uni(jgwzbm[i])+"','"+kbwlbm[i]+"','"+kbcpbm[i]+"','"+cf.GB2Uni(jldw[i])+"','"+sl[i]+"','"+dj[i]+"','"+sfksc[i]+"','"+sfkth[i]+"','"+cf.GB2Uni(bz[i])+"','"+yhmc+"',SYSDATE)";
		ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>sql=" + ls_sql);
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
