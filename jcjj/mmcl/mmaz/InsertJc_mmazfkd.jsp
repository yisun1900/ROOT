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
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼��ľ�Ű�װ������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_mmazfkd.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">Ԥ�������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yddbh" value="<%=yddbh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="15%"> 
                <div align="right">��Ʒ��ʽ</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="spks"  value="1">
                ������ 
                <input type="radio" name="spks"  value="2">
                ���� 
                <input type="radio" name="spks"  value="3">
                ������ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ʒ����</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="spzl"  value="1">
                ������ 
                <input type="radio" name="spzl"  value="2">
                ���� 
                <input type="radio" name="spzl"  value="3">
                ������ </td>
              <td width="15%"> 
                <div align="right">��Ʒ����</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="spgn"  value="1">
                ������ 
                <input type="radio" name="spgn"  value="2">
                ���� 
                <input type="radio" name="spgn"  value="3">
                ������ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ʒ����</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="spfw"  value="1">
                ������ 
                <input type="radio" name="spfw"  value="2">
                ���� 
                <input type="radio" name="spfw"  value="3">
                ������ </td>
              <td width="15%"> 
                <div align="right">��װ����</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="azjs"  value="1">
                ������ 
                <input type="radio" name="azjs"  value="2">
                ���� 
                <input type="radio" name="azjs"  value="3">
                ������ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����̬��</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="fwtd"  value="1">
                ������ 
                <input type="radio" name="fwtd"  value="2">
                ���� 
                <input type="radio" name="fwtd"  value="3">
                ������ </td>
              <td width="15%"> 
                <div align="right">����淶</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="fwgf"  value="1">
                ������ 
                <input type="radio" name="fwgf"  value="2">
                ���� 
                <input type="radio" name="fwgf"  value="3">
                ������ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����ͻ�</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="mfsh"  value="Y">
                �� 
                <input type="radio" name="mfsh"  value="N">
                �� </td>
              <td width="15%"> 
                <div align="right">��Ѱ�װ</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="mfaz"  value="Y">
                �� 
                <input type="radio" name="mfaz"  value="N">
                �� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">׼ʱ����</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="zssm"  value="Y">
                �� 
                <input type="radio" name="zssm"  value="N">
                �� </td>
              <td width="15%"> 
                <div align="right">ʹ��Ь��</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="syxt"  value="Y">
                �� 
                <input type="radio" name="syxt"  value="N">
                �� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ʹ�õ沼</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="sydb"  value="Y">
                �� 
                <input type="radio" name="sydb"  value="N">
                �� </td>
              <td width="15%"> 
                <div align="right">λ����ȷ</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="wzzq"  value="Y">
                �� 
                <input type="radio" name="wzzq"  value="N">
                �� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�����ֳ�</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="qlxc"  value="Y">
                �� 
                <input type="radio" name="qlxc"  value="N">
                �� </td>
              <td width="15%"> 
                <div align="right">���ò�Ʒ</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="cscp"  value="Y">
                �� 
                <input type="radio" name="cscp"  value="N">
                �� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���ܱ���֪ʶ</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="jsbyzs"  value="Y">
                �� 
                <input type="radio" name="jsbyzs"  value="N">
                �� </td>
              <td width="15%"> 
                <div align="right">���ڹ˿ͼ�����</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="bzgkjxy"  value="Y">
                �� 
                <input type="radio" name="bzgkjxy"  value="N">
                �� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���ڹ˿ͼҳԷ�</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="bzgkjcf"  value="Y">
                �� 
                <input type="radio" name="bzgkjcf"  value="N">
                �� </td>
              <td width="15%"> 
                <div align="right">�������̵</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="bsdtt"  value="Y">
                �� 
                <input type="radio" name="bsdtt"  value="N">
                �� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�����ܹ˿�С��</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="bjsgkxf"  value="Y">
                �� 
                <input type="radio" name="bjsgkxf"  value="N">
                �� </td>
              <td width="15%"> 
                <div align="right">��ʹ�ù˿ͼ�ˮ��</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="bsygksb"  value="Y">
                �� 
                <input type="radio" name="bsygksb"  value="N">
                �� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�����ܹ˿�����</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="bjsgkyq"  value="Y">
                �� 
                <input type="radio" name="bjsgkyq"  value="N">
                �� </td>
              <td width="15%"> 
                <div align="right">��װ��ʱ</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="azhs"  value="Y">
                �� 
                <input type="radio" name="azhs"  value="N">
                �� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.spks)) {
		alert("��ѡ��[��Ʒ��ʽ]��");
		FormName.spks[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.spzl)) {
		alert("��ѡ��[��Ʒ����]��");
		FormName.spzl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.spgn)) {
		alert("��ѡ��[��Ʒ����]��");
		FormName.spgn[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.spfw)) {
		alert("��ѡ��[��Ʒ����]��");
		FormName.spfw[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.azjs)) {
		alert("��ѡ��[��װ����]��");
		FormName.azjs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.fwtd)) {
		alert("��ѡ��[����̬��]��");
		FormName.fwtd[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.fwgf)) {
		alert("��ѡ��[����淶]��");
		FormName.fwgf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.mfsh)) {
		alert("��ѡ��[����ͻ�]��");
		FormName.mfsh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.mfaz)) {
		alert("��ѡ��[��Ѱ�װ]��");
		FormName.mfaz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zssm)) {
		alert("��ѡ��[׼ʱ����]��");
		FormName.zssm[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.syxt)) {
		alert("��ѡ��[ʹ��Ь��]��");
		FormName.syxt[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sydb)) {
		alert("��ѡ��[ʹ�õ沼]��");
		FormName.sydb[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.wzzq)) {
		alert("��ѡ��[λ����ȷ]��");
		FormName.wzzq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.qlxc)) {
		alert("��ѡ��[�����ֳ�]��");
		FormName.qlxc[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.cscp)) {
		alert("��ѡ��[���ò�Ʒ]��");
		FormName.cscp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jsbyzs)) {
		alert("��ѡ��[���ܱ���֪ʶ]��");
		FormName.jsbyzs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bzgkjxy)) {
		alert("��ѡ��[���ڹ˿ͼ�����]��");
		FormName.bzgkjxy[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bzgkjcf)) {
		alert("��ѡ��[���ڹ˿ͼҳԷ�]��");
		FormName.bzgkjcf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bsdtt)) {
		alert("��ѡ��[�������̵]��");
		FormName.bsdtt[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bjsgkxf)) {
		alert("��ѡ��[�����ܹ˿�С��]��");
		FormName.bjsgkxf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bsygksb)) {
		alert("��ѡ��[��ʹ�ù˿ͼ�ˮ��]��");
		FormName.bsygksb[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bjsgkyq)) {
		alert("��ѡ��[�����ܹ˿�����]��");
		FormName.bjsgkyq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.azhs)) {
		alert("��ѡ��[��װ��ʱ]��");
		FormName.azhs[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
