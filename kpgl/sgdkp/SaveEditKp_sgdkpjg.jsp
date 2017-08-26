<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long kdds=0;
long kzds=0;
long kxds=0;
long tsjcdd=0;
long tsjczd=0;
long tsjcxd=0;
ls=request.getParameter("kdds");
try{
	if (!(ls.equals("")))  kdds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kdds不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[重大投诉扣大单]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kzds");
try{
	if (!(ls.equals("")))  kzds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kzds不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[重大投诉扣中单]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kxds");
try{
	if (!(ls.equals("")))  kxds=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kxds不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[重大投诉扣小单]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tsjcdd");
try{
	if (!(ls.equals("")))  tsjcdd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tsjcdd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[特殊奖励或处罚大单]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tsjczd");
try{
	if (!(ls.equals("")))  tsjczd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tsjczd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[特殊奖励或处罚中单]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tsjcxd");
try{
	if (!(ls.equals("")))  tsjcxd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tsjcxd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[特殊奖励或处罚小单]类型转换发生意外:"+e);
	return;
}
String kpjlh=null;
String sgd=null;
kpjlh=cf.GB2Uni(request.getParameter("kpjlh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int ddpjz=0;
	int zdpjz=0;
	int xdpjz=0;
	//单额平均值
	ls_sql=" select depjz";
	ls_sql+=" from  kp_deflbm";
	ls_sql+=" where deflbm='1'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ddpjz=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql=" select depjz";
	ls_sql+=" from  kp_deflbm";
	ls_sql+=" where deflbm='2'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zdpjz=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql=" select depjz";
	ls_sql+=" from  kp_deflbm";
	ls_sql+=" where deflbm='3'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xdpjz=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	
	ls_sql="update kp_sgdkpjg set kdds=?,kzds=?,kxds=?,tsjcdd=?,tsjczd=?,tsjcxd=? ";
	ls_sql+=" where  (kpjlh="+kpjlh+") and  (sgd='"+sgd+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,kdds);
	ps.setLong(2,kzds);
	ps.setLong(3,kxds);
	ps.setLong(4,tsjcdd);
	ps.setLong(5,tsjczd);
	ps.setLong(6,tsjcxd);
	ps.executeUpdate();
	ps.close();


	//可接大单数=大单标准数，大单奖励数=0，重大投诉扣大单=0，特殊奖励或处罚大单=0
	ls_sql="update kp_sgdkpjg set kjdds=ddbzs+ddjls-kdds+tsjcdd,kjzds=zdbzs+zdjls-kzds+tsjczd,kjxds=xdbzs+xdjls-kxds+tsjcxd";
	ls_sql+=" where  (kpjlh="+kpjlh+") and  (sgd='"+sgd+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//下周期可接单总数/下周期可接单总额
	ls_sql="update kp_sgdkpjg set kjdzs=kjdds+kjzds+kjxds,kjdze=kjdds*"+ddpjz+"+kjzds*"+zdpjz+"+kjxds*"+xdpjz;
	ls_sql+=" where  (kpjlh="+kpjlh+") and  (sgd='"+sgd+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
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
	out.print("Exception: " +ls_sql);
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