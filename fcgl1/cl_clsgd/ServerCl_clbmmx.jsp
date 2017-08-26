<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String sgph=cf.GB2Uni(request.getParameter("sgph"));
String clbm=cf.GB2Uni(request.getParameter("clbm"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
double sgsl = 0;
String ls=request.getParameter("sgsl");
try{
	if (!(ls.equals("")))  sgsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申购数量]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clmc=null;
	String clgg=null;
	String cldlmc=null;
	String jldwmc=null;
	double cj=0;
	double cjjsj=0;
	double fgsdj=0;
	double gdj=0;

	ls_sql=" SELECT clmc,clgg,cldlmc,jldwmc,cj,cjjsj,fgsdj,gdj ";
	ls_sql+=" FROM cl_clbm,cl_jgmx ";
    ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm and cl_jgmx.dwbh='"+dwbh+"' and cl_jgmx.clbm='"+clbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		cj=rs.getDouble("cj");
		cjjsj=rs.getDouble("cjjsj");
		fgsdj=rs.getDouble("fgsdj");
		gdj=rs.getDouble("gdj");
	}
	rs.close();
	ps.close();

/********************************************************************************
|					查询该辅材是否被申购											|
********************************************************************************/
	ls_sql=" SELECT clbm ";
	ls_sql+=" FROM cl_clsgmx ";
    ls_sql+=" where sgph='"+sgph+"' and clbm='"+clbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		out.print("本次批号中已经存在此材料的申购信息!!!");
		return;
	}
	rs.close();
	ps.close();
/********************************************************************************
|					插入申购材料													|
********************************************************************************/

	
	conn.setAutoCommit(false);
	
	ls_sql="insert into cl_clsgmx ( sgph,clbm,clmc,clgg,cldlmc,jldwmc,cj,cjjsj,fgsdj,gdj,sgsl,shsl ) ";
	ls_sql+=" values ( '"+sgph+"','"+clbm+"','"+clmc+"','"+clgg+"','"+cldlmc+"','"+jldwmc+"',"+cj+","+cjjsj+","+fgsdj+","+gdj+","+sgsl+",0 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cl_clsgd set sgzsl=sgzsl+'"+sgsl+"' ";
	ls_sql+=" where  (sgph='"+sgph+"')  ";
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