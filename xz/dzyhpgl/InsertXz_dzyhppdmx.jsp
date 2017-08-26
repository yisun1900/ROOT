<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
	String ssfgs=(String)session.getAttribute("ssfgs");
String lrr=(String)session.getAttribute("yhdlm");
%>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

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

<form method="post" action="SaveInsertXz_dzyhppdmx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">使用部门</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
			if (yhjs.equals("A0") || yhjs.equals("A1"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A0','A1','F0','F1','F2') order by dwbh","");
			}
			else if (yhjs.equals("F0") || yhjs.equals("F1"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A0','A1','F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
			}
			else
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
			}
%>
                </select>
              </td>
              <td width="15%"> 
                <div align="right">编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="bh" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">名称</div>
              </td>
              <td width="35%"> 
                <input type="text" name="mc" value="" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">单位</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dw" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">数量</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sl" value="" size="20" maxlength="12" >
              </td>
              <td width="15%"> 
                <div align="right">型号及规格</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xhjgg" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">购入时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="grsj" value="" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">购入原值</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gryz" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">盘点人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="pdr" value="<%=lrr%>" size="20" maxlength="8" readonly>
              </td>
              <td width="15%"> 
                <div align="right">责任人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zrr" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">盘点时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="pdsj" value=<%=cf.today()%> size="20" maxlength="10" >
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3"></textarea>
                <div align="right"></div>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
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
	if(	javaTrim(FormName.bh)=="") {
		alert("请输入[编号]！");
		FormName.bh.focus();
		return false;
	}
	if(	javaTrim(FormName.mc)=="") {
		alert("请输入[名称]！");
		FormName.mc.focus();
		return false;
	}
	if(	javaTrim(FormName.dw)=="") {
		alert("请输入[单位]！");
		FormName.dw.focus();
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "数量"))) {
		return false;
	}
	if(!(isDatetime(FormName.grsj, "购入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[使用部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(!(isFloat(FormName.gryz, "购入原值"))) {
		return false;
	}
	if(	javaTrim(FormName.pdsj)=="") {
		alert("请输入[盘点时间]！");
		FormName.pdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pdsj, "盘点时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
