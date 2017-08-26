<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kssj=null;
String jzsj=null;
String jyjg=null;
String jysm=null;
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
String wherekssj=cf.GB2Uni(request.getParameter("kssj"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select kssj,jzsj,jyjg,jysm ";
	ls_sql+=" from  rs_jyjl";
	ls_sql+=" where  (ygbh="+whereygbh+") and  (kssj=TO_DATE('"+wherekssj+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kssj=cf.fillNull(rs.getDate("kssj"));
		jzsj=cf.fillNull(rs.getDate("jzsj"));
		jyjg=cf.fillNull(rs.getString("jyjg"));
		jysm=cf.fillNull(rs.getString("jysm"));
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
<form method="post" action="SaveEditRs_jyjl.jsp" name="editform">
<div align="center">�޸Ľ���������Ա����ţ�<%=whereygbh%>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��ʼʱ��</td>
      <td width="35%"> 
        <input type="text" name="kssj" size="20" maxlength="10"  value="<%=kssj%>" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="15%">����ʱ��</td>
      <td width="35%"> 
        <input type="text" name="jzsj" size="20" maxlength="10"  value="<%=jzsj%>" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��������</td>
      <td width="35%" colspan="3"> 
        <input type="text" name="jyjg" size="73" maxlength="50"  value="<%=jyjg%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">����˵��</td>
      <td width="35%" colspan="3"> 
        <textarea name="jysm" cols="71" rows="3"><%=jysm%></textarea>
      </td>
    </tr>
    <input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
    <input type="hidden" name="wherekssj"  value="<%=wherekssj%>" >
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
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.kssj)=="") {
		alert("������[��ʼʱ��]��");
		FormName.kssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kssj, "��ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jzsj)=="") {
		alert("������[����ʱ��]��");
		FormName.jzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jyjg)=="") {
		alert("������[��������]��");
		FormName.jyjg.focus();
		return false;
	}
	if(	javaTrim(FormName.jysm)=="") {
		alert("������[����˵��]��");
		FormName.jysm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
