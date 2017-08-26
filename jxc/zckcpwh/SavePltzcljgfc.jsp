<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String[] clbm =request.getParameterValues("clbm");
String dqbm =request.getParameter("dqbm");

String gs = request.getParameter("gs");			//调价公式
String jgmc = request.getParameter("jgmc");		//要调整的价格名称
String xsws = request.getParameter("xsws");		//需要保留的小数位数
if (jgmc!=null)
	{
		if (jgmc.equals("")) 
		{
		out.println("请选择您要调整的价格！！！");
		return;
		}
	}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
double cpbqj=0;

try {
	conn=cf.getConnection();    //得到连接

	conn.setAutoCommit(false);
//=======================================根据所选条件更新标签价=======================================
	for (int i=0;i<clbm.length ;i++ )
	{
		ls_sql = " update jxc_cljgb set "+jgmc+"=ROUND("+gs+","+xsws+"),lrr='"+yhmc+"',lrbm='"+lrbm+"',ssfgs='"+ssfgs+"',lrsj=SYSDATE ";
		ls_sql+= " where dqbm='"+dqbm+"' and clbm='"+clbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
