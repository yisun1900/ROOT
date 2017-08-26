<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] jcjlh=request.getParameterValues("jcjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<jcjlh.length ;i++ )
	{
		String cljlh="";
		String getclzt="";
		ls_sql="select cljlh,clzt";
		ls_sql+=" from  gdm_gdjcjl";
		ls_sql+=" where jcjlh='"+jcjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cljlh=cf.fillNull(rs.getString("cljlh"));
			getclzt=cf.fillNull(rs.getString("clzt"));
		}
		rs.close();
		ps.close();

		if ( !getclzt.equals("3") && !getclzt.equals("B"))//1：未接收；2：已接收等待出方案；4：已接收等待出现场；6：已出现场等待出方案；7：已出方案等待审核；8：已出方案不需审核；9：方案审核通过；A：方案审核未通过；3：已解决；B:回访未解决；5：结案
		{
			conn.rollback();
			out.println("错误！处理状态不正确");
			return;
		}

		String ycljlh="";
		String yclzt="";
		ls_sql="select yclzt,ycljlh";
		ls_sql+=" from  gdm_zgcljl";
		ls_sql+=" where cljlh='"+cljlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yclzt=cf.fillNull(rs.getString("yclzt"));
			ycljlh=cf.fillNull(rs.getString("ycljlh"));
		}
		rs.close();
		ps.close();

		String yclqk="";
		String yclr="";
		java.sql.Date yclsj=null;
		ls_sql="select clqk,clr,clsj";
		ls_sql+=" from  gdm_zgcljl";
		ls_sql+=" where cljlh='"+ycljlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yclqk=cf.fillNull(rs.getString("clqk"));
			yclr=cf.fillNull(rs.getString("clr"));
			yclsj=rs.getDate("clsj");
		}
		rs.close();
		ps.close();

		ls_sql="delete from gdm_zgcljl ";
		ls_sql+=" where cljlh='"+cljlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		
		ls_sql="update gdm_gdjcjl set clqk=?,clr=?,clsj=?,clzt=?,cljlh=? ";
		ls_sql+=" where jcjlh='"+jcjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yclqk);
		ps.setString(2,yclr);
		ps.setDate(3,yclsj);
		ps.setString(4,yclzt);
		ps.setString(5,ycljlh);
		ps.executeUpdate();
		ps.close();

	}
	


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

