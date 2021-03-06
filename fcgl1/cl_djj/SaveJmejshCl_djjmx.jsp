<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String czxh=request.getParameter("czxh");
String khbh=request.getParameter("khbh");
String shjl=cf.GB2Uni(request.getParameter("shjl"));
String shyj=cf.GB2Uni(request.getParameter("shyj"));
String[] clbm=request.getParameterValues("clbm");
String[] cldlmc=request.getParameterValues("cldlmc");
String[] sjsl=request.getParameterValues("sjsl");

double ckje=0;
double sjckdj=0;
double sjcksl=0;
double sumcksl=0;
double sumckje=0;
double khqybfb=0;
String sfjm="0";
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
/***********************************************************\
|		修改材料申请领取数量										|
\***********************************************************/
	for (int i=0;i<clbm.length ; i++)
	{
		sjcksl = Double.parseDouble(sjsl[i]);


/*******************************************************\
|		更新申请领取数量，金额，初始化审核数量，金额与出库相同		|
\*******************************************************/
		ls_sql="update cl_djjmx set sjsl="+sjcksl+",sjje=gdj*"+sjcksl;
		ls_sql+=" where czxh='"+czxh+"' and clbm='"+cf.GB2Uni(clbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	/************************************************************
	|		查询代金券金额									|
	*************************************************************/
		ls_sql=" SELECT sum(cl_djjmx.sjje) ";
		ls_sql+=" FROM cl_djjmx,cl_djj ";
		ls_sql+=" where cl_djjmx.czxh=cl_djj.czxh and cl_djj.khbh='"+khbh+"' and cl_djjmx.cldlmc='"+cf.GB2Uni(cldlmc[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			sumckje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

	/************************************************************
	|		更新代金券分类明细								|
	*************************************************************/
		ls_sql="update cl_djjflmx set sjje="+sumckje;
		ls_sql+=" where khbh='"+khbh+"' and cldlmc='"+cf.GB2Uni(cldlmc[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql=" SELECT sum(sjsl),sum(sjje) ";
	ls_sql+=" FROM cl_djjmx ";
    ls_sql+=" where czxh='"+czxh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sumcksl=rs.getDouble(1);
		sumckje=rs.getDouble(2);
	}
	rs.close();
	ps.close();


	ls_sql="update cl_djj set shzt='3',ejshr='"+yhmc+"',ejshjl='"+shjl+"',ejshyj='"+shyj+"',ejshsj=sysdate,sjsl="+sumcksl+",sjje="+sumckje;
	ls_sql+=" where czxh='"+czxh+"' ";
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>