<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String dwlx=(String)session.getAttribute("dwlx");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
//where dqbm='"+dqbm+"'
//and (dwlx='F1'  or dwlx='F2')
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
      <div align="center"> ��¼������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertXz_bgypbm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�칫��Ʒ���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="bgypbh" value="" size="20" maxlength="5" >
              </td>
              <td width="15%"> 
                <div align="right">�칫��Ʒ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="bgypmc" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gg" value="" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">Ʒ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="pp" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�۸�</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jg" value="" size="20" maxlength="9" >
              </td>
              <td width="15%"> 
                <div align="right">������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ghr" value="" size="20" maxlength="40" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�����ֹ�˾</div>
              </td>
              <td width="35%"> 
				 <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
				 <%
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
				%> 
				</select>
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3"></textarea>
                <div align="right"></div>
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
	if(	javaTrim(FormName.bgypbh)=="") {
		alert("������[�칫��Ʒ���]��");
		FormName.bgypbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bgypmc)=="") {
		alert("������[�칫��Ʒ����]��");
		FormName.bgypmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jg)=="") {
		alert("������[�۸�]��");
		FormName.jg.focus();
		return false;
	}
	if(!(isFloat(FormName.jg, "�۸�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
