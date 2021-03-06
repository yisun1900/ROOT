<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String xuhao=cf.GB2Uni(request.getParameter("xuhao"));
String zjxxh=request.getParameter("zjxxh");

String[] xmbh=request.getParameterValues("xmbh");
String[] slstr=request.getParameterValues("sl");
String[] yslstr=request.getParameterValues("ysl");

double sl=0;
double ysl=0;
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

		if (slstr[i].trim().equals(""))
		{
			sl=0;
		}
		else
		{
			try{
				sl=java.lang.Double.parseDouble(slstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>存盘失败！项目编号为["+xmbh[i]+"]的[增减工程量]输入不正确:"+slstr[i].trim());
				return;
			}
		}

		ysl=java.lang.Double.parseDouble(yslstr[i].trim());

		double zjsl=sl;
		sl=sl+ysl;//增减后数量＝原数量＋增减数量
		sl=cf.round(sl,2);

		if (sl<0)
		{
			conn.rollback();
			out.println("<BR>存盘失败！项目编号["+xmbh[i]+"]减项数量【"+zjsl+"】不能超过原数量【"+ysl+"】");
			return;
		}
		
		
		
		int newMark=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_gclmxh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"' and jgwzbm='"+jgwzbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
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

		if (newMark>0)//增减项后：有此项目
		{
			ls_sql="update bj_gclmxh set sl="+sl;
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"' and jgwzbm='"+jgwzbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			if (oldMark==0)//增减项前：没有此项目，表示本次增减项新增加项目，工程量为0需删除
			{
				ls_sql="delete from bj_gclmxh ";
				ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"' and jgwzbm='"+jgwzbm+"' and sl=0";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}
		else{//增减项后：没有此项目，增减后数量不为0，需要增加一条记录
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