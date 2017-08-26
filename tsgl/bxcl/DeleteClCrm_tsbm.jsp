<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String chooseitem=cf.GB2Uni(request.getParameter("chooseitem"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	String cljlh="";
	String tsjlh="";
	String tsyybm="";
	String getclzt="";
	ls_sql="select cljlh,tsjlh,tsyybm,clzt";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where "+chooseitem;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		cljlh=cf.fillNull(rs1.getString("cljlh"));
		tsjlh=cf.fillNull(rs1.getString("tsjlh"));
		tsyybm=cf.fillNull(rs1.getString("tsyybm"));
		getclzt=cf.fillNull(rs1.getString("clzt"));

		if ( !getclzt.equals("3") && !getclzt.equals("B"))//1：未接收；2：已接收等待出方案；4：已接收等待出现场；6：已出现场等待出方案；7：已出方案等待审核；8：已出方案不需审核；9：方案审核通过；A：方案审核未通过；3：已解决；B:回访未解决；5：结案
		{
			conn.rollback();
			out.println("错误！处理状态不正确");
			return;
		}

		String ycljlh="";
		String yddclzt="";
		String yzrbmclzt="";
		ls_sql="select yddclzt,yzrbmclzt,ycljlh";
		ls_sql+=" from  crm_tsbxcljl";
		ls_sql+=" where cljlh='"+cljlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yddclzt=cf.fillNull(rs.getString("yddclzt"));
			yzrbmclzt=cf.fillNull(rs.getString("yzrbmclzt"));
			ycljlh=cf.fillNull(rs.getString("ycljlh"));
		}
		rs.close();
		ps.close();

		String yclqk="";
		String yclr="";
		java.sql.Date yclsj=null;
		java.sql.Date ysjjjsj=null;
		ls_sql="select clqk,clr,clsj,sjjjsj";
		ls_sql+=" from  crm_tsbxcljl";
		ls_sql+=" where cljlh='"+ycljlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yclqk=cf.fillNull(rs.getString("clqk"));
			yclr=cf.fillNull(rs.getString("clr"));
			yclsj=rs.getDate("clsj");
			ysjjjsj=rs.getDate("sjjjsj");
		}
		rs.close();
		ps.close();

		ls_sql="delete from crm_tsbxcljl ";
		ls_sql+=" where cljlh='"+cljlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_tsjl set clzt=?,zrbmclzt=?";//0：未受理；1：已受理；4：已接收；5：已出现场；6：已出方案；7：方案审核通过；2：在处理；3：结案；9:不立案
		ls_sql+=" where tsjlh='"+tsjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yddclzt);
		ps.setString(2,yzrbmclzt);
		ps.executeUpdate();
		ps.close();

		
		ls_sql="update crm_tsbm set clqk=?,clr=?,clsj=?,clzt=?,cljlh=?,sjjjsj=? ";
		ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yclqk);
		ps.setString(2,yclr);
		ps.setDate(3,yclsj);
		ps.setString(4,yzrbmclzt);
		ps.setString(5,ycljlh);
		ps.setDate(6,ysjjjsj);
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

