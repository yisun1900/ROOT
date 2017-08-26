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

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);


	double zjje=0;
	String khbh=null;
	String zjxxh=null;
	ls_sql="SELECT zjje,khbh,zjxxh";
	ls_sql+=" FROM crm_zjxdj";
	ls_sql+=" order by zjxxh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		zjje=rs1.getDouble(1);
		khbh=rs1.getString(2);
		zjxxh=rs1.getString(3);

		double zkl=10;
		double suijinbfb=10;
		ls_sql="SELECT NVL(zkl,10),NVL(suijinbfb,0)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zkl=rs.getDouble(1);
			suijinbfb=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		double jzjje=zjje*zkl/10;
		double zjxsuijin=jzjje*suijinbfb/100;

		//增减项发生额
		ls_sql="update crm_zjxdj set jzjje=?,zjxsuijin=?";
		ls_sql+=" where  zjxxh='"+zjxxh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,jzjje);
		ps.setDouble(2,zjxsuijin);
		ps.executeUpdate();
		ps.close();

		//更新客户信息表（crm_khxx）
		double allzjxje=0;
		double allkglf=0;
		double allkqtk=0;
		double alljzjje=0;
		double allzjxsuijin=0;

		ls_sql="select sum(zjje),sum(kglf),sum(kqtk),sum(jzjje),sum(zjxsuijin)";
		ls_sql+=" from  crm_zjxdj";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			allzjxje=rs.getDouble(1);
			allkglf=rs.getDouble(2);
			allkqtk=rs.getDouble(3);
			alljzjje=rs.getDouble(4);
			allzjxsuijin=rs.getDouble(5);
		}
		rs.close();
		ps.close();

		ls_sql="update crm_khxx set zjxje=?,kglf=?,kqtk=?,zhzjxje=?,zjxsuijin=?";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,allzjxje);
		ps.setDouble(2,allkglf);
		ps.setDouble(3,allkqtk);
		ps.setDouble(4,alljzjje);
		ps.setDouble(5,allzjxsuijin);
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
	out.print("Exception: " + e);
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