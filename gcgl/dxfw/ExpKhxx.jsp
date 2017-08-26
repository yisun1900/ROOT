<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);
	
	String[] khbh=request.getParameterValues("khbh");

	String ls_sql=null;


	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,DECODE(kgzbz,'Y','已出','N','<font color=\"#FF00FF\">未出</font>'),DECODE(zt,'2','家装','3','<font color=\"#FF00FF\">已退单</font>','4','非家装','5','设计客户'),ysgcjdmc,DECODE(crm_khxx.jzbz,'1','家装','2','公装'),crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,crm_khxx.cxhdbm,crm_khxx.lxfs,DECODE(NVL(tgbz,'W'),'W','正常','N','<font color=\"#00FF00\">复工</font>','Y','<font color=\"#FF0000\">已停工</font>'),ywy,a.dwmc qydm,crm_khxx.qyrq,crm_khxx.kgrq,jgrq,DECODE(crm_khxx.sffj,'Y','是','N','否'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','是','N','否'),b.dwmc rzsc,khlxmc";

	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd,dm_gcjdbm,dm_khlxbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.khlxbm=dm_khlxbm.khlxbm(+)";
    ls_sql+=" and crm_khxx.zt!='3'";
    ls_sql+=" and "+ cf.arrayToInSQL(khbh,"crm_khxx.khbh");
    ls_sql+=" order by lrsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");

	pageObj.setPageRow(20000);


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >

<CENTER >
  <B><font size="3">导出客户资料</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">合同号</td>
	<td  width="3%">客户姓名</td>
	<td  width="2%">开工证</td>
	<td  width="2%">类型</td>
	<td  width="3%">工程进度</td>
	<td  width="2%">家装标志 </td>
	<td  width="8%">房屋地址</td>
	<td  width="3%">设计师</td>
	<td  width="2%">施工队</td>
	<td  width="2%">工程担当</td>
	<td  width="4%">参加促销活动</td>
	<td  width="7%">联系方式</td>
	<td  width="2%">停工</td>
	<td  width="2%">业务员</td>
	<td  width="5%">签约店面</td>
	<td  width="3%">签约日期</td>
	<td  width="3%">合同开工日期</td>
	<td  width="3%">合同竣工日期</td>
	<td  width="2%">是否返卷</td>
	<td  width="3%">返卷总金额</td>
	<td  width="3%">公司承担返卷额</td>
	<td  width="2%">是否已认证</td>
	<td  width="4%">认证市场</td>
	<td  width="4%">关系客户</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>

<%
	String yhmc=(String)session.getAttribute("yhmc");
	Connection conn  = null;
	PreparedStatement ps=null;
	try {
		conn=cf.getConnection();

		ls_sql="update crm_khxx set sfyfdx='2',fdxr='"+yhmc+"',fdxsj=TRUNC(SYSDATE) ";
		ls_sql+=" where "+ cf.arrayToInSQL(khbh,"crm_khxx.khbh");
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	catch (Exception e) {
		out.print("Exception: " + e);
		return;
	}
	finally 
	{
		try{
			if (ps!= null) ps.close(); 
			if (conn != null) cf.close(conn); 
		}
		catch (Exception e){
			if (conn != null) cf.close(conn); 
		}
	}
%>