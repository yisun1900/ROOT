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

	cwgl.Cwgl cwgl=new cwgl.Cwgl();

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		int sqjl=0;
		ls_sql="select count(*)";
		ls_sql+=" from cw_sgdjssqjl";
		ls_sql+=" where khbh='"+khbh[i]+"'  ";
		ls_sql+=" and zt='1'";//1：未拨工费；2：已拨工费
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sqjl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (sqjl>0)
		{
			conn.rollback();
			out.println("<BR>！！！有拨工费授权记录，还未拨工费，不能再授权");
			return;
		}

		String gdjsjd=null;
		double wdzgce=0;
		double qye=0;

		double zqljzjx=0;
		double zhljzjx=0;
		double cwsfke=0;
		ls_sql="select gdjsjd,wdzgce,qye,zqljzjx,zhljzjx,cwsfke";
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
			cwsfke=rs.getDouble("cwsfke");

			gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		}
		rs.close();
		ps.close();

		double khpck=0;
		double yqf=0;
		double jsyh=0;
		ls_sql="select khpck,yqf,jsyh";
		ls_sql+=" from crm_khqye";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khpck=rs.getDouble("khpck");
			yqf=rs.getDouble("yqf");
			jsyh=rs.getDouble("jsyh");
		}
		rs.close();
		ps.close();

		if (!gdjsjd.equals("F"))//E	第二次拨工费
		{
			conn.rollback();
			out.println("<BR>！！！客户编号["+khbh[i]+"]错误，状态不正确，已拨付工费");
			return;
		}

		double yfkze=cwgl.getAllFkje(khbh[i]);

		if (yfkze-jsyh-khpck-yqf-cwsfke>100)
		{
			conn.rollback();
			out.println("<BR>！！！客户编号["+khbh[i]+"]错误，客户欠款大于100元，不能结算，请走强制结算审批<P>应付款总额:"+yfkze+"<BR>结算优惠:"+jsyh+"、客户赔偿款:"+khpck+"、延期费:"+yqf+"<BR>实付款:"+cwsfke+"<P>欠款:"+cf.round(yfkze-jsyh-khpck-yqf-cwsfke,2));
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

		String setgdjsjd="X";//X	可以完工结算

		ls_sql="update crm_khxx set gdjsjd='"+setgdjsjd+"'";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_sgdjssqjl ";
		ls_sql+=" where  khbh='"+khbh[i]+"' and gdjsjd='"+setgdjsjd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		String sqr=(String)session.getAttribute("yhmc");
		String sqbm=(String)session.getAttribute("dwbh");

		ls_sql =" insert into cw_sgdjssqjl (khbh      ,gdjsjd      ,ygdjsjd      ,sqr      ,sqsj   ,sqbm      ,zt ,bz) ";
		ls_sql+="                    values('"+khbh[i]+"','"+setgdjsjd+"','"+gdjsjd+"','"+sqr+"',SYSDATE,'"+sqbm+"','1','')";
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