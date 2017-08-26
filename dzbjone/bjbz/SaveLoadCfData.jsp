<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String bjjbbm = request.getParameter("bjjbbm");
String dqbm = request.getParameter("dqbm");

String[] fxmbh =request.getParameterValues("fxmbh");
String[] xmdlbm =request.getParameterValues("xmdlbm");
String[] xmxlbm =request.getParameterValues("xmxlbm");
String[] xmbh =request.getParameterValues("xmbh");
String[] xmmc =request.getParameterValues("xmmc");
String[] smbm =request.getParameterValues("smbm");
String[] jldwbm =request.getParameterValues("jldwbm");
String[] bj =request.getParameterValues("bj");
String[] clbj =request.getParameterValues("clbj");
String[] zcf =request.getParameterValues("zcf");
String[] rgbj =request.getParameterValues("rgbj");
String[] ysf =request.getParameterValues("ysf");
String[] jxbj =request.getParameterValues("jxbj");
String[] shf =request.getParameterValues("shf");
String[] qtf =request.getParameterValues("qtf");
String[] gycl =request.getParameterValues("gycl");
String[] flmcgg =request.getParameterValues("flmcgg");
String[] bz =request.getParameterValues("bz");

//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	for (int i=0;i<xmbh.length ;i++ )
	{
		int count=0;
		sql=" select count(*)" ;
		sql+=" from bj_jzbjcfb " ;
		sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh[i]+"' and bjjbbm='"+bjjbbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>1)
		{
			conn.rollback();
			out.println("错误！项目编号["+xmbh[i]+"]有多个");
			return;
		}
		else if (count==1)//首先删除
		{
			sql=" delete from bj_jzbjcfb " ;
			sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh[i]+"' and bjjbbm='"+bjjbbm+"'" ;
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		}
			
		if (clbj[i].equals(""))
		{
			clbj[i]="0";
		}

		if (rgbj[i].equals(""))
		{
			rgbj[i]="0";
		}

		if (jxbj[i].equals(""))
		{
			jxbj[i]="0";
		}

		sql ="insert into bj_jzbjcfb (bjbbh,dqbm,fxmbh,xmbh,bjjbbm,xmmc,xmdlbm,xmxlbm,smbm";
		sql+=" ,jldwbm,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,bj,gycl,flmcgg,bz,lrr,lrsj)";
		sql+=" values('"+bjbbh+"','"+dqbm+"','"+fxmbh[i]+"','"+xmbh[i]+"','"+bjjbbm+"','"+cf.GB2Uni(xmmc[i])+"','"+xmdlbm[i]+"','"+xmxlbm[i]+"','"+smbm[i]+"'";
		sql+=" ,'"+jldwbm[i]+"','"+clbj[i]+"','"+rgbj[i]+"','"+jxbj[i]+"','"+zcf[i]+"','"+shf[i]+"','"+ysf[i]+"','"+qtf[i]+"',"+bj[i]+",'"+cf.GB2Uni(gycl[i])+"','"+cf.GB2Uni(flmcgg[i])+"','"+cf.GB2Uni(bz[i])+"','"+yhmc+"',TRUNC(SYSDATE))";
		ps= conn.prepareStatement(sql);
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
