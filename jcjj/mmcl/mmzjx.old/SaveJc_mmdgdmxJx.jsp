<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] xh=request.getParameterValues("xh");
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double mmzjxje=0;
double zjxze=0;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<xh.length ;i++ )
	{
		ls_sql="update jc_mmdgdmx set jxbz='Y'";
		ls_sql+=" where xh="+xh[i]+" and jxbz='N'";
		ps= conn.prepareStatement(ls_sql);
		if (ps.executeUpdate()!=1)
		{
			conn.rollback();
			out.print("存盘失败,序号为【"+xh[i]+"】该项不存在，或已被减项");
			return;
		}
		ps.close();

		ls_sql="insert into jc_mmzjxmx ( xh,yddbh,zjxxh) ";
		ls_sql+=" values ( ?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,xh[i]);
		ps.setString(2,yddbh);
		ps.setString(3,zjxxh);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="select sum(dj*sl)";
	ls_sql+=" from  jc_mmdgdmx";
	ls_sql+=" where yddbh='"+yddbh+"' and xh in(select xh from jc_mmzjxmx where yddbh='"+yddbh+"' and zjxxh="+zjxxh+")";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmzjxje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select wjzjxje+blzjxje+"+mmzjxje;
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
	
	ls_sql="update jc_mmzjx set mmzjxje=?,zjxze=?";
	ls_sql+=" where  (yddbh='"+yddbh+"' and zjxxh="+zjxxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,mmzjxje);
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
	alert("存盘成功！木门减项金额=<%=mmzjxje%>，减项总额=<%=zjxze%>");
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