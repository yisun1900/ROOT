<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String bjxh=null;
String gtxh=null;
String ddbh=null;
String jjbjmcbm=null;
String bjcd=null;
String bjkd=null;
String sl=null;
String dj=null;
String je=null;
String bz=null;
String wherebjxh=cf.GB2Uni(request.getParameter("bjxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bjxh,gtxh,ddbh,jjbjmcbm,bjcd,bjkd,sl,dj,je,bz ";
	ls_sql+=" from  jc_ddbjmx";
	ls_sql+=" where  (bjxh="+wherebjxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bjxh=cf.fillNull(rs.getString("bjxh"));
		gtxh=cf.fillNull(rs.getString("gtxh"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		jjbjmcbm=cf.fillNull(rs.getString("jjbjmcbm"));
		bjcd=cf.fillNull(rs.getString("bjcd"));
		bjkd=cf.fillNull(rs.getString("bjkd"));
		sl=cf.fillNull(rs.getString("sl"));
		dj=cf.fillNull(rs.getString("dj"));
		je=cf.fillNull(rs.getString("je"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸Ĺ������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_ddbjmx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" readonly>
              </td>
              <td width="17%"> 
                <div align="right">�������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="gtxh" size="20" maxlength="8"  value="<%=gtxh%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�������</div>
              </td>
              <td width="33%"> 
                <select name="jjbjmcbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jjbjmcbm,jjbjmc from jdm_jjbjmcbm order by jjbjmcbm",jjbjmcbm);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="dj" size="20" maxlength="8"  value="<%=dj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">������ȣ�mm��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="bjcd" size="20" maxlength="8"  value="<%=bjcd%>" >
              </td>
              <td width="17%"> 
                <div align="right">�����ȣ�mm��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="bjkd" size="20" maxlength="8"  value="<%=bjkd%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sl" size="20" maxlength="8"  value="<%=sl%>" >
              </td>
              <td width="17%"> 
                <div align="right">���</div>
              </td>
              <td width="33%"> 
                <input type="text" name="je" size="20" maxlength="8"  value="<%=je%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherebjxh"  value="<%=wherebjxh%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="hidden" name="bjxh" size="20" maxlength="8"  value="<%=bjxh%>" >
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
	if(	javaTrim(FormName.bjxh)=="") {
		alert("������[������]��");
		FormName.bjxh.focus();
		return false;
	}
	if(!(isNumber(FormName.bjxh, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.gtxh)=="") {
		alert("������[�������]��");
		FormName.gtxh.focus();
		return false;
	}
	if(!(isNumber(FormName.gtxh, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.jjbjmcbm)=="") {
		alert("��ѡ��[�������]��");
		FormName.jjbjmcbm.focus();
		return false;
	}
	if(!(isNumber(FormName.bjcd, "������ȣ�mm��"))) {
		return false;
	}
	if(!(isNumber(FormName.bjkd, "�����ȣ�mm��"))) {
		return false;
	}
	if(!(isNumber(FormName.sl, "����"))) {
		return false;
	}
	if(!(isNumber(FormName.dj, "����"))) {
		return false;
	}
	if(!(isNumber(FormName.je, "���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
