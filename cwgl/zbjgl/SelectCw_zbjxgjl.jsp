<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_zbjxgjlList.jsp" name="selectform">
<div align="center">�޸��ʱ����޸ļ�¼</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right">�����ֹ�˾</td>
    <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
		if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
			return;
		}
	%>
      </select>    </td>
    <td align="right">������־</td>
    <td><select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <option value="N">δ����</option>
        <option value="Y">�ѳ���</option>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><div align="right">
      ʩ���ӱ�� </td>
    <td><input type="text" name="sq_sgd_sgd" size="20" maxlength="5" >    </td>
    <td align="right"><div align="right">
      ʩ�������� </td>
    <td><input type="text" name="sq_sgd_sgdmc" size="20" maxlength="100" >    </td>
  </tr>
  
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ʱ������ԭ��</td> 
  <td width="32%"> 
    <select name="cw_zbjxgjl_zbjjsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select zbjjsyybm,zbjjsyymc from dm_zbjjsyybm order by zbjjsyybm","");
%>
    </select>  </td>
  <td align="right" width="18%">¼����</td> 
  <td width="32%"><input type="text" name="cw_zbjxgjl_lrr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼��ʱ�� �� </td> 
  <td width="32%"><input type="text" name="cw_zbjxgjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="cw_zbjxgjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����¼��</td>
  <td><input type="text" name="jsjlh" size="20" maxlength="9" ></td>
  <td align="right">Ͷ�߱��޼�¼��</td>
  <td><input type="text" name="tsjlh" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ɾ����־</td>
  <td><label>
    <input name="scbz" type="radio" value="N" checked>
    δɾ��
  </label></td>
  <td align="right">����</td>
  <td><input type="radio" name="lx" value="1" checked>�ֹ�¼��
	</td>
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
	if(!(isDatetime(FormName.cw_zbjxgjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_zbjxgjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
