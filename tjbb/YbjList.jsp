<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
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
  <B>可参观样板间列表<BR>
  (可参观截止时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="3%">序号</td>
  <td  width="5%">客户姓名</td>
  <td  width="5%">工长 </td>
  <td  width="5%">设计师</td>
  <td  width="19%">施工地址</td>
  <td  width="5%">户型</td>
  <td  width="12%">工艺做法</td>
  <td  width="6%">工程签约额</td>
  <td  width="13%">参观期限</td>
</tr>
<%
	String all=null;


	ls_sql=" SELECT '',khxm,sgdmc,sjs,fwdz,hxmc,ysmc||'+'||czmc,qye,TO_CHAR(ybjdjsj,'YYYY-MM-DD')||'至'||TO_CHAR(ybjyxq,'YYYY-MM-DD')";
	ls_sql+=" FROM crm_khxx,sq_sgd,dm_hxbm,dm_ysbm,dm_czbm";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.hxbm=dm_hxbm.hxbm(+)";
	ls_sql+=" and crm_khxx.ysbm=dm_ysbm.ysbm(+) and crm_khxx.czbm=dm_czbm.czbm(+)";
	ls_sql+=" and ybjyxq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and ybjyxq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" order by ybjyxq";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
	pageObj.printFoot();

%>
</table>


</body>
</html>