<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] gdjsjlh = request.getParameterValues("gdjsjlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String jsjd=null;
	String spjl=null;
	String khbh=null;
	String sgd=null;
	String khxm=null;
	String gdjsjd=null;


	conn.setAutoCommit(false);

	for (int i=0;i<gdjsjlh.length ;i++ )
	{
		ls_sql="select khbh,sgd,jsjd,spjl";
		ls_sql+=" from  cw_gdjsjl";
		ls_sql+=" where gdjsjlh='"+gdjsjlh[i]+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			khbh=rs1.getString("khbh");
			sgd=rs1.getString("sgd");
			jsjd=rs1.getString("jsjd");
			spjl=rs1.getString("spjl");
		}
		else{
			conn.rollback();
			out.println("错误！结算记录号["+gdjsjlh[i]+"]不存在");
			return;
		}
		rs1.close();
		ps1.close();


		if (jsjd.equals("2"))//1：结算部结算；2：结算审批；3：财务结算
		{
			if (!spjl.equals("4"))//3：通过；4：未通过
			{
				conn.rollback();
				out.println("错误！结算记录号["+gdjsjlh[i]+"]已审批通过，不能再删除");
				return;
			}
		}
		else if (jsjd.equals("3"))//1：结算部结算；2：结算审批；3：财务结算
		{
			conn.rollback();
			out.println("错误！结算记录号["+gdjsjlh[i]+"]财务已结算，不能再删除");
			return;
		}

		
		ls_sql="update crm_khxx set gdjsjd='0',gdjsjlh=null";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
        
		ls_sql="delete from cw_dejsclmx ";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		ls_sql="delete from cw_dejsxmclmx ";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_dejsmx ";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_gdjsjl ";
		ls_sql+=" where  gdjsjlh='"+gdjsjlh[i]+"'";
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
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>