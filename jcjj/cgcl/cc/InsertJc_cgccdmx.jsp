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
String ddbh = request.getParameter("ddbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼�������ⵥ�������ţ�<%=ddbh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_cgccdmx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">����</div>
              </td>
              <td width="32%"> 
                <input type="hidden" name="ddbh" value="<%=ddbh%>" >
                <select name="cgbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cgbm,cgmc from jc_cgjgb order by cgbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">�����ܼ�</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="sjzj" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">������mm��</td>
              <td width="32%"> 
                <input type="text" name="dgjs" value="" size="20" maxlength="8" onChange="getDj(insertform)">
              </td>
              <td width="18%" align="right">����߶ȣ�mm��</td>
              <td width="32%"> 
                <input type="text" name="dggd" value="" size="20" maxlength="8" onChange="getDj(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" bgcolor="#FFFFCC"> 
                <div align="right">���񳤶ȣ����ף�</div>
              </td>
              <td width="32%"> 
                <input type="text" name="dgcd" value="" size="20" maxlength="9" >
              </td>
              <td width="18%"> 
                <div align="right">����Ǳ�ϵ��</div>
              </td>
              <td width="32%"><font color="#0000CC"> 
                <input type="text" name="dgfbxs" value="" size="20" maxlength="9" >
                </font> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#0000CC">���񵥼ۣ�Ԫ/���ף�</font></td>
              <td width="32%" bgcolor="#FFFFCC"><font color="#0000CC">
                <input type="text" name="dgdj" value="" size="20" maxlength="9" >
                </font> </td>
              <td width="18%" align="right" bgcolor="#CCFFCC"><font color="#0000CC">�ع񵥼ۣ�Ԫ/���ף�</font></td>
              <td width="32%" bgcolor="#CCFFCC"> 
                <input type="text" name="tgdj" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%"> 
                <div align="right">�ع���mm��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="tgjs" value="" size="20" maxlength="8" onChange="getDj(insertform)">
              </td>
              <td width="18%"> 
                <div align="right">�ع�߶ȣ�mm��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="tggd" value="" size="20" maxlength="8" onChange="getDj(insertform)">
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%"> 
                <div align="right">�ع񳤶ȣ����ף�</div>
              </td>
              <td width="32%"> 
                <input type="text" name="tdcd" value="" size="20" maxlength="9" >
              </td>
              <td width="18%"> 
                <div align="right">�ع�Ǳ�ϵ��</div>
              </td>
              <td width="32%">
                <input type="text" name="tgfbxs" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">̨��</td>
              <td width="32%"> 
                <select name="tmbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(tmbm,tmdj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tmbm,tmmc||'('||xh||')'||'��:'||ymjg from jc_tmbj order by tmbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right"><font color="#0000CC">̨�浥�ۣ�Ԫ/���ף�</font></td>
              <td width="32%"> 
                <input type="text" name="tmdj" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">̨�泤�ȣ����ף�</div>
              </td>
              <td width="32%"> 
                <input type="text" name="tmcd" value="" size="20" maxlength="9" >
              </td>
              <td width="18%"> 
                <div align="right">̨��Ǳ�ϵ��</div>
              </td>
              <td width="32%">
                <input type="text" name="tmfbxs" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%"> 
                <div align="right">�Ű�</div>
              </td>
              <td width="32%"> 
                <select name="mbbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(mbbm,mbdj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_mbbm.mbbm,jdm_mbbm.mbmc||'��:'||jc_mbjg.jg from jdm_mbbm,jc_mbjg where jdm_mbbm.mbbm=jc_mbjg.mbbm  order by jdm_mbbm.mbbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">�Ű嵥�ۣ�Ԫ/ƽ�ף�</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="mbdj" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%" align="right">�Ű������ƽ�ף�</td>
              <td width="32%"> 
                <input type="text" name="mbmj" value="" size="20" maxlength="9" >
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">�Ű���</div>
              </td>
              <td width="32%"> 
                <select name="mbfbbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(mbfbbm,mbfbjg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_mbfbbm.mbfbbm,jdm_mbfbbm.mbfbmc||'��:'||jc_mbfbjg.jg  from jdm_mbfbbm,jc_mbfbjg where jdm_mbfbbm.mbfbbm=jc_mbfbjg.mbfbbm order by jdm_mbfbbm.mbfbbm","");
%> 
                </select>
              </td>
              <td width="18%" bgcolor="#FFFFCC"> 
                <div align="right"><font color="#0000CC">�Ű��߼۸�</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="mbfbjg" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">����</div>
              </td>
              <td width="32%"> 
                <select name="xtbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(xtbm,xtjg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_xtbm.xtbm,jdm_xtbm.xtmc||'��:'||jc_xtjg.jg  from jdm_xtbm,jc_xtjg where jdm_xtbm.xtbm=jc_xtjg.xtbm order by jdm_xtbm.xtbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">����۸�</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="xtjg" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">����</div>
              </td>
              <td width="32%"> 
                <select name="lsbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(lsbm,lsjg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_lsbm.lsbm,jdm_lsbm.lsmc||'��:'||jc_lsjg.jg from jdm_lsbm,jc_lsjg where jdm_lsbm.lsbm=jc_lsjg.lsbm order by jdm_lsbm.lsbm","");
%> 
                </select>
              </td>
              <td width="18%" bgcolor="#FFFFCC"> 
                <div align="right"><font color="#0000CC">���ּ۸�</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="lsjg" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">�߽Ű�</div>
              </td>
              <td width="32%"> 
                <select name="tjbbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(tjbbm,tjbjg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_tjbbm.tjbbm,jdm_tjbbm.tjbmc||'��:'||jc_tjbjg.jg from jdm_tjbbm,jc_tjbjg where jdm_tjbbm.tjbbm=jc_tjbjg.tjbbm order by jdm_tjbbm.tjbbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">�߽Ű�۸�</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="tjbjg" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">����</div>
              </td>
              <td width="32%"> 
                <select name="ctbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(ctbm,ctjg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_ctbm.ctbm,jdm_ctbm.ctmc||'��:'||jc_ctjg.jg from jdm_ctbm,jc_ctjg where jdm_ctbm.ctbm=jc_ctjg.ctbm order by jdm_ctbm.ctbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">����۸�</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="ctjg" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">����</div>
              </td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <select name="jlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(jlbm,jljg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_jlbm.jlbm,jdm_jlbm.jlmc||'��:'||jc_jljg.jg from jdm_jlbm,jc_jljg where jdm_jlbm.jlbm=jc_jljg.jlbm order by jdm_jlbm.jlbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">�����۸�</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="jljg" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right">��ע</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="bz" cols="71" rows="2"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="button"  value="����۸�" onClick="jsjg(insertform)" name="button">
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
function getDj(FormName)
{
	if (FormName.cgbm.value=='')
	{
		return;
	}

	if (FormName.dgjs.value=='' && FormName.tgjs.value=='')
	{
		return;
	}

	if (FormName.dgjs.value!='' && FormName.dggd.value=='')
	{
		return;
	}
	if (FormName.tgjs.value!='' && FormName.tggd.value=='')
	{
		return;
	}
/*
	var str="Jc_cgddmxCx.jsp?cgbm="+FormName.cgbm.value+"&dgjs="+FormName.dgjs.value+"&dggd="+FormName.dggd.value;
	str+="&tgjs="+FormName.tgjs.value+"&tggd="+FormName.tggd.value;
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
*/
}

function jsjg(FormName)//����FormName:Form������
{
	
	if(	javaTrim(FormName.dgcd)=="") {
		alert("������[���񳤶�]��");
		FormName.dgcd.focus();
		return false;
	}
	if(!(isFloat(FormName.dgcd, "���񳤶�"))) {
		return false;
	}
	if(	javaTrim(FormName.dgdj)=="") {
		alert("������[���񵥼�]��");
		FormName.dgdj.focus();
		return false;
	}
	if(!(isFloat(FormName.dgdj, "���񵥼�"))) {
		return false;
	}
	if(	javaTrim(FormName.dgfbxs)=="") {
		alert("������[����Ǳ�ϵ��]��");
		FormName.dgfbxs.focus();
		return false;
	}
	if(!(isFloat(FormName.dgfbxs, "����Ǳ�ϵ��"))) {
		return false;
	}


	if(	javaTrim(FormName.tdcd)=="") {
		alert("������[�ع񳤶�]��");
		FormName.tdcd.focus();
		return false;
	}
	if(!(isFloat(FormName.tdcd, "�ع񳤶�"))) {
		return false;
	}
	if(	javaTrim(FormName.tgdj)=="") {
		alert("������[�ع񵥼�]��");
		FormName.tgdj.focus();
		return false;
	}
	if(!(isFloat(FormName.tgdj, "�ع񵥼�"))) {
		return false;
	}
	if(	javaTrim(FormName.tgfbxs)=="") {
		alert("������[�ع�Ǳ�ϵ��]��");
		FormName.tgfbxs.focus();
		return false;
	}
	if(!(isFloat(FormName.tgfbxs, "�ع�Ǳ�ϵ��"))) {
		return false;
	}


	if(	javaTrim(FormName.tmcd)=="") {
		alert("������[̨�泤��]��");
		FormName.tmcd.focus();
		return false;
	}
	if(!(isFloat(FormName.tmcd, "̨�泤��"))) {
		return false;
	}
	if(	javaTrim(FormName.tmdj)=="") {
		alert("������[̨�浥��]��");
		FormName.tmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.tmdj, "̨�浥��"))) {
		return false;
	}
	if(	javaTrim(FormName.tmfbxs)=="") {
		alert("������[̨��Ǳ�ϵ��]��");
		FormName.tmfbxs.focus();
		return false;
	}
	if(!(isFloat(FormName.tmfbxs, "̨��Ǳ�ϵ��"))) {
		return false;
	}


	if(	javaTrim(FormName.mbmj)=="") {
		alert("������[�Ű����]��");
		FormName.mbmj.focus();
		return false;
	}
	if(!(isFloat(FormName.mbmj, "�Ű����"))) {
		return false;
	}
	if(	javaTrim(FormName.mbdj)=="") {
		alert("������[�Ű嵥��]��");
		FormName.mbdj.focus();
		return false;
	}
	if(!(isFloat(FormName.mbdj, "�Ű嵥��"))) {
		return false;
	}

	if(	javaTrim(FormName.mbfbjg)=="") {
		alert("��ѡ��[�Ű��߼۸�]��");
		FormName.mbfbjg.focus();
		return false;
	}
	if(!(isFloat(FormName.mbfbjg, "�Ű��߼۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.xtjg)=="") {
		alert("������[����۸�]��");
		FormName.xtjg.focus();
		return false;
	}
	if(!(isFloat(FormName.xtjg, "����۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.lsjg)=="") {
		alert("������[���ּ۸�]��");
		FormName.lsjg.focus();
		return false;
	}
	if(!(isFloat(FormName.lsjg, "���ּ۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.tjbjg)=="") {
		alert("������[�߽Ű�۸�]��");
		FormName.tjbjg.focus();
		return false;
	}
	if(!(isFloat(FormName.tjbjg, "�߽Ű�۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.ctjg)=="") {
		alert("������[����۸�]��");
		FormName.ctjg.focus();
		return false;
	}
	if(!(isFloat(FormName.ctjg, "����۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.jljg)=="") {
		alert("������[�����۸�]��");
		FormName.jljg.focus();
		return false;
	}
	if(!(isFloat(FormName.jljg, "�����۸�"))) {
		return false;
	}

	var zj=0;
	zj=FormName.dgcd.value*FormName.dgdj.value*FormName.dgfbxs.value+FormName.tdcd.value*FormName.tgdj.value*FormName.tgfbxs.value;
	zj+=FormName.tmcd.value*FormName.tmdj.value*FormName.tmfbxs.value+FormName.mbmj.value*FormName.mbdj.value;
	zj+=FormName.mbfbjg.value*1+FormName.xtjg.value*1+FormName.lsjg.value*1;
	zj+=FormName.tjbjg.value*1+FormName.ctjg.value*1+FormName.jljg.value*1;
	
	FormName.sjzj.value=parseInt(zj*100)/100;
}
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cgbm)=="") {
		alert("��ѡ��[�������]��");
		FormName.cgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dgcd)=="") {
		alert("������[���񳤶�]��");
		FormName.dgcd.focus();
		return false;
	}
	if(!(isFloat(FormName.dgcd, "���񳤶�"))) {
		return false;
	}
	if(	javaTrim(FormName.dggd)=="") {
		alert("������[����߶�]��");
		FormName.dggd.focus();
		return false;
	}
	if(!(isNumber(FormName.dggd, "����߶�"))) {
		return false;
	}
	if(	javaTrim(FormName.dgjs)=="") {
		alert("������[�������]��");
		FormName.dgjs.focus();
		return false;
	}
	if(!(isNumber(FormName.dgjs, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.dgdj)=="") {
		alert("������[���񵥼�]��");
		FormName.dgdj.focus();
		return false;
	}
	if(!(isFloat(FormName.dgdj, "���񵥼�"))) {
		return false;
	}
	if(	javaTrim(FormName.dgfbxs)=="") {
		alert("������[����Ǳ�ϵ��]��");
		FormName.dgfbxs.focus();
		return false;
	}
	if(!(isFloat(FormName.dgfbxs, "����Ǳ�ϵ��"))) {
		return false;
	}
	if(	javaTrim(FormName.tdcd)=="") {
		alert("������[�ع񳤶�]��");
		FormName.tdcd.focus();
		return false;
	}
	if(!(isFloat(FormName.tdcd, "�ع񳤶�"))) {
		return false;
	}
	if(	javaTrim(FormName.tggd)=="") {
		alert("������[�ع�߶�]��");
		FormName.tggd.focus();
		return false;
	}
	if(!(isNumber(FormName.tggd, "�ع�߶�"))) {
		return false;
	}
	if(	javaTrim(FormName.tgjs)=="") {
		alert("������[�ع����]��");
		FormName.tgjs.focus();
		return false;
	}
	if(!(isNumber(FormName.tgjs, "�ع����"))) {
		return false;
	}
	if(	javaTrim(FormName.tgdj)=="") {
		alert("������[�ع񵥼�]��");
		FormName.tgdj.focus();
		return false;
	}
	if(!(isFloat(FormName.tgdj, "�ع񵥼�"))) {
		return false;
	}
	if(	javaTrim(FormName.tgfbxs)=="") {
		alert("������[�ع�Ǳ�ϵ��]��");
		FormName.tgfbxs.focus();
		return false;
	}
	if(!(isFloat(FormName.tgfbxs, "�ع�Ǳ�ϵ��"))) {
		return false;
	}
	if(	javaTrim(FormName.tmbm)=="") {
		alert("��ѡ��[̨��]��");
		FormName.tmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tmcd)=="") {
		alert("������[̨�泤��]��");
		FormName.tmcd.focus();
		return false;
	}
	if(!(isFloat(FormName.tmcd, "̨�泤��"))) {
		return false;
	}
	if(	javaTrim(FormName.tmdj)=="") {
		alert("������[̨�浥��]��");
		FormName.tmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.tmdj, "̨�浥��"))) {
		return false;
	}
	if(	javaTrim(FormName.tmfbxs)=="") {
		alert("������[̨��Ǳ�ϵ��]��");
		FormName.tmfbxs.focus();
		return false;
	}
	if(!(isFloat(FormName.tmfbxs, "̨��Ǳ�ϵ��"))) {
		return false;
	}
	if(	javaTrim(FormName.mbmj)=="") {
		alert("������[�Ű����]��");
		FormName.mbmj.focus();
		return false;
	}
	if(!(isFloat(FormName.mbmj, "�Ű����"))) {
		return false;
	}
	if(	javaTrim(FormName.mbdj)=="") {
		alert("������[�Ű嵥��]��");
		FormName.mbdj.focus();
		return false;
	}
	if(!(isFloat(FormName.mbdj, "�Ű嵥��"))) {
		return false;
	}
	if(	javaTrim(FormName.mbbm)=="") {
		alert("��ѡ��[�Ű�]��");
		FormName.mbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mbfbjg)=="") {
		alert("��ѡ��[�Ű��߼۸�]��");
		FormName.mbfbjg.focus();
		return false;
	}
	if(!(isFloat(FormName.mbfbjg, "�Ű��߼۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.xtbm)=="") {
		alert("��ѡ��[����]��");
		FormName.xtbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xtjg)=="") {
		alert("������[����۸�]��");
		FormName.xtjg.focus();
		return false;
	}
	if(!(isFloat(FormName.xtjg, "����۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.lsbm)=="") {
		alert("��ѡ��[����]��");
		FormName.lsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lsjg)=="") {
		alert("������[���ּ۸�]��");
		FormName.lsjg.focus();
		return false;
	}
	if(!(isFloat(FormName.lsjg, "���ּ۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.tjbbm)=="") {
		alert("��ѡ��[�߽Ű�]��");
		FormName.tjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tjbjg)=="") {
		alert("������[�߽Ű�۸�]��");
		FormName.tjbjg.focus();
		return false;
	}
	if(!(isFloat(FormName.tjbjg, "�߽Ű�۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.ctbm)=="") {
		alert("��ѡ��[����]��");
		FormName.ctbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ctjg)=="") {
		alert("������[����۸�]��");
		FormName.ctjg.focus();
		return false;
	}
	if(!(isFloat(FormName.ctjg, "����۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.jlbm)=="") {
		alert("��ѡ��[����]��");
		FormName.jlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jljg)=="") {
		alert("������[�����۸�]��");
		FormName.jljg.focus();
		return false;
	}
	if(!(isFloat(FormName.jljg, "�����۸�"))) {
		return false;
	}


	jsjg(FormName);

	if(	javaTrim(FormName.sjzj)=="") {
		alert("������[�����ܼ�]��");
		FormName.sjzj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzj, "�����ܼ�"))) {
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
