<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_ppxxCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ�Ʊ���</td> 
  <td width="32%"> 
    <input type="text" name="ppbm" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">��Ʒ������</td> 
  <td width="32%"> 
    <input type="text" name="ppmc" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  
  <td align="right" width="18%">���ϴ���</td> 
  <td width="32%"><select name="cldl" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeCldlbm(selectform)">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
  </select></td>
  <td align="right" width="18%">����С��</td> 
  <td width="32%"><select name="clxl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ�����</td> 
  <td width="32%"><select name="pplb" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <option value="1">����</option>
  </select></td>
  <td align="right" width="18%">Ʒ������</td> 
  <td width="32%"><select name="scsmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select scsmc c1,scsmc c2 from jxc_scsxx where scslb in('1','3')  order by scsmc","");
%>
  </select></td>
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
<%
	cf.ajax(out);//����AJAX
%>

function changeCldlbm(FormName) //�ı������б��ֵ������Ajax
{
	FormName.clxl.length=1;

	if (FormName.cldl.value=="")
	{
		return;
	}

	var sql;
	sql="select clxlmc from jxc_clxlbm where cldlmc='"+FormName.cldl.value+"' order by clxlmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}


function getAjax(ajaxRetStr) 
{
	strToItem2(selectform.clxl,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.ppbm, "��Ʒ�Ʊ���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
