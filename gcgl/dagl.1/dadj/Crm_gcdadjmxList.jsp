<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String khbh=request.getParameter("khbh");

	ls_sql="select crm_gcdagl.damxbm,dm_damxbm.damxmc,crm_khxx.khxm,bgr,sq_dwxx.dwmc,bgsj,crm_gcdagl.lrr,crm_gcdagl.lrsj  ";
	ls_sql+=" from crm_gcdagl,crm_khxx,dm_damxbm,sq_dwxx ";
    ls_sql+=" where crm_gcdagl.damxbm=dm_damxbm.damxbm(+)";
    ls_sql+=" and crm_gcdagl.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_gcdagl.bgrdw=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_gcdagl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_gcdagl.damxbm";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("","","","EditCrm_gcdadjmx.jsp?khbh="+khbh);
//	pageObj.setPageRow(1);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","damxbm","dm_damxbm_damxmc","crm_gcdamx_lqdar","crm_gcdamx_lqdasj","crm_gcdamx_lqdasl","crm_gcdamx_lqdablr","crm_gcdamx_bxjhbz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"damxbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCrm_gcdamx.jsp?khbh="+khbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">档案登记明细</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="10%">档案编号</td>
	<td  width="12%">档案名称</td>
	<td  width="10%">客户姓名</td>
	<td  width="10%">保管人</td>
	<td  width="12%">保管单位</td>
	<td  width="13%">保管时间</td>
	<td  width="10%">录入人</td>
	<td  width="13%">录入时间</td>
</tr>
<%
	pageObj.displayDateSum();
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