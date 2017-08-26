<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String chooseitem=request.getParameter("chooseitem");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	String khbh=null;
	String cpflbm=null;
	String cpztbm=null;
	String ycpztbm=null;
	java.sql.Date yztfssj=null;
	ls_sql=" SELECT khbh,cpflbm,cpztbm,ycpztbm,yztfssj";
	ls_sql+=" from crm_cpztgzjl";
	ls_sql+=" where "+chooseitem;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		cpflbm=cf.fillNull(rs.getString("cpflbm"));
		cpztbm=cf.fillNull(rs.getString("cpztbm"));
		ycpztbm=cf.fillNull(rs.getString("ycpztbm"));
		yztfssj=rs.getDate("yztfssj");

		String getcpztbm=null;
		java.sql.Date getztfssj=null;
		ls_sql=" SELECT cpztbm,ztfssj";
		ls_sql+=" from crm_cpgzjl";
		ls_sql+=" where khbh='"+khbh+"' and cpflbm='"+cpflbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			getcpztbm=cf.fillNull(rs1.getString("cpztbm"));
			getztfssj=rs1.getDate("ztfssj");
		}
		else{
			conn.rollback();
			out.println("错误！产品信息不存在");
			return;
		}
		rs1.close();
		ps1.close();

		if (!getcpztbm.equals(cpztbm))
		{
			conn.rollback();
			out.println("错误！产品状态已改变，不能再删除");
			return;
		}


		ls_sql="update crm_cpgzjl set cpztbm=?,ztfssj=? ";
		ls_sql+=" where khbh='"+khbh+"' and cpflbm='"+cpflbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ycpztbm);
		ps.setDate(2,yztfssj);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_cpztgzjl ";
		ls_sql+=" where khbh='"+khbh+"' and cpflbm='"+cpflbm+"' and cpztbm='"+cpztbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	rs.close();
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
	out.print("<BR>存盘失败,发生意外: " + e);
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