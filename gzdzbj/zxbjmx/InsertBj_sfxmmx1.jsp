<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String dqbm=request.getParameter("dqbm");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入其它收费项目明细</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertBj_sfxmmx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="7" readonly>
              </td>
              <td width="15%">&nbsp; </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">收费项目</td>
              <td> 
                <select name="sfxmbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getSfxm(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmbm","");
%> 
                </select>
              </td>
              <td align="right">收费类型</td>
              <td> 
                <input name="sflx" type="text" id="sflx" value="" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"> 收费金额</td>
              <td colspan="3"> 
                <input type="text" name="sfje" value="" size="20" maxlength="17" >
                <font color="#FF0033"><b>注意：按百分比收费项目，不需录入收费金额，由系统自动计算 </b></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
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

function getSfxm(FormName)
{

	var str="Bj_sfxmmxCx.jsp?dqbm=<%=dqbm%>&sfxmbm="+FormName.sfxmbm.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sfxmbm)=="") {
		alert("请选择[收费项目]！");
		FormName.sfxmbm.focus();
		return false;
	}
	if (FormName.sflx.value=='固定金额')
	{
		if(	javaTrim(FormName.sfje)=="") {
			alert("请输入[收费金额]！");
			FormName.sfje.focus();
			return false;
		}
		if(!(isFloat(FormName.sfje, "收费金额"))) {
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.sfje)!="" && FormName.sfje.value!='0') {
			alert("按百分比收费，不需要录入[收费金额]！");
			FormName.sfje.select();
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
