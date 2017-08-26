<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jlh=null;
String zjlxbm=null;
String bt=null;
String nr=null;
String lrrq=null;
String yhdlm=null;
String wherejlh=cf.GB2Uni(request.getParameter("jlh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select jlh,zjlxbm,bt,nr,lrrq,yhdlm ";
	ls_sql+=" from  crm_zjsjk";
	ls_sql+=" where  (jlh="+wherejlh+")  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		jlh=cf.fillNull(rs.getString("jlh"));
		zjlxbm=cf.fillNull(rs.getString("zjlxbm"));
		bt=cf.fillNull(rs.getString("bt"));
		nr=cf.fillNull(rs.getString("nr"));
		lrrq=cf.fillNull(rs.getDate("lrrq"));
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
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

<form method="post" action="SaveEditCrm_zjsjk.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">��¼��</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="jlh" size="20" maxlength="8"  value="<%=jlh%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right">ר�ҿ�����</div>
              </td>
              <td width="35%"> 
                <select name="zjlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zjlxbm,zjlxmc from dm_zjlxbm order by zjlxbm",zjlxbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">¼������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrrq" size="20" maxlength="10"  value="<%=lrrq%>" >
              </td>
              <td width="15%"> 
                <div align="right">¼����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yhdlm" size="20" maxlength="16"  value="<%=yhdlm%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">����</td>
              <td colspan="3"> 
                <input type="text" name="bt" size="57" maxlength="40"  value="<%=bt%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">����</td>
              <td colspan="3"> 
                <textarea name="nr" cols="55" rows="3"><%=nr%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherejlh"  value="<%=wherejlh%>" >
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
	if(	javaTrim(FormName.jlh)=="") {
		alert("������[��¼��]��");
		FormName.jlh.focus();
		return false;
	}
	if(!(isNumber(FormName.jlh, "��¼��"))) {
		return false;
	}
	if(	javaTrim(FormName.zjlxbm)=="") {
		alert("��ѡ��[ר�ҿ�����]��");
		FormName.zjlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bt)=="") {
		alert("������[����]��");
		FormName.bt.focus();
		return false;
	}
	if(	javaTrim(FormName.nr)=="") {
		alert("������[����]��");
		FormName.nr.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrrq, "¼������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
