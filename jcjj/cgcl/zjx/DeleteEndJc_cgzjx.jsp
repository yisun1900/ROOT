<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] zjxxh = request.getParameterValues("zjxxh");

String ddbh=null;

String clzt=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<zjxxh.length ;i++ )
	{
		ls_sql="select ddbh,clzt";
		ls_sql+=" from  jc_cgzjx";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ddbh=rs.getString("ddbh");
			clzt=rs.getString("clzt");
		}
		rs.close();
		ps.close();

		if (!clzt.equals("01"))
		{
			conn.rollback();
			out.println("<BR>错误！增减项未完成：增减项序号="+zjxxh[i]);
			return;
		}


		ls_sql="update jc_cgzjx set clzt='00',gtzjxje=0,tmzjxje=0,wjzjxje=0,dqzjxje=0,zjxze=0,zqgtzjxje=0,zqtmzjxje=0,zqwjzjxje=0,zqdqzjxje=0,zqzjxze=0";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


	//计算增减金额
		double gtzjxje=0;
		double tmzjxje=0;
		double wjzjxje=0;
		double dqzjxje=0;
		double zjxze=0;

		double zqgtzjxje=0;
		double zqtmzjxje=0;
		double zqwjzjxje=0;
		double zqdqzjxje=0;
		double zqzjxze=0;

	//修改订单
		ls_sql="select sum(gtzjxje),sum(tmzjxje),sum(wjzjxje),sum(dqzjxje),sum(zjxze)   ,sum(zqgtzjxje),sum(zqtmzjxje),sum(zqwjzjxje),sum(zqdqzjxje),sum(zqzjxze)";
		ls_sql+=" from  jc_cgzjx";
		ls_sql+=" where ddbh='"+ddbh+"' and clzt!='00'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gtzjxje=rs.getDouble(1);
			tmzjxje=rs.getDouble(2);
			wjzjxje=rs.getDouble(3);
			dqzjxje=rs.getDouble(4);
			zjxze=rs.getDouble(5);

			zqgtzjxje=rs.getDouble(6);
			zqtmzjxje=rs.getDouble(7);
			zqwjzjxje=rs.getDouble(8);
			zqdqzjxje=rs.getDouble(9);
			zqzjxze=rs.getDouble(10);
		}
		rs.close();
		ps.close();

		ls_sql="update jc_cgdd set gtzjje=gtbfje+?,tmzjje=tmbfje+?,wjzjje=wjhtze+?,dqzjje=dqhtze+?,zjhze=htze+?";
		ls_sql+=" ,zqgtzjje=zqgtbfje+?,zqtmzjje=zqtmbfje+?,zqwjzjje=zqwjhtze+?,zqdqzjje=zqdqhtze+?,zqzjhze=wdzje+?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,gtzjxje);
		ps.setDouble(2,tmzjxje);
		ps.setDouble(3,wjzjxje);
		ps.setDouble(4,dqzjxje);
		ps.setDouble(5,zjxze);

		ps.setDouble(6,zqgtzjxje);
		ps.setDouble(7,zqtmzjxje);
		ps.setDouble(8,zqwjzjxje);
		ps.setDouble(9,zqdqzjxje);
		ps.setDouble(10,zqzjxze);
		ps.executeUpdate();
		ps.close();

		//集成订单
		ls_sql="delete from jc_jcdd ";
		ls_sql+=" where  gjz='"+zjxxh[i]+"' and lx='2' and czlx='2'";
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
		if (conn != null) cf.close(conn); 
	}
}
%>