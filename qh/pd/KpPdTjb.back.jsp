<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">施工队派单统计</font></B>
</CENTER>

<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">本期排名</td>
	<td  width="1%">施工队</td>
	<td  width="1%">总分</td>
	<td  width="1%">总分排名</td>
	<td  width="1%">上期排名</td>
	<td  width="1%">质保金</td>
	<td  width="1%">班组数</td>
	<td  width="1%">可接大单数</td>
	<td  width="1%">可接中单数</td>
	<td  width="1%">可接小单数</td>
	<td  width="1%">可接单总数</td>
	<td  width="1%">可接单总额</td>
	<td  width="1%">已接大单数</td>
	<td  width="1%">已接大单金额</td>
	<td  width="1%">已接中单数</td>
	<td  width="1%">已接中单金额</td>
	<td  width="1%">已接小单数</td>
	<td  width="1%">已接小单金额</td>
	<td  width="1%">已接单总数</td>
	<td  width="1%">已接单总额</td>
	<td  width="1%">欠接大单数</td>
	<td  width="1%">欠接中单数</td>
	<td  width="1%">欠接小单数</td>
	<td  width="1%">已完工数</td>
	<td  width="1%">在施工地数</td>
</tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String dwmc=null;
	int zbj=0;
	int bzs=0;
	int zf=0;
	int zfpm=0;
	int sqpm=0;
	int bqpm=0;
	int kjdds=0;
	int kjzds=0;
	int kjxds=0;
	int kjdzs=0,kjdze=0,yjdds=0,yjddje=0,yjzds=0,yjzdje=0,yjxds=0,yjxdje=0,ywgs=0,zsgds=0;

	int count=0;
	ls_sql="SELECT sgdmc,kp_sgdkpjg.zbj,kp_sgdkpjg.bzs,zf,zfpm,sqpm,bqpm,kjdds,kjzds,kjxds,kjdzs,kjdze,yjdds,yjddje,yjzds,yjzdje,yjxds,yjxdje,ywgs,zsgds ";
	ls_sql+=" FROM sq_sgd,kp_sgdkpjg,kp_kpjl  ";
    ls_sql+=" where kp_sgdkpjg.sgd=sq_sgd.sgd";
    ls_sql+=" and kp_sgdkpjg.kpjlh=kp_kpjl.kpjlh  and zxbz='Y'";
    ls_sql+=" order by kp_sgdkpjg.bqpm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		count++;
		dwmc=rs.getString("sgdmc");
		zbj=rs.getInt("zbj");
		bzs=rs.getInt("bzs");
		zf=rs.getInt("zf");
		zfpm=rs.getInt("zfpm");
		sqpm=rs.getInt("sqpm");
		bqpm=rs.getInt("bqpm");
		kjdds=rs.getInt("kjdds");
		kjzds=rs.getInt("kjzds");
		kjxds=rs.getInt("kjxds");

		if (count%2==1)
		{
			out.println("<tr  bgcolor=\"#FFFFFF\" align=\"center\">");
		}
		else{
			out.println("<tr  bgcolor=\"#E8E8FF\" align=\"center\">");
		}
%>

	<td><%=bqpm%></td>
	<td><%=dwmc%></td>
	<td><%=zf%></td>
	<td><%=zfpm%></td>
	<td><%=sqpm%></td>
	<td><%=zbj%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
</tr>
	
<%	
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
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

</table>
</body>
</html>