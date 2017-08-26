<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String ssfgs=request.getParameter("ssfgs");

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	ls_sql="update sq_yhxx set bianhao=null where ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	String ygbh=null;
	ls_sql="select ygbh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		ygbh=rs1.getString("ygbh");

		String bianma=null;
		ls_sql="select bianma";
		ls_sql+=" from  sq_dwxx";
		ls_sql+=" where dwbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			bianma=cf.fillNull(rs.getString("bianma"));
		}
		rs.close();
		ps.close();
		if (bianma.equals(""))
		{
			out.println("错误！请在单位信息表中录入『编码』");
			return;
		}

		String bianhao=null;
		int count=0;
		ls_sql="select NVL(max(TO_NUMBER(substr(bianhao,4 ,4))),0)";
		ls_sql+=" from  sq_yhxx";
		ls_sql+=" where ssfgs='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		bianhao=bianma+"-"+cf.addZero(count+1,4);
		
		ls_sql="update sq_yhxx set bianhao=?";
		ls_sql+=" where ygbh='"+ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,bianhao);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();


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
	out.print("存盘失败,发生意外: " + e);
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