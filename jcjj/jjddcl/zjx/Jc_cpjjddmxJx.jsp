<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");
String ddbh=request.getParameter("ddbh");
String[] cpjjbh=request.getParameterValues("cpjjbh");
String[] xslstr=request.getParameterValues("xsl");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	String clzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  jc_jjzjx";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (!clzt.equals("00"))//00：录入未完成
	{
		out.println("错误！增减项已完成，不能再录入");
		return;
	}

	conn.setAutoCommit(false);

	for (int i=0;i<cpjjbh.length ;i++ )
	{
		int sl=0;

		try{
			if (!(xslstr[i].equals("")))  sl=Integer.parseInt(xslstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[减项数量]类型转换发生意外:"+e);
			return;
		}

		int ysl=0;
		ls_sql="select zjhsl";
		ls_sql+=" from  jc_cpjjddmx";
		ls_sql+=" where  ddbh='"+ddbh+"' and cpjjbh='"+cpjjbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ysl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (sl<0)//减项
		{
			if (ysl<sl*-1)
			{
				conn.rollback();
				out.println("<BR>[减项数量]错误！不能大于[目前数量]："+ysl);
				return;
			}
		}


		int xsl=ysl+sl;

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  jc_cpjjzjxmx";
		ls_sql+=" where  zjxxh='"+zjxxh+"' and cpjjbh='"+cpjjbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();


		if (count>0)//已选增减项
		{
			ls_sql="update jc_cpjjzjxmx set xsl="+xsl;
			ls_sql+=" where  zjxxh='"+zjxxh+"' and cpjjbh='"+cpjjbh[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="insert into jc_cpjjzjxmx (zjxxh,cpjjbh,ddbh,lx,ysl,xsl)";
			ls_sql+=" values('"+zjxxh+"','"+cpjjbh[i]+"','"+ddbh+"','1',"+ysl+","+xsl+")  ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

	}

	ls_sql="delete from jc_cpjjzjxmx ";
	ls_sql+=" where  zjxxh='"+zjxxh+"' and xsl=ysl ";
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>