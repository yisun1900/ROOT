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
	String dqbm=(String)session.getAttribute("dqbm");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼�빤����Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCrm_khxx.jsp" name="insertform" target='_blank'>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0033">ǩԼ���</font></td>
              <td width="33%"> 
                <input type="text" name="qyxh" value="1" size="20" maxlength="8" onKeyUp="keyTo(gcjdbm)" >
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">��ͬ��</td>
              <td width="33%"> 
                <input type="text" name="hth" value="" size="20" maxlength="20" onKeyUp="keyGo(qyrq)">
              </td>
              <td width="18%" align="right">ǩԼ����</td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(hdsjs)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dqbm='"+dqbm+"' order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="khxm" value="" size="20" maxlength="50"  onKeyUp="keyGo(lxfs)">
              </td>
              <td width="18%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lxfs" value="" size="20" maxlength="50" onKeyUp="keyGo(kgrq)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">��������</td>
              <td width="33%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(xqbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">С��</td>
              <td width="33%"> 
                <select name="xqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xqbm,xqmc from dm_xqbm where dqbm='"+dqbm+"' order by xqmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">���ݵ�ַ</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz" value="" size="74" maxlength="100"  onKeyUp="keyGo(qyxh)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">��������</td>
              <td width="33%"> 
                <input type="text" name="csrq" value="" size="20" maxlength="10" onKeyUp="keyTo(zybm)" >
              </td>
              <td width="18%" align="right">ְҵ</td>
              <td width="33%"> 
                <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">���ʦ</td>
              <td width="33%"> 
                <input type="text" name="sjs" value="" size="20" maxlength="20" onKeyUp="keyTo(sgd)" >
              </td>
              <td width="18%" align="right">ʩ����</td>
              <td width="33%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX"  onKeyUp="keyGo(zjxm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd order by sgdmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">���̵���</td>
              <td width="33%"> 
                <input type="text" name="zjxm" size="20" maxlength="20" onKeyUp="keyGo(qye)">
              </td>
              <td width="18%" align="right">�ֳ��೤</td>
              <td width="33%"> 
                <input type="text" name="sgbz" size="20" maxlength="20" onKeyUp="keyGo(qye)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">�������</td>
              <td width="33%"> 
                <input type="text" name="fwmj" value="" size="20" maxlength="20"  onChange="calValue(insertform)" onKeyUp="keyTo(hxmjbm)">
              </td>
              <td width="18%" align="right">�������</td>
              <td width="33%"> 
                <select name="hxmjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(zxjwbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">�Ƿ����Ż�</td>
              <td width="33%"> 
                <input type="radio" name="sfyyh"  value="Y" onKeyUp="keyGo(zkl)">
                �� 
                <input type="radio" name="sfyyh"  value="N" onKeyUp="keyGo(zkl)">
                �� </td>
              <td width="18%" align="right">�ۿ��ʣ�&gt;0��&lt;=10��</td>
              <td width="33%"> 
                <input type="text" name="zkl" value="" size="20" maxlength="20" onKeyUp="keyGo(yhyy)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">ǩԼ����</td>
              <td width="33%"> 
                <input type="text" name="qyrq" size="20" maxlength="10" onKeyUp="keyGo(kgrq)" >
              </td>
              <td width="18%" align="right">ǩԼ��</td>
              <td width="33%"> 
                <input type="text" name="qye" value="" size="20" maxlength="8" onKeyUp="keyGo(fwdz)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="16%" align="right">�Ƿ�ȯ</td>
              <td width="33%">
                <input type="radio" name="sffj"  value="Y">
                �� 
                <input type="radio" name="sffj"  value="N">
                �� </td>
              <td width="18%" align="right">�Ƿ�����֤</td>
              <td width="33%">
                <input type="radio" name="sfyrz"  value="Y">
                �� 
                <input type="radio" name="sfyrz"  value="N">
                �� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">Ӧ��������</td>
              <td width="33%"> 
                <input type="text" name="kgrq" value="" size="20" maxlength="10" onKeyUp="keyGo(jgrq)" >
              </td>
              <td width="18%" align="right">ʵ�ʿ�������</td>
              <td width="33%"> 
                <input type="text" name="sjkgrq" value="" size="20" maxlength="10" onKeyUp="keyGo(sjjgrq)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">Ӧ��������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jgrq" size="20" maxlength="10" onKeyUp="keyGo(sjkgrq)" >
              </td>
              <td width="18%"> 
                <div align="right">ʵ�ʿ�������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sjjgrq" size="20" maxlength="10" onKeyUp="keyGo(sjs)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">����ͬ����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jhtrq" size="20" maxlength="10" onKeyUp="keyGo(sjkgrq)" >
              </td>
              <td width="18%"> 
                <div align="right">���޽�ֹʱ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="bxjzsj" size="20" maxlength="10" onKeyUp="keyGo(sjkgrq)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">���̽���</td>
              <td width="33%"> 
                <select name="gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(wgbz)">
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","4");
%> 
                </select>
              </td>
              <td width="18%" align="right">�깤��־</td>
              <td width="33%"> 
                <select name="wgbz" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(khlxbm)">
                  <%
	cf.selectToken(out,"Y+���깤&N+δ�깤","Y");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">�׿�����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="skrq" value="" size="20" maxlength="10" onKeyUp="keyGo(skje)" >
              </td>
              <td width="18%"> 
                <div align="right">�׿���</div>
              </td>
              <td width="33%"> 
                <input type="text" name="skje" value="" size="20" maxlength="8" onKeyUp="keyGo(zkrq)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">���ڿ�����</td>
              <td width="33%"> 
                <input type="text" name="zkrq" size="20" maxlength="10" onKeyUp="keyGo(zkje)" >
              </td>
              <td width="18%" align="right">�п���</td>
              <td width="33%"> 
                <input type="text" name="zkje" value="" size="20" maxlength="8" onKeyUp="keyTo(hdbz)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">����</td>
              <td width="33%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(fgflbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">װ�޼�λ</td>
              <td width="33%"> 
                <select name="zxjwbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(qye)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">��ɫ</td>
              <td width="33%"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(czbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right">����</td>
              <td width="33%"> 
                <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fwmj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select czbm,czmc from dm_czbm order by czbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">��ϵ�ͻ�</div>
              </td>
              <td width="33%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(bz)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">�ص���־</div>
              </td>
              <td width="33%"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(insertform)" onKeyUp="keyGo(ybjbh)">
                  <option value="1">�ǻص�</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#0000CC">¼��ʱ��</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)">
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">��Ϣ¼����</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrr" value="<%=yhdlm%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3" onKeyUp="keyTo(savebutton)"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)" name="savebutton">
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.qyxh)=="") {
		alert("������[ǩԼ���]��");
		FormName.qyxh.focus();
		return false;
	}
	if(!(isNumber(FormName.qyxh, "ǩԼ���"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[ǩԼ����]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.sjs)=="") {
		alert("������[���ʦ]��");
		FormName.sjs.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("������[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxm)=="") {
		alert("������[���̵���]��");
		FormName.zjxm.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.qye, "����ǩԼ��"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyyh)) {
		alert("��ѡ��[�Ƿ����Ż�]��");
		FormName.sfyyh[0].focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "�ۿ���"))) {
		return false;
	}
	if (parseFloat(FormName.zkl.value)>10 || parseFloat(FormName.zkl.value)<=0) 
	{
		alert("[�ۿ���]�������Ӧ�ý���0��10֮�䣡");
		FormName.zkl.select();
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
	if(	javaTrim(FormName.qye)=="") {
		alert("������[ǩԼ��]��");
		FormName.qye.focus();
		return false;
	}
	if(	!radioChecked(FormName.sffj)) {
		alert("��ѡ��[�Ƿ�ȯ]��");
		FormName.sffj[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyrz)) {
		alert("��ѡ��[�Ƿ�����֤]��");
		FormName.sfyrz[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.kgrq, "Ӧ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjkgrq, "ʵ�ʿ�������"))) {
		return false;
	}

	if(!(isDatetime(FormName.jgrq, "Ӧ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjjgrq, "ʵ�ʿ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhtrq, "����ͬ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.bxjzsj, "���޽�ֹʱ��"))) {
		return false;
	}


	if(	javaTrim(FormName.gcjdbm)=="") {
		alert("��ѡ��[���̽���]��");
		FormName.gcjdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.wgbz)=="") {
		alert("��ѡ��[�깤��־]��");
		FormName.wgbz.focus();
		return false;
	}
	if (FormName.wgbz.value=="Y")
	{
		if (FormName.gcjdbm.value!="4")
		{
			alert("[���̽���]��[�깤��־]��һ�£�");
			FormName.gcjdbm.focus();
			return false;
		}
	}
	else{
		if (FormName.gcjdbm.value=="4")
		{
			alert("[���̽���]��[�깤��־]��һ�£�");
			FormName.gcjdbm.focus();
			return false;
		}
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
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}



	FormName.submit();
	FormName.khxm.select();
	return true;
}
//-->
</SCRIPT>
