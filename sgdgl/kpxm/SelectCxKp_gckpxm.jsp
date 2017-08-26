<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

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

<form method="post" action="Kp_gckpxmCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">违规项目编码</div>
              </td>
              <td width="32%"> 
                <input type="text" name="kp_gckpxm_kpxmbm" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">违规项目名称</div>
              </td>
              <td width="32%"> 
                <input type="text" name="kp_gckpxm_kpxmmc" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">项目大类</div>
              </td>
              <td width="32%"> 
                <select name="kp_gckpxm_kpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kpdlbm,kpdlmc from kp_kpdlbm order by kpdlbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">违规分级</div>
              </td>
              <td width="32%"> 
                <select name="kp_gckpxm_kpjg" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yzcdbm,ydcdmc from kp_sgdyzcdbm order by yzcdbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">扣分</td>
              <td width="32%"> 
                <input type="text" name="kf" value="" size="20" maxlength="16" >
              </td>
              <td width="18%" align="right">罚款</td>
              <td width="32%"> 
                <input type="text" name="sgdfk" value="" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">扣除接单额百分比</div>
              </td>
              <td width="32%"> 
                <input type="text" name="kcjdebl" value="" size="10" maxlength="16" >
                % </td>
              <td width="18%"> 
                <div align="right">处罚</div>
              </td>
              <td width="32%"> 
                <select name="kp_gckpxm_kpcfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kpcfbm,kpcfmc from kp_kpcfbm order by kpcfbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">违规分级定义</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="kp_gckpxm_kpjgdy" size="73" maxlength="200" >
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
