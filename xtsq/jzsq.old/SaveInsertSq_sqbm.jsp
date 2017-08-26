<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010215")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%

String ygbh=request.getParameter("ygbh");
String kfgssq=request.getParameter("kfgssq");
String[] dwbh=request.getParameterValues("dwbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	if (kfgssq.equals("3"))//3：授权单个店面
	{
		if (dwbh.length>1)
		{
			out.println("错误！您选择了『授权单个店面』，可实际授权了["+dwbh.length+"]个");
			return;
		}

		String yhdwbh=null;
		String yhdwlx=null;
		String yhdwmc=null;
		ls_sql="select sq_yhxx.dwbh,sq_dwxx.dwlx,sq_dwxx.dwmc";
		ls_sql+=" from  sq_yhxx,sq_dwxx";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_yhxx.ygbh='"+ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yhdwbh=rs.getString(1);
			yhdwlx=rs.getString(2);
			yhdwmc=rs.getString(3);
		}
		rs.close();
		ps.close();

		if (!dwbh[0].equals(yhdwbh) && yhdwlx.equals("F2"))
		{
			out.println("错误！您选择了『授权单个店面』，确没有选择该用户所属部门："+yhdwmc);
			return;
		}
	}

	conn.setAutoCommit(false);

	ls_sql="delete from sq_sqfgs";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from sq_sqbm";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<dwbh.length ;i++ )
	{
		ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
		ls_sql+=" select dwbh,?,ssfgs";
		ls_sql+=" from sq_dwxx";
		ls_sql+=" where dwbh='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ygbh);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update sq_yhxx set kfgssq='"+kfgssq+"'";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	int fgssl=0;
	int dmsl=0;
	ls_sql="select count(distinct ssfgs),count(dwbh)";
	ls_sql+=" from  sq_sqbm";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgssl=rs.getInt(1);
		dmsl=rs.getInt(2);
	}
	rs.close();
	ps.close();

	if (kfgssq.equals("4") && fgssl>1)//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		conn.rollback();
		out.println("错误！您选择了『授权某一分公司多个店面』，可实际授权了["+fgssl+"]个分公司的店面");
		return;
	}
	else if (kfgssq.equals("4") && dmsl==1)
	{
		conn.rollback();
		out.println("错误！您选择了『授权某一分公司多个店面』，可实际只授权了1个店面");
		return;
	}
	else if (kfgssq.equals("5") && fgssl==1)
	{
		conn.rollback();
		out.println("错误！您选择了『授权多个分公司多个店面』，可实际只授权了1个分公司的店面");
		return;
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