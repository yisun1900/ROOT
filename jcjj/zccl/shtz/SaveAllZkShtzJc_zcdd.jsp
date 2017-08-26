<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yhmc=(String)session.getAttribute("yhmc");

String[] ddbh=request.getParameterValues("ddbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String clzt=null;
	String ppbm=null;

	conn.setAutoCommit(false);


	for (int i=0;i<ddbh.length ;i++ )
	{
		ls_sql =" select khbh,clzt,ppbm";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			clzt=rs.getString("clzt");
			ppbm=rs.getString("ppbm");
		}
		rs.close();
		ps.close();

		if (!clzt.equals("15"))
		{
			conn.rollback();
			out.println("<BR>错误，存盘失败！订单状态不正确："+ddbh[i]);
			return;
		}

		double zcfk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23' and gysbh='"+ppbm+"'";//21:木门；22:橱柜；23:主材；24：家具
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zcfk=rs.getDouble(1);
		}
		rs.close();
		ps.close();


		//已确认的该品牌合同＋增建项金额
		double qrhkze=0;
		double qrzjhze=0;
		ls_sql="select  sum(hkze),sum(zjhze)";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"' and ppbm='"+ppbm+"'";
		ls_sql+=" and  jc_zcdd.clzt>='09' and clzt<='30'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qrhkze=rs.getDouble(1);
			qrzjhze=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		if ( zcfk < (qrhkze+qrzjhze-11))
		{
			conn.rollback();
			out.println("["+ddbh[i]+"]错误！付款不足，不能送货！");
			out.println("<BR>实付款＝￥"+zcfk);
			out.println("<BR>该品牌累计订货＝￥"+(qrhkze+qrzjhze)+"，应补交货款＝￥"+(qrhkze+qrzjhze-zcfk));
			return ;
		}

		ls_sql="update jc_zcdd set tzshr=?,tzshsj=SYSDATE,ddshbz='3',clzt='17'";
		ls_sql+=" where ddbh='"+ddbh[i]+"' and  clzt='15' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yhmc);
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
