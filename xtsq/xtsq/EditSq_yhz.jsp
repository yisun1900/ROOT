<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%//weblogic@ page session=true%>

<%

String yhzbh=null;
String yhzmc=null;
String yhzms=null;
String jb=null;
String whereyhzbh=null;
whereyhzbh=request.getParameter("yhzbh");
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select yhzbh,yhzmc,yhzms,jb ";
	ls_sql+=" from  sq_yhz";
	ls_sql+=" where  (yhzbh='"+whereyhzbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		yhzbh=cf.fillNull(rs.getString("yhzbh"));
		yhzmc=cf.fillNull(rs.getString("yhzmc"));
		yhzms=cf.fillNull(rs.getString("yhzms"));
		jb=cf.fillNull(rs.getString("jb"));
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
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
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
    <td width="94%"> 
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr> 
    <td width="94%" height="64"> 
      <div align="center"> 
        <form method="post" action="SaveEditSq_yhz.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�û�����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="yhzbh" size="10" maxlength="6"  value="<%=yhzbh%>" >
              </td>
              <td width="15%"> 
                <div align="right">�û�������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yhzmc" size="20" maxlength="100"  value="<%=yhzmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" align="right">����</td>
              <td colspan="3"><%
	cf.radioToken(out, "jb","1+��ͨ&9+����&2+��Ӧ��",jb);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�û�������</div>
              </td>
              <td colspan="3"> 
                <textarea name="yhzms" cols="55" rows="5"><%=yhzms%></textarea>
              </td>
            </tr>
            <input type="hidden" name="whereyhzbh"  value="<%=yhzbh%>" >
            <tr> 
              <td width="19%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="31%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="�޸�" onClick="submit_onclick(editform)">
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
function submit_onclick(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yhzbh)=="") {
		alert("������[�û�����]��");
		FormName.yhzbh.focus();
		return false;
	}
	if(	javaTrim(FormName.yhzmc)=="") {
		alert("������[�û�������]��");
		FormName.yhzmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.jb)) {
		alert("��ѡ��[����]��");
		FormName.jb[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
