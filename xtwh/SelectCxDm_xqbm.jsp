<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dwstr=cf.getItemData("select cqbm,cqmc,dqbm from dm_cqbm order by dqbm,cqbm");
%>

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

<form method="post" action="Dm_xqbmCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">С������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_xqbm" size="20" maxlength="7" >
              </td>
              <td width="15%"> 
                <div align="right">С������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_xqmc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <select name="dm_xqbm_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(dm_xqbm_dqbm,dm_xqbm_cqbm,<%=dwstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <select name="dm_xqbm_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_kfs" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">��¥�绰</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_sldh" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">ÿƽ�׾��� ��</td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_mpmjj" size="20" maxlength="8" >
              </td>
              <td width="15%" align="right">��</td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_mpmjj2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��סʱ�� ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_rzsj" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_rzsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�û���½��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_yhdlm" size="20" maxlength="16" >
              </td>
              <td width="15%"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
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
	if(!(isNumber(FormName.dm_xqbm_mpmjj, "ÿƽ�׾���"))) {
		return false;
	}
	if(!(isNumber(FormName.dm_xqbm_mpmjj2, "ÿƽ�׾���"))) {
		return false;
	}
	if(!(isDatetime(FormName.dm_xqbm_rzsj, "��סʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.dm_xqbm_rzsj2, "��סʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
