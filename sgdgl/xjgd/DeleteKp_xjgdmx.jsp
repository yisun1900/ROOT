<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xjjlh=request.getParameter("xjjlh");
String kpxmbm=cf.GB2Uni(request.getParameter("kpxmbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String cfspbz=null;
	ls_sql="select cfspbz";
	ls_sql+=" from  kp_xjgdjl";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cfspbz=rs.getString("cfspbz");
	}
	else{
		out.println("删除失败！检查记录不存在");
		return;
	}
	rs.close();
	ps.close();

	if (!cfspbz.equals("1") && !cfspbz.equals("2"))//1：不需审批；2：未审批；3：审批通过；4：审批未通过
	{
		out.println("删除失败！该检查记录已审批");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="delete from kp_xjgdmx  ";
	ls_sql+=" where xjjlh='"+xjjlh+"' and kpxmbm='"+kpxmbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	double allkf=0;
	double allsgdfk=0;
	double allkcjdebl=0;
	ls_sql="select sum(kf*wzcs),sum(sgdfk*wzcs),sum(kcjdebl*wzcs)";
	ls_sql+=" from  kp_xjgdmx";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allkf=rs.getDouble(1);
		allsgdfk=rs.getDouble(2);
		allkcjdebl=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	if (allsgdfk>0 || allkcjdebl>0)
	{
		cfspbz="2";//1：无处罚；2：未审批；3：审批通过；4：审批未通过
	}
	else{
		cfspbz="1";
	}

	ls_sql="update kp_xjgdjl set fkze="+allsgdfk+",kfzs="+allkf+",kcjdebl="+allkcjdebl+",cfspbz='"+cfspbz+"'";
	ls_sql+=" where  xjjlh='"+xjjlh+"'";
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
	out.print("存盘失败,发生意外: " + e);
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