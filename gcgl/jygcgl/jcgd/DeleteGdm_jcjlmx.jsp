<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String xmbm=request.getParameter("xmbm");
String jcjlh=request.getParameter("jcjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String cfspbz=null;
	ls_sql="select cfspbz";
	ls_sql+=" from  gdm_gdjcjl";
	ls_sql+=" where jcjlh='"+jcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cfspbz=rs.getString("cfspbz");
	}
	rs.close();
	ps.close();
	if (!cfspbz.equals("1") && !cfspbz.equals("2"))//1：不需审批；2：未审批；3：审批通过；4：审批未通过
	{
		out.println("存盘失败！该施工队检查记录已审批");
		return;
	}

	
	conn.setAutoCommit(false);

	ls_sql="delete from gdm_jcjlmx ";
	ls_sql+=" where jcjlh='"+jcjlh+"' and xmbm='"+xmbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	int allkf=0;
	double allfk=0;
	ls_sql="select sum((ygkf+sgdkf)*wzcs),sum((ygfkje+sgdfkje)*wzcs)";
	ls_sql+=" from  gdm_jcjlmx";
	ls_sql+=" where jcjlh='"+jcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allkf=rs.getInt(1);
		allfk=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	if (allkf>0 || allfk>0)
	{
		cfspbz="2";//1：不需审批；2：未审批；3：审批通过；4：审批未通过
	}
	else{
		cfspbz="1";
	}

	ls_sql="update gdm_gdjcjl set fkze="+allfk+",kfzs="+allkf+",cfspbz='"+cfspbz+"'";
	ls_sql+=" where  jcjlh='"+jcjlh+"'";
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