<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Bj_wntcmcList.jsp" name="selectform">
<div align="center">��ů�ײͣ�ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����</td> 
  <td width="32%"> 
    <select name="bj_wntcmc_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
  <td align="right" width="18%">����</td> 
  <td width="32%"><select name="bj_wntcmc_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ײ�����</td>
  <td colspan="3"><input type="text" name="tcmc" value="" size="73" maxlength="50" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��׼���</td> 
  <td width="32%"> 
    <input type="text" name="bj_wntcmc_bzmj" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">�ײͼ۸�</td> 
  <td width="32%"> 
    <input type="text" name="bj_wntcmc_tcjg" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ƽ�����ӵ���</td> 
  <td width="32%"> 
    <input type="text" name="bj_wntcmc_pmzjdj" size="20" maxlength="17" >  </td>
  <td align="right">����Ƿ������</td>
  <td><input type="radio" name="mjsfkzj" value="1">
    ��������
    <input type="radio" name="mjsfkzj" value="2">
    ���ӼӼ� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����Ƿ���ѡ��</td>
  <td><input type="radio" name="zcsfxxz" value="1">
    �Զ�ѡ��
    <input type="radio" name="zcsfxxz" value="2">
    �˹�ѡ�� </td>
  <td align="right">����</td>
  <td><input type="radio" name="lx" value="1">
    ��ů�ײ�
    <input type="radio" name="lx" value="2">
    �����ײ� </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
</tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.bj_wntcmc_bzmj, "��׼���"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_wntcmc_tcjg, "�ײͼ۸�"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_wntcmc_pmzjdj, "ƽ�����ӵ���"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>