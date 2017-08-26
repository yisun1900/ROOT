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

String clzt=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		ls_sql="select clzt";
		ls_sql+=" from  jc_cgdd";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clzt=rs.getString("clzt");
		}
		rs.close();
		ps.close();
		if (!clzt.equals("13"))
		{
			conn.rollback();
			out.println("错误，删除失败！订单【"+ddbh[i]+"】处理状态不正确");
			return;
		}

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  jc_cgzjx";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
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
			out.println("错误，删除失败！订单【"+ddbh[i]+"】已发生过增减项，不能再删除");
			return;
		}

		ls_sql="update jc_cgdd set qhtsj=null,jhazrq=null,kjxsj=null,qhtr=null,htbz=null,sdks=null,tmpp=null,xtbc=null,blcz=null,jiaolian=null";
		ls_sql+=" ,gtbfje=0,tmbfje=0,wjhtze=0,dqhtze=0,wdzje=0,htze=0,gtzjje=0,tmzjje=0,wjzjje=0,dqzjje=0,zjhze=0,cgzkl=10,dzyy=null,clzt=lsclzt1";
		ls_sql+=" where  ddbh='"+ddbh[i]+"' and clzt='13'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_cgddmx ";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_cgwjddmx";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_cgdqddmx";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_cgdtmx";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		//集成订单
		ls_sql="delete from jc_jcdd ";
		ls_sql+=" where  ddbh='"+ddbh[i]+"' and lx='2'";
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
	out.print("SQL: " + ls_sql);
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