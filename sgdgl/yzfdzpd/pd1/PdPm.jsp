<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">施工队派单统计</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="8%">施工队</td>
    <td  width="7%">施工队级别</td>
    <td  width="10%">质保金</td>
    <td  width="10%">客户满意度</td>
    <td  width="8%">班长</td>
    <td  width="7%">班长级别</td>
    <td  width="10%">可接单额最小值</td>
    <td  width="10%">可接单额最大值</td>
    <td  width="6%">工人数量</td>
    <td  width="6%">可用工人数量</td>
    <td  width="6%">目前在施工地数</td>
    <td  width="6%">最小在施工地数</td>
    <td  width="6%">最大在施工地数</td>

  </tr>
  <%	
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;


	ls_sql=" select sq_sgd.sgdmc,sq_sgd.sgdjbbm sgdjb,sq_sgd.zbj,sq_sgd.khmyd,sq_bzxx.bzmc,sq_bzxx.sgdjbbm bzjb,sq_bzxx.kjdzxz,sq_bzxx.kjdzdz,sq_bzxx.grsl,sq_bzxx.kygrsl,sq_bzxx.mqzsgds,sq_bzxx.zxzsgds,sq_bzxx.zdzsgds ";
	ls_sql+=" from sq_sgd,sq_bzxx";
	ls_sql+=" where sq_sgd.sgd=sq_bzxx.sgd and sq_sgd.ssfgs='"+ssfgs+"' ";

	//必要条件：
	ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";
	ls_sql+=" and sq_bzxx.tdbz='N' ";

	ls_sql+=" order by sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm,sq_sgd.khmyd desc,sq_bzxx.kygrsl desc,sq_bzxx.mqzsgds,sq_sgd.zbj desc";


//	out.println(ls_sql);
	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
//设置显示列
/*
	String[] disColName1={"sgdmc","bzs","zbj","wkgsl","wkgqye","sl","wwgqye","wwgpjde","wgsl","wgqye","wgpjde"};
	pageObj.setDisColName(disColName1);
*/


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>
</body>
</html>