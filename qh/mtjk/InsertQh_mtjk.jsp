<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=(String)session.getAttribute("dqbm");
String dwbh=(String)session.getAttribute("dwbh");

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

<form method="post" action="SaveInsertQh_mtjk.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="font-size: 12" bgcolor="#999999" cellpadding="2" cellspacing="2" height="72">
<tr bgcolor="#FFFFFF">
  
  <td width="15%" height="25"> 
    <div align="right">����ع�˾����</div>
  </td>
  <td width="35%" height="25"> 
    <select name="bjkgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjkgsbh,bjkgsmc from qh_bjkgsdm where dqbm='"+dqbm+"'  order by bjkgsbh","");
%>
    </select>
  </td>
   <td width="15%" height="25"> 
    <div align="right">���λ����</div>
  </td>
   <td width="35%" height="25"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" height="25"> 
    <div align="right">�����ʽ</div>
  </td>
  <td width="35%" height="25"> 
    <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","");
%>
    </select>
  </td>
  <td width="15%" height="25"> 
    <div align="right">����ʱ��</div>
  </td>
  <td width="35%" height="25"> 
    <input type="text" name="bcsj" value=<%=cf.today()%> size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" height="25"> 
    <div align="right">�ಥ��</div>
  </td>
  <td width="35%" height="25"> 
    <input type="text" name="gggs" value="" size="20" maxlength="30" >
  </td>
  <td width="15%" height="25"> 
    <div align="right">Ԥ�Ƽ۸�</div>
  </td>
  <td width="35%" height="25"> 
    <input type="text" name="yjjg" value="" size="20" maxlength="9" >Ԫ
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" height="25"> 
    <div align="right">��ע</div>
  </td>
  <td width="85%" height="25" bgcolor="#FFFFFF" colspan="3"> 
    <textarea name="bz" cols="72" rows="10"></textarea>
  </td>

 
</tr>
            <tr align="center"> 
              <td colspan="4" height="27"> 
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
	
	if(	javaTrim(FormName.bjkgsbh)=="") {
		alert("������[����ع�˾����]��");
		FormName.bjkgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xxlybm)=="") {
		alert("��ѡ��[�����ʽ]��");
		FormName.xxlybm.focus();
		return false;
	}
	if(!(isDatetime(FormName.bcsj, "����ʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.yjjg, "Ԥ�Ƽ۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
