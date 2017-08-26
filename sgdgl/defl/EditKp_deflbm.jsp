<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fgsbh=null;
String deflbm=null;
String deflmc=null;
String dedy=null;
String dexy=null;
String depjz=null;
String wheredeflbm=cf.GB2Uni(request.getParameter("deflbm"));
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select fgsbh,deflbm,deflmc,dedy,dexy,depjz ";
	ls_sql+=" from  kp_deflbm";
	ls_sql+=" where deflbm='"+wheredeflbm+"' and fgsbh='"+wherefgsbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		deflbm=cf.fillNull(rs.getString("deflbm"));
		deflmc=cf.fillNull(rs.getString("deflmc"));
		dedy=cf.fillNull(rs.getString("dedy"));
		dexy=cf.fillNull(rs.getString("dexy"));
		depjz=cf.fillNull(rs.getString("depjz"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
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

<form method="post" action="SaveEditKp_deflbm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">��С������</div>
              </td>
              <td width="34%"> 
                <input type="text" name="deflbm" size="20" maxlength="1"  value="<%=deflbm%>" >
              </td>
              <td width="16%"> 
                <div align="right">�ֹ�˾</div>
              </td>
              <td width="34%"> 
                <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">��С������</td>
              <td width="34%"> 
                <input type="text" name="deflmc" size="20" maxlength="50"  value="<%=deflmc%>" >
              </td>
              <td width="16%" align="right">����ƽ��ֵ</td>
              <td width="34%"> 
                <input type="text" name="depjz" size="20" maxlength="8"  value="<%=depjz%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">�������(>=)</div>
              </td>
              <td width="34%"> 
                <input type="text" name="dedy" size="20" maxlength="8"  value="<%=dedy%>" >
              </td>
              <td width="16%"> 
                <div align="right">�����յ�(<)</div>
              </td>
              <td width="34%"> 
                <input type="text" name="dexy" size="20" maxlength="8"  value="<%=dexy%>" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2">
				<input type="hidden" name="wheredeflbm"  value="<%=wheredeflbm%>" >
				<input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
                <input type="button"  value="����" onClick="f_do(editform)">
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
	if(	javaTrim(FormName.deflbm)=="") {
		alert("������[��С������]��");
		FormName.deflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.deflmc)=="") {
		alert("������[��С������]��");
		FormName.deflmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dedy)=="") {
		alert("������[�������(>=)]��");
		FormName.dedy.focus();
		return false;
	}
	if(!(isNumber(FormName.dedy, "�������(>=)"))) {
		return false;
	}
	if(	javaTrim(FormName.dexy)=="") {
		alert("������[�����յ�(<)]��");
		FormName.dexy.focus();
		return false;
	}
	if(!(isNumber(FormName.dexy, "�����յ�(<)"))) {
		return false;
	}
	if(	javaTrim(FormName.depjz)=="") {
		alert("������[����ƽ��ֵ]��");
		FormName.depjz.focus();
		return false;
	}
	if(!(isNumber(FormName.depjz, "����ƽ��ֵ"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
