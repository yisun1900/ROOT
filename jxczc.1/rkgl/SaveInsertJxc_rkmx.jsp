<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String dqbm=request.getParameter("dqbm");
String clbm=cf.GB2Uni(request.getParameter("clbm"));
double rksl = 0;
double rkje = 0;
double rkj = 0;
ls=request.getParameter("rksl");
try{
	if (!(ls.equals("")))  rksl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rksl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入库数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("rkje");
try{
	if (!(ls.equals("")))  rkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入库金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("rkj");
try{
	if (!(ls.equals("")))  rkj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rkj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入库价]类型转换发生意外:"+e);
	return;
}
java.sql.Date scrq=null;
ls=request.getParameter("scrq");
try{
	if (!(ls.equals("")))  scrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量scrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[生产日期]类型转换发生意外:"+e);
	return;
}
String scph=cf.GB2Uni(request.getParameter("scph"));
String hjbh=cf.GB2Uni(request.getParameter("hjbh"));
String hwbh=cf.GB2Uni(request.getParameter("hwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String rkdzt=null;
	ls_sql=" SELECT rkdzt ";
	ls_sql+=" FROM jxc_rkd ";
    ls_sql+=" where rkph='"+rkph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rkdzt=cf.fillNull(rs.getString("rkdzt"));
	}
	rs.close();
	ps.close();

	if (!rkdzt.equals("0"))//0：未提交；1：等待审核；2：等待入库；3：已入库；4：已结算；6：等待总部审核
	{
		out.print("错误！入库单["+rkph+"]已提交，不能再修改！");
		return;
	}

	//查询最大数量
	int rkxh=0;
	ls_sql="select NVL(max(rkxh),0)+1 ";
	ls_sql+=" from  jxc_rkmx";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rkxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//写入入库明细
	ls_sql="insert into jxc_rkmx ( rkph,rkxh,clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm ,rksl,rkj,rkje,zcpsl,scrq,scph,hjbh,hwbh,ccpsl,wldssl,thpsl,bfpsl,ccpzkl,zcpfkcsl,ccpfkcsl,bfpfkcsl ) ";
	ls_sql+=" select           ?,?,jxc_cljgb.clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm,?    ,?  ,?   ,?    ,?   ,?   ,?   ,?   ,0,0,0,0,10,0,0,0 ";
	ls_sql+=" from  jxc_cljgb,jxc_clbm";
	ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
	ls_sql+=" and  jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,rkph);
	ps.setInt(2,rkxh);
	ps.setDouble(3,rksl);
	ps.setDouble(4,rkj);
	ps.setDouble(5,rkje);
	ps.setDouble(6,rksl);
	ps.setDate(7,scrq);
	ps.setString(8,scph);
	ps.setString(9,hjbh);
	ps.setString(10,hwbh);
	ps.executeUpdate();
	ps.close();

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
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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