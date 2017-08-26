<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] jlh = request.getParameterValues("jlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	conn.setAutoCommit(false);

	for (int i=0;i<jlh.length ;i++ )
	{
		String zt=null;
		String khbh=null;
		ls_sql="select zt,khbh";
		ls_sql+=" from  crm_khsmjl";
		ls_sql+=" where jlh='"+jlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zt=rs.getString(1);
			khbh=rs.getString(2);
		}
		rs.close();
		ps.close();
		
		if (zt==null)
		{
			conn.rollback();
			out.println("错误！不存在上门记录："+jlh[i]);
			return;
		}
		if (!zt.equals("1"))//1：未录结果；2：已录结果；3：已审核
		{
			conn.rollback();
			out.println("错误！状态不正确，不能删除");
			return;
		}

		String maxjlh=null;
		ls_sql="select max(jlh)";
		ls_sql+=" from  crm_khsmjl";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			maxjlh=cf.fillNull(rs.getString(1));
		}
		rs.close();
		ps.close();
		if (!jlh[i].equals(maxjlh))
		{
			conn.rollback();
			out.println("错误！只能删除最新上门记录："+maxjlh);
			return;
		}

		ls_sql="delete from crm_khsmjl";
		ls_sql+=" where jlh='"+jlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		java.sql.Date scsmsj=null;//首次上门时间
		java.sql.Date zjsmsj=null;//最近上门时间
		ls_sql="select min(smsj),max(smsj)";
		ls_sql+=" from  crm_khsmjl";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			scsmsj=rs.getDate(1);
			zjsmsj=rs.getDate(2);
		}
		rs.close();
		ps.close();
			
		int lfcs=0;
		ls_sql="select count(*)";
		ls_sql+=" from  crm_khsmjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			lfcs=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql =" update crm_zxkhxx set smcs='"+lfcs+"',scsmsj=?,zjsmsj=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,scsmsj);
		ps.setDate(2,zjsmsj);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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