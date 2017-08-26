<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tslxbm=null;
String tslxmc=null;
String tsdl=null;
String px=null;
String wheretslxbm=cf.GB2Uni(request.getParameter("tslxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tslxbm,tslxmc,tsdl,px ";
	ls_sql+=" from  dm_tslxbm";
	ls_sql+=" where  (tslxbm='"+wheretslxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tslxbm=cf.fillNull(rs.getString("tslxbm"));
		tslxmc=cf.fillNull(rs.getString("tslxmc"));
		tsdl=cf.fillNull(rs.getString("tsdl"));
		px=cf.fillNull(rs.getString("px"));
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

<form method="post" action="SaveEditDm_tslxbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="19%"> 
                <div align="right">Ͷ�߱��޴������</div>
  </td>
              <td width="31%"> 
                <input type="text" name="tslxbm" size="20" maxlength="2"  value="<%=tslxbm%>" >
  </td>
              <td width="19%"> 
                <div align="right">Ͷ�߱��޴�������</div>
  </td>
              <td width="31%"> 
                <input type="text" name="tslxmc" size="20" maxlength="50"  value="<%=tslxmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="19%"> 
                <div align="right">���</div>
  </td>
              <td width="31%"> 
                <select name="tsdl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+����&2+Ͷ��",tsdl);
%>
    </select>
  </td>
              <td width="19%"> 
                <div align="right">����</div>
  </td>
              <td width="31%"> 
                <input type="text" name="px" size="20" maxlength="8"  value="<%=px%>" >
  </td>
</tr>
<input type="hidden" name="wheretslxbm"  value="<%=wheretslxbm%>" >
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
	if(	javaTrim(FormName.tslxbm)=="") {
		alert("������[Ͷ�߱��޴������]��");
		FormName.tslxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tslxmc)=="") {
		alert("������[Ͷ�߱��޴�������]��");
		FormName.tslxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.tsdl)=="") {
		alert("��ѡ��[���]��");
		FormName.tsdl.focus();
		return false;
	}
	if(!(isNumber(FormName.px, "����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
