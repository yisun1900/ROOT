<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cdbh=null;
String cdxh=null;
String cdxsmc=null;
String glurl=null;
String fcdbh=null;
String sfmjcd=null;
String cdsm=null;
String wherecdbh=cf.GB2Uni(request.getParameter("cdbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cdbh,cdxh,cdxsmc,glurl,fcdbh,sfmjcd,cdsm ";
	ls_sql+=" from  sq_cd";
	ls_sql+=" where  (cdbh='"+wherecdbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cdbh=cf.fillNull(rs.getString("cdbh"));
		cdxh=cf.fillNull(rs.getString("cdxh"));
		cdxsmc=cf.fillNull(rs.getString("cdxsmc"));
		glurl=cf.fillNull(rs.getString("glurl"));
		fcdbh=cf.fillNull(rs.getString("fcdbh"));
		sfmjcd=cf.fillNull(rs.getString("sfmjcd"));
		cdsm=cf.fillNull(rs.getString("cdsm"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditSq_cd.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�˵����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdbh" size="20" maxlength="8"  value="<%=cdbh%>" >
  </td>
  <td width="15%"> 
    <div align="right">�˵����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdxh" size="20" maxlength="2"  value="<%=cdxh%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�˵���ʾ����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdxsmc" size="20" maxlength="100"  value="<%=cdxsmc%>" >
  </td>
  <td width="15%"> 
    <div align="right">�˵�����URL</div>
  </td>
  <td width="35%"> 
    <input type="text" name="glurl" size="40" maxlength="100"  value="<%=glurl%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���˵����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="fcdbh" size="20" maxlength="8"  value="<%=fcdbh%>" >
  </td>
  <td width="15%"> 
    <div align="right">�Ƿ�ĩ���˵�</div>
  </td>
  <td width="35%"> 
<%
	cf.radioToken(out, "sfmjcd","Y+��&N+��",sfmjcd);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�˵�˵��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cdsm" size="20" maxlength="250"  value="<%=cdsm%>" >
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherecdbh"  value="<%=wherecdbh%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center">
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                </div>
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
	if(	javaTrim(FormName.cdbh)=="") {
		alert("������[�˵����]��");
		FormName.cdbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cdxh)=="") {
		alert("������[�˵����]��");
		FormName.cdxh.focus();
		return false;
	}
	if(!(isNumber(FormName.cdxh, "�˵����"))) {
		return false;
	}
	if(	javaTrim(FormName.cdxsmc)=="") {
		alert("������[�˵���ʾ����]��");
		FormName.cdxsmc.focus();
		return false;
	}
	if(	javaTrim(FormName.fcdbh)=="") {
		alert("������[���˵����]��");
		FormName.fcdbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfmjcd)) {
		alert("��ѡ��[�Ƿ�ĩ���˵�]��");
		FormName.sfmjcd[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
