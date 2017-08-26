<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String shsm=null;
String shr=null;
java.sql.Date shsj=null;


shsm=cf.GB2Uni(request.getParameter("shsm"));
shr=cf.GB2Uni(request.getParameter("shr"));
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核时间]类型转换发生意外:"+e);
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

String shjl=request.getParameter("shjl");



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



	String getclzt="";
	ls_sql="select clzt";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if ( !getclzt.equals("9") && !getclzt.equals("A"))//1：未接收；2：已接收等待出方案；4：已接收等待出现场；6：已出现场等待出方案；7：已出方案等待审核；8：已出方案不需审核；9：方案审核通过；A：方案审核未通过；3：已解决；B:回访未解决；5：结案
	{
		out.println("错误！处理状态不正确");
		return;
	}

	conn.setAutoCommit(false);

	String clzt="";
	if (shjl.equals("Y"))
	{
		clzt="9";//9：方案审核通过
	}
	else {
		clzt="A";//A：方案审核未通过
	}

	ls_sql="update crm_tsbxfajl set shsm=?,shr=?,shsj=?,shjl=?,sfpfkh=?,khpfze=?,sfnbcf=?,nbcfze=?  ";
	ls_sql+=" where cfajlh='"+cfajlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shsm);
	ps.setString(2,shr);
	ps.setDate(3,shsj);
	ps.setString(4,shjl);
	ps.setString(5,sfpfkh);
	ps.setDouble(6,khpfze);
	ps.setString(7,sfnbcf);
	ps.setDouble(8,nbcfze);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="update crm_tsbm set shsm=?,shr=?,shsj=?,clzt=?,sfpfkh=?,khpfze=?,sfnbcf=?,nbcfze=? ";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shsm);
	ps.setString(2,shr);
	ps.setDate(3,shsj);
	ps.setString(4,clzt);
	ps.setString(5,sfpfkh);
	ps.setDouble(6,khpfze);
	ps.setString(7,sfnbcf);
	ps.setDouble(8,nbcfze);
	ps.executeUpdate();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and sfpfkh='2'";
	ls_sql+=" and clzt in('9','3','B','C','5')";
	//1：未接收；2：已接收等待出方案；4：已接收等待出现场；D：已接收不需出方案；6：已出现场等待方案；7：已出方案等待审核；8：已出方案不需审核；
	//9：方案审核通过；A：方案审核未通过；3：已解决；B：在处理；C：回访未解决；5：结案
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	String ddsfpfkh="";
	if (count>0)
	{
		ddsfpfkh="2";//1：不需赔付；2：发生赔付；3：录入赔付；4：已赔付
	}
	else{
		ddsfpfkh="1";
	}

	count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and sfnbcf='2'";
	ls_sql+=" and clzt in('9','3','B','C','5')";
	//1：未接收；2：已接收等待出方案；4：已接收等待出现场；D：已接收不需出方案；6：已出现场等待方案；7：已出方案等待审核；8：已出方案不需审核；
	//9：方案审核通过；A：方案审核未通过；3：已解决；B：在处理；C：回访未解决；5：结案
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	String ddsfnbcf="";
	if (count>0)
	{
		ddsfnbcf="2";//1：不需处罚；2：发生处罚；3：录入处罚；4：已已罚
	}
	else{
		ddsfnbcf="1";
	}

	ls_sql="update crm_tsjl set zrbmclzt=?,sfpfkh=?,sfnbcf=?";//0：未受理；1：已受理；4：已接收；5：已出现场；6：已出方案；7：方案审核通过；2：在处理；3：结案；9:不立案
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clzt);
	ps.setString(2,ddsfpfkh);
	ps.setString(3,ddsfnbcf);
	ps.executeUpdate();
	ps.close();

	if (shjl.equals("Y"))
	{
		ls_sql="update crm_tsjl set clzt='7' ";//7：方案审核通过
		ls_sql+=" where tsjlh='"+tsjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update crm_tsjl set clzt='6' ";//6：已出方案
		ls_sql+=" where tsjlh='"+tsjlh+"'";
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