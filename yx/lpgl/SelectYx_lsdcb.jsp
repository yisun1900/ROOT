<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>
<%
String lrr=(String)session.getAttribute("yhmc");
String dqbm=(String)session.getAttribute("dqbm");
String fgsbh=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
%>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Yx_lsdcbList.jsp" name="selectform">
<div align="center">ά��¥����Ϣ��¼����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">С�����</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_xqbh" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">С������</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_xqmc" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����</td> 
  <td width="32%"> 
    <select name="yx_lsdcb_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
  <td align="right" width="18%">����</td> 
  <td width="32%"> 
    <select name="yx_lsdcb_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sq_dwxx.dqbm,dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by sq_dwxx.dqbm","");
	}
	else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sq_dwxx.dqbm,dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by sq_dwxx.dqbm","");
	}
	else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
	{
		cf.selectItem(out,"select sq_dwxx.dqbm,dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh='"+ssfgs+"'",ssfgs);
	}
	else{
		out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
		return;
	}
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ַ</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_dz" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">�Ƽ�����</td> 
  <td width="32%"> 
    <select name="yx_lsdcb_tjdm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��λ</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_jw" size="20" maxlength="40" >  </td>
  <td align="right" width="18%">¥�̶�λ</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_yzxfsp","�ߵ�+�ߵ�&�иߵ�+�иߵ�&�е�+�е�&�͵�+�͵�","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¥������</td> 
  <td width="32%"> 
    <select name="yx_lsdcb_xz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"��Ʒ��+��Ʒ��&�������÷�+�������÷�&���ʷ�+���ʷ�&��Ǩ��+��Ǩ��&��ס���÷�+��ס���÷�&����+����","");
%>
    </select>  </td>
  <td align="right" width="18%">��ҵ��ʽ</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_wyxs" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">С����ģ</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_xqgm" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_hxzl" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_zlhx" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">�����������</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_zlhxmj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ҵ��Ա</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_ywy" size="20" maxlength="30" >  </td>
  <td align="right" width="18%">С�������Ƿ����</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_dysfwc","N+δ���&Y+���","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">С��������</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_xqfzr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">С�������˵绰</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_xqfzrdh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_lxsj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">���۷�ʽ</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_xsfs" size="20" maxlength="4" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Կ��ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_fyssj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_jfhs" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ����Ź�</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_sfytg","Y+��&N+��","");
%>  </td>
  <td align="right" width="18%">�ͻ����Ϲ������</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_khzlgmqk","��˾����+��˾����&Ա������+Ա������","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͻ�����</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_khmd","һ��+һ��&����+����&רҵ����+רҵ����","");
%>  </td>
  <td align="right" width="18%">�뿪���̹�ϵ</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_ykfsgx" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ��������</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_sfjcxc","Y+��&N+��","");
%>  </td>
  <td align="right" width="18%">�ͻ�ռ����</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_khzyl" size="20" maxlength="9" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����������ʽ</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_yxxcfs" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">������</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_kfs" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������ϵ��</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_kfslxr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">��������ϵ��ְ��</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_kfslxrzw" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������ϵ�˵绰</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_kfslxrdh" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">������</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_jzs" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_xss" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">��¥�绰</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_sldh" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����װ�޹�˾</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_ywzxgs","Y+��&N+��","");
%>  </td>
  <td align="right" width="18%">װ�޹�˾����</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_zxgssl" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��װ�޻���</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_yzxhs" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">�Ƿ�ͳһװ����</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_sftizxq","��+��&��+��","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">Ԥ��װ��ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_yjzxsj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">������ҵ��˾</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_ywwygs","Y+��&N+��","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ҵ��˾����</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_wygsmc" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">��ҵ������</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_wyfzr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ҵ�绰</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_wydh" size="20" maxlength="40" >  </td>
  <td align="right" width="18%">��ҵ��ϵ��</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_wylxr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ҵ��ϵ��ְ��</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_wylxrzw" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <select name="yx_lsdcb_kfjd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+δ����&2+������&3+����׼&4+δ��׼&5+�����","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼��ʱ�� ��</td> 
  <td width="32%"><input type="text" name="yx_lsdcb_lrsj" size="20" maxlength="10" ></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="yx_lsdcb_lrsj2" size="20" maxlength="10" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"><input type="text" name="yx_lsdcb_lrr" value="<%=lrr%>" size="20" maxlength="20" readonly></td>
  <td align="right" width="18%">�ֹ�˾ </td>
  <td width="32%"><select name="yx_lsdcb_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
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
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.yx_lsdcb_xqbh, "С�����"))) {
		return false;
	}
	if(!(isNumber(FormName.yx_lsdcb_zlhxmj, "�����������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lsdcb_lxsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lsdcb_fyssj, "��Կ��ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.yx_lsdcb_jfhs, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.yx_lsdcb_khzyl, "�ͻ�ռ����"))) {
		return false;
	}
	if(!(isNumber(FormName.yx_lsdcb_zxgssl, "װ�޹�˾����"))) {
		return false;
	}
	if(!(isNumber(FormName.yx_lsdcb_yzxhs, "��װ�޻���"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lsdcb_yjzxsj, "Ԥ��װ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lsdcb_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lsdcb_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
