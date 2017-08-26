<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String khbh=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));

double khjsje=0;
ls=request.getParameter("khjsje");
try{
	if (!(ls.equals("")))  khjsje=Double.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量khjsje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户结算金额]类型转换发生意外:"+e);
	return;
}



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khjsbz=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT khjsbz";
	ls_sql+=" FROM crm_khxx ";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khjsbz=cf.fillNull(rs.getString("khjsbz"));
	}
	rs.close();
	ps.close();

	if (khjsbz.equals("Y"))
	{
		out.println("<BR>！！！错误，客户已结算");
		return;
	}


	ls_sql="update crm_khxx set khjsbz='Y',khjsje=?";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,khjsje);
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
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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
