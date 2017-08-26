<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String jhbh=null;
jhbh=request.getParameter("pxjhbh");
String pxjhmc=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select pxjhmc ";
	ls_sql+=" from  rs_pxjh";
	ls_sql+=" where  (pxjhbh='"+jhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pxjhmc=cf.fillNull(rs.getString("pxjhmc"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
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
<%
	String wheresql="";
	String pxjhbh=null;
	pxjhbh=request.getParameter("pxjhbh");

	ls_sql="SELECT pxmxbh,DECODE(pxlx,'0','内训','1','外训') pxlx,rs_pxskxsbm.skxsmc skxs,rs_pxkclxbm.lxmc kclx,pxcd,pxrs,pxfy,pxjs,pxkssj,pxjssj,lrr,lrsj,pxkc,kcnr,bz  ";
	ls_sql+=" FROM rs_pxjhmx,rs_pxkclxbm,rs_pxskxsbm  ";
    ls_sql+=" where pxjhbh='"+pxjhbh+"' and rs_pxskxsbm.skxs=rs_pxjhmx.skxs and rs_pxkclxbm.kclx=rs_pxjhmx.kclx";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3"><%=pxjhmc%>：<%=pxjhbh%></font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">培训明细编号</td>
	<td  width="4%">培训类型</td>
	<td  width="4%">授课形式</td>
	<td  width="5%">课程类型</td>
	<td  width="12%">培训场地</td>
	<td  width="4%">培训人数</td>
	<td  width="4%">培训费用</td>
	<td  width="5%">培训讲师</td>
	<td  width="5%">培训开始时间</td>
	<td  width="5%">培训结束时间</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="11%">培训课程</td>
	<td  width="11%">课程内容</td>
	<td  width="16%">备注</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>