<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dqbm=request.getParameter("dqbm");
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));

String[] glbxh=request.getParameterValues("glbxh");
String[] glflbm=request.getParameterValues("glflbm");
String[] glmc=request.getParameterValues("glmc");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] xhlstr=request.getParameterValues("xhl");
String[] djstr=request.getParameterValues("dj");
String[] pp=request.getParameterValues("pp");
String[] xhgg=request.getParameterValues("xhgg");
String[] bjjb=request.getParameterValues("bjjb");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double dj=0;
double xhl=0;

try {
	conn=cf.getConnection();

	String xmmc=null;
	String xmdlbm=null;
	String xmxlbm=null;

	ls_sql="SELECT xmmc,xmdlbm,xmxlbm";
	ls_sql+=" FROM bj_gzbjb";
	ls_sql+=" where bj_gzbjb.dqbm='"+dqbm+"' and bj_gzbjb.xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmmc=rs.getString("xmmc");
		xmdlbm=rs.getString("xmdlbm");
		xmxlbm=rs.getString("xmxlbm");
	}
	else{
		out.println("错误！项目不存在");
		return;
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);


	for (int i=0;i<glflbm.length ;i++ )
	{
		//未录信息
		if (glflbm[i].equals(""))
		{
			continue;
		}
		//[报价级别]是否为空
		if (bjjb[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[报价级别]为空");
			return;
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
		
		int newglbxh=0;

		if (glbxh[i].equals(""))
		{
			ls_sql="select NVL(max(TO_NUMBER(glbxh)),0)";
			ls_sql+=" from  bj_gzglfxb";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				newglbxh=rs.getInt(1);
			}
			rs.close();
			ps.close();

			newglbxh++;

			//家装工料分析表
			ls_sql="insert into bj_gzglfxb(glbxh,dqbm,xmbh,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,lrr,lrsj,bjjb)";
			ls_sql+=" SELECT "+newglbxh+",dqbm,xmbh,'"+glflbm[i]+"','"+cf.GB2Uni(glmc[i])+"','"+cf.GB2Uni(pp[i])+"','"+cf.GB2Uni(xhgg[i])+"','"+jldwbm[i]+"',"+xhl+","+dj+",'"+yhmc+"',TRUNC(SYSDATE),'"+bjjb[i]+"'";
			ls_sql+=" FROM bj_gzbjb ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{
			//家装工料分析表
			ls_sql="update bj_gzglfxb set glflbm='"+glflbm[i]+"',glmc='"+cf.GB2Uni(glmc[i])+"',pp='"+cf.GB2Uni(pp[i])+"'";
			ls_sql+=" ,xhgg='"+cf.GB2Uni(xhgg[i])+"',jldwbm='"+jldwbm[i]+"',xhl="+xhl+",dj="+dj+",lrr='"+yhmc+"',lrsj=TRUNC(SYSDATE),bjjb='"+bjjb[i]+"' ";
			ls_sql+=" where glbxh="+glbxh[i];
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
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