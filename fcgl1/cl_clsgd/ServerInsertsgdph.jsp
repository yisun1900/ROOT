<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
//==================================查询最大申购批号=======================================================
String ls=null;
String lrr=null;
String dwbh=null;
java.sql.Date lrsj=null;

lrr=cf.GB2Uni(request.getParameter("lrr"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));

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

String sgph=cf.GB2Uni(request.getParameter("sgph"));
String bz=cf.GB2Uni(request.getParameter("bz"));

String psfs=null;
java.sql.Date jhshsj=null;
psfs=cf.GB2Uni(request.getParameter("psfs"));
ls=request.getParameter("jhshsj");
try{
	if (!(ls.equals("")))  jhshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划送货时间]类型转换发生意外:"+e);
	return;
}


String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
//=====================================将申购批号写入数据库======================================================
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql=" update cl_jgmx set cj=xcj,cjjsj=xcjjsj,fgsdj=xfgsdj,gdj=xgdj,sfycx=xsfycx,cxkssj=xcxkssj,cxjzsj=xcxjzsj,cxcj=xcxcj,cxcjjsj=xcxcjjsj,cxfgsdj=xcxfgsdj,cxgdj=xcxgdj    ,xjgsfgx='2',xjgsxsj=null,xcj=null,xcjjsj=null,xfgsdj=null,xgdj=null,xsfycx=null,xcxkssj=null,xcxjzsj=null,xcxcj=null,xcxcjjsj=null,xcxfgsdj=null,xcxgdj=null";
	ls_sql+=" where dwbh='"+dwbh+"' and xjgsxsj<=SYSDATE";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into cl_clsgd ( sgph,dwbh,lrr,lrsj,bz,sgzsl,shzsl,sgzt,psfs,jhshsj ) ";
	ls_sql+=" values (?,?,?,?,?,0,0,'1',?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sgph);
	ps.setString(2,dwbh);
	ps.setString(3,lrr);
	ps.setDate(4,lrsj);
	ps.setString(5,bz);
	ps.setString(6,psfs);
	ps.setDate(7,jhshsj);
	ps.executeUpdate();
	ps.close();

	conn.commit();
		
	%>
	<SCRIPT language=javascript >
		alert("存盘成功,请选择材料!!!");
		window.close();
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
