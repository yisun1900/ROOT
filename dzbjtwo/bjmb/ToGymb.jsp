<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String chooseitem =request.getParameter("chooseitem");
String czyhdlm=(String)session.getAttribute("yhdlm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String yhdlm=null;
String mbmc=null;
String mblx=null;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);


	ls_sql="SELECT distinct yhdlm,mbmc,mblx";
	ls_sql+=" FROM bj_bjmb ";
    ls_sql+=" where "+chooseitem;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		yhdlm=rs1.getString("yhdlm");
		mbmc=rs1.getString("mbmc");
		mblx=rs1.getString("mblx");

		if (mblx.equals("1"))//
		{
			out.println("<BR>提醒！["+mbmc+"]已是公用模板");
			continue;
		}

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_bjmb ";
		ls_sql+=" where mbmc='"+mbmc+"' and mblx='1'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		if (count>0)
		{
			conn.rollback();
			out.println("<BR>错误，该[公用模板称]已存在");
			return;
		}
		rs.close();
		ps.close();

		ls_sql="update bj_bjmb set mblx='1',yhdlm='"+czyhdlm+"'";//1：公用模板；2：私人模板
		ls_sql+=" where yhdlm='"+yhdlm+"' and mbmc='"+mbmc+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		ls_sql="update bj_bjmbfjxx set mblx='1',yhdlm='"+czyhdlm+"'";//1：公用模板；2：私人模板
		ls_sql+=" where yhdlm='"+yhdlm+"' and mbmc='"+mbmc+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update bj_bjmbgclmx set mblx='1',yhdlm='"+czyhdlm+"'";//1：公用模板；2：私人模板
		ls_sql+=" where yhdlm='"+yhdlm+"' and mbmc='"+mbmc+"'";
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
	alert("转换成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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