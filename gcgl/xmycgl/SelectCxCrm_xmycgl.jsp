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
<form method="post" action="Crm_xmycglCxList.jsp" name="selectform">
<div align="center">��Ŀ�쳣�Ǽǣ���ѯ</div>
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
    <td align="right">�ܼ�</td>
    <td><input type="text" name="gj" size="20" maxlength="20"></td>
    <td align="right">����</td>
    <td><input type="text" name="dd" size="20" maxlength="20"></td>
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
    <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
    </tr>
  
  <tr bgcolor="#FFFFFF">
  <td align="right" width="20%">�ǼǱ��</td> 
  <td width="30%"> 
    <input type="text" name="crm_xmycgl_djbh" size="20" maxlength="10" >  </td>
  <td align="right" width="20%">״̬</td> 
  <td width="30%"><select name="crm_xmycgl_zt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">�쳣¼��</option>
    <option value="2">�ƶ�����</option>
    <option value="3">�������</option>
    <option value="4">�Ѵ���</option>
    <option value="5">ͣ������</option>
    <option value="6">ͣ������</option>
    <option value="7">����ͣ��</option>
    <option value="8">������</option>
  </select></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right">��������ʱ�� ��</td>
  <td><input type="text" name="crm_xmycgl_cxwtsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmycgl_cxwtsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="crm_xmycgl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmycgl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">¼����</td> 
  <td width="30%"><input type="text" name="crm_xmycgl_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="20%">������</td> 
  <td width="30%"><input type="text" name="crm_xmycgl_dsr" size="20" maxlength="20" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">��������ƶ�ʱ�� ��</td> 
  <td width="30%"><input type="text" name="crm_xmycgl_jjfazdsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="20%">��</td> 
  <td width="30%"><input type="text" name="crm_xmycgl_jjfazdsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������ƶ���</td>
  <td><input type="text" name="crm_xmycgl_jjfazdr" size="20" maxlength="20" ></td>
  <td align="right">������������</td>
  <td><input type="text" name="crm_xmycgl_jjfashr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">����������ʱ�� ��</td> 
  <td width="30%"><input type="text" name="crm_xmycgl_jjfashsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="20%">��</td> 
  <td width="30%"><input type="text" name="crm_xmycgl_jjfashsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">�������¼��ʱ�� ��</td>
  <td><input type="text" name="crm_xmycgl_clqklrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmycgl_clqklrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����Ƿ���</td>
  <td><INPUT type="radio" name="crm_xmycgl_wtsfjj" value="Y">
    ���
      <INPUT type="radio" name="crm_xmycgl_wtsfjj" value="N">
      δ��� </td>
  <td align="right">�������¼����</td>
  <td><input type="text" name="crm_xmycgl_clqklrr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ͣ��������</td>
  <td><input type="text" name="crm_xmycgl_tgsqr" size="20" maxlength="20" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ͣ������ʱ�� ��</td>
  <td><input type="text" name="crm_xmycgl_tgsqsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmycgl_tgsqsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ͣ�������</td>
  <td><input type="text" name="crm_xmycgl_tgshr" size="20" maxlength="20" ></td>
  <td align="right">ͣ����˽��</td>
  <td><INPUT type="radio" name="crm_xmycgl_tgshjg" value="Y">
    ͨ��
      <INPUT type="radio" name="crm_xmycgl_tgshjg" value="N">
      δͨ�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ͣ�����ʱ�� ��</td>
  <td><input type="text" name="crm_xmycgl_tgshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmycgl_tgshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ͣ��ԭ��</td>
  <td><select name="crm_xmycgl_tgyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select tgyybm,tgyymc from dm_tgyybm order by tgyybm","");
%>
  </select></td>
  <td align="right">ͣ��¼����</td>
  <td><input type="text" name="crm_xmycgl_tglrr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ͣ��¼��ʱ�� ��</td>
  <td><input type="text" name="crm_xmycgl_tglrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmycgl_tglrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ͣ����ʼʱ�� ��</td>
  <td><input type="text" name="crm_xmycgl_tgkssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmycgl_tgkssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���Ƹ������� ��</td>
  <td><input type="text" name="crm_xmycgl_gjfgsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmycgl_gjfgsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ʵ�ʸ������� ��</td>
  <td><input type="text" name="crm_xmycgl_sjfgsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmycgl_sjfgsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����¼����</td>
  <td><input type="text" name="crm_xmycgl_fglrr" size="20" maxlength="20" >  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����¼��ʱ�� ��</td>
  <td><input type="text" name="crm_xmycgl_fglrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xmycgl_fglrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
	if(!(isDatetime(FormName.qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "ǩԼ����"))) {
		return false;
	}

	if(!(isDatetime(FormName.crm_xmycgl_cxwtsj, "��������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_cxwtsj2, "��������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_lrsj2, "¼��ʱ��"))) {
		return false;
	}

	if(!(isDatetime(FormName.crm_xmycgl_jjfazdsj, "��������ƶ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_jjfazdsj2, "��������ƶ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_jjfashsj, "����������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_jjfashsj2, "����������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_clqklrsj, "�������¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_clqklrsj2, "�������¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_tgsqsj, "ͣ������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_tgsqsj2, "ͣ������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_tgshsj, "ͣ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_tgshsj2, "ͣ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_tgkssj, "ͣ����ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_tgkssj2, "ͣ����ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_gjfgsj, "���Ƹ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_gjfgsj2, "���Ƹ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_tglrsj, "ͣ��¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_tglrsj2, "ͣ��¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_sjfgsj, "ʵ�ʸ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_sjfgsj2, "ʵ�ʸ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_fglrsj, "����¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_fglrsj2, "����¼��ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
