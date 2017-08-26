<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhmc=(String)session.getAttribute("yhmc");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String pqstr=cf.getItemData("select xm as bm,xm as mc,dwbh from oa_bgypbz where dwbh in(select dwbh from sq_dwxx where ssfgs='"+ssfgs+"') order by dwbh,xm");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertOa_lqsq.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">申领单位</td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(dwbh,slr,<%=pqstr%>)">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
%> 
                </select>
              </td>
              <td width="18%" align="right">申领人</td>
              <td width="32%"> 
                <select name="slr" style="FONT-SIZE:12PX;WIDTH:152PX">
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">办公用品</div>
              </td>
              <td width="33%"> 
                <select name="bgypbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bgypbm,bgypmc||'（'||dj||'元）' from oa_bgypbm where fgsbh='"+ssfgs+"' order by fgsbh,bgypbm","");
%> 
                </select>
              </td>
              <td colspan="2" align="center">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 领取日期</td>
              <td width="33%"> 
                <input type="text" name="lqsj" value="<%=cf.today()%>" size="20" maxlength="10">
              </td>
              <td width="18%"> 
                <div align="right">领取数量</div>
              </td>
              <td width="32%"> 
                <input type="text" name="slqsl" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">录入日期</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrrq" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
              <td width="18%"> 
                <div align="right">录入人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="56" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.bgypbm)=="") {
		alert("请选择[办公用品]！");
		FormName.bgypbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[单位]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.slr)=="") {
		alert("请选择[申领人]！");
		FormName.slr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrrq)=="") {
		alert("请输入[录入日期]！");
		FormName.lrrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrrq, "录入日期"))) {
		return false;
	}
	if(	javaTrim(FormName.slqsl)=="") {
		alert("请输入[领取数量]！");
		FormName.slqsl.focus();
		return false;
	}
	if(!(isNumber(FormName.slqsl, "领取数量"))) {
		return false;
	}
	if(	javaTrim(FormName.lqsj)=="") {
		alert("请输入[领取时间]！");
		FormName.lqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lqsj, "领取时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
