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
String xmstr=cf.getItemData("select xm as xmbm,xm as xmmc,dwbh from oa_bgypbz where dwbh in(select dwbh from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"') order by dwbh,xm");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Oa_lqsqXgLqList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">申领单位</div>
              </td>
              <td width="29%"> 
                <select name="oa_lqsq_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(oa_lqsq_dwbh,oa_lqsq_slr,<%=xmstr%>)">
                  <%
	if (yhjs.equals("A0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by dwbh","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">申领人</div>
              </td>
              <td width="35%">
                <select name="oa_lqsq_slr" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	out.println("<option value=\"\"></option>");
	cf.selectItem(out,"select xm as bm,xm as mc from oa_bgypbz where dwbh='"+dwbh+"' order by dwbh,xm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">办公用品</div>
              </td>
              <td width="29%"> 
                <select name="oa_lqsq_bgypbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bgypbm,bgypmc||'（'||dj||'元）' from oa_bgypbm order by bgypbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">录入人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="oa_lqsq_lrr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">录入日期 从</td>
              <td width="29%"> 
                <input type="text" name="oa_lqsq_lrrq" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right">到</td>
              <td width="35%"> 
                <input type="text" name="oa_lqsq_lrrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">计划领取数量 从</div>
              </td>
              <td width="29%"> 
                <input type="text" name="oa_lqsq_jhlqsl" size="20" maxlength="8" >
                <BR>
              </td>
              <td width="15%"> 
                <div align="right">到</div>
              </td>
              <td width="35%"> 
                <input type="text" name="oa_lqsq_jhlqsl2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="21%" align="right">计划领取日期 从</td>
              <td width="29%"> 
                <input type="text" name="oa_lqsq_jhlqrq" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right">到</td>
              <td width="35%">
                <input type="text" name="oa_lqsq_jhlqrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">领取状态</div>
              </td>
              <td width="29%"> 
                <select name="oa_lqsq_lqzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="Y">已领取</option>
                </select>
              </td>
              <td width="15%"> 
                <div align="right">办理人</div>
              </td>
              <td width="35%">
                <input type="text" name="oa_lqsq_blr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">实领取数量 从</div>
              </td>
              <td width="29%"> 
                <input type="text" name="oa_lqsq_slqsl" size="20" maxlength="8" >
              </td>
              <td width="15%"> 
                <div align="right">到</div>
              </td>
              <td width="35%">
                <input type="text" name="oa_lqsq_slqsl2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">领取时间 从</div>
              </td>
              <td width="29%"> 
                <input type="text" name="oa_lqsq_lqsj" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">到</div>
              </td>
              <td width="35%">
                <input type="text" name="oa_lqsq_lqsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.oa_lqsq_lrrq, "录入日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_lqsq_lrrq2, "录入日期"))) {
		return false;
	}
	if(!(isNumber(FormName.oa_lqsq_jhlqsl, "计划领取数量"))) {
		return false;
	}
	if(!(isNumber(FormName.oa_lqsq_jhlqsl2, "计划领取数量"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_lqsq_jhlqrq, "计划领取日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_lqsq_jhlqrq2, "计划领取日期"))) {
		return false;
	}
	if(!(isNumber(FormName.oa_lqsq_slqsl, "实领取数量"))) {
		return false;
	}
	if(!(isNumber(FormName.oa_lqsq_slqsl2, "实领取数量"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_lqsq_lqsj, "领取时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_lqsq_lqsj2, "领取时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
