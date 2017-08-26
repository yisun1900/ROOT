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
	String wheresql="";
	String sjfw=null;
	String sjfw2=null;
	sjfw=request.getParameter("sjfw");
	if (sjfw!=null)
	{
		if (!(sjfw.equals("")))	wheresql+="  and (crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY/MM/DD'))";
	}
	sjfw2=request.getParameter("sjfw2");
	if (sjfw2!=null)
	{
		if (!(sjfw2.equals("")))	wheresql+="  and (crm_tsjl.slsj<=TO_DATE('"+sjfw2+"','YYYY/MM/DD'))";
	}
	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_tsjl.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_tsjl.dwbh='"+dwbh+"'";
	}

	ls_sql="SELECT b.dwmc dm,khxm,sjs,sgdmc sgd,zjy,tslxmc,tsnr,slsj,clqk,jasj,zzjgmc ";
	ls_sql+=" FROM crm_tsjl,dm_zzjgbm,dm_tslxbm,sq_sgd,sq_dwxx b,crm_tsclqk  ";
    ls_sql+=" where crm_tsjl.zzjgbm=dm_zzjgbm.zzjgbm(+) and crm_tsjl.tslxbm=dm_tslxbm.tslxbm and crm_tsjl.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_tsjl.tsjlh=crm_tsclqk.tsjlh and crm_tsclqk.dwbh=b.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by dm,crm_tsjl.tslxbm,slsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.alignStr[6]="align='left'";
	pageObj.alignStr[8]="align='left'";

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dm","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="2">客户投诉报修明细表(<%=sjfw%>--<%=sjfw2%>)</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">涉及部门</td>
	<td  width="5%">客户姓名</td>
	<td  width="5%">设计师</td>
	<td  width="5%">施工队</td>
	<td  width="5%">质检员</td>
	<td  width="7%">投诉报修类型</td>
	<td  width="28%">投诉报修内容</td>
	<td  width="8%">受理时间</td>
	<td  width="19%">处理情况</td>
	<td  width="8%">结案时间</td>
	<td  width="4%">最终结果</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>