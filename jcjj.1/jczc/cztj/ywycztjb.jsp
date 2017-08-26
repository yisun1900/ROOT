<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>业务员产值统计<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="6%">排名</td>
  <td  width="9%">业务员</td>
  <td  width="20%">店面</td>
  <td  width="8%">签约数</td>
  <td  width="12%">工程签约额</td>
  <td  width="9%">平均单额</td>
  <td  width="9%">平米均价</td>
  <td  width="30%">总额 </td>
</tr>
<%
	String all=null;

	//获取总数
	ls_sql="SELECT max(sum(qye))";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.zt='2'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by ywy";

	all=cf.executeQuery(ls_sql);

	ls_sql=" SELECT rownum,ywy,dwmc,sl,qye,TO_CHAR(pjde),TO_CHAR(pmjj),tx";
	ls_sql+=" FROM (";
	ls_sql+=" SELECT ywy,dwmc,count(*) sl,sum(qye) qye,ROUND(sum(qye)/count(*)) pjde,ROUND(sum(qye)/sum(fwmj)) pmjj,'<A HREF=\"ViewYwycz.jsp?sjfw="+sjfw+"&sjfw2="+sjfw2+"&ywy='||crm_khxx.ywy||'\" target=\"_blank\"><img src=\"/images/ColuGif.gif\" width='||sum(qye)*200/"+all+"||' height=14></A>' as tx";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.zt='2' and ywy is not null";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by ywy,dwmc";
	ls_sql+=" order by qye desc";
	ls_sql+=" )";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.alignStr[7]="align='left'";
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
	pageObj.displayFoot();

%>
</table>


<P><b><font color="#0000CC">注意：此统计表以[签约日期]为准、而非[首付款日期]</font></b>
</body>
</html>