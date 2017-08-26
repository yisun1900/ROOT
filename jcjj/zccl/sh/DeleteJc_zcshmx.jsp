<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String shdbh=request.getParameter("shdbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String ddbh=null;
	ls_sql =" select ddbh";
	ls_sql+=" from jc_zcshd";
	ls_sql+=" where shdbh='"+shdbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
	}
	else{
		rs.close();
		ps.close();
		out.println("<BR>错误，送货单不存在");
		return;
	}
	rs.close();
	ps.close();

	String lsclzt="";
	String clzt="";
	String ddshbz="";
	String ddlx="";
	String khbh="";
	ls_sql =" select lsclzt,clzt,ddshbz,ddlx,khbh";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lsclzt=cf.fillNull(rs.getString("lsclzt"));
		clzt=cf.fillNull(rs.getString("clzt"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
		ddlx=cf.fillNull(rs.getString("ddlx"));
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	if (!clzt.equals("19") && !clzt.equals("20"))//19：已送货; 20：部分送货
	{
		out.println("<BR>错误，存盘失败！订单状态不正确"+clzt);
		return;
	}


	conn.setAutoCommit(false);
	
		
	ls_sql="delete from jc_zcshd  ";
	ls_sql+=" where shdbh='"+shdbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jc_zcshmx  ";
	ls_sql+=" where shdbh='"+shdbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	String xh="";
	ls_sql =" select xh";
	ls_sql+=" from jc_zcddmx";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));

		double shsl=0;

		ls_sql =" select sum(shsl)";
		ls_sql+=" from jc_zcshmx";
		ls_sql+=" where ddbh='"+ddbh+"' and xh="+xh;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			shsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		ls_sql="update jc_zcddmx set shsl="+shsl;
		ls_sql+=" where ddbh='"+ddbh+"' and xh="+xh;
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

//		out.println(ls_sql);

	}
	rs.close();
	ps.close();

	double getsl=0;
	double getshsl=0;
	ls_sql =" select sum(sl),sum(shsl)";
	ls_sql+=" from jc_zcddmx";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" and lx='1'";//1：合同项；2：增项 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getsl=rs.getDouble(1);
		getshsl=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	String setclzt="";
	if (getshsl==0)
	{
		setclzt=lsclzt;
	}
	else if (getshsl==getsl)
	{
		setclzt="19";//19：已送货
	}
	else{
		setclzt="20";//20：部分送货
	}


	ls_sql="update jc_zcdd set clzt='"+setclzt+"'";
	ls_sql+=" where ddbh='"+ddbh+"'";
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>