<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long xuhao=0;
String kmdm=null;
String kmmc=null;
String yefx=null;
String fklxbm=null;
String jdbz=null;
String fgsbh=null;
ls=request.getParameter("xuhao");
try{
	if (!(ls.equals("")))  xuhao=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xuhao不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[序号]类型转换发生意外:"+e);
	return;
}
kmdm=cf.GB2Uni(request.getParameter("kmdm"));
kmmc=cf.GB2Uni(request.getParameter("kmmc"));
yefx=cf.GB2Uni(request.getParameter("yefx"));
fklxbm=cf.GB2Uni(request.getParameter("fklxbm"));
jdbz=cf.GB2Uni(request.getParameter("jdbz"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String cwdm=cf.GB2Uni(request.getParameter("cwdm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String ls_sql=null;
try {
	conn=cf.getConnection();

	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	String gysbh=null;

	if (!cwdm.equals(""))
	{
		ls_sql="select gys";
		ls_sql+=" from  sq_gysxx";
		ls_sql+=" where cwdm='"+cwdm+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gysbh=cf.fillNull(rs.getString("gys"));
		}
		else{
			out.println("错误！未找到供应商");
			return;
		}
		rs.close();
		ps.close();
	}

	ls_sql="insert into cw_jckmdm ( xuhao,kmdm,kmmc,yefx,fklxbm,gysbh,jdbz,fgsbh,cwdm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xuhao);
	ps.setString(2,kmdm);
	ps.setString(3,kmmc);
	ps.setString(4,yefx);
	ps.setString(5,fklxbm);
	ps.setString(6,gysbh);
	ps.setString(7,jdbz);
	ps.setString(8,fgsbh);
	ps.setString(9,cwdm);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>