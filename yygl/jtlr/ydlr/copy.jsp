<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<% 
String yhmc=(String)session.getAttribute("yhmc");
String zqs = cf.GB2Uni(request.getParameter("zqs"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try
{	
	conn=cf.getConnection();


	//查询日期
	int newzqs=0;
	ls_sql="SELECT zqs";
	ls_sql+=" FROM yy_rqsd ";
	ls_sql+=" order by yy_rqsd_bzs desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		newzqs=rs.getInt("zqs");
	}
	rs.close();
	ps.close();
	

  	//是否之前已经录入过 
	int count=0;
    ls_sql="SELECT count(*)";
	ls_sql+=" FROM YY_SJ ";
	ls_sql+=" where zqs='"+newzqs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		count=rs.getInt(1);
    }
    rs.close();
	ps.close();

	if (count>0)
	{
		out.println("你已经录入了数据，请到【维护】中进行修改或增加！");
		return;

	}

	ls_sql =" insert into yy_sj ( zqs,yy_sj_fgs,yy_sjzky_mbkh,yy_sjzky_sqdj,yy_sjsjb_sjf,yy_sjsjb_tqsjf,yy_sjsjb_gccz,yy_sjsjb_tqgccz,yy_sjjjb_byjh,yy_sjjjb_qntq,yy_sjscb_mbkh,yy_sjwxb_mbkh,yy_sjqtqd_mbkh,yy_sjscb_sqdj,yy_sjwxb_sqdj,yy_sjqtqd_sqdj,lrr,yy_sj_lrsj )";
	ls_sql+=" select       "+newzqs+",yy_sj_fgs,yy_sjzky_mbkh,yy_sjzky_sqdj,yy_sjsjb_sjf,yy_sjsjb_tqsjf,yy_sjsjb_gccz,yy_sjsjb_tqgccz,yy_sjjjb_byjh,yy_sjjjb_qntq,yy_sjscb_mbkh,yy_sjwxb_mbkh,yy_sjqtqd_mbkh,yy_sjscb_sqdj,yy_sjwxb_sqdj,yy_sjqtqd_sqdj,'"+yhmc+"',SYSDATE";
	ls_sql+=" from yy_sj";
	ls_sql+=" where zqs="+zqs;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	%>
	<SCRIPT language=javascript >
	<!--
		alert("复制成功！");
		window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
	
		
	
	
<html>
<head>
<title>月度指标和同期数据录入表</title>
</head>

<body>
</body>
</html>
