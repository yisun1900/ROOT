<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

//=====================================将出库批号写入数据库======================================================
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String czxh=cf.GB2Uni(request.getParameter("czxh"));
String bz=cf.GB2Uni(request.getParameter("bz"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String qye=cf.GB2Uni(request.getParameter("qye"));

String ls=null;
String lrr=null;
java.sql.Date lrsj=null;

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

String shzt="";

try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  cl_djjflmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	ls_sql=" update cl_jgmx set cj=xcj,cjjsj=xcjjsj,fgsdj=xfgsdj,gdj=xgdj,sfycx=xsfycx,cxkssj=xcxkssj,cxjzsj=xcxjzsj,cxcj=xcxcj,cxcjjsj=xcxcjjsj,cxfgsdj=xcxfgsdj,cxgdj=xcxgdj    ,xjgsfgx='2',xjgsxsj=null,xcj=null,xcjjsj=null,xfgsdj=null,xgdj=null,xsfycx=null,xcxkssj=null,xcxjzsj=null,xcxcj=null,xcxcjjsj=null,xcxfgsdj=null,xcxgdj=null";
	ls_sql+=" where dwbh='"+dwbh+"' and xjgsxsj<=SYSDATE";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (count==0)
	{
		ls_sql="insert into cl_djjflmx ( khbh,cldlmc,qybfb,ylqje,sqlqje,sjje) ";
		ls_sql+=" select ?,cldlmc,qybfb,"+qye+"*qybfb/100.0,0,0 ";
		ls_sql+=" from cl_cldlbm ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.executeUpdate();
		ps.close();
	}

	double ylqze=0;
	ls_sql="select sum(ylqje)";
	ls_sql+=" from  cl_djjflmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ylqze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="insert into cl_djj ( czxh,khbh,qye,sfjm,shzt,lrr,lrsj,dwbh,czzt,bz,sqlqsl,sqlqje,sjsl,sjje,ylqze ) ";
	ls_sql+=" values ( ?,?,'"+qye+"',?,?,?,?,?,'1',?,0,0,0,0,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,czxh);
	ps.setString(2,khbh);
	ps.setString(3,"1");
	ps.setString(4,shzt);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,dwbh);
	ps.setString(8,bz);
	ps.setDouble(9,ylqze);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("保存成功！");
	window.close();
	//-->
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
