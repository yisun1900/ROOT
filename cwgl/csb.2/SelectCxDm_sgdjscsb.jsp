<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


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
<form method="post" action="Dm_sgdjscsbCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ֹ�˾</td> 
  <td width="32%"> 
    <select name="dm_sgdjscsb_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
		if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
    </select>  </td>
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <select name="dm_sgdjscsb_bfcs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">��һ��</option>
    <option value="2">�ڶ���</option>
    <option value="3">������</option>
    <option value="4">���Ĵ�</option>
    <option value="5">�����</option>
    <option value="6">������</option>
    <option value="7">���ߴ�</option>
    <option value="8">�ڰ˴�</option>
    <option value="9">�ھŴ�</option>
    <option value="10">��ʮ��</option>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="radio" name="bfjs"  value="1">���̷�
	<BR>
    <input type="radio" name="bfjs"  value="2">���̷ѣ�������
	<BR>
    <input type="radio" name="bfjs"  value="3">ʵ�տ��ܶ�
	<BR>
    <input type="radio" name="bfjs"  value="4">һ�ڿ�
	<BR>
    <input type="radio" name="bfjs"  value="5">���ڿ�
	<BR>
    <input type="radio" name="bfjs"  value="6">���ڿ�
	<BR>
    <input type="radio" name="bfjs"  value="7">���̻�������
	<BR>
    <input type="radio" name="bfjs"  value="8">���̻������ۣ������ѻ�������
	<BR>
    <input type="radio" name="bfjs"  value="9">����ʩ���ɱ���
	<BR>
    <input type="radio" name="bfjs"  value="A">����ʩ���ɱ��ۣ�������ʩ���ɱ�
	<BR>
    <input type="radio" name="bfjs"  value="B">���̳ɱ���  
	<BR>
    <input type="radio" name="bfjs"  value="C">���̳ɱ��ۣ������ѳɱ�  </td>
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="dm_sgdjscsb_bfbl" size="20" maxlength="9" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ˮ��·���㷽ʽ</td>
  <td>
	<input type="radio" name="sdljsfs"  value="1">ͳһ��������
	<BR>
	<input type="radio" name="sdljsfs"  value="2">������������
	<BR>
	<input type="radio" name="sdljsfs"  value="3">�ֹ�¼�������
	<BR>
	<input type="radio" name="sdljsfs"  value="9">������
  </td>
  <td align="right">ˮ��·��������</td>
  <td><input type="text" name="dm_sgdjscsb_sdlbfbl" size="20" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ���ʱ���</td> 
  <td width="32%">
	<input type="radio" name="sfkzbj"  value="Y">���ʱ���������ɸ�
	<BR>
	<input type="radio" name="sfkzbj"  value="M">���ʱ�������ɸ�
	<BR>
	<input type="radio" name="sfkzbj"  value="N">�����ʱ���
  </td>
  <td align="right" width="18%">���ʱ������</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "dm_sgdjscsb_kzbjjs","1+�������&2+�����ܶ�","");
%>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ�۲��Ͽ�</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "dm_sgdjscsb_sfkclk","Y+��&N+��","");
%>  </td>
  <td align="right" width="18%">�Ƿ�۹�����Ʒ</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "dm_sgdjscsb_sfkgdyp","Y+��&N+��","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ���Ѹ�����</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "dm_sgdjscsb_sfkyfgf","Y+��&N+��","");
%>  </td>
  <td align="right" width="18%">�Ƿ��깤����</td> 
  <td width="32%"><%
	cf.radioToken(out, "dm_sgdjscsb_sfwgjs","Y+��&N+��","");
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
	if(!(isNumber(FormName.dm_sgdjscsb_bfcs, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.dm_sgdjscsb_bfbl, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.dm_sgdjscsb_sdlbfbl, "ˮ��·��������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
