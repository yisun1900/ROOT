<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_sgdzqjsCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����¼��</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdzqjs_jsjlh" size="20" maxlength="9" >  </td>
  <td align="right" width="18%">�ͻ����</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdzqjs_khbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ʩ����</td> 
  <td width="32%"> 
    <select name="cw_sgdzqjs_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' order by sgd","");
%>
    </select>  </td>
  <td align="right" width="18%">ʩ����</td> 
  <td width="32%"> 
    <input type="text" name="sq_sgd_sgdmc" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ֳ�������</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdzqjs_sgbz" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td><select name="cw_sgdzqjs_lx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd order by gdjsjd","");
%>
  </select></td>
  <td align="right">�������</td>
  <td><select name="cw_sgdzqjs_jsjs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectToken(out,"1+���̷�&2+���̻�������&3+ʩ���ɱ���&4+�ɱ���","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������� ��</td>
  <td><input type="text" name="cw_sgdzqjs_jsrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">�� </td>
  <td><input type="text" name="cw_sgdzqjs_jsrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�������</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdzqjs_jsbl" size="20" maxlength="9" >  </td>
  <td align="right" width="18%">������</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdzqjs_jsje" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���Ϸ�</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdzqjs_clf" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">������Ʒ</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdzqjs_gdyp" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ʵ�ʲ���</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdzqjs_sjbk" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼��ʱ�� ��</td> 
  <td width="32%"><input type="text" name="cw_sgdzqjs_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="cw_sgdzqjs_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼����</td>
  <td><input type="text" name="cw_sgdzqjs_lrr" size="20" maxlength="20" ></td>
  <td align="right">¼�벿��</td>
  <td><select name="cw_sgdzqjs_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.cw_sgdzqjs_jsrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdzqjs_jsrq2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdzqjs_jsbl, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdzqjs_jsje, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdzqjs_clf, "���Ϸ�"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdzqjs_gdyp, "������Ʒ"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdzqjs_sjbk, "ʵ�ʲ���"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdzqjs_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdzqjs_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
