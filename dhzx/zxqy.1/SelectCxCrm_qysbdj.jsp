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
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String kfgssq=(String)session.getAttribute("kfgssq");
String sjs=yhmc;
if (!zwbm.equals("04"))
{
	sjs="";
}
String ywy=yhmc;
if (!zwbm.equals("19"))
{
	ywy="";
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_qysbdjCxList.jsp" name="selectform">
<div align="center">�ɵ��ͻ���ѯ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
</tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">�����ֹ�˾</td>
    <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
    <td align="right">��ѯ����</td>
    <td><select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right" width="21%">�ͻ����</td> 
  <td width="29%"> 
    <input type="text" name="khbh" size="20" maxlength="20" >  </td>
  <td align="right" width="21%">�ͻ�����</td> 
  <td width="29%"><input type="text" name="khxm" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">���ݵ�ַ</td> 
  <td colspan="3"><input type="text" name="fwdz" size="73" maxlength="100" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ҵ��Ա</td>
  <td><input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="100" <% if (!ywy.equals("")) out.println("readonly");%>>  </td>
  <td align="right">���ʦ</td>
  <td><input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="100" <% if (!sjs.equals("")) out.println("readonly");%>>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">�ɵ�ԭ��</td> 
  <td width="29%"> 
    <select name="sbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm","");
%>
    </select>  </td>
  <td align="right" width="21%">�ɵ��ͻ�����</td> 
  <td width="29%"> 
    <select name="sbkhlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sbkhlx c1,sbkhlx c2 from crm_sbkhlx where ssfgs='"+ssfgs+"' order by xh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ɵ�ʱ�� ��</td>
  <td><input type="text" name="sbsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="sbsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">��Ʋ���˽���</td> 
  <td width="29%"><%
	cf.radioToken(out, "sjbshjl","Y+ͨ��&N+δͨ��","");
%></td>
  <td align="right" width="21%">&nbsp;</td> 
  <td width="29%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">��Ʋ������</td> 
  <td width="29%"> 
    <input type="text" name="sjbshr" size="20" maxlength="20" >  </td>
  <td align="right" width="21%">��Ʋ����ʱ��</td> 
  <td width="29%"> 
    <input type="text" name="sjbshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">�г�����˽���</td> 
  <td width="29%"> 
<%
	cf.radioToken(out, "scbshjl","Y+ͨ��&N+δͨ��","");
%>  </td>
  <td align="right" width="21%">�г��������</td> 
  <td width="29%"> 
    <input type="text" name="scbshr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">�г������ʱ��</td> 
  <td width="29%"> 
    <input type="text" name="scbshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="21%">�Ӵ�������˽���</td> 
  <td width="29%"> 
<%
	cf.radioToken(out, "zgshjl","Y+ͨ��&N+δͨ��","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">�Ӵ����������</td> 
  <td width="29%"> 
    <input type="text" name="zgshr" size="20" maxlength="20" >  </td>
  <td align="right" width="21%">�Ӵ��������ʱ��</td> 
  <td width="29%"> 
    <input type="text" name="zgshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">�طü�¼��</td> 
  <td width="29%"> 
    <input type="text" name="hfjlh" size="20" maxlength="9" >  </td>
  <td align="right" width="21%">�ط���</td> 
  <td width="29%"> 
    <input type="text" name="hfr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">�ط�ʱ�� ��</td> 
  <td width="29%"><input type="text" name="hfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="21%">��</td> 
  <td width="29%"><input type="text" name="hfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">�ط÷ɵ��ͻ�����</td> 
  <td width="29%"> 
    <select name="hfsbkhlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sbkhlx c1,sbkhlx c2 from crm_sbkhlx where ssfgs='"+ssfgs+"' order by xh","");
%>
    </select>  </td>
  <td align="right" width="21%">�ط÷ɵ�ԭ��</td> 
  <td width="29%"><select name="hfsbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ط÷ɵ�ʱ�� ��</td>
  <td><input type="text" name="hfsbsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="hfsbsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����طü�¼��</td>
  <td><input type="text" name="crm_qysbdj_sjhfjlh" size="20" maxlength="9" >  </td>
  <td align="right">����ط���</td>
  <td><input type="text" name="crm_qysbdj_sjhfr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ط�ʱ�� ��</td>
  <td><input type="text" name="crm_qysbdj_sjhfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_qysbdj_sjhfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ط�ʧ��ԭ��</td>
  <td><select name="crm_qysbdj_sjhfsbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm","");
%>
  </select></td>
  <td align="right">����ط�ʧ�ܿͻ�����</td>
  <td><select name="crm_qysbdj_sjhfsbkhlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sbkhlx c1,sbkhlx c2 from crm_sbkhlx where ssfgs='"+ssfgs+"'","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ط�ʧ��ʱ�� ��</td>
  <td><input type="text" name="crm_qysbdj_sjhfsbsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_qysbdj_sjhfsbsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ϣ���Ƿ�ط�</td>
  <td><%
	cf.radioToken(out, "crm_qysbdj_xxrsfhf","Y+�ط�&N+δ�ط�","");
%>  </td>
  <td align="right">��Ϣ�˻طü�¼��</td>
  <td><input type="text" name="crm_qysbdj_xxrhfjlh" size="20" maxlength="9" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ϣ�˻ط���</td>
  <td><input type="text" name="crm_qysbdj_xxrhfr" size="20" maxlength="20" >  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ϣ�˻ط�ʱ�� ��</td>
  <td><input type="text" name="crm_qysbdj_xxrhfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_qysbdj_xxrhfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ϣ�˻ط÷ɵ�ԭ��</td>
  <td><select name="crm_qysbdj_xxrhfsbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm","");
%>
  </select>  </td>
  <td align="right">��Ϣ�˻ط÷ɵ��ͻ�����</td>
  <td><select name="crm_qysbdj_xxrhfsbkhlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sbkhlx c1,sbkhlx c2 from crm_sbkhlx where ssfgs='"+ssfgs+"'","");
%>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ϣ�˻ط÷ɵ�ʱ�� ��</td>
  <td><input type="text" name="crm_qysbdj_xxrhfsbsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_qysbdj_xxrhfsbsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">״̬</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "clzt","1+���ʦ�ύ&2+��Ʋ����&3+�г������&4+�Ӵ��������&5+�ط�","");
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼����</td>
  <td><input type="text" name="lrr" size="20" maxlength="20" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">¼��ʱ�� ��</td> 
  <td width="29%"><input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="21%">��</td> 
  <td width="29%"><input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
	//����Ajax
	cf.ajax(out);
%>

function changeFgs(FormName)
{
	FormName.zxdm.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}


function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.zxdm,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.sbsj, "�ɵ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sbsj2, "�ɵ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjbshsj, "��Ʋ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.scbshsj, "�г������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zgshsj, "�Ӵ��������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.hfsj, "�ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.hfsj2, "�ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.hfsbsj, "�ط÷ɵ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.hfsbsj2, "�ط÷ɵ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_qysbdj_sjhfsj, "����ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_qysbdj_sjhfsj2, "����ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_qysbdj_sjhfsbsj, "����ط�ʧ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_qysbdj_sjhfsbsj2, "����ط�ʧ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_qysbdj_xxrhfsj, "��Ϣ�˻ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_qysbdj_xxrhfsj2, "��Ϣ�˻ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_qysbdj_xxrhfsbsj, "��Ϣ�˻ط÷ɵ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_qysbdj_xxrhfsbsj2, "��Ϣ�˻ط÷ɵ�ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>