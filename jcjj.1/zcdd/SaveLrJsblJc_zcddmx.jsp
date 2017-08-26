<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
double jsbl=0;
double cbj=0;
ls=request.getParameter("jsbl");
try{
	if (!(ls.equals("")))  jsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jsbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cbj");
try{
	if (!(ls.equals("")))  cbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算价]类型转换发生意外:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");
String xh=request.getParameter("xh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String sxhtsfysh="";
	String sfjs="";
	ls_sql =" select sxhtsfysh,sfjs";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
		sfjs=cf.fillNull(rs.getString("sfjs"));
	}
	rs.close();
	ps.close();

	if (!sxhtsfysh.equals("N"))
	{
		out.println("<BR>错误，不能再进行修改！手写合同已审核");
		return;
	}

	if (!sfjs.equals("N") && !sfjs.equals("C"))//N：未结算；C：已选择结算；Y：已结算；M：结算已审核
	{
		out.println("<BR>错误，已结算不能再修改");
		return;
	}


	conn.setAutoCommit(false);
	
	ls_sql="update jc_zcddmx set jsbl=?,cbj=?";
	ls_sql+=" where xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jsbl);
	ps.setDouble(2,cbj);
	ps.executeUpdate();
	ps.close();

	//对增减项处理＋＋＋＋＋＋＋＋＋＋＋＋开始
	String getzjxbh="";
	ls_sql="select zjxbh";
	ls_sql+=" from jc_zczjx ";
	ls_sql+=" where ddbh='"+ddbh+"' and clzt!='00'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		getzjxbh=rs1.getString(1);

		ls_sql="update jc_zczjxmx ";
		ls_sql+=" set zjcbje=jc_zczjxmx.zjsl*(select jc_zcddmx.cbj from jc_zcddmx where jc_zcddmx.xh=jc_zczjxmx.xh)";
		ls_sql+=" where zjxbh='"+getzjxbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//主材增减项（jc_zczjx）:增减项总额
		double zjxcbze=0;
		ls_sql="select sum(zjcbje) ";
		ls_sql+=" from jc_zczjxmx ";
		ls_sql+=" where zjxbh='"+getzjxbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zjxcbze=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="update jc_zczjx set zjxcbze="+zjxcbze;
		ls_sql+=" where zjxbh='"+getzjxbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//集成订单
		ls_sql="update jc_jcdd set cbje="+zjxcbze;
		ls_sql+=" where  gjz='"+getzjxbh+"' and lx='4' and czlx='2'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();
	//对增减项处理＝＝＝＝＝＝＝＝＝＝＝＝结束

	double zjxcbze=0;
	ls_sql="select sum(zjxcbze)";
	ls_sql+=" from jc_zczjx ";
	ls_sql+=" where ddbh='"+ddbh+"' and clzt!='00'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxcbze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double cbze=0;
	ls_sql =" select sum(cbj*sl)";
	ls_sql+=" from jc_zcddmx";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cbze=rs.getDouble(1);
	}
	rs.close();
	ps.close();



	ls_sql="update jc_zcdd set  cbze="+cbze+",zjxcbze="+zjxcbze;
	ls_sql+=" where  ddbh='"+ddbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//集成订单
	ls_sql="update jc_jcdd set cbje="+cbze;
	ls_sql+=" where  gjz='"+ddbh+"' and lx='4' and czlx='1'";
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>