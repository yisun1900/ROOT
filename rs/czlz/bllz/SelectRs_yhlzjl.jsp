<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");

	//检查是否做期末结转
	//返回： -1:出错;0:当月已结转；1:上月已结转，当月未结转;2:上月未结转 
	int count=cf.checkQmjz("rs_ydjz",cf.today());

	if (count==2)
	{
		out.println("上月没有进行『结转』！");
		return;
	}
	else if (count==-1)
	{
		out.println("出错！");
		return;
	}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_yhlzjlList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="20%" align="right">分公司</td>
      <td width="30%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(ssfgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
      <td width="19%" align="right">所属单位</td>
      <td width="31%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">序号</td>
      <td width="35%"> 
        <input type="text" name="xh" size="20" maxlength="8" >
      </td>
      <td align="right" width="15%">员工序号</td>
      <td width="35%"> 
        <input type="text" name="ygbh" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">员工名称</td>
      <td width="35%"> 
        <input type="text" name="yhmc" size="20" maxlength="50" >
      </td>
      <td align="right" width="15%">员工编号</td>
      <td width="35%"> 
        <input type="text" name="bianhao" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">身份证号</td>
      <td width="35%"> 
        <input type="text" name="sfzh" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%">行政职务</td>
      <td width="35%"> 
        <select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">离职原因分类</td>
      <td width="35%"> 
        <select name="lzyyflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select lzyyflbm,lzyyflmc from dm_lzyyflbm order by lzyyflbm","");
%> 
        </select>
      </td>
      <td align="right" width="15%">离职类型</td>
      <td width="35%">
        <input type="radio" name="lzlx" value="S">
        辞职 
        <input type="radio" name="lzlx" value="T">
        辞退 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">离职原因</td>
      <td colspan="3"> 
        <input type="text" name="lzyy" size="75" maxlength="200" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">离职日期 从</td>
      <td width="35%"> 
        <input type="text" name="lzrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="15%">到</td>
      <td width="35%"> 
        <input type="text" name="lzrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">录入时间 从</td>
      <td width="35%"> 
        <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="15%">到</td>
      <td width="35%"> 
        <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">录入人</td>
      <td width="35%"> 
        <input type="text" name="lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.lzrq, "离职日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.lzrq2, "离职日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
