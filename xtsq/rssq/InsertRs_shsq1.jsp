<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%
	String ztlx=cf.GB2Uni(request.getParameter("ztlx"));
	String yhzbh=cf.GB2Uni(request.getParameter("yhzbh"));
%>
<form method="post" action="SaveInsertRs_shsq.jsp" name="insertform" target="_blank">
<div align="center">��Ƹ�����Ȩ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="14%" valign="top">�û���</td> 
      <td width="32%" valign="top"> 
        <select name="yhzbh" style="FONT-SIZE:12PX;WIDTH:230PX">
          <%
	cf.selectItem(out,"select yhzbh,yhzmc  from sq_yhz where yhzbh='"+yhzbh+"'",yhzbh);
	%> 
        </select>
      </td>    
      <td align="right" width="13%">���״̬</td> 
      <td width="41%"> 
        <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:230PX" size="12" multiple>
          <option value=""></option>
          <%
	cf.mutilSelectItem(out,"select ztbm,ztmc||'  ��'||DECODE(rs_ztbm.ztlx,'01','��Ƹ','02','��ѵ','03','�䶯','04','��������','06','������ְ','07','��������','08','�Ӱ�����','09','���ڿ�������','10','��ٵ�','11','��������','12','�����λ����','13','��ְ����','14','�˻���Ա����')||'��' from rs_ztbm where ztlx='"+ztlx+"' order by ztlx,ztbm","select ztbm from rs_shsq where yhzbh='"+yhzbh+"'");
	%> 
        </select>
      </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="ztlx" value="<%=ztlx%>">
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	!selectChecked(FormName.ztbm)) {
		alert("������[���״̬]��");
		FormName.ztbm.focus();
		return false;
	}

	if(	javaTrim(FormName.yhzbh)=="") {
		alert("��ѡ��[�û���]��");
		FormName.yhzbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
