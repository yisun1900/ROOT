<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String[] khbh=request.getParameterValues("khbh");
String zxdm=cf.GB2Uni(request.getParameter("zxdm"));
String sjsbh=cf.GB2Uni(request.getParameter("sjsbh"));
String clgw=cf.GB2Uni(request.getParameter("clgw"));

if (clgw==null || clgw.equals(""))
{
	out.println("错误！材料顾问为空");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;



try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{

		ls_sql="update crm_zxkhxx set clgw=?";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clgw);
		ps.executeUpdate();
		ps.close();


		ls_sql="update crm_khxx set clgw=?";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clgw);
		ps.executeUpdate();
		ps.close();

		//更新集成订单＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
		ls_sql="update jc_jcdd set clgw=?";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clgw);
		ps.executeUpdate();
		ps.close();

		ls_sql="update jc_mmydd set clgw=?";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clgw);
		ps.executeUpdate();
		ps.close();
		ls_sql="update jc_mmzjx set clgw=?";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clgw);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="update jc_cgdd set clgw=?";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clgw);
		ps.executeUpdate();
		ps.close();
		ls_sql="update jc_cgzjx set clgw=?";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clgw);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="update jc_jjdd set clgw=?";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clgw);
		ps.executeUpdate();
		ps.close();
		ls_sql="update jc_jjzjx set clgw=?";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clgw);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="update jc_zcdd set clgw=?";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clgw);
		ps.executeUpdate();
		ps.close();

		ls_sql="update jc_zczjx set clgw=?";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clgw);
		ps.executeUpdate();
		ps.close();
		//更新集成订单－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－

	}

	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("更换成功！");
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>