<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;

//=====================================将出库批号写入数据库======================================================
String czxh=cf.GB2Uni(request.getParameter("czxh"));
String zfyy=cf.GB2Uni(request.getParameter("zfyy"));

String ls=null;
String zflrr=null;
java.sql.Date zflrsj=null;
double sjje=0;
double oldsjje=0;

String khbh=null;
String cldlmc=null;




zflrr=cf.GB2Uni(request.getParameter("zflrr"));
ls=request.getParameter("zflrsj");
try{
	if (!(ls.equals("")))  zflrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zflrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[作废录入时间]类型转换发生意外:"+e);
	return;
}

String shzt="";

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="select  khbh,cl_djjmx.cldlmc cldlmc,cl_djjmx.sjje sjje";
	ls_sql+=" from  cl_djjmx,cl_djj";
	ls_sql+=" where cl_djjmx.czxh='"+czxh+"' and cl_djj.czxh=cl_djjmx.czxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		sjje=rs.getDouble("sjje");

		ls_sql="select sjje";
		ls_sql+=" from  cl_djjflmx";
		ls_sql+=" where khbh='"+khbh+"' and cldlmc='"+cldlmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			oldsjje=rs1.getDouble("sjje");
			oldsjje-=sjje;

			ls_sql="update cl_djjflmx set sjje='"+oldsjje+"' ";
			ls_sql+=" where khbh='"+khbh+"' and cldlmc='"+cldlmc+"'";
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();


		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();

	ls_sql="update cl_djj set zflrr=?,zflrsj=?,zfyy=?,czzt='8'";
	ls_sql+=" where  (czxh='"+czxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zflrr);
	ps.setDate(2,zflrsj);
	ps.setString(3,zfyy);
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>