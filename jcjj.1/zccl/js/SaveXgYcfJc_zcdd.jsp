<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=request.getParameter("ddbh");

double qtycf=0;
ls=request.getParameter("qtycf");
try{
	if (!(ls.equals("")))  qtycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtycf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐分解远程费]类型转换发生意外:"+e);
	return;
}



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfjs=null;
	String clzt=null;
	String khbh=null;
	double yqtycf=0;
	ls_sql =" select sfjs,clzt,khbh,qtycf";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfjs=cf.fillNull(rs.getString("sfjs"));
		clzt=rs.getString("clzt");
		khbh=rs.getString("khbh");
		yqtycf=rs.getDouble("qtycf");
	}
	rs.close();
	ps.close();

	if (sfjs.equals("Y"))
	{
		out.println("<BR>错误，订单已结算");
		return;
	}



	ls_sql="update jc_zcdd set qtycf="+qtycf+",ycf=ycf+"+(qtycf-yqtycf);
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


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
	out.print("Exception: " + e);
	return;
}
finally 
{
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
