<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String psph=cf.GB2Uni(request.getParameter("psph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//检查入库单状态
	String rkdzt=null;
	ls_sql="select rkdzt ";
	ls_sql+=" from  jxc_rkd ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rkdzt=rs.getString("rkdzt");
	}
	else{
		out.print("错误！入库单["+rkph+"]不存在！");
		return;
	}
	rs.close();
	ps.close();

	if (!rkdzt.equals("0"))//0：未提交；1：等待审核；2：等待入库；3：已入库；4：已结算；6：等待总部审核
	{
		out.print("错误！入库单已提交，不能再录入数据！");
		return;
	}

	//检查供应商订单状态
	String psdzt=null;
	ls_sql="select psdzt ";
	ls_sql+=" from  jxc_clpsd ";
	ls_sql+=" where psph='"+psph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		psdzt=rs.getString("psdzt");
	}
	else{
		out.print("错误！退料单批号["+psph+"]不存在！");
		return;
	}
	rs.close();
	ps.close();

	if (!psdzt.equals("2"))//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
	{
		out.print("错误！退料单已入库！");
		return;
	}


	//查询已入库产品数量
	int rkxh=0;
	ls_sql="select max(rkxh) ";
	ls_sql+=" from  jxc_rkmx";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rkxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	//写入入库明细
	ls_sql="insert into jxc_rkmx ( rkph,rkxh,clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm ,rksl   ,rkj ,rkje       ,zcpsl   ,scrq,scph,hjbh,hwbh,ccpsl,wldssl,thpsl,bfpsl,ccpzkl,zcpfkcsl,ccpfkcsl,bfpfkcsl ) ";
	ls_sql+=" select              ?,?+rownum,clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm ,-1*pssl,cbj ,-1*pssl*cbj,-1*pssl ,?   ,?   ,?   ,?   ,0,0,0,0,10,0,0,0 ";
	ls_sql+=" from  jxc_clpsmx";
	ls_sql+=" where psph='"+psph+"'";
	ls_sql+=" order by psxh";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,rkph);
	ps.setInt(2,rkxh);
	ps.setDate(3,null);
	ps.setString(4,"");
	ps.setString(5,"");
	ps.setString(6,"");
	ps.executeUpdate();
	ps.close();


	//出库单
	ls_sql="update jxc_clpsd set psdzt='3'";//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
	ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jxc_clpsmx set cksl=pssl";
	ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);

	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>