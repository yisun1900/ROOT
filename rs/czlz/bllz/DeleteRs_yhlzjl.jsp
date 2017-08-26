<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] xh=request.getParameterValues("xh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<xh.length ;i++ )
	{
		String ygbh="";
		String czsqxh="";
		String ysfzszg="";
		ls_sql="select ygbh,czsqxh,ysfzszg";
		ls_sql+=" from  rs_yhlzjl";
		ls_sql+=" where xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ygbh=cf.fillNull(rs.getString("ygbh"));
			czsqxh=cf.fillNull(rs.getString("czsqxh"));
			ysfzszg=cf.fillNull(rs.getString("ysfzszg"));
		}
		rs.close();
		ps.close();

		String lzxh="";
		String sfzszg="";
		ls_sql="select lzxh,sfzszg";
		ls_sql+=" from  sq_yhxx";
		ls_sql+=" where  (ygbh='"+ygbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			lzxh=cf.fillNull(rs.getString(1));
			sfzszg=cf.fillNull(rs.getString(2));
		}
		rs.close();
		ps.close();

		if (!sfzszg.equals("S") && !sfzszg.equals("T"))
		{
			out.println("错误！员工未离职");
			return;
		}
		if (!lzxh.equals(xh[i]))
		{
			out.println("错误！只能修改最新的离职信息："+lzxh);
			return;
		}

		ls_sql="update rs_czsq set clzt='03'";
		ls_sql+=" where sqxh='"+czsqxh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from rs_yhlzjl";
		ls_sql+=" where xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		ls_sql="update sq_yhxx set lzrq=null,lzyyflbm=null,lzyy=null,sfzszg='"+ysfzszg+"'";
		ls_sql+=" where  (ygbh='"+ygbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	
	}


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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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