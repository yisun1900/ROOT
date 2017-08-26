<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String dqbm=null;
String xmbh=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="SELECT dqbm,xmbh";
	ls_sql+=" FROM bj_bjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		dqbm=rs1.getString("dqbm");
		xmbh=rs1.getString("xmbh");


		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_gclmx ";
		ls_sql+=" where khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();


		if (count==0)
		{
			ls_sql="delete from bj_khglfxb ";
			ls_sql+=" where khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="delete from bj_dwgclzcyl ";
			ls_sql+=" where khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="delete from bj_bjxmmx ";
			ls_sql+=" where khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

	}
	rs1.close();
	ps1.close();

	//调整序号，删除中间空号
	int pxxh=0;
	String lsxh=null;
	ls_sql="SELECT xh";
	ls_sql+=" FROM bj_bjxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xmpx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lsxh=rs.getString(1);

		pxxh++;

		ls_sql="update bj_bjxmmx set xmpx="+pxxh+" where khbh='"+khbh+"' and xh="+lsxh;
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
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