<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertTckb_tcjgb.jsp" name="insertform" target="_blank">
<div align="center">¼�룭�ײ��ܼ۱�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font>���۰汾��</td>
    <td colspan="3"><select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:525PX">
        <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjbbh c1,bjbbh||'��'||dqmc||'����'||DECODE(bj_dzbjbb.sfzybb,'1','δ����','2','��ǰ��','3','���ð�','4','ͣ��')||'��' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.sfzybb in('1','2','3') order by bj_dzbjbb.dqbm,bjbbh","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjbbh c1,bjbbh||'��'||dqmc||'����'||DECODE(bj_dzbjbb.sfzybb,'1','δ����','2','��ǰ��','3','���ð�','4','ͣ��')||'��' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.sfzybb in('1','2','3') and bj_dzbjbb.dqbm='"+dqbm+"' order by bj_dzbjbb.dqbm,bjbbh","");
	}
%>
      </select>
    </td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font>����</td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%>
    </select></td>
    <td width="18%" align="right"><font color="#FF0000">*</font>���ۼ���</td>
    <td width="32%"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where lx='2' and  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm","");
	%>
      </select>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>����</td>
  <td><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>������</td>
  <td><input type="text" name="fwmj" value="" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ײ�����</td> 
  <td colspan="3"> 
    <input type="text" name="tcmc" value="" size="73" maxlength="50" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000FF">�ײ��ܼ�</font></td> 
  <td width="32%"> 
    <input type="text" name="tcjg" value="" size="20" maxlength="17" readonly>  </td>
  <td colspan="2">�ײ��ܼۣ���Ʒ�۸�ʩ���۸񣫼Ҿ������</td> 
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>��Ʒ�����</td>
  <td><input type="text" name="cpjg" value="" size="20" maxlength="17" onChange="calValue(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>ʩ�������</td>
  <td><input name="sgjg" type="text" value="" size="20" maxlength="17" onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ҿ������</td>
  <td><input name="jjjg" type="text" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>ƽ�����ӵ���</td>
  <td><input type="text" name="pmzjdj" value="0" size="20" maxlength="17" ></td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      
	<input type="button" onClick="f_dr(insertform)"  value="���뱨��">
	<input type="button" onClick="f_dc(insertform)"  value="��������">
	<P>
	<A HREF="�ײͼ۸��.xls"><B>����Ҽ����Ϊ������Excel����ģ��</B></A>	</td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function calValue(FormName)
{  
	var tcjg=FormName.cpjg.value*1.0+FormName.sgjg.value*1.0+FormName.jjjg.value*1.0;
	tcjg=round(tcjg,2);
	FormName.tcjg.value=tcjg;
}


function f_do(FormName)//����FormName:Form������
{
	calValue(FormName);

	if(	javaTrim(FormName.bjbbh)=="") {
		alert("��ѡ��[���۰汾��]��");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("��ѡ��[����]��");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("������[������]��");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.tcjg)=="") {
		alert("������[�ײ��ܼ�]��");
		FormName.tcjg.focus();
		return false;
	}
	if(!(isFloat(FormName.tcjg, "�ײ��ܼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.pmzjdj)=="") {
		alert("������[ƽ�����ӵ���]��");
		FormName.pmzjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.pmzjdj, "ƽ�����ӵ���"))) {
		return false;
	}
	if(	javaTrim(FormName.cpjg)=="") {
		alert("������[��Ʒ�����]��");
		FormName.cpjg.focus();
		return false;
	}
	if(!(isFloat(FormName.cpjg, "��Ʒ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sgjg)=="") {
		alert("������[ʩ�������]��");
		FormName.sgjg.focus();
		return false;
	}
	if(!(isFloat(FormName.sgjg, "ʩ�������"))) {
		return false;
	}
	if(	javaTrim(FormName.jjjg)=="") {
		alert("������[�Ҿ������]��");
		FormName.jjjg.focus();
		return false;
	}
	if(!(isFloat(FormName.jjjg, "�Ҿ������"))) {
		return false;
	}

	FormName.action="SaveInsertTckb_tcjgb.jsp";
	FormName.submit();
	return true;
}

function f_dr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("��ѡ��[���۰汾��]��");
		FormName.bjbbh.focus();
		return false;
	}

	FormName.action="LoadDataTc.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("��ѡ��[���۰汾��]��");
		FormName.bjbbh.focus();
		return false;
	}

	FormName.action="ExpTckb_tcjgb.jsp";
	FormName.submit();
	return true;
}
</SCRIPT>
