<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xmdlbm=null;
String xmdlmc=null;
String sftsxm=null;
String wherexmdlbm=cf.GB2Uni(request.getParameter("xmdlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xmdlbm,xmdlmc,sftsxm ";
	ls_sql+=" from  bdm_xmdlbm";
	ls_sql+=" where  (xmdlbm='"+wherexmdlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmdlmc=cf.fillNull(rs.getString("xmdlmc"));
		sftsxm=cf.fillNull(rs.getString("sftsxm"));
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

<form method="post" action="SaveEditBdm_xmdlbm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ŀ�������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xmdlbm" size="20" maxlength="2"  value="<%=xmdlbm%>" >
              </td>
              <td width="15%"> 
                <div align="right">��Ŀ��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xmdlmc" size="20" maxlength="50"  value="<%=xmdlmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ŀ����</div>
              </td>
              <td colspan="3">
                <input type="radio" name="sftsxm"  value="1" <% if (sftsxm.equals("1")) out.print("checked");%>>
                �����ࣨ��ٷֱ��շ���Ŀ��أ�<BR>
				<input type="radio" name="sftsxm"  value="2" <% if (sftsxm.equals("2")) out.print("checked");%>>
				�����ࣨ�������շ���Ŀ�޹أ�<BR>
				<input type="radio" name="sftsxm"  value="3" <% if (sftsxm.equals("3")) out.print("checked");%>>
				������</td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
				<input type="hidden" name="wherexmdlbm"  value="<%=wherexmdlbm%>" >
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
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("������[��Ŀ�������]��");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmdlmc)=="") {
		alert("������[��Ŀ��������]��");
		FormName.xmdlmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.sftsxm)) {
		alert("��ѡ��[��Ŀ����]��");
		FormName.sftsxm[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
