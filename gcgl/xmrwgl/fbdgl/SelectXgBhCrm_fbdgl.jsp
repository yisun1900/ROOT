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
<form method="post" action="Crm_fbdglXgBhList.jsp" name="selectform">
<div align="center">����ά�޵������޸ı���</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
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
    <td colspan="4" bgcolor="#CCCCFF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���������</td> 
  <td width="31%"> 
    <input type="text" name="crm_fbdgl_fbdbh" size="20" maxlength="10" >  </td>
  <td align="right" width="19%">״̬</td> 
  <td width="31%"><select name="crm_fbdgl_zt" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option value="4">�������</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��Ʒ����</td> 
  <td width="31%"> 
    <select name="crm_fbdgl_cpflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cpflbm,cpflmc from dm_cpflbm order by cpflbm","");
%>
    </select>  </td>
  <td align="right" width="19%">��Ʒ�ӿ���</td> 
  <td width="31%"><input type="text" name="crm_fbdgl_cpjkr" size="20" maxlength="20" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">����ά�޷���ʱ���</td>
  <td><input type="text" name="crm_fbdgl_fssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_fbdgl_fssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">�ƻ��������ʱ�� ��</td>
  <td><input type="text" name="crm_fbdgl_jhbhwcsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_fbdgl_jhbhwcsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�ƻ���װʱ�� ��</td> 
  <td width="31%"><input type="text" name="crm_fbdgl_jhazsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="19%">��</td> 
  <td width="31%"><input type="text" name="crm_fbdgl_jhazsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">����¼����</td> 
  <td width="31%"> 
    <input type="text" name="crm_fbdgl_falrr" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">����¼��ʱ��</td> 
  <td width="31%"> 
    <input type="text" name="crm_fbdgl_falrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����µ����� ��</td>
  <td><input type="text" name="crm_fbdgl_xdsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_fbdgl_xdsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">����������� ��</td>
  <td><input type="text" name="crm_fbdgl_bhwcrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_fbdgl_bhwcrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>



<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">¼��ʱ�� ��</td> 
  <td width="31%"><input type="text" name="crm_fbdgl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="19%">��</td> 
  <td width="31%"><input type="text" name="crm_fbdgl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">¼����</td> 
  <td width="31%"><input type="text" name="crm_fbdgl_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="19%">¼�벿�� </td>
  <td width="31%"><select name="crm_fbdgl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
	if(!(isDatetime(FormName.crm_fbdgl_fssj, "����ά�޷���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fbdgl_fssj2, "����ά�޷���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fbdgl_jhbhwcsj, "�ƻ��������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fbdgl_jhbhwcsj2, "�ƻ��������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fbdgl_jhazsj, "�ƻ���װʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fbdgl_jhazsj2, "�ƻ���װʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fbdgl_falrsj, "����¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fbdgl_xdsj, "�����µ�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fbdgl_xdsj2, "�����µ�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fbdgl_bhwcrq, "�����������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fbdgl_bhwcrq2, "�����������"))) {
		return false;
	}

	if(!(isDatetime(FormName.crm_fbdgl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fbdgl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
