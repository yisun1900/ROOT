<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ygbh=(String)session.getAttribute("ygbh");
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String zjxxh=request.getParameter("zjxxh");
String dqbm=request.getParameter("dqbm");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 
        ��¼�������շ���Ŀ��ϸ
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertBj_sfxmmx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">�ͻ����</font></td>
              <td width="32%"> 
                <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="7" readonly>
				</td>
              <td width="18%">&nbsp; </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#FF0000">*</font>�շ���Ŀ</td>
              <td colspan="3"> 
                <select name="sfxmbm" style="FONT-SIZE:12PX;WIDTH:522PX" onChange="getSfxm(insertform)" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sfxmbm,sfxmmc||DECODE(sfbxx,'1','����ѡ��','2','') from bdm_sfxmbm where dqbm='"+dqbm+"' and sfxmbm not in(select sfxmbm from bj_sfxmmx where khbh='"+khbh+"') and (sfxsq='1' OR (sfxsq='2' and sfxmbm in(select sfxmbm from sq_sfxmsq where ygbh='"+ygbh+"'))) order by sfxmbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">�շѼ��㷽ʽ</font></td>
              <td colspan="3"><input name="sflx" type="text" id="sflx" value="" size="73" maxlength="17" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">������λ</font></td>
              <td><input type="text" name="jldw" value="" size="20" maxlength="17" readonly>
                <strong><font color="#0000FF">�����޸�</font></strong></td>
              <td align="right"><font color="#FF0000">*</font>����</td>
              <td><input type="text" name="sl" value="" size="20" maxlength="17" onChange="getJe(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>����</td>
              <td><input type="text" name="dj" value="" size="20" maxlength="17"  onchange="getJe(insertform)">
              <input type="hidden" name="bzdj" value="" ></td>
              <td align="right"><font color="#FF0000">*</font>�շѰٷֱ�</td>
              <td><input name="sfbfb" type="text" value="" size="20" maxlength="8">
%</td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">�շѽ��</font></td>
              <td colspan="3"><input type="text" name="zqsfje" value="" size="20" maxlength="17" readonly>
                <strong><font color="#0000FF">�����޸�</font></strong></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="zjxxh" value="<%=zjxxh%>" >
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function getSfxm(FormName)
{

	var str="Bj_sfxmmxCx.jsp?dqbm=<%=dqbm%>&sfxmbm="+FormName.sfxmbm.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getJe(FormName)
{
	if (FormName.sflx.value=='�̶����ɸģ�')
	{
		var zqsfje=0;
		zqsfje=FormName.dj.value*FormName.sl.value
		zqsfje=round(zqsfje,2);
		FormName.zqsfje.value=zqsfje;
	}
	else if (FormName.sflx.value=='�̶������ɸģ�')
	{
		var zqsfje=0;
		zqsfje=FormName.dj.value*FormName.sl.value
		zqsfje=round(zqsfje,2);
		FormName.zqsfje.value=zqsfje;
	}
	else{
		FormName.zqsfje.value="����¼�룬�Զ�����";
	}
}


function f_do(FormName)//����FormName:Form������
{
	getJe(FormName);

	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sfxmbm)=="") {
		alert("��ѡ��[�շ���Ŀ]��");
		FormName.sfxmbm.focus();
		return false;
	}

	if(	javaTrim(FormName.jldw)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.sl)=="") 
	{
		alert("������[����]��");
		FormName.sl.focus();
		return false;
	}

	if(!(isFloat(FormName.sl, "����"))) 
	{
		return false;
	}

	if(	javaTrim(FormName.sl)=="" || FormName.sl.value=='0') {
		alert("��¼��[����]��");
		FormName.sl.select();
		return false;
	}

	if (FormName.sflx.value=='�̶����ɸģ�')
	{
		if(	javaTrim(FormName.dj)=="") {
			alert("������[����]��");
			FormName.dj.focus();
			return false;
		}
		if(!(isFloat(FormName.dj, "����"))) {
			return false;
		}

		if(	javaTrim(FormName.dj)=="" || FormName.dj.value=='0') {
			alert("��¼��[����]��");
			FormName.dj.select();
			return false;
		}

		if(	javaTrim(FormName.zqsfje)=="") {
			alert("������[�շѽ��]��");
			FormName.zqsfje.focus();
			return false;
		}
		if(!(isFloat(FormName.zqsfje, "�շѽ��"))) {
			return false;
		}

		if(	javaTrim(FormName.zqsfje)=="" || FormName.zqsfje.value=='0') {
			alert("��¼��[�շѽ��]��");
			FormName.zqsfje.select();
			return false;
		}

		FormName.sfbfb.value="";
	}
	else if (FormName.sflx.value=='�̶������ɸģ�')
	{
		if(FormName.dj.value!=FormName.bzdj.value) 
		{
			alert("���󣡲����޸�[����]��");
			FormName.dj.value=FormName.bzdj.value;
			return false;
		}


		if(	javaTrim(FormName.dj)=="") {
			alert("������[����]��");
			FormName.dj.focus();
			return false;
		}
		if(!(isFloat(FormName.dj, "����"))) {
			return false;
		}

		if(	javaTrim(FormName.dj)=="" || FormName.dj.value=='0') {
			alert("��¼��[����]��");
			FormName.dj.select();
			return false;
		}

		if(	javaTrim(FormName.zqsfje)=="") {
			alert("������[�շѽ��]��");
			FormName.zqsfje.focus();
			return false;
		}
		if(!(isFloat(FormName.zqsfje, "�շѽ��"))) {
			return false;
		}

		if(	javaTrim(FormName.zqsfje)=="" || FormName.zqsfje.value=='0') {
			alert("��¼��[�շѽ��]��");
			FormName.zqsfje.select();
			return false;
		}

		FormName.sfbfb.value="";
	}
	else if (FormName.sflx.value=='����ֱ�ӷѰٷֱȣ��ɸģ�')
	{
		if(	javaTrim(FormName.sfbfb)=="") {
			alert("������[�շѰٷֱ�]��");
			FormName.sfbfb.focus();
			return false;
		}
		if(!(isFloat(FormName.sfbfb, "�շѰٷֱ�"))) {
			return false;
		}

		FormName.dj.value="";
		FormName.zqsfje.value="";
	}
	else{
		FormName.dj.value="";
		FormName.zqsfje.value="";
		FormName.sfbfb.value="";
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
