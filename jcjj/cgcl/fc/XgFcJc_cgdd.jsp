<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String jhfcsj=null;
String sfcsj=null;
String fcr=null;
String fcbz=null;
String sdlsfxt=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select jhfcsj,sfcsj,fcr,fcbz,sdlsfxt";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		jhfcsj=cf.fillNull(rs.getDate("jhfcsj"));
		sfcsj=cf.fillNull(rs.getDate("sfcsj"));
		fcr=cf.fillNull(rs.getString("fcr"));
		fcbz=cf.fillNull(rs.getString("fcbz"));
		sdlsfxt=cf.fillNull(rs.getString("sdlsfxt"));
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
<title>���񸴲�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">���񸴲�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">�ƻ�����ʱ��</td>
              <td width="27%"> 
                <input type="text" name="jhfcsj" size="20" maxlength="20"  value="<%=jhfcsj%>" readonly>              </td>
              <td width="25%" align="right">ˮ��·��ԭͼֽ�Ƿ���ͬ</td>
              <td width="27%"> <%
	cf.radioToken(out, "sdlsfxt","Y+��ͬ&N+����ͬ",sdlsfxt);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">ʵ����ʱ��</td>
              <td width="27%"><input type="text" name="sfcsj" size="20" maxlength="20"  value="<%=sfcsj%>" ondblclick="JSCalendar(this)"></td>
              <td width="25%" align="right">����¼����</td>
              <td width="27%"><input type="text" name="fcr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">���ⱸע</td>
              <td colspan="3"> 
                <textarea name="fcbz" cols="71" rows="3"><%=fcbz%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="51"> 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset" name="Reset" value="����">
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                <p> 
                  <input type="button"  value="¼�������ϸ" onClick="f_lrmm(insertform)" name="lrmm" >
                  <input type="button"  value="�鿴������ϸ" onClick="f_ckmm(insertform)" name="ckmm" >
                </p>
                <p> 
                  <input type="button"  value="¼�������ϸ" onClick="f_lrwj(insertform)" name="lrwj" >
                  <input type="button"  value="�鿴�����ϸ" onClick="f_ckwj(insertform)" name="ckwj" >
                </p>
                <p> 
                  <input type="button"  value="¼�������ϸ" onClick="f_lrbl(insertform)" name="lrbl" >
                  <input type="button"  value="�鿴������ϸ" onClick="f_ckbl(insertform)" name="ckbl" >
                </p>
                </div>              </td>
            </tr>
          </table>

	  
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
	if(	!radioChecked(FormName.sdlsfxt)) {
		alert("��ѡ��[ˮ��·��ԭͼֽ�Ƿ���ͬ]��");
		FormName.sdlsfxt[0].focus();
		return false;
	}
	if(	javaTrim(FormName.fcr)=="") {
		alert("������[����¼����]��");
		FormName.fcr.focus();
		return false;
	}
	if(	javaTrim(FormName.sfcsj)=="") {
		alert("������[ʵ����ʱ��]��");
		FormName.sfcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sfcsj, "ʵ����ʱ��"))) {
		return false;
	}
/*
	if(	javaTrim(FormName.fcbz)=="") {
		alert("������[���ⱸע]��");
		FormName.fcbz.focus();
		return false;
	}
*/
	FormName.action="SaveXgFcJc_cgdd.jsp";
	FormName.submit();
	return true;
}
function f_lrmm(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgfcdmxMain.jsp";
	FormName.submit();
	return true;
}

function f_ckmm(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgfcdmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrwj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertJc_cgwjfcdmx.jsp";
	FormName.submit();
	return true;
}

function f_ckwj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgwjfcdmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrbl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertJc_cgdqfcdmx.jsp";
	FormName.submit();
	return true;
}

function f_ckbl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgdqfcdmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
