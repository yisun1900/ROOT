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
	String yhdlm=(String)session.getAttribute("yhdlm");
	String dwbh=(String)session.getAttribute("dwbh");
String dwstr=cf.getItemData("select dwbh,dwmc||'��'||dwdh||'��',ssdw from sq_dwxx where dwlx='4' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼�빤����Ϣ��<font color="#FF0033">*</font>Ϊ�����ֶΣ�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCrm_khxx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>�ͻ�����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="khxm" value="" size="20" maxlength="50" >
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>�Ա�</div>
              </td>
              <td width="32%"> 
                <input type="radio" name="xb"  value="M">
                �� 
                <input type="radio" name="xb"  value="W">
                Ů </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>���ݵ�ַ</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz" value="" size="57" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>��������</td>
              <td width="33%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right"><font color="#FF0033">*</font>��ϵ��ʽ</td>
              <td width="32%"> 
                <input type="text" name="lxfs" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>����</div>
              </td>
              <td width="33%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>������</div>
              </td>
              <td width="32%"> 
                <select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>װ�޼�λ</div>
              </td>
              <td width="33%"> 
                <select name="zxjwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>��ɫ</div>
              </td>
              <td width="32%"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>�������</div>
              </td>
              <td width="33%"> 
                <select name="hxmjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>�������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="fwmj" value="" size="20" maxlength="20"  onChange="calValue(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>ǩԼ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="qye" value="" size="20" maxlength="8"  onChange="calValue(insertform)">
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font><font color="#0000CC">ÿƽ�׾���</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="pmjj" value="" size="20" maxlength="8" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>�Ƿ����Ż�</div>
              </td>
              <td width="33%"> 
                <input type="radio" name="sfyyh"  value="Y">
                �� 
                <input type="radio" name="sfyyh"  value="N">
                �� </td>
              <td width="18%"> 
                <div align="right">�Ż�ԭ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="yhyy" value="" size="20" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>ǩԼ����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="qyrq" value="" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">Ӧ��������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="kgrq" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�׿�����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="skrq" value="" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">�׿���</div>
              </td>
              <td width="32%"> 
                <input type="text" name="skje" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">���ڿ�����</td>
              <td width="33%"> 
                <input type="text" name="zkrq" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">�п���</td>
              <td width="32%"> 
                <input type="text" name="zkje" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">Ӧ��������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jgrq" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">������Ŀ</div>
              </td>
              <td width="32%"> 
                <input type="text" name="fzxm" value="" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>���ʦ</td>
              <td width="33%"> 
                <input type="text" name="sjs" value="" size="20" maxlength="20" >
              </td>
              <td width="18%" align="right">��ͬ��</td>
              <td width="32%"> 
                <input type="text" name="hth" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font>��ϵ�ͻ�</div>
              </td>
              <td width="33%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>�ص���־</div>
              </td>
              <td width="32%"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="3">ʩ���ӻص�</option>
                  <option value="2">���ʦ�ص�</option>
                  <option value="4">�Ͽͻ��ص�</option>
                  <option value="5">Ա���ص�</option>
                  <option value="6">�೤�ص�</option>
                  <option value="7">��¥��</option>
                  <option value="8">������</option>
                  <option value="9">����</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�ι۵�ַ</td>
              <td colspan="3"> 
                <input type="text" name="cgdz" value="" size="57" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#FF0033">*</font>�ص�ʩ����</div>
              </td>
              <td width="35%"> 
                <select name="hdsgd" disabled  style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(hdsgd,hdsgbz,<%=dwstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('3','8') order by dwbh","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">�ص�����</div>
              </td>
              <td width="35%"> 
                <select name="hdsgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font><font color="#0000CC">ǩԼ����</font></div>
              </td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">�ص����ʦ</div>
              </td>
              <td width="32%">
                <input type="text" name="hdsjs" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0033">*</font><font color="#0000CC">�ϱ�����</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="sbrq" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font><font color="#0000CC">��Ϣ¼����</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrr" value="<%=yhdlm%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
              </td>
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
function calValue(FormName){  
	FormName.pmjj.value=parseInt(FormName.qye.value/FormName.fwmj.value);      
}      

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("��ѡ��[�Ա�]��");
		FormName.xb[0].focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.cqbm)=="") {
		alert("������[��������]��");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("������[����]��");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgflbm)=="") {
		alert("������[������]��");
		FormName.fgflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zxjwbm)=="") {
		alert("������[װ�޼�λ]��");
		FormName.zxjwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ysbm)=="") {
		alert("������[��ɫ]��");
		FormName.ysbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxmjbm)=="") {
		alert("������[�������]��");
		FormName.hxmjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("������[���]��");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "���"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("������[ǩԼ��]��");
		FormName.qye.focus();
		return false;
	}
	if(!(isNumber(FormName.qye, "ǩԼ��"))) {
		return false;
	}

	calValue(FormName);

	if(	javaTrim(FormName.pmjj)=="") {
		alert("������[ÿƽ�׾���]��");
		FormName.pmjj.focus();
		return false;
	}
	if(!(isNumber(FormName.pmjj, "ÿƽ�׾���"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyyh)) {
		alert("��ѡ��[�Ƿ����Ż�]��");
		FormName.sfyyh[0].focus();
		return false;
	}
	if(	javaTrim(FormName.qyrq)=="") {
		alert("������[ǩԼ����]��");
		FormName.qyrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.kgrq, "Ӧ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.skrq, "�׿�����"))) {
		return false;
	}
	if(!(isNumber(FormName.skje, "�׿���"))) {
		return false;
	}
	if(!(isDatetime(FormName.zkrq, "���ڿ�����"))) {
		return false;
	}
	if(!(isNumber(FormName.zkje, "�п���"))) {
		return false;
	}
	if(!(isDatetime(FormName.jgrq, "Ӧ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sbrq, "�ϱ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjs)=="") {
		alert("������[���ʦ]��");
		FormName.sjs.focus();
		return false;
	}
	if(	javaTrim(FormName.khlxbm)=="") {
		alert("��ѡ��[��ϵ�ͻ�]��");
		FormName.khlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hdbz)=="") {
		alert("��ѡ��[�ص���־]��");
		FormName.hdbz.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[��Ϣ¼����]��");
		FormName.lrr.focus();
		return false;
	}

	if(	javaTrim(FormName.hdsgd)=="") {
		alert("������[�ص�ʩ����]��");
		FormName.hdsgd.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
