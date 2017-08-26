<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dqbm=request.getParameter("dqbm");
String[] glbxh=request.getParameterValues("glbxh");
String[] xmbh=request.getParameterValues("xmbh");
String[] glflbm=request.getParameterValues("glflbm");
String[] glmc=request.getParameterValues("glmc");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] xhlstr=request.getParameterValues("xhl");
String[] djstr=request.getParameterValues("dj");
String[] pp=request.getParameterValues("pp");
String[] xh=request.getParameterValues("xh");
String[] gg=request.getParameterValues("gg");
String[] xl=request.getParameterValues("xl");
String[] bjjbbm=request.getParameterValues("bjjbbm");
String[] wlbm=request.getParameterValues("wlbm");
String[] wlllbz=request.getParameterValues("wlllbz");
String[] bz=request.getParameterValues("bz");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double dj=0;
double xhl=0;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	for (int i=0;i<glbxh.length ;i++ )
	{
		
		//[报价级别]是否为空
		if (bjjbbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！[报价级别]为空");
			return;
		}
		//[工料分类]是否为空
		if (glflbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！[工料分类]为空");
			return;
		}

/*
		if (glflbm[i].equals("1"))//1:辅材费
		{
			//[物料编码]是否为空
			if (wlbm[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！[结算材料编码]为空");
				return;
			}

			String getglmc="";
			String getpp="";
			String getxh="";
			ls_sql="select glmc,pp,xh";
			ls_sql+=" from  bj_jscljgb";
			ls_sql+=" where dqbm='"+dqbm+"' and wlbm='"+cf.GB2Uni(wlbm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				getglmc=cf.fillNull(rs.getString("glmc"));
				getpp=cf.fillNull(rs.getString("pp"));
				getxh=cf.fillNull(rs.getString("xh"));

				if (!getglmc.equals(cf.GB2Uni(glmc[i])) || !getpp.equals(cf.GB2Uni(pp[i])) || !getxh.equals(cf.GB2Uni(xh[i])))
				{
					rs.close();
					ps.close();

					conn.rollback();
					out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！结算材料编码["+cf.GB2Uni(wlbm[i])+"]与[材料名称、品牌、型号规格]不一致");
					return;
				}
			}
			else{
				rs.close();
				ps.close();

				conn.rollback();
				out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！结算材料编码["+cf.GB2Uni(wlbm[i])+"]不存在");
				return;
			}
			rs.close();
			ps.close();
		}
		else{
			//[物料编码]是否为空
			if (!wlbm[i].equals("") )
			{
				conn.rollback();
				out.println("<BR>存盘失败！非[材料类]，不能录入[结算材料编码]");
				return;
			}
		}
*/
		//[材料名称]是否为空
		if (glmc[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！[材料名称]为空");
			return;
		}
		//[计量单位]是否为空
		if (jldwbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！[计量单位]为空");
			return;
		}
		//[消耗量]是否为空
		if (xhlstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！[数量]为空");
			return;
		}
		//[单价]是否为空
		if (djstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！[单价]为空");
			return;
		}
		
		
		xhl=0;
		try{
			xhl=java.lang.Double.parseDouble(xhlstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！材料名称为["+cf.GB2Uni(glmc[i])+"]的[数量]输入不正确:"+xhlstr[i].trim());
			return;
		}

		dj=0;
		try{
			dj=java.lang.Double.parseDouble(djstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！材料名称为["+cf.GB2Uni(glmc[i])+"]的[单价]输入不正确:"+djstr[i].trim());
			return;
		}

		if (glflbm[i].equals("1"))
		{
			if (wlllbz[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！材料名称为["+cf.GB2Uni(glmc[i])+"]，请选择【是否需要物流领料】");
				return;
			}
		}
		else{
			wlllbz[i]="";
		}
	
		//家装工料分析表
		ls_sql="update bj_jzglfxb set glflbm='"+glflbm[i]+"',wlllbz='"+wlllbz[i]+"',glmc='"+cf.GB2Uni(glmc[i])+"',pp='"+cf.GB2Uni(pp[i])+"',xh='"+cf.GB2Uni(xh[i])+"',gg='"+cf.GB2Uni(gg[i])+"',xl='"+cf.GB2Uni(xl[i])+"',bz='"+cf.GB2Uni(bz[i])+"'";
		ls_sql+=" ,jldwbm='"+jldwbm[i]+"',xhl="+xhl+",dj="+dj+",lrr='"+yhmc+"',lrsj=TRUNC(SYSDATE),bjjbbm='"+bjjbbm[i]+"',wlbm='"+cf.GB2Uni(wlbm[i])+"' ";
		ls_sql+=" where glbxh="+glbxh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

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