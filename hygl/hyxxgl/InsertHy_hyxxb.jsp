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
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertHy_hyxxb.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ա���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hybh" value="" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">ˮ�ʷ�������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hykh" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ա����</div>
              </td>
              <td width="35%"> 
                <select name="hyjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hyjbbh,hyjb from hy_hyjbb order by hyjbbh","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <select name="fwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">��������</option>
                  <option value="2">��ֵ����</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="rhrq" value="<%=cf.today()%>" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">��Ч����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yxrq" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����ר����</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">��Ϣ¼����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xxlrr" value="<%=yhdlm%>" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ա����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hymm" value="" size="20" maxlength="12" >
              </td>
              <td width="15%"> 
                <div align="right">��Ա����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hyxm" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�Ա�</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="xb"  value="M">
                �� 
                <input type="radio" name="xb"  value="W">
                Ů </td>
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yzbm" value="" size="20" maxlength="12" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ա��ַ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hydz" value="" size="20" maxlength="200" >
              </td>
              <td width="15%"> 
                <div align="right">���֤����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sfzhm" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�绰</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dh" value="" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">�ֻ�</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sj" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dzxx" value="" size="20" maxlength="40" >
              </td>
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="csrq" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ְҵ</div>
              </td>
              <td width="35%"> 
                <select name="zydm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,zymc from hy_zydmb order by xh","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">������</div>
              </td>
              <td width="35%"> 
                <select name="ysrdm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,ysrdm from hy_ysrdmb order by xh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����״��</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="hyzk"  value="Y">
                �ѻ� 
                <input type="radio" name="hyzk"  value="N">
                δ�� </td>
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jhjnr" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="arxm" value="" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="arsr" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�۸�ӡ��</div>
              </td>
              <td width="35%"> 
                <select name="jgyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jgyxbm,jgyxmc from hy_jgyxbm order by jgyxbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">����ӡ��</div>
              </td>
              <td width="35%"> 
                <select name="fwyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwyxbm,fwyxmc from hy_fwyxbm order by fwyxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���ӡ��</div>
              </td>
              <td width="35%"> 
                <select name="fgyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgyxbm,fgyxmc from hy_fgyxbm order by fgyxbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">����ӡ��</div>
              </td>
              <td width="35%"> 
                <select name="gyyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gyyxbm,gyyxmc from hy_gyyxbm order by gyyxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ר����</div>
              </td>
              <td width="35%"> 
                <select name="zdfgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zdfgbm,zdfgmc from hy_zdfgbm order by zdfgbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">ƽʱ����</div>
              </td>
              <td width="35%"> 
                <select name="psahbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select psahbm,psahmc  from hy_psahbm order by psahbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">ϲ����ֽ��־</td>
              <td colspan="3"> 
                <textarea name="bzzz" cols="55" rows="2"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��֪ͬ��Ʒ��</div>
              </td>
              <td colspan="3"> 
                <textarea name="sztlpp" cols="55" rows="2"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">ϲ��ȥ���̵�</td>
              <td colspan="3"> 
                <textarea name="shop" cols="55" rows="2"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ϲ����ױƷƷ��</div>
              </td>
              <td colspan="3"> 
                <textarea name="hzppp" cols="55" rows="2"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">ϲ����װƷ��</td>
              <td colspan="3"> 
                <textarea name="fzpp" cols="55" rows="2"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�����ܽ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xfzje" value="" size="20" maxlength="17" >
              </td>
              <td width="15%"> 
                <div align="right">�������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gmcs" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jf" value="" size="20" maxlength="8" >
              </td>
              <td width="15%"> 
                <div align="right">δ�һ�����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="wdhjf" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="2"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
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
	if(	javaTrim(FormName.hybh)=="") {
		alert("������[��Ա���]��");
		FormName.hybh.focus();
		return false;
	}
	if(	javaTrim(FormName.hyxm)=="") {
		alert("������[��Ա����]��");
		FormName.hyxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("��ѡ��[�Ա�]��");
		FormName.xb[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.csrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjnr, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.arsr, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[����ר����]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.rhrq)=="") {
		alert("������[�������]��");
		FormName.rhrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.rhrq, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.yxrq)=="") {
		alert("������[��Ч����]��");
		FormName.yxrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxrq, "��Ч����"))) {
		return false;
	}
	if(	javaTrim(FormName.hykh)=="") {
		alert("������[ˮ�ʷ�������]��");
		FormName.hykh.focus();
		return false;
	}
	if(	javaTrim(FormName.gmcs)=="") {
		alert("������[�������]��");
		FormName.gmcs.focus();
		return false;
	}
	if(!(isNumber(FormName.gmcs, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.xfzje)=="") {
		alert("������[�����ܽ��]��");
		FormName.xfzje.focus();
		return false;
	}
	if(!(isFloat(FormName.xfzje, "�����ܽ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jf)=="") {
		alert("������[����]��");
		FormName.jf.focus();
		return false;
	}
	if(!(isNumber(FormName.jf, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.wdhjf)=="") {
		alert("������[δ�һ�����]��");
		FormName.wdhjf.focus();
		return false;
	}
	if(!(isNumber(FormName.wdhjf, "δ�һ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.xxlrr)=="") {
		alert("������[��Ϣ¼����]��");
		FormName.xxlrr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
