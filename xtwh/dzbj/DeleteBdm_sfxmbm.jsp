<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	String sfxmbm=null;
	String sfxmmc=null;
	String dqbm=null;
	ls_sql="select sfxmbm,sfxmmc,dqbm";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where "+chooseitem;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		sfxmbm=rs1.getString("sfxmbm");
		sfxmmc=rs1.getString("sfxmmc");
		dqbm=rs1.getString("dqbm");

		int sl=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  bj_sfxmmx";
		ls_sql+=" where sfxmbm='"+sfxmbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql="select count(*) ";
		ls_sql+=" from  bj_sfxmmxq";
		ls_sql+=" where sfxmbm='"+sfxmbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sl+=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql="select count(*) ";
		ls_sql+=" from  bj_sfxmmxh";
		ls_sql+=" where sfxmbm='"+sfxmbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sl+=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (sl>0)
		{
			conn.rollback();
			out.println("错误！项目["+sfxmbm+"]已使用，不能删除");
			return;
		}


		ls_sql="delete from bdm_sfxmbm ";
		ls_sql+=" where  sfxmbm='"+sfxmbm+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from bj_sfbl ";
		ls_sql+=" where  sfxmbm='"+sfxmbm+"' and dqbm='"+dqbm+"'";
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
	alert("删除成功！");
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