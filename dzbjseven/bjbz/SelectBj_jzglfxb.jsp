<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>
<%
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
%>

<body bgcolor="#FFFFFF">
<noscript><iframe scr="*.htm"></iframe></noscript>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼����ӱ��۱�׼��Ŀ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>���۰汾��</td>
              <td colspan="3">
                <select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:515PX">
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
                </select>				</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font>����</td>
              <td width="34%"> 
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
                </select>              </td>
              <td width="15%" align="right"><font color="#FF0000">*</font>���ۼ���</td>
              <td width="35%"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <font color="#FF0000">*</font>��Ŀ����              </td>
              <td width="34%"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
                </select>              </td>
              <td width="15%" align="right"> 
                <font color="#FF0000">*</font>��ĿС��              </td>
              <td width="35%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��Ŀ����</td>
              <td><select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select xmflbm,xmflmc from bdm_xmflbm order by xmflbm","");
%>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <font color="#FF0000">*</font>��Ŀ���              </td>
              <td width="34%"> 
                <input type="text" name="xmbh" value="" size="20" maxlength="16" >              </td>
              <td width="15%" align="right">�������</td>
              <td width="35%"><input type="text" name="xh" value="" size="20" maxlength="17" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font>��Ŀ����</td>
              <td colspan="3"> 
                <input type="text" name="xmmc" value="" size="72" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                ����              </td>
              <td width="34%"> 
                <select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%> 
                </select>              </td>
              <td width="15%" align="right"><font color="#FF0000">*</font>������λ</td>
              <td width="35%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" ><font color="#FF0000">*</font>�Ƿ��ѡ��</td>
              <td colspan="3"><%
	cf.radioToken(out, "sfbxx","1+�ر���&2+������&3+��ѡ��&9+������","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">������Ŀ���</td>
              <td colspan="3"><input type="text" name="glxmbh" size="56" maxlength="100"  value="" >
                <font color="#FF0000"><strong>����Ŀ����ö��ŷָ</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�Ƿ���Ҫ����</td>
              <td><%
	cf.radioToken(out, "sfxycl","Y+��Ҫ&N+��","Y");
%></td>
              <td align="right"><font color="#FF0000">*</font>�Ƿ���ҪԤ����</td>
              <td><%
	cf.radioToken(out, "sfxyyjd","Y+��Ҫ&N+��","N");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#E8E8FF"><strong>�ɱ���</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>���ϳɱ�</td>
              <td bgcolor="#E8E8FF"><input type="text" name="clcb" value="0" size="20" maxlength="17" onChange="f_jscb(insertform)"></td>
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>�˹��ɱ�</td>
              <td bgcolor="#E8E8FF"><input type="text" name="rgcb" value="0" size="20" maxlength="17" onChange="f_jscb(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>��е�ɱ�</td>
              <td bgcolor="#E8E8FF"><input type="text" name="jxcb" value="0" size="20" maxlength="17" onChange="f_jscb(insertform)"></td>
              <td align="right" bgcolor="#E8E8FF">&nbsp;</td>
              <td bgcolor="#E8E8FF">
			    <p>&nbsp;</p>		      </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">�ɱ���</font></td>
              <td colspan="3" bgcolor="#E8E8FF"><input type="text" name="cbenj" value="����¼���Զ�����" size="20" maxlength="17" readonly>
                  <font color="#0000CC"><strong>ע�⣺�ɱ���<font color="#FF0000">(<font color="#0000CC"><strong>�Զ�����</strong></font>)</font>�����ϳɱ����˹��ɱ�����е�ɱ�</strong></font> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#CCCCFF"><strong>���ⱨ��</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>���ķ�</td>
              <td bgcolor="#CCCCFF"><input type="text" name="clbj" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>���ķ�</td>
              <td bgcolor="#CCCCFF"><input type="text" name="zcf" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>�˹���</td>
              <td bgcolor="#CCCCFF"><input type="text" name="rgbj" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>�����</td>
              <td bgcolor="#CCCCFF"><input type="text" name="ysf" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>��е��</td>
              <td bgcolor="#CCCCFF"><input type="text" name="jxbj" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>��ķ�</td>
              <td bgcolor="#CCCCFF"><input type="text" name="shf" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>������</td>
              <td bgcolor="#CCCCFF"><input type="text" name="qtf" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
              <td bgcolor="#CCCCFF" align="right">&nbsp;</td>
              <td bgcolor="#CCCCFF">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font><font color="#0000CC">����Ԥ���</font></td>
              <td colspan="3" bgcolor="#CCCCFF"><input type="text" name="bj" value="����¼���Զ�����" size="20" maxlength="17" readonly>
              <font color="#0000CC"><strong>����Ԥ��ۣ����ķ�+���ķѣ��˹��ѣ�����ѣ���е�ѣ���ķѣ�������</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>���̻�������</td>
              <td colspan="3" bgcolor="#E8E8FF"><input type="text" name="sgdbj" value="0" size="20" maxlength="17" >
              ���̻�������=����Ԥ���/����</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>ʩ���ɱ���</td>
              <td colspan="3" bgcolor="#E8E8FF"><input name="sgcbj" type="text" value="0" size="20" maxlength="17">
                ʩ���ɱ���=����Ԥ��ۡ�����</td>
            </tr>
            
              <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>�Ƿ��������</td>
              <td bgcolor="#CCCCFF">
				  <input type="radio" name="sfyxdz" value="Y">�������
				  <input type="radio" name="sfyxdz" value="N">��			  </td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>����ۿ�</td>
              <td bgcolor="#CCCCFF"><input name="zdzk" type="text" value="10" size="10" maxlength="10" >
                (0��10֮��)</td>
            </tr>
          
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">���ղ��ϼ��</td>
              <td colspan="3"> 
                <textarea name="gycl" cols="71" rows="8"></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�������ƹ��</td>
              <td colspan="3"><textarea name="flmcgg" cols="71" rows="4"></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��ע</td>
              <td colspan="3"><textarea name="bz" cols="71" rows="2"></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td>
              <td width="34%"> 
                <input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>              </td>
              <td width="15%" align="right"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
              <td width="35%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                  <p>
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="button" onClick="f_wh(insertform)"  value="ά�����Ϸ���" name="wh"  >
                  <input name="button" type="button" onClick="copyBj(insertform)"  value="���Ʊ���">
                  <input type="reset"  value="����" name="reset">
                  </p>
              </td>
            </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jscb(FormName)//����FormName:Form������
{
	var cbenj=FormName.clcb.value*1+FormName.rgcb.value*1+FormName.jxcb.value*1;
	cbenj=round(cbenj,2);
	FormName.cbenj.value=cbenj;
}

function f_jsjg(FormName)//����FormName:Form������
{
	var bj=FormName.clbj.value*1+FormName.rgbj.value*1+FormName.jxbj.value*1+FormName.zcf.value*1+FormName.shf.value*1+FormName.ysf.value*1+FormName.qtf.value*1;
	bj=round(bj,2);
	FormName.bj.value=bj;
}

function f_do(FormName)//����FormName:Form������
{
	f_jscb(FormName);
	f_jsjg(FormName);

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
	
	if(	javaTrim(FormName.clcb)=="") {
		alert("������[���ϳɱ�]��");
		FormName.clcb.focus();
		return false;
	}
	if(!(isFloat(FormName.clcb, "���ϳɱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.rgcb)=="") {
		alert("������[�˹��ɱ�]��");
		FormName.rgcb.focus();
		return false;
	}
	if(!(isFloat(FormName.rgcb, "�˹��ɱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.jxcb)=="") {
		alert("������[��е�ɱ�]��");
		FormName.jxcb.focus();
		return false;
	}
	if(!(isFloat(FormName.jxcb, "��е�ɱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.cbenj)=="") {
		alert("������[�ɱ���]��");
		FormName.cbenj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbenj, "�ɱ���"))) {
		return false;
	}

	if(	javaTrim(FormName.clbj)=="") {
		alert("������[���ķ�]��");
		FormName.clbj.focus();
		return false;
	}
	if(!(isFloat(FormName.clbj, "���ķ�"))) {
		return false;
	}
	if(	javaTrim(FormName.rgbj)=="") {
		alert("������[�˹���]��");
		FormName.rgbj.focus();
		return false;
	}
	if(!(isFloat(FormName.rgbj, "�˹���"))) {
		return false;
	}
	if(	javaTrim(FormName.jxbj)=="") {
		alert("������[��е��]��");
		FormName.jxbj.focus();
		return false;
	}
	if(!(isFloat(FormName.jxbj, "��е��"))) {
		return false;
	}
	if(	javaTrim(FormName.zcf)=="") {
		alert("������[���ķ�]��");
		FormName.zcf.focus();
		return false;
	}
	if(!(isFloat(FormName.zcf, "���ķ�"))) {
		return false;
	}
	if(	javaTrim(FormName.shf)=="") {
		alert("������[��ķ�]��");
		FormName.shf.focus();
		return false;
	}
	if(!(isFloat(FormName.shf, "��ķ�"))) {
		return false;
	}
	if(	javaTrim(FormName.ysf)=="") {
		alert("������[�����]��");
		FormName.ysf.focus();
		return false;
	}
	if(!(isFloat(FormName.ysf, "�����"))) {
		return false;
	}
	if(	javaTrim(FormName.qtf)=="") {
		alert("������[������]��");
		FormName.qtf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtf, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.bj)=="") {
		alert("������[����Ԥ���]��");
		FormName.bj.focus();
		return false;
	}
	if(!(isFloat(FormName.bj, "����Ԥ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdbj)=="") {
		alert("������[���̻�������]��");
		FormName.sgdbj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdbj, "���̻�������"))) {
		return false;
	}
	if(	javaTrim(FormName.sgcbj)=="") {
		alert("������[ʩ���ɱ���]��");
		FormName.sgcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbj, "ʩ���ɱ���"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfyxdz)) {
		alert("��ѡ��[�Ƿ�ɴ���]��");
		FormName.sfyxdz[0].focus();
		return false;
	}
	if (FormName.sfyxdz[0].checked)
	{
		if(	javaTrim(FormName.zdzk)=="") {
			alert("������[����ۿ�]��");
			FormName.zdzk.select();
			return false;
		}
		if(!(isFloat(FormName.zdzk, "����ۿ�"))) {
			return false;
		}
		if (FormName.zdzk.value<0 || FormName.zdzk.value>10)
		{
			alert("����[����ۿ�]Ӧ����0��10֮�䣡");
			FormName.zdzk.select();
			return false;
		}
	}
	else{
		FormName.zdzk.value=10;
	}

	if(!(isFloat(FormName.xh, "���"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfbxx)) {
		alert("��ѡ��[�Ƿ��ѡ��]��");
		FormName.sfbxx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxycl)) {
		alert("��ѡ��[�Ƿ���Ҫ����]��");
		FormName.sfxycl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxyyjd)) {
		alert("��ѡ��[�Ƿ���ҪԤ����]��");
		FormName.sfxyyjd[0].focus();
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

	FormName.action="SaveInsertBj_jzbjb.jsp";
	FormName.submit();
	FormName.wh.disabled=false;
	return true;
}




function f_wh(FormName)//����FormName:Form������
{
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
		alert("������[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("������[��Ŀ���]��");
		FormName.xmbh.focus();
		return false;
	}

	FormName.action="EditBj_jzglfxb.jsp";
	FormName.submit();
	return true;
}
function copyBj(FormName)//����FormName:Form������
{
	FormName.action="chooseCopyBj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
