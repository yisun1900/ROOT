<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String[] clbm=request.getParameterValues("clbm");
String[] getrkxh=request.getParameterValues("rkxh");
String[] hwbh =request.getParameterValues("hwbh");//入库货位
String[] hjbh =request.getParameterValues("hjbh");//入库货架


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
		out.print("错误！入库单已提交，不能再修改！");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		//检查货架
		if (cf.GB2Uni(hjbh[i]).equals(""))
		{
			conn.rollback();
			out.print("<BR>第【"+(i+1)+"】行错误！材料编码【"+clbm[i]+"】入库货架不能为空！");
			return;
		}

		ls_sql="update jxc_rkmx set hjbh=?,hwbh=? ";
		ls_sql+=" where rkph='"+rkph+"' and rkxh='"+getrkxh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cf.GB2Uni(hjbh[i]));
		ps.setString(2,cf.GB2Uni(hwbh[i]));
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功！");
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>