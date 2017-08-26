<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String[] xh=request.getParameterValues("xhbox");

Connection conn = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
	}
	rs.close();
	ps.close();
	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1：未完成；2：完成；3：业绩结转
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("错误！客户已签单，不能再修改报价");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("错误！客户签单失败，不能再修改报价");
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
		ls_sql+=" FROM bj_bjxmmx";
		ls_sql+=" where xh="+xh[i];
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

		
		ls_sql="delete from bj_gclmx ";
		ls_sql+=" where xmbh='"+xmbh+"'";
		ls_sql+=" and khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		ls_sql="delete from bj_khglfxb ";
		ls_sql+=" where xmbh=(select xmbh from bj_bjxmmx where xh="+xh[i]+")";
		ls_sql+=" and khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		
		ls_sql="delete from bj_khglxmb ";
		ls_sql+=" where xmbh='"+xmbh+"'";
		ls_sql+=" and khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from bj_bjxmmx ";
		ls_sql+=" where  xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	//调整序号，删除中间空号
	int pxxh=0;
	String lsxh=null;
	ls_sql="SELECT xh";
	ls_sql+=" FROM bj_bjxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xmpx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lsxh=rs.getString(1);

		pxxh++;

		ls_sql="update bj_bjxmmx set xmpx="+pxxh+" where khbh='"+khbh+"' and xh="+lsxh;
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();


	//初始化
	dzbj.Tzk tzk=new dzbj.Tzk();
	//更新报价折扣
	tzk.updateBjZkl(conn,khbh,"yz");

	//更新其它收费项目，调整收费百分比
	dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
	dzbj.updateSfxm(conn,khbh,"csrj");

	//获取电子报价金额
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");

	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
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