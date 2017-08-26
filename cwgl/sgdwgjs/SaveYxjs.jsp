<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh=request.getParameterValues("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{

		String gdjsjd=null;
		double wdzgce=0;
		double qye=0;

		double zqljzjx=0;
		double zhljzjx=0;
		double sfke=0;
		ls_sql="select gdjsjd,wdzgce,qye,zqljzjx,zhljzjx,sfke";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			wdzgce=rs.getDouble("wdzgce");
			qye=rs.getDouble("qye");
			zqljzjx=rs.getDouble("zqljzjx");
			zhljzjx=rs.getDouble("zhljzjx");
			sfke=rs.getDouble("sfke");

			gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		}
		rs.close();
		ps.close();

		if (!gdjsjd.equals("I") && !gdjsjd.equals("L"))//A:可以第一次拨工费
		{
			conn.rollback();
			out.println("<BR>！！！客户编号["+khbh[i]+"]错误，状态不正确，已拨付工费");
			return;
		}

		if (qye+zhljzjx-sfke>10)
		{
			conn.rollback();
			out.println("<BR>！！！客户编号["+khbh[i]+"]错误，客户欠款不能结算，签约额:"+qye+"、增减项:"+zhljzjx+"、实际发生额:"+cf.round(qye+zhljzjx,2)+"、实付款:"+sfke+"、欠款:"+cf.round(qye+zhljzjx-sfke,2));
			return;
		}

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_gcfxysjl  ";
		ls_sql+=" where crm_gcfxysjl.khbh='"+khbh[i]+"' and crm_gcfxysjl.ysjg='2' ";//'1','合格','2','不合格'
		ls_sql+=" order by crm_gcfxysjl.ysjlh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			conn.rollback();
			out.println("<BR>！！！客户编号["+khbh[i]+"]错误，验收未通过，不能拨工费");
			return;
		}

		ls_sql="update crm_khxx set gdjsjd='X'";//A:可以第一次拨工费
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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