<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String mmczbm=null;
String mmczmc=null;
String ysmc=null;
String wheremmczbm=cf.GB2Uni(request.getParameter("mmczbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select mmczbm,mmczmc,ysmc ";
	ls_sql+=" from  jdm_mmczbm";
	ls_sql+=" where  (mmczbm='"+wheremmczbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmczbm=cf.fillNull(rs.getString("mmczbm"));
		mmczmc=cf.fillNull(rs.getString("mmczmc"));
		ysmc=cf.fillNull(rs.getString("ysmc"));
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

<form method="post" action="SaveEditJdm_mmczbm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ľ�Ų��ʱ���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="mmczbm" size="20" maxlength="2"  value="<%=mmczbm%>" >
              </td>
              <td width="15%"> 
                <div align="right">��ɫ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ysmc" value="<%=ysmc%>" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">ľ�Ų�������</td>
              <td colspan="3"> 
                <input type="text" name="mmczmc" size="73" maxlength="50"  value="<%=mmczmc%>" >
              </td>
            </tr>
            <input type="hidden" name="wheremmczbm"  value="<%=wheremmczbm%>" >
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
	if(	javaTrim(FormName.mmczbm)=="") {
		alert("������[ľ�Ų��ʱ���]��");
		FormName.mmczbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mmczmc)=="") {
		alert("������[ľ�Ų�������]��");
		FormName.mmczmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ysmc)=="") {
		alert("������[��ɫ����]��");
		FormName.ysmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
