<%@ page contentType="text/html;charset=gb2312"  %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">填写领取申请</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertOa_lqsq.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">单位</td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh","");
%> 
                </select>
              </td>
              <td width="18%" align="right">申领人</td>
              <td width="32%"> 
                <select name="slr" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_change(insertform)">
                  <option value=""></option>
<%
	cf.selectItem(out,"select xm as bm,xm as mc from oa_bgypbz where dwbh='"+dwbh+"' order by dwbh,xm","");
%> 
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
//	cf.selectItem(out,"select bgypbm,bgypmc||'（'||dj||'元）' from oa_bgypbm order by bgypbm","");
%> 
                </select>
              </td>
              <td colspan="2" align="center">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">计划领取数量</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jhlqsl" value="" size="20" maxlength="8" >
              </td>
              <td width="18%"> 
                <div align="right">计划领取日期</div>
              </td>
              <td width="32%">
                <input type="text" name="jhlqrq" value="<%=cf.today()%>" size="20" maxlength="10" >
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
                <input type="button"  value="存盘" onClick="f_do(insertform)" name="bc">
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
function f_change(FormName)
{               
	FormName.bgypbm.length=0;  

	if(	javaTrim(FormName.slr)=="") {
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?dwbh=<%=dwbh%>&slr="+escape(escape(FormName.slr.value));
	parent.menu.aform.submit();
}                                                                                                                                                       


function f_do(FormName)//参数FormName:Form的名称
{
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
	if(	javaTrim(FormName.bgypbm)=="") {
		alert("请选择[办公用品]！");
		FormName.bgypbm.focus();
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
	if(	javaTrim(FormName.jhlqsl)=="") {
		alert("请输入[计划领取数量]！");
		FormName.jhlqsl.focus();
		return false;
	}
	if(!(isNumber(FormName.jhlqsl, "计划领取数量"))) {
		return false;
	}
	if(	javaTrim(FormName.jhlqrq)=="") {
		alert("请输入[计划领取日期]！");
		FormName.jhlqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhlqrq, "计划领取日期"))) {
		return false;
	}

	FormName.submit();
//	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
