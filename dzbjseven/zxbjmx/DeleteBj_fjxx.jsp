<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String[] oldjgwzbm=request.getParameterValues("xhbox");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
	String getbjjb="";
	ls_sql="SELECT zxzt,bjjb";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		getbjjb=rs.getString("bjjb");
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


	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+getbjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);


	for (int i=0;i<oldjgwzbm.length ; i++)
	{
		ls_sql="delete from bj_fjxx where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		if (ps.executeUpdate()!=1)
		{
			ps.close();

			conn.rollback();
			out.println("<BR>存盘失败！不存在的房间名称["+cf.GB2Uni(oldjgwzbm[i])+"]");
			return;
		}
		ps.close();

		ls_sql="delete from bj_gclmx where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (lx.equals("2"))//1：非套餐；2：套餐
		{
			ls_sql="delete from tc_csrjkhcgjmj ";
			ls_sql+=" where khbh='"+khbh+"'";
			ls_sql+=" and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="delete from tc_csrjkhlkbjmj ";
			ls_sql+=" where khbh='"+khbh+"'";
			ls_sql+=" and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="delete from tc_csrjkhczjmj ";
			ls_sql+=" where khbh='"+khbh+"'";
			ls_sql+=" and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="delete from tc_csrjkhjjjmj ";
			ls_sql+=" where khbh='"+khbh+"'";
			ls_sql+=" and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="delete from tc_csrjkhzcqd ";
			ls_sql+=" where khbh='"+khbh+"'";
			ls_sql+=" and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}


	}


	//调整序号
	int pxxh=0;
	String lsjgwzbm=null;
	ls_sql="SELECT jgwzbm";
	ls_sql+=" FROM bj_fjxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xuhao";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lsjgwzbm=rs.getString(1);

		pxxh++;

		ls_sql="update bj_fjxx set xuhao="+pxxh+" where khbh='"+khbh+"' and jgwzbm='"+lsjgwzbm+"'";
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
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>