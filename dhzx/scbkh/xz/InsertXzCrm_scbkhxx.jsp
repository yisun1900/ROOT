<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
String ssfgs=(String)session.getAttribute("ssfgs");
ssfgs="FBJ00";
String lrbm=(String)session.getAttribute("dwbh");
String zwbm=(String)session.getAttribute("zwbm");
String dqbm=(String)session.getAttribute("dqbm");
dqbm="01";
String ywyssxz=cf.fillNull(cf.executeQuery("select sjsbh from sq_yhxx where yhdlm='"+yhdlm+"'"));
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertXzCrm_scbkhxx.jsp" name="insertform" target="_blank">
<div align="center">С�飭¼��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�ͻ�����</td>
  <td><input type="text" name="khxm" value="" size="20" maxlength="50" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��ϵ��ʽ</td>
  <td colspan="3"><input type="text" name="lxfs" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����绰</td>
  <td colspan="3"><input type="text" name="qtdh" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font>�������� </td>
  <td><select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(xqbm)" onChange="cf_fwdz(insertform)">
    <option value=""></option>
    <%
		cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm","");
%>
  </select>  </td>
  <td align="right">�ֵ�</td>
  <td><input name="jiedao" type="text"  onChange="cf_fwdz(insertform)" onKeyUp="keyTo(fwdz)" value="" size="20" maxlength="50"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font>С��</td>
  <td>
	<input type="text" name="xqbm" value="" size="20" maxlength="50" onKeyUp="changheIn(insertform)"  onblur="cf_fwdz(insertform)">  
	</td>

  <td align="right"><font color="#CC0000">*</font>¥��</td>
  <td><input type="text" name="louhao" value="" size="20" maxlength="50" onKeyUp="keyTo(fwdz)"  onChange="cf_fwdz(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">&nbsp;</td>
  <td colspan="3">
	<select name="valuelist" id="sel" style="position:absolute;WIDTH:300; left:19%;FONT-SIZE:12px;display:none" size="20" onKeyUp="changeItem(insertform,this)" onclick ="selectCk(insertform,this)">
	</select>
  ע�⣺<font color="#0000FF">���ݵ�ַ</font>���������ֵ���С����¥�ţ��Զ����ɣ�����¼��  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000FF">���ݵ�ַ</font></td>
  <td colspan="3"><input type="text" name="fwdz" value="" size="73" maxlength="100" onKeyUp="keyTo(fwlxbm)" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font>С������</td>
  <td><select name="xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx","");
%>
  </select></td>
  <td align="right">����</td>
  <td><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������</td>
  <td><input type="text" name="fwmj" value="" size="20" maxlength="8" >  </td>
  <td align="right">���ۣ�Ԫ/m��</td>
  <td><input type="text" name="fj" value="" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font>�ͻ���Դ����</td>
  <td><select name="khzyxz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxz","");
%>
  </select></td>
  <td align="right">Ԥ��װ��ʱ��</td>
  <td><input type="text" name="yjzxsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font>�Ƿ���ط�</td>
  <td><input type="radio" name="sfxhf"  value="Y">
��Ҫ
  <input type="radio" name="sfxhf"  value="N">
�� </td>
  <td align="right">�´λط�ʱ��</td>
  <td><input type="text" name="xchfsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������������</td>
  <td colspan="3"><input type="text" name="jzdsmc" value="" size="73" maxlength="100" ></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>ҵ��Ա</td> 
  <td width="32%">
  <select name="ywy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
      <%

	if (zwbm.equals("19"))//19��ҵ��Ա
	{
		out.println("<option value=\""+yhmc+"\">"+yhmc+"</option>");
	}
	else if (zwbm.equals("24"))//24���г����鳤
	{
		out.println("<option value=\"\"></option>");
		String sql=null;
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'��'||sq_yhxx.dh||'��' c2";
		sql+=" from sq_yhxx,sq_sqfgs ";
		sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
		sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.sjsbh='"+ywyssxz+"' ";

		sql+=" UNION ALL ";

		sql+=" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'��'||sq_yhxx.dh||'��' c2";
		sql+=" from sq_yhxx,sq_sqbm ";
		sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+lrbm+"' ";
		sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.sjsbh='"+ywyssxz+"' ";

		sql+=" ORDER BY c1";

		cf.selectItem(out,sql,yhmc);
	}
	else{
		out.println("<option value=\"\"></option>");
		String sql=null;
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'��'||sq_yhxx.dh||'��' c2";
		sql+=" from sq_yhxx,sq_sqfgs ";
		sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
		sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";

		sql+=" UNION ALL ";

		sql+=" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'��'||sq_yhxx.dh||'��' c2";
		sql+=" from sq_yhxx,sq_sqbm ";
		sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+lrbm+"' ";
		sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";

		sql+=" ORDER BY c1";

		cf.selectItem(out,sql,yhmc);
	}
%>
    </select>	
	</td>
  <td align="right" width="18%"><font color="#CC0000">*</font>ҵ��Ա����С��</td> 
  <td width="32%">
  <select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	if (zwbm.equals("19"))//19��ҵ��Ա
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywyssxz+"' order by dwbh",ywyssxz);
	}
	else if (zwbm.equals("24"))//24���г����鳤
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywyssxz+"' order by dwbh",ywyssxz);
	}
	else 
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F4' and ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh","");
	}
%>
  </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td> 
  <td width="32%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td> 
  <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td> 
  <td width="32%"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">�����ֹ�˾</span></td> 
  <td width="32%"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	  <input type="hidden" name="dqbm" value="<%=dqbm%>"> 
	<input type="button"  value="����" onClick="f_do(insertform)" name="bc">
	<input type="reset"  value="����" name="reset" onclick="bc.disabled=false">      </td>
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

//�����������ⵥ��ʱ����������ʧ
document.onclick=function()
{
	insertform.valuelist.style.display='none';
}

//�ı�����ֵ
function changheIn(FormName)
{   

	if(event.keyCode==13)//�س�
	{
		insertform.valuelist.style.display='none';
	}
	else if(event.keyCode==38)//�ϼ�ͷ
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[FormName.valuelist.length-1].selected=true;
		mark="last";

		oldtext=FormName.xqbm.value;

		FormName.xqbm.value=FormName.valuelist.options[FormName.valuelist.length-1].text;
	}
	else if(event.keyCode==40)//�¼�ͷ
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[0].selected=true;
		mark="first";

		oldtext=FormName.xqbm.value;

		FormName.xqbm.value=FormName.valuelist.options[0].text;
	}
	else{//������
		if(FormName.xqbm.value=="") 
		{
			insertform.valuelist.style.display='none';
			return;
		}

		//��ȡ�ͺ��б�
		var actionStr="/dhzx/scbkh/GetListByAjax.jsp?dqbm=<%=dqbm%>&invalue="+FormName.xqbm.value;

//		window.open(actionStr);
		openAjax(actionStr);  
	}

}                                                                                                                                                       


function getAjax(ajaxRetStr) 
{
	//ȥ��ǰ��Ļ��з�
	while (true)
	{
		if (ajaxRetStr.substring(0,1)=="\r")
		{
			ajaxRetStr=ajaxRetStr.substring(1);
		}
		else if (ajaxRetStr.substring(0,1)=="\n")
		{
			ajaxRetStr=ajaxRetStr.substring(1);
		}
		else{
			break;
		}
	}

	//����������
	insertform.valuelist.length=0;

	if (ajaxRetStr!="")
	{
		insertform.valuelist.style.display='block';
		strToItem3(insertform.valuelist,ajaxRetStr);
	}
	else{
		insertform.valuelist.style.display='none';
	}

}

//�ı���������Ŀ
function changeItem(FormName,field)
{
	if(event.keyCode==38)//�ϼ�ͷ
	{
		if (mark=="last")
		{
			mark="";
		}

		FormName.xqbm.value=field.options[field.selectedIndex].text;

		if (field.selectedIndex==0)
		{
			if (mark=="first")
			{
				field.value="";
				mark="";

				FormName.xqbm.value=oldtext;

				FormName.xqbm.focus();
			}
			else{
				mark="first";
			}
		}
	}
	else if(event.keyCode==40)//�¼�ͷ
	{
		if (mark=="first")
		{
			mark="";
		}

		FormName.xqbm.value=field.options[field.selectedIndex].text;

		if (field.selectedIndex==field.length-1)
		{
			if (mark=="last")
			{
				field.value="";
				mark="";

				FormName.xqbm.value=oldtext
				FormName.xqbm.focus();
			}
			else{
				mark="last";
			}
		}
	}
	else if(event.keyCode==13)//�س�
	{
		insertform.valuelist.style.display='none';
		FormName.xqbm.focus();
	}
}

//˫����������Ŀ
function selectCk(FormName,field)
{
	insertform.valuelist.style.display='none';
	FormName.xqbm.value=field.options[field.selectedIndex].text;
	FormName.xqbm.focus();
}

function cf_fwdz(FormName)
{  
	FormName.jiedao.value=strTrim(FormName.jiedao.value);
	FormName.xqbm.value=strTrim(FormName.xqbm.value);
	FormName.louhao.value=strTrim(FormName.louhao.value);
	FormName.fwdz.value=FormName.cqbm.options[FormName.cqbm.selectedIndex].text+FormName.jiedao.value+FormName.xqbm.value+FormName.louhao.value;
}      

function f_do(FormName)//����FormName:Form������
{
	cf_fwdz(FormName);

	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.cqbm)=="") {
		alert("������[��������]��");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqbm)=="") {
		alert("������[С��]��");
		FormName.xqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.louhao)=="") {
		alert("������[¥��]��");
		FormName.louhao.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}
	if(!(isMPhone(FormName.lxfs, "��ϵ��ʽ"))) {
		return false;
	}

	if(	javaTrim(FormName.xqlx)=="") {
		alert("������[С������]��");
		FormName.xqlx.focus();
		return false;
	}
	if(	javaTrim(FormName.khzyxz)=="") {
		alert("������[�ͻ���Դ����]��");
		FormName.khzyxz.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.fj, "����"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj, "Ԥ��װ��ʱ��"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfxhf)) {
		alert("��ѡ��[�Ƿ���ط�]��");
		FormName.sfxhf[0].focus();
		return false;
	}
	if (FormName.sfxhf[0].checked)
	{
		if(	javaTrim(FormName.xchfsj)=="") {
			alert("������[�´λط�ʱ��]��");
			FormName.xchfsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.xchfsj, "�´λط�ʱ��"))) {
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.xchfsj)!="") {
			alert("��������[�´λط�ʱ��]��");
			FormName.xchfsj.select();
			return false;
		}
	}


	if(	javaTrim(FormName.ywy)=="") {
		alert("������[ҵ��Ա]��");
		FormName.ywy.focus();
		return false;
	}
	if(	javaTrim(FormName.ywyssxz)=="") {
		alert("��ѡ��[ҵ��Ա����С��]��");
		FormName.ywyssxz.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
