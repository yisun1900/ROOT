<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

double gckk=0;
ls=request.getParameter("gckk");
try{
	if (!(ls.equals("")))  gckk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gckk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程扣款]类型转换发生意外:"+e);
	return;
}


String khbh=cf.GB2Uni(request.getParameter("khbh"));
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String oldgckkspbz=null;
	String newzjxxh=null;
	String gcjdbm=null;
	ls_sql="select gckkspbz,gcjdbm,zjxxh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldgckkspbz=cf.fillNull(rs.getString("gckkspbz"));//工程扣款审批标志
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));//工程进度
		newzjxxh=cf.fillNull(rs.getString("zjxxh"));
	}
	rs.close();
	ps.close();
	if (oldgckkspbz.equals("N"))//N：未审批；Y：已审批
	{
		out.println("错误！工程扣款未审批");
		return;
	}
	if (gcjdbm.equals("5"))
	{
		out.println("错误！客户已完结，不能再修改");
		return;
	}


	conn.setAutoCommit(false);

	ls_sql="update crm_zjxdj set gckk=?";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,gckk);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set gckk=?,gckkspbz='Y'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,gckk);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set khjsje=qye+NVL(zjxje,0)-NVL(gckk,0)";//客户结算金额
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("审批成功！");
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