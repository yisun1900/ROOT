<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<%
	String khbh=request.getParameter("khbh");
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">客户材料小类数量限制（<%=khbh%>）</font></B>
</CENTER>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="8%">材料小类编码</td>
	<td  width="22%">材料小类名称</td>
	<td  width="22%">材料大类</td>
	<td  width="10%">是否限制数量</td>
	<td  width="8%"><span class="STYLE1">套餐数量限制</span></td>
	<td  width="8%"><span class="STYLE1">超出部分加价</span></td>
	<td  width="10%"><span class="STYLE1">是否限制减免数量</span></td>
	<td  width="8%"><span class="STYLE1">允许减免最大数量</span></td>

</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	ls_sql="SELECT '修改' xg,bj_khclxlxz.clxlbm,jxc_clxlbm.clxlmc,jxc_clxlbm.cldlmc,DECODE(bj_khclxlxz.sfxzsl,'1','不限制','2','不能超量','3','可超量需加价'),bj_khclxlxz.tcslxz,bj_khclxlxz.ccbfjj,DECODE(bj_khclxlxz.sfkjm,'1','不限制','2','限制'),bj_khclxlxz.yxjmzdsl";
	ls_sql+=" FROM bj_khclxlxz,jxc_clxlbm ";
    ls_sql+=" where bj_khclxlxz.clxlbm=jxc_clxlbm.clxlbm(+) and bj_khclxlxz.khbh='"+khbh+"'";
    ls_sql+=" order by jxc_clxlbm.cldlmc,bj_khclxlxz.clxlbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

 
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("cldlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"clxlbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="EditBj_khclxlxz.jsp?khbh="+khbh;//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xg",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
	pageObj.printFoot();
%> 
</body>
</html>

<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
