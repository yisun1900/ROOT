<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_cpgzjlJdList.jsp" name="selectform">
<div align="center">¼��״̬��Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
</tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"> �ֹ�˾ </td>
    <td><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
        <%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and  dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
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
      </select>    </td>
    <td align="right"> ǩԼ���� </td>
    <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
        <%
					if (kfgssq.equals("2") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
					}
					else if (kfgssq.equals("1") )
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
					}
					else if (kfgssq.equals("3"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
					}
					else if (kfgssq.equals("4"))
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
					}
					else{
						out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
						return;
					}
					%>
      </select>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ǩԼ���� ��</td>
    <td><input type="text" name="qyrq" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
    <td align="right">��</td>
    <td><input type="text" name="qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ͬ��</td>
    <td><input type="text" name="hth" size="20" maxlength="20">    </td>
    <td align="right">�ͻ����</td>
    <td><input type="text" name="khbh" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���ʦ</td>
    <td><input type="text" name="sjs" size="20" maxlength="20">    </td>
    <td align="right">���̵���</td>
    <td><input type="text" name="zjxm" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>�ͻ�����</b></font></td>
    <td><input type="text" name="khxm" size="20" maxlength="50">    </td>
    <td align="right">�ͻ�����</td>
    <td><input type="text" name="khxm2" size="14" maxlength="50" >
      ��ģ����ѯ�� </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>��ϵ��ʽ</b></font> </td>
    <td><input type="text" name="lxfs" size="20" maxlength="50">    </td>
    <td align="right"> ��ϵ��ʽ </td>
    <td><input type="text" name="lxfs2" size="14" maxlength="50">
      ��ģ����ѯ�� </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>���ݵ�ַ</b></font></td>
    <td colspan="3"><input type="text" name="fwdz" size="71" maxlength="100">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ���ݵ�ַ </td>
    <td colspan="3"><input type="text" name="fwdz2" size="65" maxlength="50" >
      ��ģ����ѯ�� </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="20%">��Ʒ����</td> 
  <td width="30%"><select name="crm_cpgzjl_cpflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cpflbm,cpflmc from dm_cpflbm order by cpflbm","");
%>
  </select></td>
  <td align="right" width="20%">��Ʒ״̬</td> 
  <td width="30%"><select name="crm_cpgzjl_cpztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select cpztbm,cpztmc from dm_cpztbm order by cpztbm","");
%>
    </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">��Ʒ����</td> 
  <td width="30%"> 
<%
	cf.radioToken(out, "crm_cpgzjl_cplx","1+����Ʒ&2+��Ʒ","");
%>  </td>
  <td align="right" width="20%">��Ʒ��װ����</td> 
  <td width="30%"> 
<%
	cf.radioToken(out, "crm_cpgzjl_cpazlx","1+ʩ����&2+��װ��","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">������</td> 
  <td width="30%"> 
<%
	cf.radioToken(out, "crm_cpgzjl_ghf","�׹�+�׹�&��˾��+��˾��&δȷ��+δȷ��","");
%>  </td>
  <td align="right" width="20%">�׹�Ʒ��</td> 
  <td width="30%"> 
    <input type="text" name="crm_cpgzjl_jgpp" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">��������֪ʱ��</td> 
  <td width="30%"> 
    <input type="text" name="crm_cpgzjl_ghfhzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="20%">�Ƿ񽻵׺��¶���</td> 
  <td width="30%"> 
<%
	cf.radioToken(out, "crm_cpgzjl_sfxdd","Y+��&N+��","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">�Ƿ����������</td> 
  <td width="30%"> 
<%
	cf.radioToken(out, "crm_cpgzjl_sfxhxgl","Y+��&N+��","");
%>  </td>
  <td align="right" width="20%">ѡ���Ƿ����</td> 
  <td width="30%"> 
<%
	cf.radioToken(out, "crm_cpgzjl_zxsfwz","Y+��&N+��","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">�Ƿ��践��</td> 
  <td colspan="3">
	<INPUT type="radio" name="crm_cpgzjl_sfxfb" value="N">�޷���
	<INPUT type="radio" name="crm_cpgzjl_sfxfb" value="Y">�ȴ�����
	<INPUT type="radio" name="crm_cpgzjl_sfxfb" value="W">�����ɹ�
	<INPUT type="radio" name="crm_cpgzjl_sfxfb" value="S">����ʧ��  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">�Ƿ����쳣</td> 
  <td colspan="3">
	<INPUT type="radio" name="crm_cpgzjl_sfyyc" value="N">���쳣
	<INPUT type="radio" name="crm_cpgzjl_sfyyc" value="Y">�ȴ�����
	<INPUT type="radio" name="crm_cpgzjl_sfyyc" value="W">�쳣����ɹ�
	<INPUT type="radio" name="crm_cpgzjl_sfyyc" value="S">�쳣���ʧ��  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���������</td>
  <td><input type="text" name="crm_cpgzjl_fbdbh" size="20" maxlength="10" ></td>
  <td align="right">�쳣�����</td>
  <td><input type="text" name="crm_cpgzjl_ycdbh" size="20" maxlength="10" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">��������</td> 
  <td width="30%"><input type="text" name="crm_cpgzjl_txrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="20%">��</td> 
  <td width="30%"><input type="text" name="crm_cpgzjl_txrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">�Ƿ�������</td> 
  <td width="30%"><%
	cf.radioToken(out, "crm_cpgzjl_sfxtx","Y+������&N+��","");
%></td>
  <td align="right" width="20%">��Ʒ���ʦ</td> 
  <td width="30%"><input type="text" name="crm_cpgzjl_cpsjs" size="20" maxlength="30" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">¼��ʱ�� �� </td> 
  <td width="30%"><input type="text" name="crm_cpgzjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="20%">��</td> 
  <td width="30%"><input type="text" name="crm_cpgzjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼����</td>
  <td><input type="text" name="crm_cpgzjl_lrr" size="20" maxlength="20" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">����Ӧ�������� ��</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_zwyjcrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" bgcolor="#FFFFCC">��</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_zwyjcrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ƻ����ʱ�� ��</td>
  <td><input type="text" name="crm_cpgzjl_jhrksj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_cpgzjl_jhrksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">�ƻ��ͻ�ʱ�� ��      </td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_jhshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" bgcolor="#FFFFCC">��</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_jhshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ƻ���װʱ�� ��</td>
  <td><input type="text" name="crm_cpgzjl_jhazsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_cpgzjl_jhazsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">״̬����ʱ�� ��</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_ztfssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" bgcolor="#FFFFCC"> ��</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_ztfssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ʵ���ʱ�� ��</td>
  <td><input type="text" name="crm_cpgzjl_srksj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_cpgzjl_srksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">ʵ�ͻ�ʱ�� ��</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_sshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" bgcolor="#FFFFCC">��</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_sshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�״����Ű�װʱ�� ��</td>
  <td><input type="text" name="crm_cpgzjl_scazsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_cpgzjl_scazsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">��װ���ʱ�� ��</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_azwcsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" bgcolor="#FFFFCC">��</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_azwcsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
<%
	cf.ajax(out);//����AJAX
%>


function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_cpgzjl_ghfhzsj, "��������֪ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_txrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_txrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}

	
	if(!(isDatetime(FormName.crm_cpgzjl_zwyjcrq, "����Ӧ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_zwyjcrq2, "����Ӧ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_jhrksj, "�ƻ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_jhrksj2, "�ƻ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_jhshsj, "�ƻ��ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_jhshsj2, "�ƻ��ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_jhazsj, "�ƻ���װʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_jhazsj2, "�ƻ���װʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_ztfssj, "״̬����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_ztfssj2, "״̬����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_srksj, "ʵ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_srksj2, "ʵ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_sshsj, "ʵ�ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_sshsj2, "ʵ�ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_scazsj, "�״����Ű�װʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_scazsj2, "�״����Ű�װʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_azwcsj, "��װ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_azwcsj2, "��װ���ʱ��"))) {
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
