<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] gysbm =request.getParameterValues("gysbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<gysbm.length ;i++ )
	{
		//取用户登录名
		String yhdlm=null;
		ls_sql="select yhdlm";
		ls_sql+=" from  sq_gysbm";
		ls_sql+=" where gysbm='"+gysbm[i]+"'";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yhdlm=rs.getString("yhdlm");
		}
		rs.close();
		ps.close();

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  sq_gysxx";
		ls_sql+=" where gysbm='"+gysbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			conn.rollback();
			out.println("错误！不能删除，[品牌供应商信息表]存在此供应商，供应商编号："+gysbm[i]);
			return;
		}

		//删除：供应商联系人
		ls_sql="delete from sq_gyslxr ";
		ls_sql+=" where gysbm='"+gysbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//删除：供应商信息表
		ls_sql="delete from sq_gysbm ";
		ls_sql+=" where gysbm='"+gysbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from sq_gyssqfgs ";
		ls_sql+=" where gysbm='"+gysbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//有用户登录名
		if (yhdlm!=null)//Y：已撤销；N：未撤销
		{
			//取消用户权限
			ls_sql="delete from sq_yhssz where yhdlm='"+yhdlm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="delete from  sq_yhewqx where yhdlm='"+yhdlm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		}

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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>