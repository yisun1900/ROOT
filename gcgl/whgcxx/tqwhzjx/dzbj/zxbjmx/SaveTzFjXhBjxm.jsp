<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String[] xmbh=request.getParameterValues("xmbh");
String[] jgwzbm=request.getParameterValues("jgwzbm");
String[] fjnxh=request.getParameterValues("fjnxh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 飞单审核未通过；3：已签约；4：飞单；5：飞单审核未通过
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
	}
	rs.close();
	ps.close();
	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1：未完成；2：完成；3：业绩结转
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("错误！客户已签单，不能再修改报价");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("错误！客户签单失败，不能再修改报价");
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
		ls_sql+=" FROM bj_gclmx ";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh[i]+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
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
				ls_sql="update bj_gclmx set fjnxh="+fjnxh[i]+" ";
				ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh[i]+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else{
				ls_sql="insert into bj_gclmx(khbh,dqbm,xmbh,jgwzbm,sl,sl,wcl,bjbz)";
				ls_sql+=" values('"+khbh+"','"+dqbm+"','"+xmbh[i]+"','"+cf.GB2Uni(jgwzbm[i])+"',0,0,0,'N') ";
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