<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrph = request.getParameter("lrph");
String[] khbh=request.getParameterValues("khbh");
String[] sjjgrqstr=request.getParameterValues("sjjgrq");

java.sql.Date sjjgrq=null;
String ls=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int zdxh=0;

String xgcjdbm=null;
String xsjjgrq=null;
String gcjdbm1=null;
String sjjgrq1=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		try{
			sjjgrq=java.sql.Date.valueOf(sjjgrqstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>序号为["+(i+1)+"]的[实竣工日期]格式输入不正确:"+sjjgrqstr[i]);
			return;
		}

		ls_sql="SELECT xgcjdbm,xsjjgrq";
		ls_sql+=" FROM crm_lrphmx ";
		ls_sql+=" where  khbh='"+khbh[i]+"' and lrph="+lrph;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xgcjdbm=cf.fillNull(rs.getString("xgcjdbm"));
			xsjjgrq=cf.fillNull(rs.getDate("xsjjgrq"));
		}
		else{
			conn.rollback();
			out.println("<BR>！！！错误，序号为:"+(i+1)+"的客户编号["+khbh[i]+"]不存在");
			return;
		}
		rs.close();
		ps.close();


		ls_sql="SELECT gcjdbm,sjjgrq";
		ls_sql+=" FROM crm_khxx ";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gcjdbm1=cf.fillNull(rs.getString("gcjdbm"));
			sjjgrq1=cf.fillNull(rs.getDate("sjjgrq"));
		}
		else{
			conn.rollback();
			out.println("<BR>！！！错误，序号为:"+(i+1)+"的客户编号["+khbh[i]+"]不存在");
			return;
		}
		rs.close();
		ps.close();

		if (!xgcjdbm.equals(gcjdbm1))
		{
			conn.rollback();
			out.println("<BR>！！！错误，序号为:"+(i+1)+"的客户编号["+khbh[i]+"]工程进度已改变，存盘失败");
			return;
		}
		if (!xsjjgrq.equals(sjjgrq1))
		{
			conn.rollback();
			out.println("<BR>！！！错误，序号为:"+(i+1)+"的客户编号["+khbh[i]+"]实竣工日期 已改变，存盘失败");
			return;
		}



		ls_sql="update crm_khxx set sjjgrq=?,gcjdbm='4',wgbz='Y'";
		ls_sql+=" where  khbh='"+khbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,sjjgrq);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_lrphmx set sfsz='N',xgcjdbm='4',xsjjgrq=?";
		ls_sql+=" where  khbh='"+khbh[i]+"' and lrph="+lrph;
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,sjjgrq);
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