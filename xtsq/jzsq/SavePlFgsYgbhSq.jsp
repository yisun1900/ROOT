<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010211")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>
<%

String[] ygbh=request.getParameterValues("ygbh");
String kfgssq=request.getParameter("kfgssq");
String[] ssfgs=request.getParameterValues("ssfgs");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	if (kfgssq.equals("1") && ssfgs.length>1)//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("错误！您选择了『授权单个分公司』，可实际授权了["+ssfgs.length+"]个");
		return;
	}
	else if (kfgssq.equals("2") && ssfgs.length==1)
	{
		out.println("错误！您选择了『授权多个分公司』，可实际只授权了1个");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<ygbh.length ;i++ )
	{
		ls_sql="delete from sq_sqfgs";
		ls_sql+=" where ygbh='"+ygbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from sq_sqbm";
		ls_sql+=" where ygbh='"+ygbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		for (int j=0;j<ssfgs.length ;j++ )
		{
			ls_sql="insert into sq_sqfgs (ssfgs,ygbh ) ";
			ls_sql+=" values ( ?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs[j]);
			ps.setString(2,ygbh[i]);
			ps.executeUpdate();
			ps.close();
		}

		if (kfgssq.equals("1"))//1：授权单个分公司
		{
			String yhssfgs=null;
			ls_sql="select ssfgs";
			ls_sql+=" from  sq_yhxx";
			ls_sql+=" where ygbh='"+ygbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				yhssfgs=rs.getString(1);
			}
			rs.close();
			ps.close();

			if (!ssfgs[0].equals(yhssfgs) )
			{
				conn.rollback();
				out.println("员工编号"+ygbh[i]+"错误！您选择了『授权单个分公司』，确没有选择该用户所属分公司："+yhssfgs);
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