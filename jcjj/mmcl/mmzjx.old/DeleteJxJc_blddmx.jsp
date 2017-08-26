<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] lrxh=request.getParameterValues("lrxh");
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double blzjxje=0;
double zjxze=0;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<lrxh.length ;i++ )
	{
		ls_sql="update jc_blddmx set jxbz='N'";
		ls_sql+=" where lrxh="+lrxh[i]+" and jxbz='Y'";
		ps= conn.prepareStatement(ls_sql);
		if (ps.executeUpdate()!=1)
		{
			conn.rollback();
			out.print("存盘失败,序号为【"+lrxh[i]+"】该项不存在，或未被减项");
			return;
		}
		ps.close();

		ls_sql="delete from jc_blzjxmx ";
		ls_sql+=" where yddbh='"+yddbh+"' and zjxxh="+zjxxh+" and xh="+lrxh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	ls_sql="select sum(dj*sl)";
	ls_sql+=" from  jc_blddmx";
	ls_sql+=" where yddbh='"+yddbh+"' and lrxh in(select xh from jc_blzjxmx where yddbh='"+yddbh+"' and zjxxh="+zjxxh+")";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		blzjxje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select mmzjxje+wjzjxje+"+blzjxje;
	ls_sql+=" from  jc_mmzjx";
	ls_sql+=" where  (yddbh='"+yddbh+"' and zjxxh="+zjxxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxze=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	ls_sql="update jc_mmzjx set blzjxje=?,zjxze=?";
	ls_sql+=" where  (yddbh='"+yddbh+"' and zjxxh="+zjxxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,blzjxje);
	ps.setDouble(2,zjxze);
	ps.executeUpdate();
	ps.close();

	double zjxze1=0;
	double zjxze2=0;
	ls_sql="select sum(zjxze)";
	ls_sql+=" from  jc_mmzjx";
	ls_sql+=" where  yddbh='"+yddbh+"' and zjxbz='1'";//1：增项；2：减项
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxze1=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	ls_sql="select sum(zjxze)";
	ls_sql+=" from  jc_mmzjx";
	ls_sql+=" where  yddbh='"+yddbh+"' and zjxbz='2'";//1：增项；2：减项
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxze2=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	ls_sql="update jc_mmydd set zjxbz='Y',zxje=?,jxje=?";
	ls_sql+=" where  (yddbh='"+yddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zjxze1);
	ps.setDouble(2,zjxze2);
	ps.executeUpdate();
	ps.close();

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！玻璃减项金额=<%=blzjxje%>，减项总额=<%=zjxze%>");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + ls_sql);
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