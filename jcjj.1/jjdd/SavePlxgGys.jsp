<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] ddbh=request.getParameterValues("ddbh");
String pdgc=cf.GB2Uni(request.getParameter("pdgc"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String pdgcmc=null;
	String ppmc=null;
	String gys=null;

	ls_sql="select gysmc,ppmc,gys";
	ls_sql+=" from  sq_gysxx";
	ls_sql+=" where  gysbh='"+pdgc+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		pdgcmc=rs.getString("gysmc");
		ppmc=rs.getString("ppmc");
		gys=rs.getString("gys");
	}
	rs.close();
	ps.close();

	if (pdgcmc==null)
	{
		out.println("！存盘失败，[工厂名称]为空。");
		return;
	}
	if (ppmc==null)
	{
		out.println("！存盘失败，[品牌]为空。");
		return;
	}
	if (gys==null)
	{
		out.println("！存盘失败，[供应商]为空。");
		return;
	}

	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		String khbh=null;
		String oldpdgcmc=null;
		ls_sql="select khbh,pdgcmc";
		ls_sql+=" from  jc_jjdd";
		ls_sql+=" where  ddbh='"+ddbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			oldpdgcmc=rs.getString("pdgcmc");
		}
		rs.close();
		ps.close();

		ls_sql="update jc_jjdd set pdgc=?,pdgcmc=?,jjgys=?,jjppmc=?";
		ls_sql+=" where  ddbh='"+ddbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,pdgc);
		ps.setString(2,pdgcmc);
		ps.setString(3,gys);
		ps.setString(4,ppmc);
		ps.executeUpdate();
		ps.close();

		ls_sql="update jc_jjzjx set pdgc=?,pdgcmc=?,jjgys=?,jjppmc=?";
		ls_sql+=" where  ddbh='"+ddbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,pdgc);
		ps.setString(2,pdgcmc);
		ps.setString(3,gys);
		ps.setString(4,ppmc);
		ps.executeUpdate();
		ps.close();

		//更新财务信息
		ls_sql="update cw_khfkjl set gysbh=?";
		ls_sql+=" where  khbh='"+khbh+"' and gysbh='"+oldpdgcmc+"' and fklxbm='24'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,pdgcmc);
		ps.executeUpdate();
		ps.close();

	}

 	conn.commit();

	out.println("<P><P>修改成功！");

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