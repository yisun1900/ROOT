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
<form method="post" action="Rs_shsqList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�������</td>
      <td width="35%"> 
        <select name="ztlx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"01+��Ƹ&02+��ѵ&03+�䶯&04+��������&06+������ְ&07+��������&08+�Ӱ�����&09+���ڿ�������&10+��ٵ�&11+��������&12+�����λ����&13+��ְ����&14+�˻���Ա����","");
	%> 
        </select>
      </td>
      <td align="right" width="15%">�û���</td>
      <td width="35%"> 
        <select name="yhzbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhzbh,yhzmc  from sq_yhz order by yhzbh","");
	%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">���״̬</td>
      <td colspan="3"> 
        <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:522PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc||'  ��'||DECODE(rs_ztbm.ztlx,'01','��Ƹ','02','��ѵ','03','�䶯','04','��������','06','������ְ','07','��������','08','�Ӱ�����','09','���ڿ�������','10','��ٵ�','11','��������','12','�����λ����')||'��' from rs_ztbm order by ztlx,ztbm","");
	%> 
        </select>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="��ѯ" onClick="f_do(selectform)">
        <input type="reset"  value="����">
      </td>
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
