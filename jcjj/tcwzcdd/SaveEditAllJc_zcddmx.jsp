<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String[] zcysbm=request.getParameterValues("zcysbm");
String[] zcpzwzbm=request.getParameterValues("zcpzwzbm");
String[] dpzkStr=request.getParameterValues("dpzk");
String[] djStr=request.getParameterValues("dj");
String[] slStr=request.getParameterValues("sl");
String[] zqjeStr=request.getParameterValues("zqje");
String[] jeStr=request.getParameterValues("je");
String[] ycfStr=request.getParameterValues("ycf");
String[] qtfy=request.getParameterValues("qtfy");
String[] qtfyjeStr=request.getParameterValues("qtfyje");
String[] cxhdbz=request.getParameterValues("cxhdbz");
String[] cxhdblStr=request.getParameterValues("cxhdbl");
String[] cxhdjeStr=request.getParameterValues("cxhdje");
String[] bz=request.getParameterValues("bz");



String ddbh=request.getParameter("ddbh");
String[] zcbm=request.getParameterValues("zcbm");
String[] xzxh=request.getParameterValues("xzxh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql =" select clzt";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("07"))
	{
		out.println("<BR>错误，不能再进行修改！合同已完成");
		return;
	}

	conn.setAutoCommit(false);
	
	for (int i=0;i<xzxh.length ;i++ )
	{
		double sl=0;
		double dpzk=0;
		double dj=0;
		double zqje=0;
		double je=0;
		double ycf=0;
		double qtfyje=0;
		double cxhdbl=0;
		double cxhdje=0;

		sl=Double.parseDouble(slStr[i]);
		dpzk=Double.parseDouble(dpzkStr[i]);
		dj=Double.parseDouble(djStr[i]);
		zqje=Double.parseDouble(zqjeStr[i]);
		je=Double.parseDouble(jeStr[i]);
		if (!ycfStr[i].equals(""))
		{
			ycf=Double.parseDouble(ycfStr[i]);
		}
		if (!qtfyjeStr[i].equals(""))
		{
			qtfyje=Double.parseDouble(qtfyjeStr[i]);
		}
		if (!cxhdblStr[i].equals(""))
		{
			cxhdbl=Double.parseDouble(cxhdblStr[i]);
		}
		if (!cxhdjeStr[i].equals(""))
		{
			cxhdje=Double.parseDouble(cxhdjeStr[i]);
		}

		
		ls_sql="update jc_zcddmx set sl="+sl+",dpzk="+dpzk+",dj="+dj+",zqje="+zqje+",je="+je+",ycf="+ycf+",qtfy='"+qtfy[i]+"',qtfyje="+qtfyje+",cxhdbz='"+cxhdbz[i]+"',cxhdbl="+cxhdbl+",cxhdje="+cxhdje;
		ls_sql+=" ,zjhsl="+sl+",zqzjhje="+zqje+",zjhje="+je+",zjhycf="+ycf+",zjhqtfy="+qtfyje+",zjhcxhdje="+cxhdje;
		ls_sql+=" ,zcpzwzbm='"+cf.GB2Uni(zcpzwzbm[i])+"',zcysbm='"+cf.GB2Uni(zcysbm[i])+"',bz='"+cf.GB2Uni(bz[i])+"',lrr='"+yhmc+"',lrsj=SYSDATE ";
		ls_sql+=" where ddbh='"+ddbh+"' and xh="+xzxh[i];
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
	out.print("Exception: " + e);
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