<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String sqbh=request.getParameter("sqbh");

	ls_sql="SELECT sgdmc,crm_khxx.khbh khbh,crm_khxx.khxm,crm_khxx.fwdz,ybjyxq,fgflmc,zxjwmc,hxmc,hxmjmc,ysmc,ybj_fpybj.fpsj as ybj_fpybj_fpsj  ";
	ls_sql+=" FROM ybj_fpybj,crm_khxx,ybj_cgsq,sq_sgd  ";
	ls_sql+=" ,dm_fgflbm,dm_hxmjbm,dm_hxbm,dm_ysbm,dm_zxjwbm";
    ls_sql+=" where ybj_fpybj.khbh=crm_khxx.khbh and ybj_fpybj.sqbh=ybj_cgsq.sqbh ";
    ls_sql+=" and crm_khxx.ysbm=dm_ysbm.ysbm and crm_khxx.hxbm=dm_hxbm.hxbm and crm_khxx.sgd=sq_sgd.sgd";
    ls_sql+=" and crm_khxx.hxmjbm=dm_hxmjbm.hxmjbm and crm_khxx.zxjwbm=dm_zxjwbm.zxjwbm and crm_khxx.fgflbm=dm_fgflbm.fgflbm";
    ls_sql+=" and ybj_fpybj.sqbh="+sqbh;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
/*
//设置显示列
	String[] disColName={"sqbh","crm_khxx_ybjmc","crm_khxx_fgflbm","crm_khxx_zxjwbm","crm_khxx_hxmjbm","crm_khxx_sgjdbm","crm_khxx_kcgqkbm","crm_khxx_ysbm","ybj_fpybj_fpsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置按钮参数
	String[] buttonName={"删除已分配样板间"};//按钮的显示名称
	String[] buttonLink={"DeleteYbj_fpybj.jsp?sqbh="+sqbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sqbh","1");//列参数对象加入Hash表
	spanColHash.put("sgdmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="2">已分配样板间列表</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="7%">施工队</td>
	<td  width="8%">样板间编号</td>
	<td  width="6%">姓名</td>
	<td  width="20%">样板间地址</td>
	<td  width="10%">有效期</td>
	<td  width="6%">风格</td>
	<td  width="8%">价位</td>
	<td  width="8%">户型</td>
	<td  width="8%">面积</td>
	<td  width="6%">油色</td>
	<td  width="10%">分配时间</td>
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