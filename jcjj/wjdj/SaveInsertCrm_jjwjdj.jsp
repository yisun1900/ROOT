<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jjwjr=null;
java.sql.Date jjwjsj=null;
jjwjr=cf.GB2Uni(request.getParameter("jjwjr"));
ls=request.getParameter("jjwjsj");
try{
	if (!(ls.equals("")))  jjwjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jjwjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int zcsl=0;
int jjsl=0;
int mmsl=0;
int cgsl=0;
int js=0;

try {
	conn=cf.getConnection();

	//检查是否允许完结
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jc_mmydd ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt not in('20','98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mmsl=rs.getInt(1);
		js+=mmsl;
	}
	rs.close();
	ps.close();
	if (mmsl>0)
	{
		out.println("<BR>！错误，木门订单必须处于：『单项完结、取消预订单、退单』三个状态，有【"+mmsl+"】个订单不符合要求");
	}

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jc_cgdd ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt not in('35','98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cgsl=rs.getInt(1);
		js+=cgsl;
	}
	rs.close();
	ps.close();
	if (cgsl>0)
	{
		out.println("<BR>！错误，橱柜订单必须处于：『单项完结、取消预订单、退单』三个状态，有【"+cgsl+"】个订单不符合要求");
	}

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jc_jjdd ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt not in('35','98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jjsl=rs.getInt(1);
		js+=jjsl;
	}
	rs.close();
	ps.close();
	if (jjsl>0)
	{
		out.println("<BR>！错误，家具订单必须处于：『单项完结、取消预订单、退单』三个状态，有【"+jjsl+"】个订单不符合要求");
	}

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jc_zcdd ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt not in('30','98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsl=rs.getInt(1);
		js+=zcsl;
	}
	rs.close();
	ps.close();
	if (zcsl>0)
	{
		out.println("<BR>！错误，主材订单必须处于：『单项完结、取消预订单、退单』三个状态，有【"+zcsl+"】个订单不符合要求");
	}

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jc_zczjx ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt not in('30','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsl=rs.getInt(1);
		js+=zcsl;
	}
	rs.close();
	ps.close();
	if (zcsl>0)
	{
		out.println("<BR>！错误，主材增减项必须处于：『单项完结、退单』2个状态，有【"+zcsl+"】个订单不符合要求");
	}

	if (js>0)
	{
		out.println("<P>！！！错误，只有所有单项完结，才能做客户完结");
		return;
	}

	ls_sql="update crm_khxx set jjwjbz='Y',jjwjr=?,jjwjsj=? ";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjwjr);
	ps.setDate(2,jjwjsj);
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
	out.print("存盘失败,发生意外: " + ls_sql);
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
