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
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform">
<div align="center">�������ϳ�ʼ��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">���ϴ���</td>
  <td><select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changeCldlbm(insertform)">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlmc mc,cldlmc from jxc_cldlbm where cldllb in('2','3') order by cldlmc","");
%>
  </select></td>
  <td align="right">����С��</td>
  <td><select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changeClxlbm(insertform)">
    <option value=""></option>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ϱ���</td> 
  <td width="32%"> 
    <input type="text" name="clbm" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">�ڲ�����</td> 
  <td width="32%"><input type="text" name="nbbm" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td><input type="text" name="clmc" size="20" maxlength="50" ></td>
  <td align="right">��Ʒ��</td>
  <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
      <%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('2','3') order by ppmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͺ�</td> 
  <td width="32%"><input type="text" name="xh" size="20" maxlength="100" ></td>
  <td align="right" width="18%">���</td> 
  <td width="32%"><input type="text" name="gg" size="20" maxlength="100" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������λ</td> 
  <td width="32%"><select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc mc,jldwmc from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
  <td align="right" width="18%">��װ������λ</td> 
  <td width="32%"><select name="bzjldwbm" id="bzjldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc mc,jldwmc from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ���� ��</td> 
  <td width="32%"> 
    <input type="text" name="djzl" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="djzl2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ɹ����� ��</td> 
  <td width="32%"> 
    <input type="text" name="cgzq" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="cgzq2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������ ��</td> 
  <td width="32%"> 
    <input type="text" name="bzq" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="bzq2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���������� ��</td> 
  <td width="32%"> 
    <input type="text" name="bztxq" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="bztxq2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼��ʱ�� ��</td> 
  <td width="32%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="lrsj2" size="20" maxlength="10"  onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ÿҳ��ʾ����</td>
  <td><input type="text" name="myxssl" size="20" value="300"></td>
  <td align="right">����</td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDq(selectform)" >
    <%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
					}
					else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
						return;
					}
%>
  </select></td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯȫ������" onClick="f_do1(insertform)">
    <input type="button" onClick="f_do2(insertform)"  value="��ѯδ��ʼ������">
    <input type="button" onClick="f_do3(insertform)"  value="��ѯ����δ��ʼ������">
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

var lx="";

function changeCldlbm(FormName) //�ı������б��ֵ������Ajax
{
	FormName.clxlbm.length=1;
	FormName.ppmc.length=1;

	if (FormName.cldlbm.value=="")
	{
		return;
	}

	lx="1";

	var sql;
	sql="select clxlmc from jxc_clxlbm where cldlmc='"+FormName.cldlbm.value+"' order by clxlmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function changeClxlbm(FormName) //�ı������б��ֵ������Ajax
{
	FormName.ppmc.length=1;

	if (FormName.clxlbm.value=="")
	{
		return;
	}

	lx="2";

	var sql;
	sql="select ppmc from jxc_ppxx where pplb in('2','3') and cldl='"+FormName.cldlbm.value+"'  order by ppmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (lx=="1")
	{
		strToItem2(insertform.clxlbm,ajaxRetStr);
	}
	else if (lx=="2")
	{
		strToItem2(insertform.ppmc,ajaxRetStr);
	}
}

function f_do1(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.djzl, "��Ʒ����"))) {
		return false;
	}
	if(!(isNumber(FormName.djzl2, "��Ʒ����"))) {
		return false;
	}
	if(!(isNumber(FormName.cgzq, "�ɹ�����"))) {
		return false;
	}
	if(!(isNumber(FormName.cgzq2, "�ɹ�����"))) {
		return false;
	}
	if(!(isNumber(FormName.bzq, "������"))) {
		return false;
	}
	if(!(isNumber(FormName.bzq2, "������"))) {
		return false;
	}
	if(!(isNumber(FormName.bztxq, "����������"))) {
		return false;
	}
	if(!(isNumber(FormName.bztxq2, "����������"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.myxssl)=="") {
		alert("��ѡ��[ÿҳ��ʾ����]��");
		FormName.myxssl.focus();
		return false;
	}
	if(!(isNumber(FormName.myxssl, "ÿҳ��ʾ����"))) {
		return false;
	}

	FormName.action="Jxc_clbmCshList1.jsp";
	FormName.submit();
	return true;
}

function f_do2(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.djzl, "��Ʒ����"))) {
		return false;
	}
	if(!(isNumber(FormName.djzl2, "��Ʒ����"))) {
		return false;
	}
	if(!(isNumber(FormName.cgzq, "�ɹ�����"))) {
		return false;
	}
	if(!(isNumber(FormName.cgzq2, "�ɹ�����"))) {
		return false;
	}
	if(!(isNumber(FormName.bzq, "������"))) {
		return false;
	}
	if(!(isNumber(FormName.bzq2, "������"))) {
		return false;
	}
	if(!(isNumber(FormName.bztxq, "����������"))) {
		return false;
	}
	if(!(isNumber(FormName.bztxq2, "����������"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.myxssl)=="") {
		alert("��ѡ��[ÿҳ��ʾ����]��");
		FormName.myxssl.focus();
		return false;
	}
	if(!(isNumber(FormName.myxssl, "ÿҳ��ʾ����"))) {
		return false;
	}

	FormName.action="Jxc_clbmCshList2.jsp";
	FormName.submit();
	return true;
}

function f_do3(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}

	if(!(isNumber(FormName.djzl, "��Ʒ����"))) {
		return false;
	}
	if(!(isNumber(FormName.djzl2, "��Ʒ����"))) {
		return false;
	}
	if(!(isNumber(FormName.cgzq, "�ɹ�����"))) {
		return false;
	}
	if(!(isNumber(FormName.cgzq2, "�ɹ�����"))) {
		return false;
	}
	if(!(isNumber(FormName.bzq, "������"))) {
		return false;
	}
	if(!(isNumber(FormName.bzq2, "������"))) {
		return false;
	}
	if(!(isNumber(FormName.bztxq, "����������"))) {
		return false;
	}
	if(!(isNumber(FormName.bztxq2, "����������"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.myxssl)=="") {
		alert("��ѡ��[ÿҳ��ʾ����]��");
		FormName.myxssl.focus();
		return false;
	}
	if(!(isNumber(FormName.myxssl, "ÿҳ��ʾ����"))) {
		return false;
	}

	FormName.action="Jxc_clbmCshList3.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
