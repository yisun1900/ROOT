<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String fgsbh=cf.GB2Uni(request.getParameter("ssfgs"));
String dqbm=cf.executeQuery("select dqbm from sq_dwxx where dwbh='"+fgsbh+"'");
%>
<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">¼�룭��¥����Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#CC0000">*</font>����</td>
              <td width="31%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'","");
%> 
                </select>              </td>
              <td width="16%" align="right"><font color="#CC0000">*</font>��˾</td>
              <td width="34%"> 
                <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"' ","");
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#CC0000">*</font>����              </td>
              <td width="31%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm","");
%> 
                </select>              </td> 
              <td width="16%" align="right"  >              </td>
              <td width="34%">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#CC0000">*</font>С������              </td>
              <td colspan="3"> 
                <input type="text" name="xqmc" value="" size="70" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#CC0000">*</font>��ַ              </td>
              <td colspan="3"> 
                <input type="text" name="dz" value="" size="70" maxlength="80" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
              <p align="right">�ܱ߻������˳�·��              </td>
              <td colspan="3"> 
                <p align="left"> 
                  <textarea name="cclx" cols="69" rows="2"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#CC0000">*</font>��λ</td>
              <td width="31%"> 
                <input type="text" name="jw" value="" size="20" maxlength="9" >              </td>
              <td width="16%" align="right">¥�̶�λ</td>
              <td width="34%"> 
                <input type="radio" name="yzxfsp"  value="�ߵ�">
                �ߵ� 
                <input type="radio" name="yzxfsp"  value="�иߵ�">
                �иߵ� 
                <input type="radio" name="yzxfsp"  value="�е�">
                �е� 
                <input type="radio" name="yzxfsp"  value="�͵�">
              �͵� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#CC0000">*</font>¥������</td>
              <td width="31%"> 
                <select name="xz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <option value="��Ʒ��">��Ʒ��</option>
                  <option value="�������÷�">�������÷�</option>
                  <option value="���ʷ�">���ʷ�</option>
                  <option value="��Ǩ��">��Ǩ��</option>
                  <option value="��ס���÷�">��ס���÷�</option>
                  <option value="����">����</option>
                  <option value="����">����</option>
                </select>              </td>
              <td width="16%" align="right" bgcolor="#FFFFFF">С�������Ƿ���� </td>
              <td width="34%">
				<input type="radio" name="dysfwc"  value="Y">���
				<input type="radio" name="dysfwc"  value="N">δ���			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#CC0000">*</font>С����ģ              </td>
              <td colspan="3"> 
                <input type="text" name="xqgm" size="70" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#CC0000">*</font>��������              </td>
              <td colspan="3"> 
                <input type="text" name="hxzl" value="" size="70" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��������</td>
              <td width="31%"> 
                <input type="text" name="zlhx" value="" size="20" maxlength="20" >              </td>
              <td width="16%" align="right">�����������</td>
              <td width="34%"> 
              <input type="text" name="zlhxmj" value="" size="20" maxlength="8" ></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">С��������</td>
              <td width="31%">&nbsp;</td>
              <td align="right" width="16%">С�������˵绰</td>
              <td width="34%"> 
              <input type="text" name="xqfzrdh" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#CC0000">*</font>С���ۺ�����              </td>
              <td colspan="3"> 
                <textarea name="xqzhpj" cols="69" rows="3"></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#CCCCFF">¥���������</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">����ʱ��</td>
              <td><input type="text" name="lxsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"><font color="#CC0000">*</font>���۷�ʽ</td>
              <td><input type="radio" name="xsfs"  value="�ַ�">
                �ַ�
                <input type="radio" name="xsfs"  value="�ڷ�">
                �ڷ� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>��Կ��ʱ��</td>
              <td><input type="text" name="fyssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right">��������</td>
              <td><input type="text" name="jfhs" value="" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�Ƿ����Ź�</td>
              <td>
			  		<input type="radio" name="sfytg"  value="Y">���Ź�
				  <input type="radio" name="sfytg"  value="N">��			</td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td><p align="right"><font color="#CC0000">*</font>����״��              </td>
              <td colspan="3"><textarea name="xszk" cols="69" rows="5"></textarea>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#CCCCFF">�ͻ����ϻ�ȡ���</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�ͻ����Ϲ������</td>
              <td><input type="radio" name="khzlgmqk" value="��˾����">
                ��˾����
                <input type="radio" name="khzlgmqk" value="Ա������">
                Ա������</td>
              <td align="right">�ͻ�����</td>
              <td><input type="radio" name="khmd" value="һ��">
                һ��
                <input type="radio" name="khmd" value="����">
                ����
                <input type="radio" name="khmd" value="רҵ����">
                רҵ����</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�뿪���̹�ϵ</td>
              <td colspan="3"><input name="ykfsgx" type="text" id="ykfsgx" value="" size="70" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#CCCCFF">��˾����������</td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>�Ƿ��������</td>
              <td><input type="radio" name="sfjcxc"  value="Y">
                ��
                <input type="radio" name="sfjcxc"  value="N">
                ��</td>
              <td align="right">��˾��ǩ���ͻ���</td>
              <td><input name="khzyl" type="text" id="khzyl" value="" size="10" maxlength="8" ></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">����������ʽ</td>
              <td colspan="3"><input type="text" name="yxxcfs" value="" size="70" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�������鼰��פ�ƻ�</td>
              <td colspan="3"><textarea name="kfjy" cols="69" rows="3" id="kfjy"></textarea></td>
            </tr>
            <tr bgcolor="#CCCCFF" align="center"> 
              <td colspan="4" bgcolor="#CCCCFF">������/������/������</td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#CC0000">*</font>������              </td>
              <td colspan="3"> 
                <input type="text" name="kfs" value="" size="70" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">��������ϵ��</td>
              <td width="31%"> 
                <input type="text" name="kfslxr" value="" size="20" maxlength="20" >              </td>
              <td align="right" width="16%">��������ϵ��ְ��</td>
              <td width="34%"> 
              <input type="text" name="kfslxrzw" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">��������ϵ�˵绰</td>
              <td colspan="3"> 
                <input type="text" name="kfslxrdh" value="" size="70" maxlength="50" >               </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                ������              </td>
              <td colspan="3"> 
                <input type="text" name="jzs" value="" size="70" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#CC0000">*</font>������              </td>
              <td colspan="3"> 
                <input type="text" name="xss" value="" size="70" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>��¥�绰 </td>
              <td colspan="3"><input type="text" name="sldh" value="" size="70" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td colspan="4" align="center">װ�����</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#CC0000">*</font>����װ�޹�˾</td>
              <td width="31%"> 
                <input type="radio" name="ywzxgs"  value="Y">
                �� 
                <input type="radio" name="ywzxgs"  value="N">
                �� </td>
              <td width="16%" align="right">&nbsp;</td>
              <td width="34%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">װ�޹�˾����</td>
              <td><input type="text" name="zxgssl" value="" size="20" maxlength="20" ></td>
              <td align="right" bgcolor="#FFFFFF">��װ�޻���</td>
              <td><input type="text" name="yzxhs" value="" size="20" maxlength="10" ></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>�Ƿ�ͳһװ����</td>
              <td><input type="radio" name="sftizxq"  value="��">
                ��
                <input type="radio" name="sftizxq"  value="��">
                ��</td>
              <td align="right">Ԥ��װ��ʱ��</td>
              <td><input type="text" name="yjzxsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#CCCCFF" align="center"> 
              <td colspan="4">��ҵ</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#CC0000">*</font>������ҵ��˾</td>
              <td width="31%"> 
                <input type="radio" name="ywwygs"  value="Y">
                �� 
                <input type="radio" name="ywwygs"  value="N">
                �� </td>
              <td width="16%" align="right">&nbsp;</td>
              <td width="34%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                ��ҵ��˾����              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="wygsmc" value="" size="70" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                ��ҵ������              </td>
              <td width="31%"> 
                <input type="text" name="wyfzr" value="" size="20" maxlength="20" >              </td>
              <td width="16%" align="right"> 
                ��ҵ�绰              </td>
              <td width="34%"> 
              <input type="text" name="wydh" value="" size="20" maxlength="40" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">��ҵ��ϵ��</td>
              <td width="31%"> 
                <input type="text" name="wylxr" value="" size="20" maxlength="20" >              </td>
              <td align="right" width="16%">��ҵ��ϵ��ְ��</td>
              <td width="34%"> 
              <input type="text" name="wylxrzw" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                <font color="#CC0000">*</font><font color="#0000FF">¼����</font> </td>
              <td width="31%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>              </td>
              <td width="16%" align="right"> 
                <font color="#CC0000">*</font><font color="#0000FF">¼��ʱ��              </font></td>
              <td width="34%"> 
              <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            

            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input name="tg" type="button" onClick="f_tg(insertform)"  value="�Ź����">
                <input name="ds" type="button" onClick="f_ds(insertform)"  value="����������Ϣ">
                <input name="gg" type="button" onClick="f_gg(insertform)"  value="����������">
                <input type="reset"  value="����" name="reset">              </td>
            </tr>
        </table>
          <input type="text" name="xqfzr" value="" size="20" maxlength="20" >
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
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
	if(	javaTrim(FormName.cqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[��˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("��ѡ��[С������]��");
		FormName.xqmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jw)=="") {
		alert("������[��λ]��");
		FormName.jw.focus();
		return false;
	}
	if(	javaTrim(FormName.dz)=="") {
		alert("������[��ַ]��");
		FormName.dz.focus();
		return false;
	}

	if(	!radioChecked(FormName.xsfs)) {
		alert("��ѡ��[���۷�ʽ]��");
		FormName.xsfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.xszk)=="") {
		alert("������[����״��]��");
		FormName.xszk.focus();
		return false;
	}
	if(	javaTrim(FormName.xqgm)=="") {
		alert("������[С����ģ]��");
		FormName.xqgm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxzl)=="") {
		alert("������[��������]��");
		FormName.hxzl.focus();
		return false;
	}
	if(	javaTrim(FormName.xqzhpj)=="") {
		alert("������[С���ۺ�����]��");
		FormName.xqzhpj.focus();
		return false;
	}
	if(	javaTrim(FormName.kfs)=="") {
		alert("������[������]��");
		FormName.kfs.focus();
		return false;
	}
	if(	javaTrim(FormName.xss)=="") {
		alert("������[������]��");
		FormName.xss.focus();
		return false;
	}
	if(	javaTrim(FormName.sldh)=="") {
		alert("������[��¥�绰]��");
		FormName.sldh.focus();
		return false;
	}
	if(	!radioChecked(FormName.ywzxgs)) {
		alert("��ѡ��[����װ�޹�˾]��");
		FormName.ywzxgs[0].focus();
		return false;
	}
	
	if(!(isNumber(FormName.zxgssl, "װ�޹�˾����"))) {
		return false;
	}
	if(	!radioChecked(FormName.ywwygs)) {
		alert("��ѡ��[������ҵ��˾]��");
		FormName.ywwygs[0].focus();
		return false;
	}
	if(!(isNumber(FormName.yzxhs, "��װ�޻���"))) {
		return false;
	}

	if(	javaTrim(FormName.fyssj)=="") {
		alert("������[��Կ��ʱ��]��");
		FormName.fyssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fyssj, "��Կ��ʱ��"))) {
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

	/*if(!(isNumber(FormName.zlhxmj, "�����������"))) {
		return false;
	}*/
	if(!(isDatetime(FormName.lxsj, "����ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.jfhs, "��������"))) {
		return false;
	}

	if(	!radioChecked(FormName.sftizxq)) {
		alert("��ѡ��[�Ƿ�ͳһװ����]��");
		FormName.sftizxq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjcxc)) {
		alert("��ѡ��[�Ƿ��������]��");
		FormName.sfjcxc[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj, "Ԥ��װ��ʱ��"))) {
		return false;
	}

	FormName.action="SaveInsertYx_lsdcb.jsp";
	FormName.submit();
	return true;
}
function f_tg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("��ѡ��[С������]��");
		FormName.xqmc.focus();
		return false;
	}

	FormName.action="InsertYx_lptgqk.jsp";
	FormName.submit();
	return true;
}
function f_ds(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("��ѡ��[С������]��");
		FormName.xqmc.focus();
		return false;
	}

	FormName.action="InsertYx_lpjzdsqk.jsp";
	FormName.submit();
	return true;
}
function f_gg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("��ѡ��[С������]��");
		FormName.xqmc.focus();
		return false;
	}

	FormName.action="InsertYx_lpggxcqk.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
