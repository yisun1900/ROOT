<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String zwbm=(String)session.getAttribute("zwbm");
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");
String[] sfxmbm = request.getParameterValues("sfxmbm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}

	conn.setAutoCommit(false);

	for (int i=0;i<sfxmbm.length ;i++ )
	{
		if (zwbm.equals("04") || zwbm.equals("20"))//家装设计师,预算员
		{
			String isSfbxx="";
			ls_sql="SELECT sfbxx";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and sfxmbm='"+sfxmbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				isSfbxx=rs.getString(1);
			}
			rs.close();
			ps.close();

			if (isSfbxx.equals("1"))//1：必选；2：非必选
			{
				conn.rollback();
				out.println("错误！项目编号【"+sfxmbm[i]+"】是必选项不能删除，若想删除请由非设计师完成");
				return;
			}
		}

		ls_sql="delete from bj_sfxmmxh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and sfxmbm='"+sfxmbm[i]+"'";
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>