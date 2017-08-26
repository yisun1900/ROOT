<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");
String[] xh=request.getParameterValues("xhbox");

Connection conn = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


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

	for (int i=0;i<xh.length ;i++ )
	{
		String xmbh=null;
		String sfbxx="";
		String tcnxmbz="";
		ls_sql="SELECT xmbh,sfbxx,tcnxmbz";
		ls_sql+=" FROM bj_bjxmmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xmbh=rs.getString("xmbh");
			sfbxx=cf.fillNull(rs.getString("sfbxx"));
			tcnxmbz=cf.fillNull(rs.getString("tcnxmbz"));
		}
		rs.close();
		ps.close();

		if (tcnxmbz.equals("Y"))//套餐内项目标志 Y：是；N：否
		{
			out.println("<BR>提醒！项目【"+xmbh+"】是套餐内项目，不能删除");
			continue;
		}


		if (sfbxx.equals("1"))//1：必报项；2：必列项；3：可选项；9：作废项
		{
			out.println("<BR>提醒！项目【"+xmbh+"】是必报项，不能删除");
			continue;
		}
		else if (sfbxx.equals("2"))//1：必报项；2：必列项；3：可选项；9：作废项
		{
			out.println("<BR>提醒！项目【"+xmbh+"】是必列项，不能删除");
			continue;
		}

		
		ls_sql="delete from bj_gclmxh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"'";
		ls_sql+=" and khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		ls_sql="delete from bj_khglfxbh ";
		ls_sql+=" where xmbh=(select xmbh from bj_bjxmmxh where zjxxh='"+zjxxh+"' and xh="+xh[i]+")";
		ls_sql+=" and zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		
		ls_sql="delete from bj_khglxmbh ";
		ls_sql+=" where xmbh='"+xmbh+"'";
		ls_sql+=" and zjxxh='"+zjxxh+"' and khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from bj_bjxmmxh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and  xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

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


/*
	//初始化
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//更新其它收费项目，调整收费百分比
	dzbj.updateSfxm(conn,khbh,"yz");
	//获取电子报价金额
	double dzbjze=dzbj.getAllBjje(conn,khbh,"yz");


	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();
*/


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
	out.print("<BR>SQL=" +ls_sql);
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