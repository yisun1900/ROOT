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
<form method="post" action="Gdm_rwbmList.jsp" name="selectform">
<div align="center">�������ѯ����</div>


<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">�������(4λ)</td>
  <td width="32%"><input type="text" name="rwbm" size="20" maxlength="4"  value="" ></td>
  <td width="18%" align="right" bgcolor="#FFFFFF">�������</td>
  <td width="32%"><select name="rwflbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
    <option value=""></option>
    <%
	cf.selectItem(out,"select rwflbm,rwflmc from gdm_rwflbm order by rwflbm","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td colspan="3"><input type="text" name="rwmc" size="73" maxlength="100"  value="" ></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">�������</td>
  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "rwdx","1+�ͻ�&2+ʩ����&3+��Ӧ��&4+���ʦ&5+�ʼ�","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ��漰������</td>
  <td><%
	cf.radioToken(out, "sfsjysxm","Y+��&N+��","");
%></td>
  <td align="right" bgcolor="#FFFFFF">������Ŀ</td>
  <td bgcolor="#FFFFFF"><select name="gcysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_gcysxm where ysxmflbm='05' order by gcysxmbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">�Ƿ��漰������Ŀ</td>
  <td bgcolor="#FFFFFF"><%
	cf.radioToken(out, "sfsjzcxm","Y+��&N+��","");
%></td>
  <td align="right" bgcolor="#FFFFFF">�漰���Ĵ���</td>
  <td bgcolor="#FFFFFF"><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb='1' order by cldlmc","");
%>
  </select></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right">�漰���Ľڵ�</td>
  <td>
  <select name="sjzcjd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  <%
	cf.selectToken(out,"03+����֪ͨ&05+�Ѳ���& 25+����֪ͨ&26+����&09+��ͬ�����&11+��ͬ��ȷ��&13+�����ѽ���&15+ȷ���ͻ�ʱ��&17+��֪ͨ�ͻ�&19+�ͻ���װ��� ","");
%>
  </select></td>
  <td align="right" bgcolor="#FFFFFF">��������</td>
  <td bgcolor="#FFFFFF"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from gdm_bjjbbm order by bjjbbm","");
%>
  </select></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����ʱ��</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "bjsj","1+��ǰ����&2+�º�����&3+��ǰ�º�����&9+������","");
%>  </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ�Ӱ���������</td>
  <td><%
	cf.radioToken(out, "sfyxhxgq","Y+��&N+��","");
%></td>
  <td align="right" bgcolor="#FFFFFF">�ص�������</td>
  <td bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zdjkrw","Y+�ص���&N+���ص���","");
%></td>
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
