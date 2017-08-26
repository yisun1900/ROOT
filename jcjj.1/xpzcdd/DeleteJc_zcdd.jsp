<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String clzt=null;
	String xclbz=null;
	String ddlx=null;
	String sfjs=null;
	
	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		ls_sql =" select khbh,clzt,xclbz,ddlx,sfjs";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			clzt=rs.getString("clzt");
			xclbz=rs.getString("xclbz");
			ddlx=cf.fillNull(rs.getString("ddlx"));
			sfjs=cf.fillNull(rs.getString("sfjs"));
		}
		else{
			conn.rollback();
			out.println("<BR>错误，删除失败！订单【"+ddbh[i]+"】不存在");
			return;
		}
		rs.close();
		ps.close();

		//检查客户结算＋＋＋＋＋＋＋＋＋＋＋＋开始
		String getkhjsbz="";
		ls_sql=" select khjsbz ";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getkhjsbz=cf.fillNull(rs.getString("khjsbz"));
		}
		rs.close();
		ps.close();

		if (!getkhjsbz.equals("N") && !getkhjsbz.equals("") && !getkhjsbz.equals("3"))//N：未结算；Y：已结算；2：审批同意；3：审批不同意
		{
			conn.rollback();
			out.println("<font color=\"#FF0000\">错误！客户已结算</font>:"+getkhjsbz);
			return;
		}
		//检查客户结算＝＝＝＝＝＝＝＝＝＝＝＝＝结束

		if (!clzt.equals("09"))
		{
			conn.rollback();
			out.println("<BR>错误，删除失败！订单【"+ddbh[i]+"】状态不正确");
			return;
		}

		if (!sfjs.equals("N") && !sfjs.equals("C"))//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款
		{
			conn.rollback();
			out.println("<BR>错误，删除失败！订单【"+ddbh[i]+"】已结算");
			return;
		}

		ls_sql="delete from jc_zczjxmx ";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_zczjx ";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_zcddmx ";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_zcdd ";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//集成订单
		ls_sql="delete from jc_jcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (ddlx.equals("E"))//E：散客
		{
			ls_sql="delete from crm_zxkhxx";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="delete from crm_khxx";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		//删除付款信息
		ls_sql="delete from cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and  bz='选配主材主材录入'";
		ls_sql+=" and  fklxbm='23'";//55：主材代金券;62：主材预付款;23:主材
		ls_sql+=" and  ddbh='"+ddbh[i]+"'";
		ls_sql+=" and  zckx in('55','62','67')";
		ls_sql+=" and scbz='N'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and  bz='选配主材主材录入'";
		ls_sql+=" and  fklxbm='23'";//55：主材代金券;62：主材预付款;23:主材
		ls_sql+=" and  ddbh='"+ddbh[i]+"'";
		ls_sql+=" and zffs='16'";//16：纸质材料券
		ls_sql+=" and scbz='N'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and  bz='选配主材主材录入'";
		ls_sql+=" and  fklxbm in('55','62','67')";
		ls_sql+=" and  zckx='23'";//55：主材代金券;62：主材预付款;23:主材
		ls_sql+=" and  zcddbh='"+ddbh[i]+"'";
		ls_sql+=" and scbz='N'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

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