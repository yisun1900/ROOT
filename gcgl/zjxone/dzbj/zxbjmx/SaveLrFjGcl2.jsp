<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");
String khbh=request.getParameter("khbh");
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String xuhao=cf.GB2Uni(request.getParameter("xuhao"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));

String[] xmbh=request.getParameterValues("xmbh");
String[] slstr=request.getParameterValues("sl");

double sl=0;
String oldjgwzmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
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
	ls_sql+=" where zjxxh='"+zjxxh+"' and xuhao="+xuhao;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	if (rs1.next())
	{
		oldjgwzmc=rs1.getString(1);
	}
	rs1.close();
	ps1.close();

	if (!oldjgwzmc.equals(jgwzbm))
	{
		out.println("<BR>存盘失败！结构位置为["+jgwzbm+"]的名称已发生变化");
		return;
	}

	conn.setAutoCommit(false);


	for (int i=0;i<xmbh.length ;i++ )
	{

		try{
			if (slstr[i].trim().equals(""))
			{
				sl=0;
			}
			else{
				sl=java.lang.Double.parseDouble(slstr[i].trim());
			}
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！项目编号为["+xmbh[i]+"]的[工程量]输入不正确:"+slstr[i].trim());
			return;
		}

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_gclmxh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh[i]+"' and jgwzbm='"+jgwzbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count>0)
		{
			ls_sql="update bj_gclmxh set sl="+sl+",zjhsl="+sl;
			ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh[i]+"' and jgwzbm='"+jgwzbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		else{
			ls_sql="insert into bj_gclmxh(zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz)";
			ls_sql+=" values('"+zjxxh+"','"+khbh+"','"+dqbm+"','"+xmbh[i]+"','"+jgwzbm+"',"+sl+","+sl+",0,'N') ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
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
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>