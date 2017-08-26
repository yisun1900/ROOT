<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getclzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!getclzt.equals("2") && !getclzt.equals("4") && !getclzt.equals("6") && !getclzt.equals("7"))//1：未接收；2：接收后直接出方案不需审核；4：接收后直接出方案需审核；6：已接收等待出方案；7：等待出现场后出方案；8：已出现场方案不需审核；9：已出现场方案需审核；3：已解决；5：结案
	{
		out.println("错误！状态不正确");
		return;
	}

	conn.setAutoCommit(false);


	ls_sql="update crm_tsjl set clzt='1'";//0：未受理；1：已受理；2：在处理；3：结案；9:不立案
	ls_sql+=" where tsjlh='"+tsjlh+"' and clzt='2'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//1：未接收；2：接收后直接出方案不需审核；4：接收后直接出方案需审核；6：已接收等待出方案；7：等待出现场后出方案；8：已出现场方案不需审核；9：已出现场方案需审核；3：已解决；5：结案
	ls_sql="update crm_tsbm set clzt='1',jsr=null,jssj=null,jssm=null,jhcfasj=null,sjcfasj=null,jhjjsj=null,fashbm=null,fashr=null,jjfa=null";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_tsjl set zrbmclzt='1'";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
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

