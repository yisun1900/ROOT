<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String[] khbh = request.getParameterValues("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  cmp_cmpjl";
		ls_sql+=" where khbh='"+khbh[i]+"' and cmpzt='1'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		ps.close();
		rs.close();

		if (count>0)
		{
			conn.rollback();
			out.println("错误！不能重复设置:"+khbh[i]);
			return;
		}

		ls_sql="insert into cmp_cmpjl (khbh,cmpzt,cmpbh,lx,lrr,lrsj,lrbm,bz)";
		ls_sql+=" values(?,'1','FBJ01','1',?,SYSDATE,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh[i]);
		ps.setString(2,lrr);
		ps.setString(3,lrbm);
		ps.setString(4,"批量人工设置");
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_khxx set cmpzt=1,cmpbh=1";//0：未授权；1：等待填写；2：已填写
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	parent.window.close();
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