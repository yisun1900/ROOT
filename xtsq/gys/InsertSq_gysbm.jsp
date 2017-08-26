<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入供应商</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>所属地区</td>
              <td width="31%">
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>供应商名称</td>
              <td colspan="3"> 
                <input type="text" name="gys" value="" size="72" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">供应商地址</td>
              <td colspan="3"> 
                <input type="text" name="gysdz" value="" size="72" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>供应商电话</td>
              <td colspan="3"> 
                <input type="text" name="gysdh" value="" size="72" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">供应商传真</div>
              </td>
              <td width="31%"> 
                <input type="text" name="gyscz" value="" size="20" maxlength="50" >
              </td>
              <td width="18%"> 
                <div align="right">EMail</div>
              </td>
              <td width="32%"> 
                <input type="text" name="email" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">财务代码</td>
              <td width="31%"> 
                <input type="text" name="cwdm" value="" size="20" maxlength="20" >
              </td>
              <td width="18%" align="right">供应商负责人</td>
              <td width="32%"> 
                <input type="text" name="gysfzr" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4">系统授权</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">可登陆系统标志</td>
              <td width="31%"><%
	cf.radioToken(out, "kdlxtbz","Y+可登陆&N+不可登陆","");
%></td>
              <td rowspan="4" align="right"><font color="#FF0000">*</font>所属分公司</td>
              <td rowspan="4"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" size="7" multiple>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','『撤销』') from sq_dwxx where dwlx='F0' order by cxbz,dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">用户登录名</td>
              <td width="31%"> 
                <input type="text" name="yhdlm" value="" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">用户口令</td>
              <td width="31%"> 
                <input type="text" name="yhkl" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">用户名称</td>
              <td width="31%"> 
                <input type="text" name="yhmc" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="70" rows="3"></textarea>
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
	if(	javaTrim(FormName.gys)=="") {
		alert("请输入[供应商名称]！");
		FormName.gys.focus();
		return false;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysdh)=="") {
		alert("请输入[供应商电话]！");
		FormName.gysdh.focus();
		return false;
	}

	if(	!selectChecked(FormName.ssfgs)) {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}

	if(	javaTrim(FormName.yhdlm)!="") 
	{
		if(	javaTrim(FormName.yhkl)=="") {
			alert("请选择[用户口令]！");
			FormName.yhkl.focus();
			return false;
		}
		if(	javaTrim(FormName.yhmc)=="") {
			alert("请选择[用户名称]！");
			FormName.yhmc.focus();
			return false;
		}
		if(	!radioChecked(FormName.kdlxtbz)) {
			alert("请选择[可登陆系统标志]！");
			FormName.kdlxtbz[0].focus();
			return false;
		}

	}
	

	FormName.action="SaveInsertSq_gysbm.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
