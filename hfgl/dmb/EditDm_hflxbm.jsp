<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hflxbm=null;
String hflxmc=null;
String hfdl=null;
String sjjg=null;
String sfzdsz=null;
String wherehflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select hflxbm,hflxmc,hfdl,sjjg,sfzdsz ";
	ls_sql+=" from  dm_hflxbm";
	ls_sql+=" where  (hflxbm='"+wherehflxbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		hflxbm=cf.fillNull(rs.getString("hflxbm"));
		hflxmc=cf.fillNull(rs.getString("hflxmc"));
		hfdl=cf.fillNull(rs.getString("hfdl"));
		sjjg=cf.fillNull(rs.getString("sjjg"));
		sfzdsz=cf.fillNull(rs.getString("sfzdsz"));
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

<form method="post" action="SaveEditDm_hflxbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="17%" align="right"> 
                �ط����ͱ���  </td>
              <td width="33%"> 
                <input type="text" name="hflxbm" size="20" maxlength="2"  value="<%=hflxbm%>" >  </td>
              <td width="18%" align="right"> 
                �ط���������  </td>
              <td width="32%"> 
                <input type="text" name="hflxmc" size="20" maxlength="50"  value="<%=hflxmc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ��Զ�����</td>
  <td><%
	cf.radioToken(out, "sfzdsz","1+�Զ�����&2+�ֶ�����",sfzdsz);
%></td>
  <td align="right">�ط�ʱ���� </td>
  <td><input type="text" name="sjjg" size="20" maxlength="8"  value="<%=sjjg%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="17%" align="right"> 
                �طô���  </td>
              <td width="33%"> 
                <select name="hfdl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+��ѯ�ͻ��ط�&2+��ʩ���̻ط�&3+���޿ͻ��ط�&4+Ͷ�߱��޻ط�",hfdl);
%>
    </select>  </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
</tr>
	    <tr> 
              <td height="2" colspan="4" align="center"> 
<input type="hidden" name="wherehflxbm"  value="<%=wherehflxbm%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
              <input type="reset"  value="����"></td>
          </tr>
        </table>
</form>

	  
	  
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
	if(	javaTrim(FormName.hflxbm)=="") {
		alert("������[�ط����ͱ���]��");
		FormName.hflxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hflxmc)=="") {
		alert("������[�ط���������]��");
		FormName.hflxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hfdl)=="") {
		alert("��ѡ��[�طô���]��");
		FormName.hfdl.focus();
		return false;
	}
	if(!(isNumber(FormName.sjjg, "�ط�ʱ����"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfzdsz)) {
		alert("��ѡ��[�Ƿ��Զ�����]��");
		FormName.sfzdsz[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
