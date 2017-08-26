<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String xmbh=request.getParameter("xmbh");
String dqbm=request.getParameter("dqbm");
String zjxxh=request.getParameter("zjxxh");


double sl=0;
String ls=null;
String jgwzbm=null;
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

	ls_sql="SELECT bj_fjxxh.jgwzbm,xuhao";
	ls_sql+=" FROM bj_fjxxh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
	ls_sql+=" order by bj_fjxxh.xuhao ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		jgwzbm=rs.getString("xuhao");
		jgwzmc=rs.getString("jgwzbm");


		oldjgwzmc=cf.GB2Uni(request.getParameter("CN"+jgwzbm));
		if (!oldjgwzmc.equals(jgwzmc))
		{
			conn.rollback();
			out.println("<BR>存盘失败！结构位置为["+oldjgwzmc+"]的名称已发生变化");
			return;
		}


		ls=request.getParameter("C"+jgwzbm);
		if (ls.trim().equals(""))
		{
			sl=0;
		}
		else
		{
			try{
				sl=java.lang.Double.parseDouble(ls.trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>存盘失败！结构位置为["+jgwzmc+"]的[增减工程量]输入不正确:"+ls.trim());
				return;
			}
		}

		String zjqslstr=request.getParameter("CL"+jgwzbm);
		double zjqsl=java.lang.Double.parseDouble(zjqslstr.trim());

		double zjsl=sl;
		sl=sl+zjqsl;//增减后数量＝原数量＋增减数量
		sl=cf.round(sl,2);

		if (sl<0)
		{
			conn.rollback();
			out.println("<BR>存盘失败！结构位置为["+jgwzmc+"]减项数量【"+zjsl+"】不能超过原数量【"+zjqsl+"】");
			return;
		}
		
		int newMark=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_gclmxh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			newMark=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		
		int oldMark=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_gclmxq ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			oldMark=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();


		if (newMark>0)//增减项后：有此项目
		{
			ls_sql="update bj_gclmxh set sl="+sl;
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzmc+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();

			if (oldMark==0)//增减项前：没有此项目，表示本次增减项新增加项目，工程量为0需删除
			{
				ls_sql="delete from bj_gclmxh ";
				ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzmc+"' and sl=0";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
		}
		else{//增减项后：没有此项目，增减后数量不为0，需要增加一条记录
			if (sl!=0)
			{
				ls_sql="insert into bj_gclmxh(zjxxh,khbh,dqbm,xmbh,jgwzbm,sl)";
				ls_sql+=" values('"+zjxxh+"','"+khbh+"','"+dqbm+"','"+xmbh+"','"+jgwzmc+"',"+sl+") ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
		}

	}
	rs.close();
	ps.close();


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