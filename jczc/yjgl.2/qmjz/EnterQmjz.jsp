<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>期末结转</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">

<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">

	<td  width="10%">业绩结转时间</td>
	<td  width="7%">结转人</td>
	<td  width="17%">操作时间</td>
	<td  width="10%">上期结转日期</td>
	<td  width="7%">签约客户总数</td>
	<td  width="14%">签约业绩总额</td>
	<td  width="7%">退单客户总数</td>
	<td  width="14%">退单业绩总额</td>
	<td  width="14%">业绩总额</td>
	
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String ls_sql=null;

	ls_sql="SELECT TO_CHAR(jzrq,'YYYY-MM-DD') jzrq,jzr,czsj,TO_CHAR(sqjzrq,'YYYY-MM-DD') sqjzrq,khzs,qyze,tdkhzs,NVL(tdqyze,0),qyze-NVL(tdqyze,0)";
	ls_sql+=" FROM cw_qmjz";
    ls_sql+=" order by jzrq desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(12);//设置每页显示记录数
	pageObj.setDateType("long");

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jzrq"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_qmjz.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jzrq",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>

  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
        <div align="center">业绩期末结转</div>
    <tr> 
      <td align="right" width="19%" height="37">选择结转时间</td>
      <td height="37" width="21%"> 
        <select name="nian" style="FONT-SIZE:12PX;WIDTH:80PX" >
          <%
	cf.selectToken(out,"2006+2006年&2007+2007年&2008+2008年&2009+2009年&2010+2010年&2011+2011年&2012+2012年&2013+2013年&2014+2014年&2015+2015年&2016+2016年&2017+2017年&2018+2018年&2019+2019年&2020+2020年&2021+2021年&2022+2022年&2023+2023年&2024+2024年&2025+2025年",cf.today("YYYY"));
%> 
        </select>
        年 </td>
      <td height="37" colspan="2"> 
        <input type="radio" name="yue" value="01">
        一月<br>
        <input type="radio" name="yue" value="02">
        二月<br>
        <input type="radio" name="yue" value="03">
        三月<br>
        <input type="radio" name="yue" value="04">
        四月<br>
        <input type="radio" name="yue" value="05">
        五月<br>
        <input type="radio" name="yue" value="06">
        六月
      </td>
      <td height="37" colspan="2" width="34%"> 
        <input type="radio" name="yue" value="07">
        七月<br>
        <input type="radio" name="yue" value="08">
        八月<br>
        <input type="radio" name="yue" value="09">
        九月<br>
        <input type="radio" name="yue" value="10">
        十月<br>
        <input type="radio" name="yue" value="11">
        十一月<br>
        <input type="radio" name="yue" value="12">
        十二月</td>
    </tr>
    <tr align="center"> 
      <td colspan="6"> 
        <input type="button"  value="业绩结转" onClick="f_do(selectform)">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.nian)=="") {
		alert("请输入[年]！");
		FormName.nian.focus();
		return false;
	}
	if(	!radioChecked(FormName.yue)) {
		alert("请选择[月份]！");
		FormName.yue[0].focus();
		return false;
	}

	FormName.action="yjqmjz.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
