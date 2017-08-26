<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tggdbm=null;
String tggdmc=null;
String dy=null;
String xydy=null;
String wheretggdbm=cf.GB2Uni(request.getParameter("tggdbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tggdbm,tggdmc,dy,xydy ";
	ls_sql+=" from  jdm_tggdbm";
	ls_sql+=" where  (tggdbm='"+wheretggdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tggdbm=cf.fillNull(rs.getString("tggdbm"));
		tggdmc=cf.fillNull(rs.getString("tggdmc"));
		dy=cf.fillNull(rs.getString("dy"));
		xydy=cf.fillNull(rs.getString("xydy"));
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

<form method="post" action="SaveEditJdm_tggdbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�ع�߶��������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="tggdbm" size="20" maxlength="2"  value="<%=tggdbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">�ع�߶���������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="tggdmc" size="20" maxlength="50"  value="<%=tggdmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���ڣ�mm��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dy" size="20" maxlength="8"  value="<%=dy%>" >
  </td>
  <td width="15%"> 
    <div align="right">С�ڵ��ڣ�mm��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="xydy" size="20" maxlength="8"  value="<%=xydy%>" >
  </td>
</tr>
<input type="hidden" name="wheretggdbm"  value="<%=wheretggdbm%>" >
	    <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="����">
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
	if(	javaTrim(FormName.tggdbm)=="") {
		alert("������[�ع�߶��������]��");
		FormName.tggdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tggdmc)=="") {
		alert("������[�ع�߶���������]��");
		FormName.tggdmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dy)=="") {
		alert("������[���ڣ�mm��]��");
		FormName.dy.focus();
		return false;
	}
	if(!(isNumber(FormName.dy, "���ڣ�mm��"))) {
		return false;
	}
	if(	javaTrim(FormName.xydy)=="") {
		alert("������[С�ڵ��ڣ�mm��]��");
		FormName.xydy.focus();
		return false;
	}
	if(!(isNumber(FormName.xydy, "С�ڵ��ڣ�mm��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
