<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dggdbm=null;
String dggdmc=null;
String dy=null;
String xydy=null;
String wheredggdbm=cf.GB2Uni(request.getParameter("dggdbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dggdbm,dggdmc,dy,xydy ";
	ls_sql+=" from  jdm_dggdbm";
	ls_sql+=" where  (dggdbm='"+wheredggdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dggdbm=cf.fillNull(rs.getString("dggdbm"));
		dggdmc=cf.fillNull(rs.getString("dggdmc"));
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

<form method="post" action="SaveEditJdm_dggdbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">����߶��������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dggdbm" size="20" maxlength="2"  value="<%=dggdbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">����߶���������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dggdmc" size="20" maxlength="50"  value="<%=dggdmc%>" >
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
<input type="hidden" name="wheredggdbm"  value="<%=wheredggdbm%>" >
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
	if(	javaTrim(FormName.dggdbm)=="") {
		alert("������[����߶��������]��");
		FormName.dggdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dggdmc)=="") {
		alert("������[����߶���������]��");
		FormName.dggdmc.focus();
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
