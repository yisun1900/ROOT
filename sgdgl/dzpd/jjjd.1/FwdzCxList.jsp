<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String fwdz=cf.GB2Uni(request.getParameter("fwdz"));


	ls_sql="SELECT khbh,khxm,fwdz,kgrq,sjkgrq,jgrq,gcjdmc,a.dwmc sbdm,sgdmc sgd,sgbz,sjs,zjxm ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm ";
    ls_sql+=" where (crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)) and zt='2' and crm_khxx.gcjdbm not in('1','5') and pdclzt!='1'";
    ls_sql+=" and  (fwdz like '%"+fwdz+"%') and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm";
	ls_sql+=" order by fwdz";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","khxm","xb","fwdz","lxfs","qyrq","kgrq","dwbh","sbrq","hdbz"};
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

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">附近在施工程列表</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">客户编号</td>
	<td  width="6%">姓名</td>
	<td  width="18%">房屋地址</td>
	<td  width="9%">合同开工日期</td>
	<td  width="9%">实开工日期</td>
	<td  width="8%">合同完工日期</td>
	<td  width="8%">工程进度</td>
	<td  width="10%">签约店面</td>
	<td  width="6%">施工队</td>
	<td  width="6%">班组</td>
	<td  width="6%">设计师</td>
	<td  width="6%">质检员</td>
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