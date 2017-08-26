<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String shxmxlbm=null;
String shxmxlmc=null;
String shxmdlbm=null;
String whereshxmxlbm=cf.GB2Uni(request.getParameter("shxmxlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select shxmxlbm,shxmxlmc,shxmdlbm ";
	ls_sql+=" from  dm_shxmxlbm";
	ls_sql+=" where  (shxmxlbm='"+whereshxmxlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		shxmxlbm=cf.fillNull(rs.getString("shxmxlbm"));
		shxmxlmc=cf.fillNull(rs.getString("shxmxlmc"));
		shxmdlbm=cf.fillNull(rs.getString("shxmdlbm"));
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

<form method="post" action="SaveEditDm_shxmxlbm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�����Ŀ����</div>
              </td>
              <td width="30%"> 
                <select name="shxmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select shxmdlbm,shxmdlmc from dm_shxmdlbm order by shxmdlbm",shxmdlbm);
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="30%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�����ĿС�����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="shxmxlbm" size="20" maxlength="2"  value="<%=shxmxlbm%>" >
              </td>
              <td width="20%"> 
                <div align="right">�����ĿС������</div>
              </td>
              <td width="30%"> 
                <input type="text" name="shxmxlmc" size="20" maxlength="50"  value="<%=shxmxlmc%>" >
              </td>
            </tr>
            <input type="hidden" name="whereshxmxlbm"  value="<%=whereshxmxlbm%>" >
            <tr> 
              <td width="20%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="30%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="20%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="30%" height="2"> 
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
	if(	javaTrim(FormName.shxmxlbm)=="") {
		alert("������[�����ĿС�����]��");
		FormName.shxmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.shxmxlmc)=="") {
		alert("������[�����ĿС������]��");
		FormName.shxmxlmc.focus();
		return false;
	}
	if(	javaTrim(FormName.shxmdlbm)=="") {
		alert("��ѡ��[�����Ŀ����]��");
		FormName.shxmdlbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
