<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String[] khbh = request.getParameterValues("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		String zjxxh=null;

		ls_sql="select zjxxh";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zjxxh=rs.getString(1);
		}
		else{
			conn.rollback();
			out.println("错误！客户信息不存在："+khbh[i]);
			return;
		}
		rs.close();
		ps.close();

		if (zjxxh!=null)
		{
			conn.rollback();
			out.println("错误！客户有过增减项不能重做报价："+khbh[i]);
			return;
		}

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  crm_czbjjl";
		ls_sql+=" where  khbh='"+khbh[i]+"' and sfyzczbj='1'";
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
			out.println("错误！已经授权重做报价，客户："+khbh[i]);
			return;
		}

		ls_sql="insert into crm_czbjjl(khbh,pzczbjsj,pzczbjr,sfyzczbj) ";
		ls_sql+=" values('"+khbh[i]+"',SYSDATE,'"+yhmc+"','1')";
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
	out.print("Exception: " + e);
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
