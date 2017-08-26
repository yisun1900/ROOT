<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%


String[] jcjlh=request.getParameterValues("jcjlh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<jcjlh.length ;i++ )
	{
		String kpbz=null;
		String jsbz=null;
		ls_sql="select kpbz,jsbz";
		ls_sql+=" from  gdm_gdjcjl";
		ls_sql+=" where  (jcjlh='"+jcjlh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			kpbz=rs.getString("kpbz");
			jsbz=rs.getString("jsbz");
		}
		rs.close();
		ps.close();
		if (kpbz==null)
		{
			kpbz="N";
		}
		if (jsbz==null)
		{
			jsbz="N";
		}
		if (kpbz.equals("Y") || jsbz.equals("Y"))
		{
			conn.rollback();
			out.println("错误！已结算或考评，不能删除："+jcjlh[i]);
			return;
		}

		ls_sql="update gdm_gdjcjl set cfspbz='2',spr=null,spsj=null,spyj=null ";
		ls_sql+=" where  (jcjlh='"+jcjlh[i]+"')  ";
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