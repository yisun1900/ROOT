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
	String yhmc=(String)session.getAttribute("yhmc");
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String zdyhbz=(String)session.getAttribute("zdyhbz");

%>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");

%>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼��ͻ���Ϣ��<font color="#FF0033">*</font>Ϊ�����ֶΣ�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCrm_khxx.jsp" name="insertform" target='_blank'>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#FF0033">*</font>�ͻ�����</div>              </td>
              <td width="31%"> 
                <input type="text" name="khxm" value="" size="20" maxlength="50"  onKeyUp="keyTo(xb[0])">              </td>
              <td width="20%"> 
                <div align="right">�Ա�</div>              </td>
              <td width="30%"> 
                <input type="radio" name="xb"  value="M" onKeyUp="keyGo(lxfs)">
                �� 
                <input type="radio" name="xb"  value="W" onKeyUp="keyGo(lxfs)">
                Ů </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0033">*</font>��ϵ��ʽ</td>
              <td width="31%"> 
                <input type="text" name="lxfs" value="" size="20" maxlength="100" onKeyUp="keyGo(hth)" >              </td>
              <td width="20%" align="right">��ͬ��</td>
              <td width="30%"> 
                <input type="text" name="hth" value="" size="20" maxlength="20" onKeyUp="keyGo(fwdz)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#FF0033">*</font>���ݵ�ַ</div>              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz" value="" size="74" maxlength="100"  onKeyUp="keyTo(cqbm)" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��������</td>
              <td width="31%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(xqbm)"  onChange="getXq(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm","");
%> 
                </select>              </td>
              <td width="20%" align="right">���ۣ�Ԫ/m��</td>
              <td width="30%"> 
                <input type="text" name="fj" value="" size="20" maxlength="20" onKeyUp="keyTo(sjs)" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��������</td>
              <td width="31%"> 
                <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm","");
%> 
                </select>              </td>
              <td width="20%" align="right">ְҵ</td>
              <td width="30%"> 
                <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0033">*</font>���ʦ</td>
              <td width="31%"> 
                <input type="text" name="sjs" value="" size="20" maxlength="20" onKeyUp="keyTo(khlxbm)" >              </td>
              <td width="20%" align="right"><font color="#FF0033">*</font>���̵���</td>
              <td width="30%"> 
                <input type="text" name="zjxm" size="20" maxlength="20" onKeyUp="keyGo(qye)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">ʩ����</td>
              <td width="31%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX"  onKeyUp="keyGo(zjxm)">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'��'||DECODE(sq_sgd.cxbz,'Y','����,')||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh  order by sq_sgd.ssfgs,sq_sgd.cxbz,sgdmc","");
	}
	else 
	{
		cf.selectItem(out,"select sgd,sgdmc||'��'||DECODE(sq_sgd.cxbz,'Y','����,')||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' order by sq_sgd.ssfgs,sq_sgd.cxbz,sgdmc","");
	}
%> 
                </select>              </td>
              <td width="20%" align="right">ʩ���೤</td>
              <td width="30%"> 
                <input type="text" name="sgbz" size="20" maxlength="20" onKeyUp="keyGo(qye)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0033">*</font>��ϵ�ͻ�</td>
              <td width="31%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(xxlybm)">
                  <%
	if (zdyhbz.equals("Y"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","04");
	}
	else{
		out.println("<option value=\"04\">��ͨ�ͻ�</option>");
	}
%> 
                </select>              </td>
              <td width="20%" align="right">����</td>
              <td width="30%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(fgflbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">���</div>              </td>
              <td width="31%"> 
                <select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(ysbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%> 
                </select>              </td>
              <td width="20%"> 
                <div align="right">��ɫ</div>              </td>
              <td width="30%"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(czbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">����</td>
              <td width="31%"> 
                <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(yqbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select czbm,czmc from dm_czbm order by czbm","");
%> 
                </select>              </td>
              <td width="20%" align="right">����</td>
              <td width="30%"> 
                <select name="yqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fwmj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yqbm,yqmc from dm_yqbm order by yqbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#FF0033">*</font>����ǩԼ��</div>              </td>
              <td width="31%"> 
                <input type="text" name="qye" value="" size="20" maxlength="8"  onChange="calValue(insertform)" >
                <input type="hidden" name="pmjj" value="" size="20" maxlength="8" readonly>              </td>
              <td width="20%"> 
                <div align="right">�������</div>              </td>
              <td width="30%"> 
                <input type="text" name="fwmj" value="" size="20" maxlength="20"  onChange="calValue(insertform)" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�Ƿ�ȯ</td>
              <td width="31%"> 
                <input type="radio" name="sffj"  value="Y" onKeyUp="keyGo(sfyrz[0])">
                �� 
                <input type="radio" name="sffj"  value="N" onKeyUp="keyGo(sfyrz[0])" checked>
                �� </td>
              <td width="20%" align="right">�Ƿ�����֤</td>
              <td width="30%"> 
                <input type="radio" name="sfyrz"  value="Y" onKeyUp="keyGo(sfyyh[0])">
                �� 
                <input type="radio" name="sfyrz"  value="N" onKeyUp="keyGo(sfyyh[0])" checked>
                �� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�Ƿ����Ż�</td>
              <td width="31%"> 
                <input type="radio" name="sfyyh"  value="Y" >
                �� 
                <input type="radio" name="sfyyh"  value="N"  checked>
                �� </td>
              <td width="20%" align="right">�Ż�����</td>
              <td width="30%"> 
                <input type="text" name="yhyy" value="" size="20" maxlength="200" onKeyUp="keyGo(jyjdrq)" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">���齻������</td>
              <td width="31%"> 
                <input type="text" name="jyjdrq" value="" size="20" maxlength="10" onKeyUp="keyGo(qyrq)" onDblClick="JSCalendar(this)">              </td>
              <td width="20%" align="right"><font color="#FF0033">*</font>ǩԼ����</td>
              <td width="30%"> 
                <input type="text" name="qyrq" size="20" maxlength="10" onKeyUp="keyGo(kgrq)" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ͬ��������</td>
              <td width="31%"> 
                <input type="text" name="kgrq" value="" size="20" maxlength="10" onKeyUp="keyGo(jgrq)" onDblClick="JSCalendar(this)">              </td>
              <td width="20%" align="right">ʵ�ʿ�������</td>
              <td width="30%"> 
                <input type="text" name="sjkgrq" value="" size="20" maxlength="10" onKeyUp="keyGo(sjjgrq)" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp;</td>
              <td width="20%" align="right">ʵ�����ι�����������</td>
              <td width="30%"> 
                <input type="text" name="sybgcrq" size="20" maxlength="10" onKeyUp="keyTo(hdbz)" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ͬ��������</td>
              <td width="31%"> 
                <input type="text" name="jgrq" size="20" maxlength="10" onKeyUp="keyTo(hdbz)" onDblClick="JSCalendar(this)">              </td>
              <td width="20%" align="right">ʵ�ʿ�������</td>
              <td width="30%"> 
                <input type="text" name="sjjgrq" size="20" maxlength="10" onKeyUp="keyGo(sjs)" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">ʵ���������</div>              </td>
              <td width="31%"> 
                <input type="text" name="sjwjrq" size="20" maxlength="10" onKeyUp="keyGo(sjkgrq)" onDblClick="JSCalendar(this)">              </td>
              <td width="20%"> 
                <div align="right">���̽���</div>              </td>
              <td width="30%"> 
                <select name="gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(wgbz)">
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","5");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�ɱ��ޱ�־</td>
              <td width="31%"> 
                <select name="kbxbz" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(wgbz)">
                  <option value="Y">����</option>
                  <option value="N">������</option>
                </select>              </td>
              <td width="20%" align="right">���޽�ֹʱ��</td>
              <td width="30%"> 
                <input type="text" name="bxjzsj" size="20" maxlength="10" onKeyUp="keyGo(sjkgrq)" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0033">*</font>�ص���־</td>
              <td width="31%"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(ybjbh)">
                  <option value="1">�ǻص�</option>
                </select>              </td>
              <td width="20%" align="right">ʩ���ӽ����־</td>
              <td width="30%"> 
                <select name="gdjsjd" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(khlxbm)">
                  <option value="0">δ����</option>
                  <option value="1" selected>�ѽ���</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">���ʦ�����־</td>
              <td width="31%"> 
                <select name="sjsjsbz" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(wgbz)">
                  <option value="0">δ����</option>
                  <option value="1">ǩ������</option>
                  <option value="2" selected>�깤���� </option>
                </select>              </td>
              <td width="20%" align="right">ҵ��Ա�����־</td>
              <td width="30%"> 
                <select name="ywyjsbz" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(khlxbm)">
                  <option value="0">δ����</option>
                  <option value="1" selected>�ѽ���</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000CC">�����ֹ�˾</font></td>
              <td width="31%"> 
                <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
                </select>              </td>
              <td width="20%" align="right"><font color="#FF0033">*</font><font color="#0000CC">ǩԼ����</font></td>
              <td width="30%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(hdsjs)">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#FF0033">*</font><font color="#0000CC">¼��ʱ��</font></div>              </td>
              <td width="31%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)">              </td>
              <td width="20%"> 
                <div align="right"><font color="#FF0033">*</font><font color="#0000CC">��Ϣ¼����</font></div>              </td>
              <td width="30%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��ע</div>              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3" onKeyUp="keyTo(savebutton)"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)" name="savebutton">
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
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
	if(	javaTrim(FormName.lxfs)=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.hth)=="") {
		alert("������[��ͬ��]��");
		FormName.hth.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}

	if(!(isNumber(FormName.fj, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjs)=="") {
		alert("������[���ʦ]��");
		FormName.sjs.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxm)=="") {
		alert("������[���̵���]��");
		FormName.zjxm.focus();
		return false;
	}

	if(	javaTrim(FormName.khlxbm)=="") {
		alert("��ѡ��[��ϵ�ͻ�]��");
		FormName.khlxbm.focus();
		return false;
	}


	if(	javaTrim(FormName.qye)=="") {
		alert("������[����ǩԼ��]��");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "����ǩԼ��"))) {
		return false;
	}


	calValue(FormName);

	if(	!radioChecked(FormName.sfyyh)) {
		alert("��ѡ��[�Ƿ����Ż�]��");
		FormName.sfyyh[0].focus();
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
	if(	javaTrim(FormName.qyrq)=="") {
		alert("������[ǩԼ����]��");
		FormName.qyrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "ǩԼ����"))) {
		return false;
	}

	if(!(isDatetime(FormName.jyjdrq, "���齻������"))) {
		return false;
	}
	if(!(isDatetime(FormName.kgrq, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jgrq, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjjgrq, "ʵ�ʿ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq, "ʵ���������"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.hdbz)=="") {
		alert("��ѡ��[�ص���־]��");
		FormName.hdbz.focus();
		return false;
	}

	if(	javaTrim(FormName.sjwjrq)!="") {
		if (FormName.gcjdbm.value!="5")
		{
			alert("[���̽���]����ȷ��Ӧ��������ᣡ");
			FormName.gcjdbm.focus();
			return false;
		}
	}
	else if(javaTrim(FormName.sjjgrq)!="") {
		if (FormName.gcjdbm.value!="4" && FormName.gcjdbm.value!="5")
		{
			alert("[���̽���]����ȷ��Ӧ�������깤��");
			FormName.gcjdbm.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[*ǩԼ����]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("������[�����ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[��Ϣ¼����]��");
		FormName.lrr.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
