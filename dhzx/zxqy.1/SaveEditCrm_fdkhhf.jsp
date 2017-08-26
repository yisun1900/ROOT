<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hfr=null;
java.sql.Date hfsj=null;
String hfsbyybm=null;
String hfsbkhlx=null;
String hfsbyyxs=null;
java.sql.Date hfsbsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
hfr=cf.GB2Uni(request.getParameter("hfr"));
ls=request.getParameter("hfsj");
try{
	if (!(ls.equals("")))  hfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hfsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[回访时间]类型转换发生意外:"+e);
	return;
}
hfsbyybm=cf.GB2Uni(request.getParameter("hfsbyybm"));
hfsbkhlx=cf.GB2Uni(request.getParameter("hfsbkhlx"));
hfsbyyxs=cf.GB2Uni(request.getParameter("hfsbyyxs"));
ls=request.getParameter("hfsbsj");
try{
	if (!(ls.equals("")))  hfsbsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hfsbsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[回访飞单时间]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));

String hfjlh=request.getParameter("hfjlh");
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String hfwhkh=cf.GB2Uni(request.getParameter("hfwhkh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  crm_fdkhhf";
	ls_sql+=" where hfjlh='"+hfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=cf.fillNull(rs.getString("lx"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	if (lx.equals("1"))
	{
		ls_sql="update crm_qysbdj set hfr=?,hfsj=?,hfsbyybm=?,hfsbkhlx=?,hfsbyyxs=?,hfsbsj=?,hfwhkh=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,hfr);
		ps.setDate(2,hfsj);
		ps.setString(3,hfsbyybm);
		ps.setString(4,hfsbkhlx);
		ps.setString(5,hfsbyyxs);
		ps.setDate(6,hfsbsj);
		ps.setString(7,hfwhkh);
		ps.executeUpdate();
		ps.close();

		String setzxzt="";
		if (hfwhkh.equals("Y"))//Y：挽回；N：否
		{
			setzxzt="5";//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
		}
		else{
			setzxzt="4";//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
		}

		ls_sql="update crm_zxkhxx set zxzt='"+setzxzt+"',hfwhkh='"+hfwhkh+"'";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (lx.equals("2"))
	{
		ls_sql="update crm_qysbdj set sjhfr=?,sjhfsj=?,sjhfsbyybm=?,sjhfsbkhlx=?,sjhfsbyyxs=?,sjhfsbsj=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,hfr);
		ps.setDate(2,hfsj);
		ps.setString(3,hfsbyybm);
		ps.setString(4,hfsbkhlx);
		ps.setString(5,hfsbyyxs);
		ps.setDate(6,hfsbsj);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update crm_qysbdj set xxrhfr=?,xxrhfsj=?,xxrhfsbyybm=?,xxrhfsbkhlx=?,xxrhfsbyyxs=?,xxrhfsbsj=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,hfr);
		ps.setDate(2,hfsj);
		ps.setString(3,hfsbyybm);
		ps.setString(4,hfsbkhlx);
		ps.setString(5,hfsbyyxs);
		ps.setDate(6,hfsbsj);
		ps.executeUpdate();
		ps.close();
	}
	
	ls_sql="update crm_fdkhhf set hfr=?,hfsj=?,hfsbyybm=?,hfsbkhlx=?,hfsbyyxs=?,hfsbsj=?,lrr=?,lrsj=?,lrbm=?,hfwhkh=? ";
	ls_sql+=" where hfjlh='"+hfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hfr);
	ps.setDate(2,hfsj);
	ps.setString(3,hfsbyybm);
	ps.setString(4,hfsbkhlx);
	ps.setString(5,hfsbyyxs);
	ps.setDate(6,hfsbsj);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.setString(10,hfwhkh);
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
	out.print("<BR>出错:" + e);
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