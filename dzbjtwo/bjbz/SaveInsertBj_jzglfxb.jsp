<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dqbm=request.getParameter("dqbm");
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));

String[] glflbm=request.getParameterValues("glflbm");
String[] glmc=request.getParameterValues("glmc");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] xhlstr=request.getParameterValues("xhl");
String[] djstr=request.getParameterValues("dj");
String[] pp=request.getParameterValues("pp");
String[] xhgg=request.getParameterValues("xhgg");
String[] wlbm=request.getParameterValues("wlbm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double dj=0;
double xhl=0;
int count=0;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);


	for (int i=0;i<glflbm.length ;i++ )
	{
		//未录信息
		if (glflbm[i].equals(""))
		{
			continue;
		}
		if (glflbm[i].equals("1"))//1:辅材费
		{
			//[物料编码]是否为空
			if (wlbm[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>存盘失败！[结算材料编码]为空");
				return;
			}

			String getglmc="";
			String getpp="";
			String getxhgg="";
			ls_sql="select glmc,pp,xhgg";
			ls_sql+=" from  bj_jscljgb";
			ls_sql+=" where dqbm='"+dqbm+"' and wlbm='"+cf.GB2Uni(wlbm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				getglmc=cf.fillNull(rs.getString("glmc"));
				getpp=cf.fillNull(rs.getString("pp"));
				getxhgg=cf.fillNull(rs.getString("xhgg"));

				if (!getglmc.equals(cf.GB2Uni(glmc[i])) || !getpp.equals(cf.GB2Uni(pp[i])) || !getxhgg.equals(cf.GB2Uni(xhgg[i])))
				{
					rs.close();
					ps.close();

					conn.rollback();
					out.println("<BR>存盘失败！结算材料编码["+cf.GB2Uni(wlbm[i])+"]与[工料名称、品牌、型号规格]不一致");
					return;
				}
			}
			else{
				rs.close();
				ps.close();

				conn.rollback();
				out.println("<BR>存盘失败！结算材料编码["+cf.GB2Uni(wlbm[i])+"]不存在");
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
		//[工料名称]是否为空
		if (glmc[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[工料名称]为空");
			return;
		}
		//[计量单位]是否为空
		if (jldwbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[计量单位]为空");
			return;
		}
		//[消耗量]是否为空
		if (xhlstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[消耗量]为空");
			return;
		}
		//[单价]是否为空
		if (djstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[单价]为空");
			return;
		}

		xhl=0;
		try{
			xhl=java.lang.Double.parseDouble(xhlstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！工料名称为["+cf.GB2Uni(glmc[i])+"]的[单价]输入不正确:"+xhlstr[i].trim());
			return;
		}

		dj=0;
		try{
			dj=java.lang.Double.parseDouble(djstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！工料名称为["+cf.GB2Uni(glmc[i])+"]的[单价]输入不正确:"+djstr[i].trim());
			return;
		}


		int glbxh=0;
		ls_sql="select NVL(max(TO_NUMBER(glbxh)),0)";
		ls_sql+=" from  bj_jzglfxb";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			glbxh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		glbxh++;


		//家装工料分析表
		ls_sql="insert into bj_jzglfxb(glbxh,dqbm,xmbh,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,lrr,lrsj,bjjbbm,wlbm)";
		ls_sql+=" values("+glbxh+",'"+dqbm+"','"+xmbh+"','"+glflbm[i]+"','"+cf.GB2Uni(glmc[i])+"','"+cf.GB2Uni(pp[i])+"','"+cf.GB2Uni(xhgg[i])+"','"+jldwbm[i]+"',"+xhl+","+dj+",'"+yhmc+"',TRUNC(SYSDATE),'"+bjjbbm+"','"+cf.GB2Uni(wlbm[i])+"')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	String getwlbm=null;
	count=0;
	ls_sql="select wlbm,count(*)";
	ls_sql+=" from  bj_jzglfxb";
	ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"' and wlbm is not null";
	ls_sql+=" group by wlbm";
	ls_sql+=" having count(*)>1";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		getwlbm=rs.getString(1);
		count=rs.getInt(2);
	}
	rs.close();
	ps.close();
	if (count>1)
	{
		conn.rollback();
		out.println("<BR>存盘失败！结算材料编码["+getwlbm+"]已存在");
		return;
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