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
String xmstr=cf.getItemData("select xm as xmbm,xm as xmmc,dwbh from oa_bgypbz order by dwbh,xm");
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

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">申领单位</div>
              </td>
              <td width="29%"> 
                <select name="oa_lqsq_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(oa_lqsq_dwbh,oa_lqsq_slr,<%=xmstr%>)">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
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
	if (yhjs.equals("00"))
	{
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select xm as bm,xm as mc from oa_bgypbz where dwbh='"+dwbh+"' order by dwbh,xm","");
	}
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
                <input type="radio" name="oa_lqsq_lqzt" value="N">
                未领取 
                <input type="radio" name="oa_lqsq_lqzt" value="Y">
                已领取 </td>
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
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">领取类型</td>
              <td width="29%"> 
                <input type="radio" name="lqlx" value="1">
                正常领取 
                <input type="radio" name="lqlx" value="2">
                超额领取 </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">查询结果排序</td>
              <td colspan="3"> 第一列 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="oa_lqsq.xh desc">申请序号</option>
                  <option value="sq_dwxx.dwmc">领用单位</option>
                  <option value="oa_lqsq.slr">申领人</option>
                  <option value="oa_bgypbm.bgypmc">办公用品</option>
                  <option value="oa_lqsq.jhlqsl">计划领取数量</option>
                  <option value="oa_lqsq.jhlqrq">计划领取日期</option>
                  <option value="oa_lqsq.lrr">录入人</option>
                  <option value="oa_lqsq.lrrq">录入日期</option>
                  <option value="oa_lqsq.lqzt">领取状态</option>
                  <option value="oa_lqsq.slqsl">实领取数量</option>
                  <option value="oa_lqsq.blr">办理人</option>
                  <option value="oa_lqsq.lqsj">领取时间</option>
                  <option value="oa_bgypbm.dj">单价</option>
                  <option value="oa_lqsq.lqlx">领取类型</option>
                </select>
                第二列 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="oa_lqsq.xh desc">申请序号</option>
                  <option value="sq_dwxx.dwmc">领用单位</option>
                  <option value="oa_lqsq.slr">申领人</option>
                  <option value="oa_bgypbm.bgypmc">办公用品</option>
                  <option value="oa_lqsq.jhlqsl">计划领取数量</option>
                  <option value="oa_lqsq.jhlqrq">计划领取日期</option>
                  <option value="oa_lqsq.lrr">录入人</option>
                  <option value="oa_lqsq.lrrq">录入日期</option>
                  <option value="oa_lqsq.lqzt">领取状态</option>
                  <option value="oa_lqsq.slqsl">实领取数量</option>
                  <option value="oa_lqsq.blr">办理人</option>
                  <option value="oa_lqsq.lqsj">领取时间</option>
                  <option value="oa_bgypbm.dj">单价</option>
                  <option value="oa_lqsq.lqlx">领取类型</option>
                </select>
                第三列 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="oa_lqsq.xh desc">申请序号</option>
                  <option value="sq_dwxx.dwmc">领用单位</option>
                  <option value="oa_lqsq.slr">申领人</option>
                  <option value="oa_bgypbm.bgypmc">办公用品</option>
                  <option value="oa_lqsq.jhlqsl">计划领取数量</option>
                  <option value="oa_lqsq.jhlqrq">计划领取日期</option>
                  <option value="oa_lqsq.lrr">录入人</option>
                  <option value="oa_lqsq.lrrq">录入日期</option>
                  <option value="oa_lqsq.lqzt">领取状态</option>
                  <option value="oa_lqsq.slqsl">实领取数量</option>
                  <option value="oa_lqsq.blr">办理人</option>
                  <option value="oa_lqsq.lqsj">领取时间</option>
                  <option value="oa_bgypbm.dj">单价</option>
                  <option value="oa_lqsq.lqlx">领取类型</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">显示风格</td>
              <td colspan="3"> 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;每页显示数量 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform,'cx')">
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
function f_do(FormName,lx)//参数FormName:Form的名称
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

	FormName.action="Oa_lqsqCxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
