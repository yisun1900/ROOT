<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String mbfbbm=null;
String jg=null;
String wherembfbbm=cf.GB2Uni(request.getParameter("mbfbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select mbfbbm,jg ";
	ls_sql+=" from  jc_mbfbjg";
	ls_sql+=" where  (mbfbbm='"+wherembfbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mbfbbm=cf.fillNull(rs.getString("mbfbbm"));
		jg=cf.fillNull(rs.getString("jg"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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

<form method="post" action="SaveEditJc_mbfbjg.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�Ű���</div>
  </td>
  <td width="35%"> 
    <select name="mbfbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select mbfbbm,mbfbmc from jdm_mbfbbm order by mbfbbm",mbfbbm);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">�۸�</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jg" size="20" maxlength="9"  value="<%=jg%>" >
  </td>
</tr>
<input type="hidden" name="wherembfbbm"  value="<%=wherembfbbm%>" >
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
	if(	javaTrim(FormName.mbfbbm)=="") {
		alert("��ѡ��[�Ű���]��");
		FormName.mbfbbm.focus();
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
