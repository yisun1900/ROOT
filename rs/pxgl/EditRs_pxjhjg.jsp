<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String jhjg=null;
String bz=null;
String wherepxjhbh=cf.GB2Uni(request.getParameter("pxjhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bz,jhjg ";
	ls_sql+=" from  rs_pxjhjg";
	ls_sql+=" where  (pxjhbh='"+wherepxjhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bz=cf.fillNull(rs.getString("bz"));
		jhjg=rs.getString("jhjg");
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<form method="post" action="" name="editform">
<div align="center">���޸���ѵ���</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ƻ����</td> 
  <td width="35%"> 
    <select name="jhjg" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option value=""></option>
<%
	cf.selectToken(out,"1+���&2+�������&0+δ���",jhjg);
%>
    </select>
  </td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%"> 
	&nbsp;  
</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="71" rows=""><%=bz%></textarea>
  </td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="hidden" name="wherepxjhbh"  value="<%=wherepxjhbh%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
   	  <input type="button"  value="¼����ϸ" onClick="f_lrmx(editform)">
  	  <input type="button"  value="�޸���ϸ" onClick="f_mx(editform)">
	  <input type="button"  value="���" onClick="f_wc(editform)">
	</div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jhjg)=="") {
		alert("��ѡ��[��ѵ���]��");
		FormName.jhjg.focus();
		return false;
	}

	FormName.action="SaveEditRs_pxjhjg.jsp";
	FormName.submit();
	return true;
}
function f_wc(FormName)//����FormName:Form������
{
	FormName.action="EditInsertRs_pxjhjgwc.jsp";
	FormName.submit();
	return true;
}
function f_mx(FormName)//����FormName:Form������
{
	FormName.action="Rs_pxzjmxEdList.jsp";
	FormName.submit();
	return true;
}
function f_lrmx(FormName)//����FormName:Form������
{
	FormName.action="Rs_EditpxzjmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
