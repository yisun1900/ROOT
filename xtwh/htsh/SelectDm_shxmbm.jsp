<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Dm_shxmbmList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�����Ŀ����</div>
              </td>
              <td width="31%"> 
                <select name="dm_shxmbm_shxmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select shxmdlbm,shxmdlmc from dm_shxmdlbm order by shxmdlbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">�����ĿС��</div>
              </td>
              <td width="32%"> 
                <select name="dm_shxmbm_shxmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select shxmxlbm,shxmxlmc from dm_shxmxlbm order by shxmdlbm,shxmxlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�����Ŀ����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="dm_shxmbm_shxmbm" size="20" maxlength="4" >
              </td>
              <td width="18%"> 
                <div align="right">�۷�</div>
              </td>
              <td width="32%"> 
                <input type="text" name="dm_shxmbm_kf" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�����Ŀ����</td>
              <td colspan="3"> 
                <input type="text" name="dm_shxmbm_shxmmc" size="72" maxlength="100" >
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">
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
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.dm_shxmbm_kf, "�۷�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
