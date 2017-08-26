<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String chooseitem = request.getParameter("chooseitem");
String khbh=null;
String sgd=null;
long xuhao=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="select khbh,sgd,xuhao";
	ls_sql+=" from  pd_pdjl";
	ls_sql+=" where "+chooseitem;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		khbh=cf.fillNull(rs1.getString("khbh"));
		sgd=cf.fillNull(rs1.getString("sgd"));
		xuhao=rs1.getLong("xuhao");

		long maxxuhao=0;
		ls_sql="select max(xuhao)";
		ls_sql+=" from  pd_pdjl";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			maxxuhao=rs.getLong(1);
		}
		rs.close();
		ps.close();

		if (maxxuhao!=xuhao)
		{
			conn.rollback();
			out.println("错误！只能删除最新的派单记录："+maxxuhao);
			return;
		}

		ls_sql="delete from pd_pdjl ";
		ls_sql+=" where khbh='"+khbh+"' and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="delete from pd_pdyxjjl ";
		ls_sql+=" where khbh='"+khbh+"' and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_khxx set pdsj=null,pdr=null,sgd=null,mgfrz=null,nwgfrz=null,sdgfrz=null,yqgfrz=null,pdsm=null,pdclzt='1',jlbz=null";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除派单成功！");
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>