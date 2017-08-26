<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%


String[] gdjsjlh=request.getParameterValues("gdjsjlh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<gdjsjlh.length ;i++ )
	{
		String jsjd=null;
		ls_sql="select jsjd";
		ls_sql+=" from  cw_gdjsjl";
		ls_sql+=" where  (gdjsjlh='"+gdjsjlh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			jsjd=rs.getString("jsjd");
		}
		rs.close();
		ps.close();

		if (!jsjd.equals("2"))//1：结算部结算；2：结算审批；3：财务结算
		{
			conn.rollback();
			out.println("错误！[结算进度]不正确，不能删除："+gdjsjlh[i]);
			return;
		}

		ls_sql="update cw_gdjsjl set jsjd='1',spjl=null,spr=null,spsj=null,spyj=null,glftd=0,wxjbfb=0,wxj=0,bk=0 ";
		ls_sql+=" where  (gdjsjlh='"+gdjsjlh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


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