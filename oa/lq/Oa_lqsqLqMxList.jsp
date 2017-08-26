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
	String wheresql="";

	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>办公用品领取明细(<%=sjfw%>---<%=sjfw2%>)</B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">单位</td>
	<td  width="6%">申领人</td>
	<td  width="12%">办公用品</td>
	<td  width="5%">单价</td>
	<td  width="5%">计划数量</td>
	<td  width="7%">金额</td>
	<td  width="9%">申请日期</td>
	<td  width="10%">计划领取日期</td>
	<td  width="7%">领取状态</td>
	<td  width="5%">实领数量</td>
	<td  width="7%">金额</td>
	<td  width="5%">办理人</td>
	<td  width="10%">领取时间</td>
</tr>
<%
	int[] mark={3,1,1,1,2,2,4,4,4,2,2,4,4};//设置显示风格参数
	//0:空;1：合并列，无小计；2：数值列，需小计、总计；3：合并列，有小计；4：不合并列；5：列名在小计中显示
	
	ls_sql="SELECT sq_dwxx.dwmc,oa_lqsq.slr as slr,oa_bgypbm.bgypmc,TO_CHAR(dj) dj,oa_lqsq.jhlqsl as oa_lqsq_jhlqsl,oa_lqsq.jhlqsl*dj jhje,oa_lqsq.lrrq as lrrq,oa_lqsq.jhlqrq as oa_lqsq_jhlqrq, DECODE(oa_lqsq.lqzt,'N','未领取','Y','已领取') as oa_lqsq_lqzt,oa_lqsq.slqsl as oa_lqsq_slqsl,oa_lqsq.slqsl*dj sjje,oa_lqsq.blr as oa_lqsq_blr,oa_lqsq.lqsj as oa_lqsq_lqsj";
	ls_sql+=" FROM oa_bgypbm,oa_lqsq,sq_dwxx  ";
    ls_sql+=" where oa_lqsq.dwbh=sq_dwxx.dwbh and oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
    ls_sql+=" and lqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
    ls_sql+=" and lqsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
	ls_sql+=" order by sq_dwxx.dwmc,oa_lqsq.slr,oa_lqsq.bgypbm";
	so.addData(ls_sql);

	//输出数据
	so.outData(out,mark);
%> 

</body>
</html>