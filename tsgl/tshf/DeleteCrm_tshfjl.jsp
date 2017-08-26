<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] hfjlh = request.getParameterValues("hfjlh");
if (hfjlh.length!=1)
{
	out.println("错误！每次只能删除一条记录");
	return;
}

String tsjlh=null;
String ysfxhf=null;
java.sql.Date yhfsj=null;
String yhfjlh=null;
java.sql.Date yzxhfsj=null;
String yhfr=null;
String yclzt=null;

String tsyybm=null;
String yhfjgbm=null;
String ysfjslx=null;

String yzzjgbm=null;
String yjsxbm=null;
java.sql.Date yjasj=null;



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String newhfjlh=null;
	int count=0;
	ls_sql="select NVL(max(substr(hfjlh,8,3)),0)";
	ls_sql+=" from  crm_tshfjl";
	ls_sql+=" where khbh='"+hfjlh[0].substring(0,7)+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	newhfjlh=hfjlh[0].substring(0,7)+cf.addZero(count,3);

	if (!newhfjlh.equals(hfjlh[0]))
	{
		out.println("错误！只能删除最新一次的回访记录");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="select tsjlh,ysfxhf,yhfsj,yhfjlh,yzxhfsj,yhfr,yclzt";
	ls_sql+=" from  crm_tsjlhfmx";
	ls_sql+=" where hfjlh='"+hfjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		tsjlh=rs.getString("tsjlh");
		ysfxhf=rs.getString("ysfxhf");
		yhfsj=rs.getDate("yhfsj");
		yhfjlh=rs.getString("yhfjlh");
		yzxhfsj=rs.getDate("yzxhfsj");
		yhfr=rs.getString("yhfr");
		yclzt=rs.getString("yclzt");


		ls_sql="update crm_tsjl set sfxhf=?,hfsj=?,hfjlh=?,zxhfsj=?,hfr=?,clzt=?";
		ls_sql+=" where tsjlh='"+tsjlh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,ysfxhf);
		ps1.setDate(2,yhfsj);
		ps1.setString(3,yhfjlh);
		ps1.setDate(4,yzxhfsj);
		ps1.setString(5,yhfr);
		ps1.setString(6,yclzt);
		ps1.executeUpdate();
		ps1.close();

		//投诉问题回访明细（crm_tswthfmx）
		ls_sql="select tsyybm,yhfjgbm,ysfjslx";
		ls_sql+=" from  crm_tswthfmx";
		ls_sql+=" where tsjlh='"+tsjlh+"' and hfjlh='"+hfjlh[0]+"'";
		ls_sql+=" order by tsyybm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			tsyybm=rs1.getString("tsyybm");
			yhfjgbm=rs1.getString("yhfjgbm");
			ysfjslx=rs1.getString("ysfjslx");

			ls_sql ="update crm_tsbm set hfjgbm=?,sfjslx=?,zzjgbm=null,jsxbm=null";
			ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
			ps2= conn.prepareStatement(ls_sql);
			ps2.setString(1,yhfjgbm);
			ps2.setString(2,ysfjslx);
			ps2.executeUpdate();
			ps2.close();

		}
		rs1.close();
		ps1.close();
	}
	ps.close();
	rs.close();

	ls_sql="delete from crm_tswthfmx";
	ls_sql+=" where hfjlh='"+hfjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from crm_tsjlhfmx where hfjlh='"+hfjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_tshfjl";
	ls_sql+=" where hfjlh='"+hfjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from crm_tshffkbm where hfjlh='"+hfjlh[0]+"'";
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
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>