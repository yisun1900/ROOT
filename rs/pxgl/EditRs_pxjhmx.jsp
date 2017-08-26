<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String pxlx=null;
String skxs=null;
String kclx=null;
String pxkc=null;
String kcnr=null;
String pxcd=null;
String pxrs=null;
String pxfy=null;
String pxjs=null;
String bz=null;
String gcrs=null;
String zcrs=null;
String jcrs=null;
String pxkssj=null;
String pxjssj=null;

String wherepxmxbh=cf.GB2Uni(request.getParameter("pxmxbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select skxs,kclx,pxkc,kcnr,pxcd,pxrs,pxfy,pxjs,bz,pxlx,gcrs,zcrs,jcrs,pxkssj,pxjssj ";
	ls_sql+=" from  rs_pxjhmx";
	ls_sql+=" where  (pxmxbh='"+wherepxmxbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		skxs=cf.fillNull(rs.getString("skxs"));
		kclx=cf.fillNull(rs.getString("kclx"));
		pxkc=cf.fillNull(rs.getString("pxkc"));
		kcnr=cf.fillNull(rs.getString("kcnr"));
		pxcd=cf.fillNull(rs.getString("pxcd"));
		pxrs=cf.fillNull(rs.getString("pxrs"));
		pxfy=cf.fillNull(rs.getString("pxfy"));
		pxjs=cf.fillNull(rs.getString("pxjs"));
		bz=cf.fillNull(rs.getString("bz"));
		pxlx=cf.fillNull(rs.getString("pxlx"));
		gcrs=cf.fillNull(rs.getString("gcrs"));
		zcrs=cf.fillNull(rs.getString("zcrs"));
		jcrs=cf.fillNull(rs.getString("jcrs"));
		pxkssj=cf.fillNull(rs.getDate("pxkssj"));
		pxjssj=cf.fillNull(rs.getDate("pxjssj"));

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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_pxjhmx.jsp" name="editform">
<div align="center">�޸���ѵ�ƻ���ϸ��<%=wherepxmxbh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ѵ����</td> 
  <td width="35%"> 
    <input type="text" name="pxrs" size="20" maxlength="8"  value="<%=pxrs%>" >
  </td>
  <td align="right" width="15%">��ѵ����</td> 
  <td width="35%"> 
    <input type="text" name="pxfy" size="20" maxlength="9"  value="<%=pxfy%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�߲�����</td> 
  <td width="35%"> 
    <input type="text" name="gcrs" size="20" maxlength="8"  value="<%=gcrs%>" >
  </td>
  <td align="right" width="15%">�в�����</td> 
  <td width="35%"> 
    <input type="text" name="zcrs" size="20" maxlength="8"  value="<%=zcrs%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <input type="text" name="jcrs" size="20" maxlength="8"  value="<%=jcrs%>" >
  </td>
  <td align="right" width="15%">��ѵ����</td> 
  <td width="35%"> <%
	cf.radioToken(out, "pxlx","0+��ѵ&1+��ѵ",pxlx);
	%> 
  </td>

</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ڿ���ʽ</td> 
  <td width="35%"> 
    <select name="skxs" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select skxs,skxsmc from rs_pxskxsbm order by skxs",skxs);
%>
    </select>
  </td>
  <td align="right" width="15%">�γ�����</td> 
  <td width="35%"> 
    <select name="kclx" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select kclx,lxmc  from rs_pxkclxbm order by kclx",kclx);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ѵ��ʦ</td> 
  <td width="35%"> 
    <input type="text" name="pxjs" size="20" maxlength="40"  value="<%=pxjs%>" >
  </td>
    <td align="right" width="15%">��ѵ����</td> 
  <td width="35%"> 
    <input type="text" name="pxcd" size="20" maxlength="50"  value="<%=pxcd%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ѵ��ʼʱ��</td> 
  <td width="35%"> 
    <input type="text" name="pxkssj" size="20" maxlength="40"  value="<%=pxkssj%>" ondblclick="JSCalendar(this)">
  </td>
    <td align="right" width="15%">��ѵ����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="pxjssj" size="20" maxlength="50"  value="<%=pxjssj%>" ondblclick="JSCalendar(this)">
  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ѵ�γ�</td> 
  <td width="35%" colspan="3"> 
    <textarea name="pxkc" cols="71" rows=""><%=pxkc%></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�γ�����</td> 
  <td width="35%" colspan="3"> 
    <textarea name="kcnr" cols="71" rows=""><%=kcnr%></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="71" rows=""><%=bz%></textarea>
  </td>
</tr>
<input type="hidden" name="wherepxmxbh"  value="<%=wherepxmxbh%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.skxs)=="") {
		alert("��ѡ��[�ڿ���ʽ]��");
		FormName.skxs.focus();
		return false;
	}
	if(	javaTrim(FormName.kclx)=="") {
		alert("��ѡ��[�γ�����]��");
		FormName.kclx.focus();
		return false;
	}
	if(	javaTrim(FormName.pxrs)=="") {
		alert("������[��ѵ����]��");
		FormName.pxrs.focus();
		return false;
	}
	if(!(isNumber(FormName.pxrs, "��ѵ����"))) {
		return false;
	}
	if(	javaTrim(FormName.pxfy)=="") {
		alert("������[��ѵ����]��");
		FormName.pxfy.focus();
		return false;
	}
	if(!(isFloat(FormName.pxfy, "��ѵ����"))) {
		return false;
	}
		if(	javaTrim(FormName.pxrs)=="") {
		alert("������[��ѵ����]��");
		FormName.pxrs.focus();
		return false;
	}
	if(!(isNumber(FormName.gcrs, "�߲�����"))) {
		return false;
	}
	if(	javaTrim(FormName.gcrs)=="") {
		alert("������[�߲�����]��");
		FormName.gcrs.focus();
		return false;
	}
	if(!(isNumber(FormName.zcrs, "�в�����"))) {
		return false;
	}
	if(	javaTrim(FormName.zcrs)=="") {
		alert("������[�в�����]��");
		FormName.zcrs.focus();
		return false;
	}
	if(!(isNumber(FormName.jcrs, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.jcrs)=="") {
		alert("������[��������]��");
		FormName.jcrs.focus();
		return false;
	}
	if(!(isDatetime(FormName.pxkssj, "��ѵ��ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.pxjssj)=="") {
		alert("������[��ѵ����ʱ��]��");
		FormName.pxjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pxjssj, "��ѵ����ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
