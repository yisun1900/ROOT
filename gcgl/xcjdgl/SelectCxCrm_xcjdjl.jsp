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
String zwbm=(String)session.getAttribute("zwbm");
String yhmc=(String)session.getAttribute("yhmc");

String sjs=yhmc;
if (!zwbm.equals("04"))
{
	sjs="";
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_xcjdjlCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
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
    <td>
	<select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
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
  <td width="34%"><input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" <% if (!sjs.equals("")) out.println("readonly");%>></td>
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
    <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���׼�¼��</td> 
  <td width="31%"> 
    <input type="text" name="crm_xcjdjl_jdjlh" size="20" maxlength="10" >  </td>
  <td align="right" width="19%">����״̬</td> 
  <td width="31%">
	<select name="crm_xcjdjl_clzt" style="FONT-SIZE:12PX;WIDTH:152PX"  >
		<option value=""></option>
		<option value="1">����</option>
		<option value="2">ȷ��</option>
		<option value="3">����ȷ��</option>
		<option value="4">�������</option>
		<option value="5">����</option>
		<option value="6">�ѽ���</option>
	</select>
  </td>

</tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�����Ƿ�ɹ�</td>
    <td><%
	cf.radioToken(out, "crm_xcjdjl_jdsfcg","Y+�ɹ�&N+��","");
%></td>
    <td align="right">�Ƿ�ɿ���</td>
    <td><%
	cf.radioToken(out, "crm_xcjdjl_sfkkg","Y+��&N+��","");
%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right">�������� ��</td>
  <td><input type="text" name="crm_xcjdjl_sqrq" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xcjdjl_sqrq2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������</td> 
  <td width="31%"><input type="text" name="crm_xcjdjl_sqr" size="20" maxlength="20" ></td>
  <td align="right" width="19%">��������ϵ�绰</td> 
  <td width="31%"><input type="text" name="crm_xcjdjl_sqrlxdh" size="20" maxlength="40" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�Ƿ�������</td> 
  <td width="31%">
	<INPUT type="radio" name="crm_xcjdjl_sfxtp" value="Y">��
    <INPUT type="radio" name="crm_xcjdjl_sfxtp" value="N">��
  </td>
  <td align="right" width="19%">ʧ���Ƿ���</td> 
  <td width="31%"><%
	cf.radioToken(out, "crm_xcjdjl_sbsfcl","Y+��&N+��","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ƻ��������� ��</td>
  <td><input type="text" name="crm_xcjdjl_jhjdrq" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xcjdjl_jhjdrq2" size="20" maxlength="10" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">������ʱ�� ��</td>
  <td><input type="text" name="crm_xcjdjl_zcwcsj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xcjdjl_zcwcsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����Ƿ�ͨ��</td>
  <td><%
	cf.radioToken(out, "crm_xcjdjl_tpsftg","Y+ͨ��&N+δͨ��","");
%></td>
  <td align="right">���������</td>
  <td><input type="text" name="crm_xcjdjl_tpshr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������ʱ�� ��</td>
  <td><input type="text" name="crm_xcjdjl_tpshsj" size="20" maxlength="10" ></td>
  <td align="right">�� </td>
  <td><input type="text" name="crm_xcjdjl_tpshsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">����ȷ�����ʱ�� ��</td> 
  <td width="31%"><input type="text" name="crm_xcjdjl_jdqrwcsj" size="20" maxlength="10" ></td>
  <td align="right" width="19%">��</td> 
  <td width="31%"><input type="text" name="crm_xcjdjl_jdqrwcsj2" size="20" maxlength="10" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���׷�����</td> 
  <td width="31%"> 
    <input type="text" name="crm_xcjdjl_fbr" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���׷���ʱ�� ��</td>
  <td><input type="text" name="crm_xcjdjl_fbsj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xcjdjl_fbsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ȷ�Ͻ������� ��</td>
  <td><input type="text" name="crm_xcjdjl_zzqrjdrq" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xcjdjl_zzqrjdrq2" size="20" maxlength="10" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">ʵ�ʽ���ʱ�� ��</td>
  <td><input type="text" name="crm_xcjdjl_sjjdsj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_xcjdjl_sjjdsj2" size="20" maxlength="10" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">ͼֽ�Ƿ�����</td> 
  <td width="31%"><%
	cf.radioToken(out, "crm_xcjdjl_tzsfqr","Y+��&N+��","");
%></td>
  <td align="right" width="19%">�����Ƿ����</td> 
  <td width="31%"><%
	cf.radioToken(out, "crm_xcjdjl_fasfkx","Y+��&N+��","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�ͻ��Ƿ��Ͽ�</td> 
  <td width="31%"><%
	cf.radioToken(out, "crm_xcjdjl_khsfqr","Y+��&N+��","");
%></td>
  <td align="right" width="19%">�ֳ������˳������</td> 
  <td width="31%"><%
	cf.radioToken(out, "crm_xcjdjl_xcfzrqr","Y+��&N+��","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">ǽ�崹ֱ���Ƿ�ȷ��</td> 
  <td width="31%"><%
	cf.radioToken(out, "crm_xcjdjl_qtczdqr","Y+��&N+��","");
%></td>
  <td align="right" width="19%">¼����</td> 
  <td width="31%"><input type="text" name="crm_xcjdjl_lrr" size="20" maxlength="20" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">¼��ʱ�� ��</td> 
  <td width="31%"><input type="text" name="crm_xcjdjl_lrsj" size="20" maxlength="10" ></td>
  <td align="right" width="19%">��</td> 
  <td width="31%"><input type="text" name="crm_xcjdjl_lrsj2" size="20" maxlength="10" ></td>
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
	if(!(isDatetime(FormName.crm_xcjdjl_sqrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_sqrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_jhjdrq, "�ƻ���������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_jhjdrq2, "�ƻ���������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_zcwcsj, "������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_zcwcsj2, "������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_jdqrwcsj, "����ȷ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_jdqrwcsj2, "����ȷ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_fbsj, "���׷���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_fbsj2, "���׷���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_zzqrjdrq, "����ȷ�Ͻ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_zzqrjdrq2, "����ȷ�Ͻ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_sjjdsj, "ʵ�ʽ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_sjjdsj2, "ʵ�ʽ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_tpshsj, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_tpshsj2, "�������ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>