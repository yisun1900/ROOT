<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jjfa=null;
String sjcfar=null;
java.sql.Date sjcfasj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;

jjfa=cf.GB2Uni(request.getParameter("jjfa"));
sjcfar=cf.GB2Uni(request.getParameter("sjcfar"));
ls=request.getParameter("sjcfasj");
try{
	if (!(ls.equals("")))  sjcfasj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjcfasj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际出方案时间]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));

java.sql.Date jhjjsj=null;
ls=request.getParameter("jhjjsj");
try{
	if (!(ls.equals("")))  jhjjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhjjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划解决时间]类型转换发生意外:"+e);
	return;
}

String sfpfkh=request.getParameter("sfpfkh");
String sfnbcf=request.getParameter("sfnbcf");

double khpfze=0;
ls=request.getParameter("khpfze");
try{
	if (!(ls.equals("")))  khpfze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量khpfze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户赔付总额]类型转换发生意外:"+e);
	return;
}
double nbcfze=0;
ls=request.getParameter("nbcfze");
try{
	if (!(ls.equals("")))  nbcfze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量nbcfze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[内部处罚总额]类型转换发生意外:"+e);
	return;
}
String clzt=cf.GB2Uni(request.getParameter("clzt"));

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
String cfajlh=cf.GB2Uni(request.getParameter("cfajlh"));
String dwbh=request.getParameter("dwbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String yddclzt="";
	ls_sql="select clzt";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yddclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	String ycfajlh="";
	String getclzt="";
	ls_sql="select clzt,cfajlh";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
		ycfajlh=cf.fillNull(rs.getString("cfajlh"));
	}
	rs.close();
	ps.close();

	if ( !getclzt.equals("2") && !getclzt.equals("6") && !getclzt.equals("A"))//1：未接收；2：已接收等待出方案；4：已接收等待出现场；6：已出现场等待出方案；7：已出方案等待审核；8：已出方案不需审核；9：方案审核通过；A：方案审核未通过；3：已解决；B:回访未解决；5：结案
	{
		out.println("错误！处理状态不正确");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="insert into crm_tsbxfajl ( cfajlh,tsjlh,tsyybm,dwbh,jjfa,sjcfar,sjcfasj,jhjjsj,sfpfkh,khpfze,sfnbcf,nbcfze,lrr,lrsj,lrbm,yddclzt,yzrbmclzt,ycfajlh,clzt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'1') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cfajlh);
	ps.setString(2,tsjlh);
	ps.setString(3,tsyybm);
	ps.setString(4,dwbh);
	ps.setString(5,jjfa);
	ps.setString(6,sjcfar);
	ps.setDate(7,sjcfasj);
	ps.setDate(8,jhjjsj);
	ps.setString(9,sfpfkh);
	ps.setDouble(10,khpfze);
	ps.setString(11,sfnbcf);
	ps.setDouble(12,nbcfze);
	ps.setString(13,lrr);
	ps.setDate(14,lrsj);
	ps.setString(15,lrbm);
	ps.setString(16,yddclzt);
	ps.setString(17,getclzt);
	ps.setString(18,ycfajlh);
	ps.executeUpdate();
	ps.close();


	String ddclzt="";
	if (clzt.equals("7"))//7：已出方案等待审核；8：已出方案不需审核
	{
		ddclzt="6";//6：已出方案
	}
	else{
		ddclzt="7";//7：方案审核通过
	}

	ls_sql="update crm_tsjl set clzt=?,zrbmclzt=?";//0：未受理；1：已受理；4：已接收；5：已出现场；6：已出方案；7：方案审核通过；2：在处理；3：结案；9:不立案
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddclzt);
	ps.setString(2,clzt);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="update crm_tsbm set jjfa=?,sjcfar=?,sjcfasj=?,jhjjsj=?,sfpfkh=?,khpfze=?,sfnbcf=?,nbcfze=?,clzt=?,cfajlh=?";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjfa);
	ps.setString(2,sjcfar);
	ps.setDate(3,sjcfasj);
	ps.setDate(4,jhjjsj);
	ps.setString(5,sfpfkh);
	ps.setDouble(6,khpfze);
	ps.setString(7,sfnbcf);
	ps.setDouble(8,nbcfze);
	ps.setString(9,clzt);
	ps.setString(10,cfajlh);
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>