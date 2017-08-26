<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");
String dqbm=request.getParameter("dqbm");
String xmbh=request.getParameter("xmbh");

String[] jgwzbm=request.getParameterValues("jgwzbm");

double sl=0;
String ls=null;
String jgwzmc=null;
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


	conn.setAutoCommit(false);


	for (int i=0;i<jgwzbm.length ;i++ )
	{
		ls_sql="SELECT bj_fjxxh.jgwzbm";
		ls_sql+=" FROM bj_fjxxh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xuhao="+jgwzbm[i];
		ls_sql+=" order by bj_fjxxh.xuhao ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jgwzmc=rs.getString("jgwzbm");
		}
		rs.close();
		ps.close();

		ls=request.getParameter("C"+jgwzbm[i]);
		oldjgwzmc=cf.GB2Uni(request.getParameter("CN"+jgwzbm[i]));

		if (!oldjgwzmc.equals(jgwzmc))
		{
			conn.rollback();
			out.println("<BR>存盘失败！结构位置为["+oldjgwzmc+"]的名称已发生变化，请刷新该页面重新保存");
			return;
		}

		try{
			if (ls.trim().equals(""))
			{
				sl=0;
			}
			else{
				sl=java.lang.Double.parseDouble(ls.trim());
			}
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！结构位置为["+jgwzmc+"]的[工程量]输入不正确:"+ls.trim());
			return;
		}

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_gclmxh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzmc+"'";
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
			ls_sql+=" where zjxxh='"+zjxxh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzmc+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		else{
			ls_sql="insert into bj_gclmxh(zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz)";
			ls_sql+=" values('"+zjxxh+"','"+khbh+"','"+dqbm+"','"+xmbh+"','"+jgwzmc+"',"+sl+","+sl+",0,'N') ";
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