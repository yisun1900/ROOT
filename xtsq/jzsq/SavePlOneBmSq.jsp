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
		ls_sql="delete from sq_sqfgs";
		ls_sql+=" where ygbh='"+ygbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from sq_sqbm";
		ls_sql+=" where ygbh='"+ygbh[i]+"' and dwbh='"+dwbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
		ls_sql+=" select dwbh,?,ssfgs";
		ls_sql+=" from sq_dwxx";
		ls_sql+=" where dwbh='"+dwbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ygbh[i]);
		ps.executeUpdate();
		ps.close();

		int fgssl=0;
		int dmsl=0;
		ls_sql="select count(distinct ssfgs),count(dwbh)";
		ls_sql+=" from  sq_sqbm";
		ls_sql+=" where ygbh='"+ygbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fgssl=rs.getInt(1);
			dmsl=rs.getInt(2);
		}
		rs.close();
		ps.close();

		String kfgssq=null;
		//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		if (dmsl==1)
		{
			kfgssq="3";
		}
		else if (fgssl==1)
		{
			kfgssq="4";
		}
		else{
			kfgssq="5";
		}

		if (kfgssq.equals("3"))//3：授权单个店面
		{
			String yhdwbh=null;
			String yhdwlx=null;
			String yhdwmc=null;
			ls_sql="select sq_yhxx.dwbh,sq_dwxx.dwlx,sq_dwxx.dwmc";
			ls_sql+=" from  sq_yhxx,sq_dwxx";
			ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_yhxx.ygbh='"+ygbh[i]+"'";
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

			if (!dwbh.equals(yhdwbh) && yhdwlx.equals("F2"))
			{
				conn.rollback();
				out.println("错误！您选择了『授权单个店面』，确没有选择该用户所属部门："+yhdwmc);
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