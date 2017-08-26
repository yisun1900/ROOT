<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tsxlbm=null;
String tsxlmc=null;
String tslxbm=null;
String px=null;
String wheretsxlbm=cf.GB2Uni(request.getParameter("tsxlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tsxlbm,tsxlmc,tslxbm,px ";
	ls_sql+=" from  dm_tsxlbm";
	ls_sql+=" where  (tsxlbm='"+wheretsxlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tsxlbm=cf.fillNull(rs.getString("tsxlbm"));
		tsxlmc=cf.fillNull(rs.getString("tsxlmc"));
		tslxbm=cf.fillNull(rs.getString("tslxbm"));
		px=cf.fillNull(rs.getString("px"));
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

<form method="post" action="SaveEditDm_tsxlbm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">Ͷ�߱��޴���</div>
              </td>
              <td width="31%"> 
                <select name="tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="tsxlbm.value=tslxbm.value">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm order by tslxbm",tslxbm);
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="px" size="20" maxlength="8"  value="<%=px%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">Ͷ�߱���С�����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="tsxlbm" size="20" maxlength="4"  value="<%=tsxlbm%>" >
              </td>
              <td width="19%"> 
                <div align="right">Ͷ�߱���С������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="tsxlmc" size="20" maxlength="50"  value="<%=tsxlmc%>" >
              </td>
            </tr>
            <input type="hidden" name="wheretsxlbm"  value="<%=wheretsxlbm%>" >
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
	if(	javaTrim(FormName.tslxbm)=="") {
		alert("��ѡ��[Ͷ�߱��޴���]��");
		FormName.tslxbm.focus();
		return false;
	}
	if(!(isNumber(FormName.px, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.tsxlbm)=="") {
		alert("������[Ͷ�߱���С�����]��");
		FormName.tsxlbm.focus();
		return false;
	}
	if(FormName.tsxlbm.value.length!=4) {
		alert("[Ͷ�߱���С�����]Ӧ��Ϊ4λ��");
		FormName.tsxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsxlmc)=="") {
		alert("������[Ͷ�߱���С������]��");
		FormName.tsxlmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
