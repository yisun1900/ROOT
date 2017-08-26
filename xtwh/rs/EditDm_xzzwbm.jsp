<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String xzzwbm=null;
String xzzwmc=null;
String gzbm=null;
String gwzz=null;
String zwflbm=null;
String wherexzzwbm=cf.GB2Uni(request.getParameter("xzzwbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xzzwbm,xzzwmc,gzbm,gwzz,zwflbm ";
	ls_sql+=" from  dm_xzzwbm";
	ls_sql+=" where  (xzzwbm='"+wherexzzwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		xzzwmc=cf.fillNull(rs.getString("xzzwmc"));
		gzbm=cf.fillNull(rs.getString("gzbm"));
		gwzz=cf.fillNull(rs.getString("gwzz"));
		zwflbm=cf.fillNull(rs.getString("zwflbm"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditDm_xzzwbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">ְ�����</td>
      <td width="35%"> 
        <input type="text" name="xzzwbm" size="20" maxlength="2"  value="<%=xzzwbm%>" >
      </td>
      <td align="right" width="15%">ְ������</td>
      <td width="35%"> 
        <input type="text" name="xzzwmc" size="20" maxlength="50"  value="<%=xzzwmc%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">����</td>
      <td width="35%"> 
        <select name="gzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zwbm,zwmc from dm_zwbm order by zwbm",gzbm);
%> 
        </select>
      </td>
      <td align="right" width="15%">ְ�����</td>
      <td width="35%">
        <select name="zwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
cf.selectItem(out,"select zwflbm,zwflmc from dm_zwflbm order by zwflbm",zwflbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��λְ��</td>
      <td colspan="3"> 
        <textarea name="gwzz" cols="72" rows="12"><%=gwzz%></textarea>
      </td>
    </tr>
    <input type="hidden" name="wherexzzwbm"  value="<%=wherexzzwbm%>" >
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
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xzzwbm)=="") {
		alert("������[ְ�����]��");
		FormName.xzzwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xzzwmc)=="") {
		alert("������[ְ������]��");
		FormName.xzzwmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gzbm)=="") {
		alert("��ѡ��[����]��");
		FormName.gzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zwflbm)=="") {
		alert("��ѡ��[ְ�����]��");
		FormName.zwflbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
