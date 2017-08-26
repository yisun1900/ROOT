<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String htshsj=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}


	htshsj=request.getParameter("htshsj");
	if (htshsj!=null)
	{
		if (!(htshsj.equals("")))	wheresql+="  and (crm_khxx.htshsj>=TO_DATE('"+htshsj+"','YYYY/MM/DD'))";
	}
	htshsj=request.getParameter("htshsj2");
	if (htshsj!=null)
	{
		if (!(htshsj.equals("")))	wheresql+="  and (crm_khxx.htshsj<=TO_DATE('"+htshsj+"','YYYY/MM/DD'))";
	}


	ls_sql="SELECT rownum,dwmc,zf,zs,TO_CHAR(pjf)";
	ls_sql+=" from (";
	ls_sql+=" SELECT dwmc,sum(100-htshdf) zf,count(*) zs,sum(100-htshdf)/count(*) pjf";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and htshbz='Y'";
    ls_sql+=wheresql;
    ls_sql+=" group by crm_khxx.dwbh,dwmc ";
    ls_sql+=" order by pjf desc";
	ls_sql+=" )";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//设置每页显示记录数
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	spanColHash.put("htshdf","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<div align="center">合同审核平均分排名</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">排名</td>
	<td  width="40%">店面</td>
	<td  width="20%">总分</td>
	<td  width="15%">审核总数</td>
	<td  width="15%">平均分</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
	pageObj.printSum();
%> 
</table>

</body>

</html>