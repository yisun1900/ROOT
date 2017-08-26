<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<%
String dwbh=request.getParameter("dwbh");
String[] ygbh=request.getParameterValues("ygbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<ygbh.length ;i++ )
	{
		ls_sql="delete from sq_sqbm";
		ls_sql+=" where ygbh='"+ygbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from sq_sqfgs";
		ls_sql+=" where ygbh='"+ygbh[i]+"' and ssfgs='"+dwbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into sq_sqfgs (ssfgs,ygbh ) ";
		ls_sql+=" values ( ?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,dwbh);
		ps.setString(2,ygbh[i]);
		ps.executeUpdate();
		ps.close();

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  sq_sqfgs";
		ls_sql+=" where ygbh='"+ygbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		String kfgssq=null;
		//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		if (count>1)
		{
			kfgssq="2";
		}
		else{
			kfgssq="1";
		}

		if (kfgssq.equals("1"))
		{
			ls_sql="select count(*)";
			ls_sql+=" from  sq_sqfgs,sq_yhxx";
			ls_sql+=" where sq_sqfgs.ygbh=sq_yhxx.ygbh and sq_sqfgs.ssfgs=sq_yhxx.ssfgs and sq_sqfgs.ygbh='"+ygbh[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();
			if (count<1)
			{
				conn.rollback();
				out.println("员工编号"+ygbh[i]+"错误！被『授权单个分公司』，确没有选择该用户所属分公司");
				return;
			}
		}

		ls_sql="update sq_yhxx set kfgssq='"+kfgssq+"'";
		ls_sql+=" where ygbh='"+ygbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
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
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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