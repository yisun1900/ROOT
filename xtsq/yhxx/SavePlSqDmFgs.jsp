<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010218")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%

String[] ygbh=request.getParameterValues("ygbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	for (int i=0;i<ygbh.length ;i++ )
	{
		String yhjs=null;
		String ssfgs=null;
		String dwbh=null;
		ls_sql="select yhjs,ssfgs,dwbh";
		ls_sql+=" from  sq_yhxx";
		ls_sql+=" where ygbh='"+ygbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yhjs=rs.getString("yhjs");
			ssfgs=rs.getString("ssfgs");
			dwbh=rs.getString("dwbh");
		}
		rs.close();
		ps.close();

		if (yhjs==null || yhjs.equals(""))
		{
			conn.rollback();
			out.println("错误！无用户角色："+ygbh[i]);
			return;
		}

		String kfgssq=null;//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

		if (yhjs.equals("A0") || yhjs.equals("A1"))//A0：总部；A1：总部部门；A2：大区； F0：分公司； F1：分公司部门； F2：分公司店面；F3：部门小组；
		{
			if (count>1)
			{
				kfgssq="1";
			}
			else{
				kfgssq="2";
			}

			ls_sql="delete from sq_sqfgs";
			ls_sql+=" where ygbh='"+ygbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		
			ls_sql="insert into sq_sqfgs (ssfgs,ygbh ) ";
			ls_sql+=" select dwbh,'"+ygbh[i]+"' ";
			ls_sql+=" from sq_dwxx ";
			ls_sql+=" where dwlx='F0' and cxbz='N'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (yhjs.equals("F0") || yhjs.equals("F1"))
		{
			kfgssq="1";

			ls_sql="delete from sq_sqfgs";
			ls_sql+=" where ygbh='"+ygbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		
			ls_sql="insert into sq_sqfgs (ssfgs,ygbh ) ";
			ls_sql+=" values('"+ssfgs+"','"+ygbh[i]+"') ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (yhjs.equals("F2") || yhjs.equals("F3"))
		{
			kfgssq="3";

			ls_sql="delete from sq_sqbm";
			ls_sql+=" where ygbh='"+ygbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
			ls_sql+=" values('"+dwbh+"','"+ygbh[i]+"','"+ssfgs+"') ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
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