<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dwflbm=null;
String dwflmc=null;
String dwtjflbm=null;
String dwdl=null;
String zzfw=null;
String wheredwflbm=cf.GB2Uni(request.getParameter("dwflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dwflbm,dwflmc,dwtjflbm,dwdl,zzfw ";
	ls_sql+=" from  dm_dwflbm";
	ls_sql+=" where  (dwflbm='"+wheredwflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwflbm=cf.fillNull(rs.getString("dwflbm"));
		dwflmc=cf.fillNull(rs.getString("dwflmc"));
		dwtjflbm=cf.fillNull(rs.getString("dwtjflbm"));
		dwdl=cf.fillNull(rs.getString("dwdl"));
		zzfw=cf.fillNull(rs.getString("zzfw"));
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
<form method="post" action="SaveEditDm_dwflbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��λ�������</td>
      <td width="35%"> 
        <input type="text" name="dwflbm" size="20" maxlength="2"  value="<%=dwflbm%>" >
      </td>
      <td align="right" width="15%">��λ��������</td>
      <td width="35%"> 
        <input type="text" name="dwflmc" size="20" maxlength="50"  value="<%=dwflmc%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��λ����</td>
      <td width="35%"> <%
	cf.radioToken(out, "dwdl","1+ҵ������&2+��ҵ������",dwdl);
%> </td>
      <td align="right" width="15%">ͳ�Ʒ���</td>
      <td width="35%">
        <select name="dwtjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwtjflbm,dwtjflmc from dm_dwtjflbm order by dwtjflbm",dwtjflbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">ְ��Χ</td>
      <td colspan="3"> 
        <textarea name="zzfw" cols="72" rows="12"><%=zzfw%></textarea>
      </td>
    </tr>
    <input type="hidden" name="wheredwflbm"  value="<%=wheredwflbm%>" >
    <tr> 
      <td colspan="4" > 
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwflbm)=="") {
		alert("������[��λ�������]��");
		FormName.dwflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dwflmc)=="") {
		alert("������[��λ��������]��");
		FormName.dwflmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.dwdl)) {
		alert("��ѡ��[��λ����]��");
		FormName.dwdl[0].focus();
		return false;
	}
	if(	javaTrim(FormName.dwtjflbm)=="") {
		alert("������[ͳ�Ʒ���]��");
		FormName.dwtjflbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
