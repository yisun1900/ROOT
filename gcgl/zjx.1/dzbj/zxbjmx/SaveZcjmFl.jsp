<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String zjxxh=request.getParameter("zjxxh");
String jmfl=cf.GB2Uni(request.getParameter("jmfl"));
String[] tccplbbm=request.getParameterValues("tccplbbm");
String[] jgwzbm=request.getParameterValues("jgwzbm");
String[] sjjmslStr=request.getParameterValues("sjjmsl");


 
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String sfwc="";
	String khbh="";
	ls_sql="select sfwc,khbh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
		khbh=rs.getString("khbh");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<tccplbbm.length ;i++ )
	{
		double sjsl=0;//实际数量
		ls_sql="select sum(sjsl) sjsl ";
		ls_sql+=" FROM bj_khzcxmxjh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"' and tccplbbm='"+tccplbbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjsl=rs.getDouble("sjsl");
		}
		rs.close();
		ps.close();

		if (sjsl>0)
		{
			conn.rollback();
			out.println("错误！已选择主材数量:"+sjsl+"，不可减免，请先删除主材");
			return;
		}

		double sjjmsl=0;
		try{
			sjjmsl=Double.parseDouble(sjjmslStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[减免数量]类型转换发生意外:"+e);
			return;
		}


		ls_sql="update bj_khzcxmxjh set sjjmsl="+sjjmsl+",sjjmje=jmdj*"+sjjmsl;
		ls_sql+=" ,sjsl=0,sjjshsl=0,sjsfsl=0,sjsfje=0";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"' and tccplbbm='"+tccplbbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	
		//检查：小类数量限制：＋＋＋＋＋＋＋＋＋＋＋＋开始
		double getyxjmzdsl=0;//允许减免最大数量
		String getsfkjm="";//是否限制减免数量  1：不限制；2：限制

		ls_sql="select sfkjm,yxjmzdsl";
		ls_sql+=" FROM bj_khclxlxz";
		ls_sql+=" where khbh='"+khbh+"' and clxlbm='"+tccplbbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getyxjmzdsl=rs.getDouble("yxjmzdsl");
			getsfkjm=cf.fillNull(rs.getString("sfkjm"));
		}
		rs.close();
		ps.close();

		double xlsjjmsl=0;
		ls_sql="select sum(sjjmsl)";
		ls_sql+=" FROM bj_khzcxmxjh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tccplbbm='"+tccplbbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xlsjjmsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		if (getsfkjm.equals("2"))//1：不限制；2：限制
		{
			if (xlsjjmsl>getyxjmzdsl)
			{
				conn.rollback();
				out.println("<P>错误！类别限制减免总数量，总数量["+xlsjjmsl+"]不能超过限制数量["+getyxjmzdsl+"]");
				return;
			}
		}
		//检查：小类数量限制：＝＝＝＝＝＝＝＝＝＝＝＝结束
		

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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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