<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String xuhao=cf.GB2Uni(request.getParameter("xuhao"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String zjxxh=request.getParameter("zjxxh");

String[] xmbh=request.getParameterValues("xmbh");
String[] slstr=request.getParameterValues("sl");
String[] zjqslstr=request.getParameterValues("zjqsl");

double sl=0;
String oldjgwzmc=null;

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


	ls_sql="SELECT jgwzbm";
	ls_sql+=" FROM bj_fjxxh ";
	ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xuhao="+xuhao;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldjgwzmc=rs.getString(1);
	}
	rs.close();
	ps.close();

	if (!oldjgwzmc.equals(jgwzbm))
	{
		out.println("<BR>存盘失败！结构位置为["+jgwzbm+"]的名称已发生变化");
		return;
	}

	conn.setAutoCommit(false);


	for (int i=0;i<xmbh.length ;i++ )
	{
		double zjqsl=java.lang.Double.parseDouble(zjqslstr[i].trim());

		if (slstr[i].trim().equals(""))
		{
			sl=0;
		}
		else{
			try{
				sl=java.lang.Double.parseDouble(slstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>存盘失败！项目编号为["+xmbh[i]+"]的[工程量]输入不正确:"+slstr[i].trim());
				return;
			}
		}

		double zjsl=sl;
		sl=sl+zjqsl;
		if (sl<0)
		{
			conn.rollback();
			out.println("<BR>存盘失败！项目编号["+xmbh[i]+"]减项数量【"+zjsl+"】不能超过原数量【"+zjqsl+"】");
			return;
		}

		int newMark=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_gclmxh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"' and jgwzbm='"+jgwzbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			newMark=rs.getInt(1);
		}
		rs.close();
		ps.close();

		int oldMark=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_gclmxq ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"' and jgwzbm='"+jgwzbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			oldMark=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (newMark>0)//老项目
		{
			ls_sql="update bj_gclmxh set sl="+sl;
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"' and jgwzbm='"+jgwzbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			if (oldMark==0)//本次新增项目，需删除
			{
				ls_sql="delete from bj_gclmxh ";
				ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"' and jgwzbm='"+jgwzbm+"' and sl=0";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}
		else{//新项目
			if (sl!=0)
			{
				ls_sql="insert into bj_gclmxh(zjxxh,khbh,dqbm,xmbh,jgwzbm,sl)";
				ls_sql+=" values('"+zjxxh+"','"+khbh+"','"+dqbm+"','"+xmbh[i]+"','"+jgwzbm+"',"+sl+") ";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}

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
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
		if (conn != null) cf.close(conn); 
	}
}
%>