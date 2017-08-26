<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String tpshr=null;
tpshr=cf.GB2Uni(request.getParameter("tpshr"));
java.sql.Date tpshsj=null;
ls=request.getParameter("tpshsj");
try{
	if (!(ls.equals("")))  tpshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tpshsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[特批审核时间]类型转换发生意外:"+e);
	return;
}
String tpsftg=cf.GB2Uni(request.getParameter("tpsftg"));
String tpsm=cf.GB2Uni(request.getParameter("tpsm"));

String jdjlh=null;
jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String clzt=null;
	String sfxtp=null;
	ls_sql=" SELECT khbh,clzt,sfxtp";
	ls_sql+=" FROM crm_xcjdjl ";
    ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		clzt=cf.fillNull(rs.getString("clzt"));
		sfxtp=cf.fillNull(rs.getString("sfxtp"));
	}
	rs.close();
	ps.close();

	if (!clzt.equals("1"))//1：申请；2：确认；3：部分确认；4：特批完成；5：发布；6：已交底
	{
		out.print("错误！已特批");
		return;
	}
	if (!sfxtp.equals("Y"))
	{
		out.print("错误！不需特批");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_xcjdjl set tpsftg=?,tpsm=?,tpshr=?,tpshsj=?,clzt='4' ";
	ls_sql+=" where  jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tpsftg);
	ps.setString(2,tpsm);
	ps.setString(3,tpshr);
	ps.setDate(4,tpshsj);
	ps.executeUpdate();
	ps.close();

	String setxcjdbz="";//0：未申请；1：普通申请；2：特批申请；3：确认通过；4：确认失败；5：部分确认；6：特批同意；7：特批不同意；8：发布；9：交底成功；A：交底失败；B：失败已出方案
	if (tpsftg.equals("Y"))//Y：是；N：否
	{
		setxcjdbz="6";
	}
	else{
		setxcjdbz="7";
	}

	
	ls_sql="update crm_khxx set xcjdbz='"+setxcjdbz+"' ";
	ls_sql+=" where khbh='"+khbh+"'";
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