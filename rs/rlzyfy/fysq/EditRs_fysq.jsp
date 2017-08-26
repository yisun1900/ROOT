<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fysqbh=null;
String fgs=null;
String sqsj=null;
String xqlx=null;
String ytxs=null;
String fy=null;
String bz=null;
String wherefysqbh=cf.GB2Uni(request.getParameter("fysqbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fysqbh,fgs,sqsj,xqlx,ytxs,fy,bz ";
	ls_sql+=" from  rs_fysq";
	ls_sql+=" where  (fysqbh='"+wherefysqbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fysqbh=cf.fillNull(rs.getString("fysqbh"));
		fgs=cf.fillNull(rs.getString("fgs"));
		sqsj=cf.fillNull(rs.getDate("sqsj"));
		xqlx=cf.fillNull(rs.getString("xqlx"));
		ytxs=cf.fillNull(rs.getString("ytxs"));
		fy=cf.fillNull(rs.getString("fy"));
		bz=cf.fillNull(rs.getString("bz"));
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
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_fysq.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="1" style="FONT-SIZE:12" bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">����������</span></td> 
  <td width="35%"> 
    <input type="text" name="fysqbh" size="20" maxlength="10"  value="<%=fysqbh%>" readonly>
  </td>
  <td align="right" width="15%">����ֹ�˾</td> 
  <td width="35%"> 
    <input type="text" name="fgs" size="20" maxlength="5"  value="<%=fgs%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="sqsj" size="20" maxlength="10"  value="<%=sqsj%>" onDblClick="JSCalendar(this)">
  </td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <select name="xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"01+��Ƹ��&02+��ѵ��&03+������&04+������&05+��ᱣ�շ�&06+������&07+��������",xqlx);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��;��ʽ</td> 
  <td width="35%"> 
    <input type="text" name="ytxs" size="20" maxlength="100"  value="<%=ytxs%>" >
  </td>
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <input type="text" name="fy" size="20" maxlength="9"  value="<%=fy%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="69" rows="3"><%=bz%></textarea>
  </td>
</tr>
<input type="hidden" name="wherefysqbh"  value="<%=wherefysqbh%>" >
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
	if(	javaTrim(FormName.fysqbh)=="") {
		alert("������[����������]��");
		FormName.fysqbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgs)=="") {
		alert("������[����ֹ�˾]��");
		FormName.fgs.focus();
		return false;
	}
	if(	javaTrim(FormName.sqsj)=="") {
		alert("������[����ʱ��]��");
		FormName.sqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.xqlx)=="") {
		alert("��ѡ��[��������]��");
		FormName.xqlx.focus();
		return false;
	}
	if(	javaTrim(FormName.ytxs)=="") {
		alert("������[��;��ʽ]��");
		FormName.ytxs.focus();
		return false;
	}
	if(	javaTrim(FormName.fy)=="") {
		alert("������[����]��");
		FormName.fy.focus();
		return false;
	}
	if(!(isFloat(FormName.fy, "����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
