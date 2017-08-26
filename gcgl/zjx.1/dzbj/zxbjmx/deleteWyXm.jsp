<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String dqbm=null;
String xmbh=null;

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

	String bjjbbm=null;
	ls_sql="SELECT bjjb";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=rs.getString(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	String sfbxx="";
	ls_sql="SELECT dqbm,xmbh,sfbxx";
	ls_sql+=" FROM bj_bjxmmxh ";
	ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
	ls_sql+=" and tcnxmbz='N'";//套餐内项目标志 Y：是；N：否
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		dqbm=rs1.getString("dqbm");
		xmbh=rs1.getString("xmbh");
		sfbxx=cf.fillNull(rs1.getString(1));

		ls_sql="delete from bj_khglfxbh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_gclmxh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();


		if (count==0)
		{
			if (!sfbxx.equals("1") && !sfbxx.equals("2"))//1：必报项；2：必列项；3：可选项；9：作废项
			{
				ls_sql="delete from bj_bjxmmxh ";
				ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="delete from bj_khglxmbh ";
				ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}

	}
	rs1.close();
	ps1.close();

	ls_sql="delete from bj_gclmxh ";
	ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh not in(select xmbh from bj_bjxmmxh where zjxxh='"+zjxxh+"' and khbh='"+khbh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	
	//调整序号，删除中间空号
	int pxxh=0;
	String lsxh=null;
	ls_sql="SELECT xh";
	ls_sql+=" FROM bj_bjxmmxh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
	ls_sql+=" order by xmpx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lsxh=rs.getString(1);

		pxxh++;

		ls_sql="update bj_bjxmmxh set xmpx="+pxxh+" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xh="+lsxh;
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

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
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>