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
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼�뱨�۱�׼��Ŀ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font>����</td>
              <td width="33%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                </select>
              </td>
              <td align="right" width="18%"><font color="#FF0000">*</font>���ۼ���</td>
              <td width="32%"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>��Ŀ����</div>
              </td>
              <td width="33%"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>��ĿС��</div>
              </td>
              <td width="32%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>��Ŀ���</div>
              </td>
              <td width="33%"> 
                <input type="text" name="xmbh" value="" size="20" maxlength="16" >
              </td>
              <td width="18%"> 
                <div align="right">�������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xh" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>��Ŀ����</td>
              <td colspan="3"> 
                <input type="text" name="xmmc" value="" size="74" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font>������λ</td>
              <td width="33%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%> 
                </select>
              </td>
              <td align="right" width="18%">����</td>
              <td width="32%"> 
                <select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF" width="17%">�ɱ���</td>
              <td bgcolor="#E8E8FF" width="33%"> 
                <input type="text" name="cbenj" value="" size="20" maxlength="17" >
              </td>
              <td align="right" bgcolor="#E8E8FF" width="18%">ʩ���ӱ���</td>
              <td bgcolor="#E8E8FF" width="32%"> 
                <input type="text" name="sgdbj" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="17%" height="22" align="right"> <font color="#FF0000">*</font>�ͻ�����</td>
              <td width="33%"> 
                <input type="text" name="bj" value="" size="20" maxlength="17" >
              </td>
              <td width="18%"> 
                <div align="right">����Ѱٷֱ�</div>
              </td>
              <td width="32%"> 
                <input type="text" name="glfbl" value="" size="8" maxlength="17" >
                % </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="17%">��������</td>
              <td width="33%"> 
                <input type="text" name="zcmc" value="" size="20" maxlength="17" >
              </td>
              <td align="right" width="18%">���Ĺ��</td>
              <td width="32%"> 
                <input type="text" name="zcgg" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="17%">���ķ�</td>
              <td width="33%"> 
                <input type="text" name="zcf" value="" size="20" maxlength="17" >
              </td>
              <td width="18%"> 
                <div align="right">���ķ�</div>
              </td>
              <td width="32%"> 
                <input type="text" name="clf" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="17%">�˹���</td>
              <td bgcolor="#CCCCFF" width="33%"> 
                <input type="text" name="rgf" value="" size="20" maxlength="17" >
              </td>
              <td width="18%"> 
                <div align="right">��е��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jjf" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="17%" align="right">���ղ��ϼ��</td>
              <td colspan="3"> 
                <textarea name="gycl" cols="72" rows="8"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="17%" align="right"><font color="#FF0000">*</font>�Ƿ��ѡ��</td>
              <td width="33%"><%
	cf.radioToken(out, "sfbxx","1+��ѡ&2+�Ǳ�ѡ&3+����ѡ","");
%></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>��������</td>
              <td width="33%"> 
                <select name="bjlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">��׼��Ŀ</option>
                </select>
              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>�Ƿ���Ҫ����</td>
              <td width="32%"> 
                <input type="radio" name="sfxycl" value="1">
                ��Ҫ 
                <input type="radio" name="sfxycl" value="2">
                ����Ҫ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>¼����</td>
              <td width="33%"> 
                <input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>
              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>¼��ʱ��</td>
              <td width="32%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <p> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="button" onClick="f_lr(insertform)"  value="¼�빤�Ϸ���" name="lr" disabled>
                  <input type="button" onClick="f_wh(insertform)"  value="ά�����Ϸ���" name="wh" disabled>
                  <input type="reset"  value="����" name="reset">
                </p>
                <p> 
                  <input type="button" onClick="window.open('LoadData.jsp')"  value="������ӱ���">
                  <input type="button" onClick="window.open('LoadGlfx.jsp')"  value="���빤�Ϸ���" name="button">
                </p>
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("������[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("��ѡ��[��Ŀ����]��");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("��ѡ��[��ĿС��]��");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("������[��Ŀ���]��");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("������[��Ŀ����]��");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjlx)=="") {
		alert("��ѡ��[��������]��");
		FormName.bjlx.focus();
		return false;
	}
	
	if(!(isFloat(FormName.cbenj, "�ɱ���"))) {
		return false;
	}
	if(!(isFloat(FormName.sgdbj, "ʩ���ӱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.bj)=="") {
		alert("������[�ͻ�����]��");
		FormName.bj.focus();
		return false;
	}
	if(!(isFloat(FormName.bj, "�ͻ�����"))) {
		return false;
	}
	if(!(isFloat(FormName.glfbl, "����Ѱٷֱ�"))) {
		return false;
	}
	if(!(isFloat(FormName.zcf, "���ķ�"))) {
		return false;
	}
	if(!(isFloat(FormName.clf, "���ķ�"))) {
		return false;
	}
	if(!(isFloat(FormName.rgf, "�˹���"))) {
		return false;
	}
	if(!(isFloat(FormName.jjf, "��е��"))) {
		return false;
	}

	if(!(isInt(FormName.xh, "���"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfbxx)) {
		alert("��ѡ��[�Ƿ��ѡ��]��");
		FormName.sfbxx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("��ѡ��[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("��ѡ��[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfxycl)) {
		alert("��ѡ��[�Ƿ���Ҫ����]��");
		FormName.sfxycl[0].focus();
		return false;
	}

	FormName.action="SaveInsertBj_gzbjb.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.wh.disabled=false;
	return true;
}
function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("��ѡ��[��Ŀ����]��");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("��ѡ��[��ĿС��]��");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("������[��Ŀ���]��");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("������[��Ŀ����]��");
		FormName.xmmc.focus();
		return false;
	}

	FormName.action="InsertBj_gzglfxb.jsp";
	FormName.submit();
	return true;
}

function f_wh(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("��ѡ��[��Ŀ����]��");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("��ѡ��[��ĿС��]��");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("������[��Ŀ���]��");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("������[��Ŀ����]��");
		FormName.xmmc.focus();
		return false;
	}

	FormName.action="EditBj_gzglfxb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
