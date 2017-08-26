<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();



	String ls_sql=null;
	String wheresql="";


	byte[] b=new byte[1024];

	out.println(request.getInputStream().readLine(b,0,11));
	
	String tj1=request.getParameter("tj1");
//	out.println(request.getReader());

	byte[] aa=tj1.getBytes();
	for (int i=0;i<aa.length ;i++ )
	{
		out.println(aa[i]);
	}

	String tj2=cf.GB2Uni(request.getParameter("tj2"));
	String tj3=cf.GB2Uni(request.getParameter("tj3"));
	String tj1name=cf.GB2Uni(request.getParameter("tj1name"));

	String tj2name=cf.GB2Uni(request.getParameter("tj2name"));
	String tj3name=cf.GB2Uni(request.getParameter("tj3name"));

	if (tj1name!=null)
	{
		if (!(tj1name.equals("")))
		{
			wheresql+=" and  ("+tj1name+"='"+tj1+"')";
		}
	}
	if (tj2name!=null)
	{
		if (!(tj2name.equals("")))
		{
			wheresql+=" and  ("+tj2name+"='"+tj2+"')";
		}
	}
	if (tj3name!=null)
	{
		if (!(tj3name.equals("")))
		{
			wheresql+=" and  ("+tj3name+"='"+tj3+"')";
		}
	}


	ls_sql="SELECT xz_mpyzsq.sqxh,DECODE(xz_mpyzsq.sfywc,'Y','是','N','否') as sfywc,xz_mpyzsq.sqrq,xz_mpyzsq.yqjfrq,xz_mpyzsq.yqsl,mpbb,wcsj,wcsl,dj,xz_mpyzsq.xm as xz_mpyzsq_xm,xz_mpyzsq.zw as xz_mpyzsq_zw,xz_mpyzsq.dh as xz_mpyzsq_dh,xz_mpyzsq.cz as xz_mpyzsq_cz,xz_mpyzsq.yx as xz_mpyzsq_yx,sq_dwxx.dwmc as xz_mpyzsq_dwbh,xz_mpyzsq.sqlrr,xz_mpyzsq.bz as xz_mpyzsq_bz    ";
	ls_sql+=" FROM xz_mpyzsq,sq_dwxx  ";
    ls_sql+=" where xz_mpyzsq.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by xz_mpyzsq.sqxh";
	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Xz_mpyzsqCxList.jsp","SelectCxXz_mpyzsq.jsp","","");
	pageObj.setPageRow(1000);
/*
//设置显示列
	String[] disColName={"sqxh","xz_mpyzsq_xm","xz_mpyzsq_zw","xz_mpyzsq_sj","xz_mpyzsq_dh","xz_mpyzsq_yx","xz_mpyzsq_bz","xz_mpyzsq_dwbh","xz_mpyzsq_sqrq"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">名片制作申请查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">申请序号</td>
	<td  width="3%">是否完成</td>
	<td  width="5%">申请日期</td>
	<td  width="5%">要求交付日期</td>
	<td  width="3%">要求数量</td>
	<td  width="5%">名片版本</td>
	<td  width="5%">完成时间</td>
	<td  width="3%">完成数量</td>
	<td  width="3%">单价</td>
	<td  width="4%">姓名</td>
	<td  width="5%">职务</td>
	<td  width="12%">电话</td>
	<td  width="8%">传真</td>
	<td  width="12%">邮箱</td>
	<td  width="8%">申请部门</td>
	<td  width="4%">申请录入人</td>
	<td  width="11%">备注</td>
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
