<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE2 {color: #FF0000}
.STYLE1 {color: #CC0000}
-->
</style>
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
  <div align="center">���˵ǼǱ�</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE2">*</span>�����ֹ�˾</td>
      <td>
	  <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
      </select>
	  
	  </td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">ʩ����</td>
      <td width="35%"> 
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeSgd(insertform)">
          <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' and sq_sgd.ssfgs='"+ssfgs+"' order by sq_sgd.ssfgs,sgdmc","");
	}
%> 
        </select>      </td>
      <td align="right" width="15%">�೤</td>
      <td width="35%"> 
        <select name="bzmc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><span class="STYLE2">*</span>����</td>
      <td width="35%"> 
        <input type="text" name="xm" value="" size="20" maxlength="20" >      </td>
      <td align="right" width="15%"><span class="STYLE2">*</span>�Ա�</td>
      <td width="35%"> 
        <input type="radio" name="xb"  value="��">
        �� 
        <input type="radio" name="xb"  value="Ů">
        Ů </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><span class="STYLE2">*</span>����</td>
      <td width="35%"> 
        <input type="text" name="jg" value="" size="20" maxlength="50" >      </td>
      <td align="right" width="15%"><span class="STYLE2">*</span>��������</td>
      <td width="35%"> 
        <input type="text" name="csrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><span class="STYLE2">*</span>����</td>
      <td colspan="3"> 
        <input type="radio" name="gz"  value="ľ��">
        ľ�� 
        <input type="radio" name="gz"  value="ˮ�繤">
        ˮ�繤 
        <input type="radio" name="gz"  value="���Ṥ">
        ���Ṥ 
        <input type="radio" name="gz"  value="�߹�">
        �߹�
        <input type="radio" name="gz"  value="�ӹ�">
        �ӹ� </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE2">*</span>��ְʱ��</td>
      <td><input type="text" name="rzsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
      <td align="right"><span class="STYLE2">*</span>����</td>
      <td><input type="radio" name="lx"  value="��ʱ">
��ʱ
  <input type="radio" name="lx"  value="����">
����</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE2">*</span>���п�</td>
      <td><input type="text" name="yhk" value="" size="20" maxlength="50" ></td>
      <td align="right">�Ƿ�ǩ��������ǲ��ͬ</td>
      <td><input type="radio" name="sfqdlwpqht"  value="Y">
      ��
        <input type="radio" name="sfqdlwpqht"  value="N" checked>
        ��</td>
    </tr>
    <tr bgcolor="#FFFFFF">
	 <td align="right">�Ƿ�ͨ������</td>
      <td><input type="radio" name="sfkstg"  value="Y">
      ��
        <input type="radio" name="sfkstg"  value="N" checked>
        ��</td>
      <td align="right">�ϸ�֤���</td>
      <td><input name="sgzbh" type="text" id="sgzbh" value="" size="20" maxlength="20" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�ȼ�</td>
      <td width="35%"> 
        <input type="text" name="dj" value="" size="20" maxlength="10" >      </td>
      <td align="right" width="15%"><span class="STYLE2">*</span>���֤��</td>
      <td width="35%"><input type="text" name="sfzh" value="" size="20" maxlength="18" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><span class="STYLE2">*</span>�绰</td>
      <td colspan="3"><input type="text" name="dh" value="" size="73" maxlength="50" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">סַ</td>
      <td colspan="3"> 
        <input type="text" name="zz" value="" size="73" maxlength="50" >      </td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">������ϵ��</td>
      <td bgcolor="#FFFFFF"><input type="text" name="jjlxr" value="" size="20" maxlength="20" >      </td>
      <td align="right" bgcolor="#FFFFFF">��ϵ�˵绰</td>
      <td bgcolor="#FFFFFF"><input type="text" name="jjlxrdh" value="" size="20" maxlength="20" >      </td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">������ϵ�˵�ַ</td>
      <td colspan="3" bgcolor="#FFFFFF"><input name="jjlxrdz" type="text" id="jjlxrdz" value="" size="73" maxlength="50" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��ѵ˵��</td>
      <td colspan="3"> 
        <textarea name="pxsm" cols="71" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">     
		<input type="button" name="sczp" onClick="f_sczp(insertform)"  value="�ϴ���Ƭ" disabled>
        <input type="button" name="ck" onClick="f_ck(insertform)"  value="�鿴��Ƭ" disabled>
<P>
		<A HREF="����.xls"><B>����Ҽ����Ϊ������Excelģ��</B></A>&nbsp;&nbsp;&nbsp;
		<input  type="button" onClick="LoadExc(insertform)"  value="����-Excel">
		<input  type="button" onClick="exp(insertform)"  value="����-Excel">
		
		</td>
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

function changeSgd(FormName) 
{
	FormName.bzmc.length=1;

	if (FormName.sgd.value=="")
	{
		return;
	}


	var sql;
	sql="select bzmc c1,bzmc c2 from sq_bzxx where sgd='"+FormName.sgd.value+"' and tdbz in('Y','N') order by bzmc";


	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.bzmc,ajaxRetStr);
}

function f_sczp(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.xm)=="") {
		alert("������[����]��");
		FormName.xm.focus();
		return false;
	}

	if(new RegExp('Linux').test(navigator.platform.toString()))
	{
		var urlStr="loadWj.jsp?ssfgs="+FormName.ssfgs.value+"&xm="+FormName.xm.value;
		window.open(urlStr);
	}
	else
	{
		var urlStr="loadPhoto.jsp?ssfgs="+FormName.ssfgs.value+"&xm="+FormName.xm.value;
		window.open(urlStr);
	}
}


function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.xm)=="") {
		alert("������[����]��");
		FormName.xm.focus();
		return false;
	}

	var urlStr="viewPhoto.jsp?ssfgs="+FormName.ssfgs.value+"&xm="+FormName.xm.value;
	window.open(urlStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}

/*
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.bzmc)=="") {
		alert("��ѡ��[�೤]��");
		FormName.bzmc.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.xm)=="") {
		alert("������[����]��");
		FormName.xm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("��ѡ��[�Ա�]��");
		FormName.xb[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jg)=="") {
		alert("������[����]��");
		FormName.jg.focus();
		return false;
	}
	if(	javaTrim(FormName.csrq)=="") {
		alert("������[��������]��");
		FormName.csrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.csrq, "��������"))) {
		return false;
	}
	if(	!radioChecked(FormName.gz)) {
		alert("��ѡ��[����]��");
		FormName.gz[0].focus();
		return false;
	}
	if(	javaTrim(FormName.rzsj)=="") {
		alert("������[��ְʱ��]��");
		FormName.rzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.rzsj, "��ְʱ��"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.sfzh)=="") {
		alert("������[���֤]��");
		FormName.sfzh.focus();
		return false;
	}
	if(FormName.sfzh.value.length!=15 && FormName.sfzh.value.length!=18) 
	{
		alert("[���֤]����ֻ����15λ��18λ");
		FormName.sfzh.focus();
		return false;
	}
	if(	javaTrim(FormName.yhk)=="") {
		alert("������[���п�]��");
		FormName.yhk.focus();
		return false;
	}
	if(	javaTrim(FormName.dh)=="") {
		alert("������[�绰]��");
		FormName.dh.focus();
		return false;
	}
	/*if(	javaTrim(FormName.jjlxr)=="") {
		alert("��ѡ��[������ϵ��]��");
		FormName.jjlxr.focus();
		return false;
	}
	if(	javaTrim(FormName.jjlxrdh)=="") {
		alert("��ѡ��[������ϵ�˵绰]��");
		FormName.jjlxrdh.focus();
		return false;
	}
	if(	javaTrim(FormName.jjlxrdz)=="") {
		alert("��ѡ��[������ϵ�˵�ַ]��");
		FormName.jjlxrdz.focus();
		return false;
	}*/

	FormName.action="SaveInsertSq_grxxb.jsp";
	FormName.submit();
	FormName.sczp.disabled=false;
	FormName.ck.disabled=false;
	return true;
}

function LoadExc(FormName)//����FormName:Form������
{

	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}

function exp(FormName)//����FormName:Form������
{

	FormName.action="exp.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
