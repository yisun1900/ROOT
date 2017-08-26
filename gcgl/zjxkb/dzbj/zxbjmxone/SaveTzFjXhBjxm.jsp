<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");
String[] xmbh=request.getParameterValues("xmbh");
String[] jgwzbm=request.getParameterValues("jgwzbm");
String[] fjnxh=request.getParameterValues("fjnxh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}

	String dqbm=null;
	ls_sql=" SELECT dqbm";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx ";
	ls_sql+=" where crm_zxkhxx.ssfgs=sq_dwxx.dwbh and crm_zxkhxx.khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString(1);
	}
	rs.close();
	ps.close();

	
	conn.setAutoCommit(false);

	for (int i=0;i<xmbh.length ; i++)
	{
		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_gclmxh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh[i]+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (fjnxh[i].trim().equals(""))
		{
			if (count>0)
			{
				conn.rollback();
				out.println("房间『"+cf.GB2Uni(jgwzbm[i])+"』、项目『"+xmbh[i]+"』错误！[房间内序号]未选择");
				return;
			}
			else{
				continue;
			}
		}
		else{
			if (count>0)
			{
				ls_sql="update bj_gclmxh set fjnxh="+fjnxh[i]+" ";
				ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh[i]+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else{
				ls_sql="insert into bj_gclmxh(zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz)";
				ls_sql+=" values('"+zjxxh+"','"+khbh+"','"+dqbm+"','"+xmbh[i]+"','"+cf.GB2Uni(jgwzbm[i])+"',0,0,0,'N') ";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}

//		out.println(ls_sql);
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" +ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>