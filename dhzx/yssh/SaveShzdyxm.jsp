<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String[] xmbh=request.getParameterValues("xmbh");
String[] cbjStr=request.getParameterValues("cbj");
String[] sgcbjStr=request.getParameterValues("sgcbj");
String[] sgdbjStr=request.getParameterValues("sgdbj");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
	}
	rs.close();
	ps.close();
	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1：未完成；2：完成；3：业绩结转
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("错误！客户已签单，不能再修改报价");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("错误！客户签单失败，不能再修改报价");
		return;
	}


	conn.setAutoCommit(false);


	
	for (int i=0;i<xmbh.length ;i++ )
	{
		double cbj=0;
		try{
			cbj=java.lang.Double.parseDouble(cbjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！项目编号["+xmbh[i]+"]的[成本价]输入不正确:"+cbjStr[i].trim());
			return;
		}
		double sgcbj=0;
		try{
			sgcbj=java.lang.Double.parseDouble(sgcbjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！项目编号["+xmbh[i]+"]的[施工成本价]输入不正确:"+sgcbjStr[i].trim());
			return;
		}
		double sgdbj=0;
		try{
			sgdbj=java.lang.Double.parseDouble(sgdbjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！项目编号["+xmbh[i]+"]的[工程基础报价]输入不正确:"+sgdbjStr[i].trim());
			return;
		}

		ls_sql="update bj_bjxmmx set cbenj="+cbj+",sgcbj="+sgcbj+",sgdbj="+sgdbj;
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh[i]+"'";
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