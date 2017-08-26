<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>月报表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='010407'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[冻结当月业绩]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>

<body bgcolor="#FFFFFF">


<form method="post" action="" name="selectform" target="_blank">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="4" height="36"> 
        <div align="center">冻结当月业绩</div>
      </td>
    </tr>
    <tr> 
      <td align="right" width="22%" height="37">选择冻结时间</td>
      <td height="37" width="28%"> 
        <select name="nian" style="FONT-SIZE:12PX;WIDTH:80PX" >
          <%
	cf.selectToken(out,"1995+1995年&1996+1996年&1997+1997年&1998+1998年&1999+1999年&2000+2000年&2001+2001年&2002+2002年&2003+2003年&2004+2004年&2005+2005年&2006+2006年&2007+2007年&2008+2008年&2009+2009年&2010+2010年&2011+2011年&2012+2012年&2013+2013年&2014+2014年&2015+2015年",cf.today("YYYY"));
%> 
        </select>
        年 </td>
      <td height="37" colspan="2" width="50%"> 
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
        六月<br>
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
      <td height="45" colspan="4"> 
        <input type="button"  value="冻结当月业绩" onClick="f_do(selectform)" >
      </td>
    </tr>
  </table>
</form>

<table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%" >&nbsp;</td>
	<td  width="16%">年</td>
	<td  width="14%" >月</td>
	<td  width="20%" >冻结人</td>
	<td  width="30%" >冻结时间</td>
</tr>
<%
	String ls_sql=null;
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT nian,yue,djr,djsj  ";
	ls_sql+=" FROM cw_yjdjjl  ";
	ls_sql+=" order by nian desc,yue desc  ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","DeleteYjdj.jsp");

//设置主键
	String[] keyName={"nian","yue"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("删除冻结");
	pageObj.setDateType("long");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>

</body>

</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
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

	FormName.action="KsEnterYjdj.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
