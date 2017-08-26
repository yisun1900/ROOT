<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xxlx=null;
String yhdlm=null;
String qdbz=null;
String wherexxlx=cf.GB2Uni(request.getParameter("xxlx"));
String whereyhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select xxlx,yhdlm,qdbz ";
	ls_sql+=" from  sq_xxtxqd";
	ls_sql+=" where  (xxlx='"+wherexxlx+"') and  (yhdlm='"+whereyhdlm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		xxlx=cf.fillNull(rs.getString("xxlx"));
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		qdbz=cf.fillNull(rs.getString("qdbz"));
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

<form method="post" action="SaveEditSq_xxtxqd.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��Ϣ����</div>
  </td>
  <td width="35%"> 
    <select name="xxlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"01+����װ����&02+ľ�Ű�װ����",xxlx);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">�û���½��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="yhdlm" size="20" maxlength="16"  value="<%=yhdlm%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">ǿ����־</div>
  </td>
  <td width="35%"> 
    <select name="qdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+��ͨ&1+����",qdbz);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherexxlx"  value="<%=wherexxlx%>" >
<input type="hidden" name="whereyhdlm"  value="<%=whereyhdlm%>" >
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
	if(	javaTrim(FormName.xxlx)=="") {
		alert("��ѡ��[��Ϣ����]��");
		FormName.xxlx.focus();
		return false;
	}
	if(	javaTrim(FormName.yhdlm)=="") {
		alert("������[�û���½��]��");
		FormName.yhdlm.focus();
		return false;
	}
	if(	javaTrim(FormName.qdbz)=="") {
		alert("��ѡ��[ǿ����־]��");
		FormName.qdbz.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
