<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String tzjlh=cf.GB2Uni(request.getParameter("tzjlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String[] xmflbm=request.getParameterValues("xmflbm");
String[] zkStr=request.getParameterValues("zk");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from crm_bfxmtzk ";
	ls_sql+=" where tzjlh='"+tzjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<xmflbm.length ;i++ )
	{
		if (xmflbm[i].equals(""))
		{
			continue;
		}


		if (zkStr[i].trim().equals(""))
		{
			conn.rollback();
			out.println("<BR>项目分类"+cf.GB2Uni(xmflbm[i])+"错误！[折扣]不能为空");
			return;
		}

		double zk=0;
		try{
			zk=Double.parseDouble(zkStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>项目分类"+cf.GB2Uni(xmflbm[i])+"错误！[折扣]不是数字类型："+zkStr[i].trim());
			return;
		}

		if (zk<0 || zk>10)
		{
			conn.rollback();
			out.println("错误！[折扣]应该在0和10之间！");
			return;
		}

		ls_sql="insert into crm_bfxmtzk (tzjlh,khbh,xmflbm,zk) ";
		ls_sql+=" values(?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,tzjlh);
		ps.setString(2,khbh);
		ps.setString(3,cf.GB2Uni(xmflbm[i]));
		ps.setDouble(4,zk);
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