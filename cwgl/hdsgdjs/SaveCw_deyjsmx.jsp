<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String[] xmbh=request.getParameterValues("xmbh");

String[] cbdjstr=request.getParameterValues("cbdj");
String[] cbjestr=request.getParameterValues("cbje");
String[] mllstr=request.getParameterValues("mll");
String[] mlestr=request.getParameterValues("mle");

String[] jsblxsstr=request.getParameterValues("jsblxs");
String[] nbjsdjstr=request.getParameterValues("nbjsdj");
String[] nbjsjestr=request.getParameterValues("nbjsje");
String[] gsmllstr=request.getParameterValues("gsmll");
String[] gsmlrstr=request.getParameterValues("gsmlr");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<xmbh.length ;i++ )
	{
		double cbdj=0;
		double cbje=0;
		double mll=0;
		double mle=0;

		double jsblxs=0;
		double nbjsdj=0;
		double nbjsje=0;
		double gsmll=0;
		double gsmlr=0;

		cbdj=java.lang.Double.parseDouble(cbdjstr[i].trim());
		cbje=java.lang.Double.parseDouble(cbjestr[i].trim());
		mll=java.lang.Double.parseDouble(mllstr[i].trim());
		mle=java.lang.Double.parseDouble(mlestr[i].trim());

		nbjsdj=java.lang.Double.parseDouble(nbjsdjstr[i].trim());
		nbjsje=java.lang.Double.parseDouble(nbjsjestr[i].trim());
		gsmll=java.lang.Double.parseDouble(gsmllstr[i].trim());
		gsmlr=java.lang.Double.parseDouble(gsmlrstr[i].trim());

		try{
			jsblxs=java.lang.Double.parseDouble(jsblxsstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！项目编号为["+xmbh[i]+"]的[结算比例系数]输入不正确:"+jsblxsstr[i].trim());
			return;
		}

		if (jsblxs<=0 || jsblxs>100)
		{
			conn.rollback();
			out.println("<BR>存盘失败！项目编号为["+xmbh[i]+"]的[结算比例系数]输入不正确:"+jsblxsstr[i].trim()+"，应在0和100之间");
			return;
		}

	
		ls_sql="update cw_deyjsmx set cbdj=?,cbje=?,mll=?,mle=?,jsblxs=?,nbjsdj=?,nbjsje=?,gsmll=?,gsmlr=?";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,cbdj);
		ps.setDouble(2,cbje);
		ps.setDouble(3,mll);
		ps.setDouble(4,mle);
		ps.setDouble(5,jsblxs);
		ps.setDouble(6,nbjsdj);
		ps.setDouble(7,nbjsje);
		ps.setDouble(8,gsmll);
		ps.setDouble(9,gsmlr);
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