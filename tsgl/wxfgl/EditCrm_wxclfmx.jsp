<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tsjlh=null;
String clmc=null;
String sl=null;
String dj=null;
String clf=null;
String llr=null;
String llsj=null;
String lrr=null;
String lrsj=null;
String bz=null;
String lrxh=cf.GB2Uni(request.getParameter("lrxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tsjlh,clmc,sl,dj,clf,llr,llsj,lrr,lrsj,bz ";
	ls_sql+=" from  crm_wxclfmx";
	ls_sql+=" where  lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		clmc=cf.fillNull(rs.getString("clmc"));
		sl=cf.fillNull(rs.getString("sl"));
		dj=cf.fillNull(rs.getString("dj"));
		clf=cf.fillNull(rs.getString("clf"));
		llr=cf.fillNull(rs.getString("llr"));
		llsj=cf.fillNull(rs.getDate("llsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCrm_wxclfmx.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼�����</span></td>
    <td><input type="text" name="lrxh" value="<%=lrxh%>" size="20" maxlength="8" readonly>    </td>
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">���޼�¼��</span></td>
    <td><input type="text" name="tsjlh" value="<%=tsjlh%>" size="20" maxlength="10" readonly>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td colspan="3"> 
    <input type="text" name="clmc" size="73" maxlength="100"  value="<%=clmc%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����</td>
  <td><input type="text" name="sl" size="20" maxlength="17"  value="<%=sl%>" onChange="f_jsje(editform)"></td>
  <td align="right"><span class="STYLE1">*</span>����</td>
  <td><input type="text" name="dj" size="20" maxlength="17"  value="<%=dj%>" onChange="f_jsje(editform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">���Ϸ�</span></td> 
  <td width="32%"><input type="text" name="clf" size="20" maxlength="17"  value="<%=clf%>" readonly></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������</td> 
  <td width="32%"> 
    <input type="text" name="llr" size="20" maxlength="20"  value="<%=llr%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>����ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="llsj" size="20" maxlength="10"  value="<%=llsj%>" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td> 
  <td width="32%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td> 
  <td width="32%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>    </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>


<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsje(FormName)//����FormName:Form������
{
	var clf=FormName.sl.value*FormName.dj.value*1.0 ;
	clf=round(clf,2);
	FormName.clf.value=clf;
}
function f_do(FormName)//����FormName:Form������
{
	f_jsje(FormName);

	if(	javaTrim(FormName.clmc)=="") {
		alert("������[��������]��");
		FormName.clmc.focus();
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("������[����]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("������[����]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.clf)=="") {
		alert("������[���Ϸ�]��");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "���Ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.llr)=="") {
		alert("������[������]��");
		FormName.llr.focus();
		return false;
	}
	if(	javaTrim(FormName.llsj)=="") {
		alert("������[����ʱ��]��");
		FormName.llsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.llsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
