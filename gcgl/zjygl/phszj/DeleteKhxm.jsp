<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrph = request.getParameter("lrph");
String[] khbhbox=request.getParameterValues("khbhbox");
String[] khbh=request.getParameterValues("khbh");
String[] lrxh=request.getParameterValues("lrxh");

String ls=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String jzjxm=null;
String xzjxm=null;
String jsgbz=null;
String xsgbz=null;

String zjxm=null;
String sgbz=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		if (!cf.searchArray(khbhbox,khbh[i]))
		{
			continue;
		}

		ls_sql="SELECT jzjxm,xzjxm,jsgbz,xsgbz";
		ls_sql+=" FROM crm_lrphmx ";
		ls_sql+=" where lrph="+lrph+" and khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			jzjxm=cf.fillNull(rs.getString("jzjxm"));
			xzjxm=cf.fillNull(rs.getString("xzjxm"));
			jsgbz=cf.fillNull(rs.getString("jsgbz"));
			xsgbz=cf.fillNull(rs.getString("xsgbz"));
		}
		else{
			conn.rollback();
			out.println("<BR>！！！错误，序号为:"+lrxh[i]+"的客户编号["+khbh[i]+"]不存在");
			return;
		}
		ps.close();
		rs.close();

		ls_sql="SELECT zjxm,sgbz";
		ls_sql+=" FROM crm_khxx ";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			sgbz=cf.fillNull(rs.getString("sgbz"));
			zjxm=cf.fillNull(rs.getString("zjxm"));
		}
		else{
			conn.rollback();
			out.println("<BR>！！！错误，序号为:"+lrxh[i]+"的客户编号["+khbh[i]+"]不存在");
			return;
		}
		ps.close();
		rs.close();

		if (!xzjxm.equals(zjxm))
		{
			conn.rollback();
			out.println("<BR>！！！错误，序号为:"+lrxh[i]+"的客户编号["+khbh[i]+"]工程担当已改变，不能删除");
			return;
		}
		if (!sgbz.equals(xsgbz))
		{
			conn.rollback();
			out.println("<BR>！！！错误，序号为:"+lrxh[i]+"的客户编号["+khbh[i]+"]施工班组已改变，不能删除");
			return;
		}

		ls_sql="update crm_khxx set zjxm=?,sgbz=?,zjdh=null,bzdh=null";
		ls_sql+=" where  khbh='"+khbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,jzjxm);
		ps.setString(2,jsgbz);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_lrphmx";
		ls_sql+=" where  khbh='"+khbh[i]+"' and lrph="+lrph;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update crm_lrph set sl=(select count(*) from crm_lrphmx where lrph="+lrph+") where lrph="+lrph;
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