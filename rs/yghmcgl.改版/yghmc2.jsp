<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>员工通讯录</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<center>员工通讯录</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="20%">部门名称</td>
	<td  width="10%">工号</td>
	<td  width="15%">姓名</td>
	<td  width="15%">职务</td>
	<td  width="20%">手机</td>
	<td  width="20%">办公电话</td>
</tr>
<%
	String getygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";
	String sq_yhxx_yhmc=null;
	String xzzwbm=null;
	String ssfgs=null;
	String sq_yhxx_dwbh=null;

	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+ssfgs+"')";

	sq_yhxx_dwbh=request.getParameter("sq_yhxx_dwbh");
	if (sq_yhxx_dwbh!=null)
	{
		sq_yhxx_dwbh=cf.GB2Uni(sq_yhxx_dwbh);
		if (!(sq_yhxx_dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+sq_yhxx_dwbh+"')";
	}
	sq_yhxx_yhmc=request.getParameter("sq_yhxx_yhmc");
	if (sq_yhxx_yhmc!=null)
	{
		sq_yhxx_yhmc=cf.GB2Uni(sq_yhxx_yhmc);
		if (!(sq_yhxx_yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc like '%"+sq_yhxx_yhmc+"%')";
	}
	xzzwbm=request.getParameter("xzzwbm");
	if (xzzwbm!=null)
	{
		xzzwbm=cf.GB2Uni(xzzwbm);
		if (!(xzzwbm.equals("")))	wheresql+=" and  (sq_yhxx.xzzwbm='"+xzzwbm+"')";
	}

	String yhjs=(String)session.getAttribute("yhjs");
	String fgsbh=(String)session.getAttribute("ssfgs");


	ls_sql="SELECT sq_dwxx.dwmc||'（'||dwdh||'）' as sq_dwxx_dwmc,sq_yhxx.bianhao,sq_yhxx.yhmc,xzzwbm,sq_yhxx.dh,sq_yhxx.bgdh";
	ls_sql+=" FROM sq_yhxx,sq_dwxx  ";
    ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh  and sq_yhxx.sfzszg not in('S','T')";
    ls_sql+=" and sq_yhxx.dhsfgb!='9'";
    ls_sql+=wheresql;

/*
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+getygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_yhxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+getygbh+"' )";
	}
*/
	ls_sql+=" and ((sq_yhxx.yhdlm is null) OR (sq_yhxx.yhdlm not in(select yhdlm from sq_yhssz where yhzbh='000000')))";

	
    ls_sql+=" order  by sq_dwxx.xuhao,sq_dwxx.ssfgs,sq_dwxx.dwbh,sq_yhxx.xuhao,sq_yhxx.yhmc";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

	//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sq_dwxx_dwmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表



	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>
</body>



</html>
