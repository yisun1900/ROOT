<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zxjwbm=null;
String zxjwmc=null;
String qd=null;
String zd=null;
String wherezxjwbm=cf.GB2Uni(request.getParameter("zxjwbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zxjwbm,zxjwmc,qd,zd ";
	ls_sql+=" from  dm_zxjwbm";
	ls_sql+=" where  (zxjwbm='"+wherezxjwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zxjwbm=cf.fillNull(rs.getString("zxjwbm"));
		zxjwmc=cf.fillNull(rs.getString("zxjwmc"));
		qd=cf.fillNull(rs.getString("qd"));
		zd=cf.fillNull(rs.getString("zd"));
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

<form method="post" action="SaveEditDm_zxjwbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">װ�޼�λ����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="zxjwbm" size="20" maxlength="2"  value="<%=zxjwbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">װ�޼�λ����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="zxjwmc" size="20" maxlength="50"  value="<%=zxjwmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���</div>
  </td>
  <td width="35%"> 
    <input type="text" name="qd" size="20" maxlength="17"  value="<%=qd%>" >
  </td>
  <td width="15%"> 
    <div align="right">�յ�</div>
  </td>
  <td width="35%"> 
    <input type="text" name="zd" size="20" maxlength="17"  value="<%=zd%>" >
  </td>
</tr>
<input type="hidden" name="wherezxjwbm"  value="<%=wherezxjwbm%>" >
            <tr> 
              <td colspan="4" height="2"> 
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
	if(	javaTrim(FormName.zxjwbm)=="") {
		alert("������[װ�޼�λ����]��");
		FormName.zxjwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zxjwmc)=="") {
		alert("������[װ�޼�λ����]��");
		FormName.zxjwmc.focus();
		return false;
	}
	if(	javaTrim(FormName.qd)=="") {
		alert("������[���]��");
		FormName.qd.focus();
		return false;
	}
	if(!(isFloat(FormName.qd, "���"))) {
		return false;
	}
	if(	javaTrim(FormName.zd)=="") {
		alert("������[�յ�]��");
		FormName.zd.focus();
		return false;
	}
	if(!(isFloat(FormName.zd, "�յ�"))) {
		return false;
	}

	FormName.action="SaveEditDm_zxjwbm.jsp";
	FormName.submit();
	return true;
}
function f_gx(FormName)//����FormName:Form������
{
	if ( confirm("ȷʵҪ������?") )	
	{
		FormName.action="UpdateKhxxZxjwbm.jsp";
		FormName.submit();
		return true;
	}

}
//-->
</SCRIPT>
