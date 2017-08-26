<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date tglrsj=null;
String tglrr=null;
String tgyybm=null;

ls=request.getParameter("tglrsj");
try{
	if (!(ls.equals("")))  tglrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tglrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[停工申请时间]类型转换发生意外:"+e);
	return;
}
tglrr=cf.GB2Uni(request.getParameter("tglrr"));
tgyybm=cf.GB2Uni(request.getParameter("tgyybm"));
java.sql.Date tgkssj=null;
java.sql.Date gjfgsj=null;
ls=request.getParameter("tgkssj");
try{
	if (!(ls.equals("")))  tgkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tgkssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[停工开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gjfgsj");
try{
	if (!(ls.equals("")))  gjfgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gjfgsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[估计复工日期]类型转换发生意外:"+e);
	return;
}

String djbh=cf.GB2Uni(request.getParameter("djbh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String zt=null;
	String tgshjg=null;
	ls_sql=" select zt,tgshjg";
	ls_sql+=" from  crm_tggl";
	ls_sql+=" where  djbh='"+djbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
		tgshjg=cf.fillNull(rs.getString("tgshjg"));
	}
	rs.close();
	ps.close();

	if (!zt.equals("7"))
	{
		out.println("<BR>！！！错误，停工状态不正确");
		return;
	}
	if (!tgshjg.equals("Y"))
	{
		out.println("<BR>！！！错误，停工审批未通过");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_tggl set tglrsj=?,tglrr=?,tgyybm=?,tgkssj=?,gjfgsj=? ";
	ls_sql+=" where  djbh='"+djbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,tglrsj);
	ps.setString(2,tglrr);
	ps.setString(3,tgyybm);
	ps.setDate(4,tgkssj);
	ps.setDate(5,gjfgsj);
	ps.executeUpdate();
	ps.close();

		
	ls_sql="update crm_khxx set tgbz='Y',tgkssj=?,gjfgsj=?,tgyybm=?";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,tgkssj);
	ps.setDate(2,gjfgsj);
	ps.setString(3,tgyybm);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>