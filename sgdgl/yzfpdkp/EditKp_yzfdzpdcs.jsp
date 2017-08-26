<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ssfgs=null;
String pjde=null;
String grs=null;
String zbj=null;
String khmyd=null;
String zxzsgds=null;
String zdzsgds=null;
String wheressfgs=cf.GB2Uni(request.getParameter("ssfgs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ssfgs,pjde,grs,zbj,khmyd,zxzsgds,zdzsgds ";
	ls_sql+=" from  kp_yzfdzpdcs";
	ls_sql+=" where  (ssfgs='"+wheressfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		pjde=cf.fillNull(rs.getString("pjde"));
		grs=cf.fillNull(rs.getString("grs"));
		zbj=cf.fillNull(rs.getString("zbj"));
		khmyd=cf.fillNull(rs.getString("khmyd"));
		zxzsgds=cf.fillNull(rs.getString("zxzsgds"));
		zdzsgds=cf.fillNull(rs.getString("zdzsgds"));
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
<form method="post" action="SaveEditKp_yzfdzpdcs.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�ֹ�˾</td> 
  <td width="31%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh",ssfgs);
%>
    </select>
  </td>
  <td align="right" width="19%">��һ��ȵ�ƽ������</td> 
  <td width="31%"> 
    <input type="text" name="pjde" size="20" maxlength="17"  value="<%=pjde%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���鹤����Сֵ</td> 
  <td width="31%"> 
    <input type="text" name="grs" size="20" maxlength="8"  value="<%=grs%>" >
  </td>
  <td align="right" width="19%">�ʱ�����Сֵ</td> 
  <td width="31%"> 
    <input type="text" name="zbj" size="20" maxlength="17"  value="<%=zbj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�ͻ��������Сֵ</td> 
  <td width="31%"> 
    <input type="text" name="khmyd" size="10" maxlength="9"  value="<%=khmyd%>" >
    %
  </td>
  <td align="right" width="19%">������С��ʩ������</td> 
  <td width="31%"> 
    <input type="text" name="zxzsgds" size="20" maxlength="8"  value="<%=zxzsgds%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���������ʩ������</td> 
  <td width="31%"> 
    <input type="text" name="zdzsgds" size="20" maxlength="8"  value="<%=zdzsgds%>" >
  </td>
  <td align="right" width="19%">&nbsp;  </td>
  <td width="31%">&nbsp;  </td>
</tr>
<input type="hidden" name="wheressfgs"  value="<%=wheressfgs%>" >
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.pjde)=="") {
		alert("������[��һ��ȵ�ƽ������]��");
		FormName.pjde.focus();
		return false;
	}
	if(!(isFloat(FormName.pjde, "��һ��ȵ�ƽ������"))) {
		return false;
	}
	if(	javaTrim(FormName.grs)=="") {
		alert("������[���鹤����Сֵ]��");
		FormName.grs.focus();
		return false;
	}
	if(!(isNumber(FormName.grs, "���鹤����Сֵ"))) {
		return false;
	}
	if(	javaTrim(FormName.zbj)=="") {
		alert("������[�ʱ�����Сֵ]��");
		FormName.zbj.focus();
		return false;
	}
	if(!(isFloat(FormName.zbj, "�ʱ�����Сֵ"))) {
		return false;
	}
	if(	javaTrim(FormName.khmyd)=="") {
		alert("������[�ͻ��������Сֵ]��");
		FormName.khmyd.focus();
		return false;
	}
	if(!(isFloat(FormName.khmyd, "�ͻ��������Сֵ"))) {
		return false;
	}
	if(	javaTrim(FormName.zxzsgds)=="") {
		alert("������[������С��ʩ������]��");
		FormName.zxzsgds.focus();
		return false;
	}
	if(!(isNumber(FormName.zxzsgds, "������С��ʩ������"))) {
		return false;
	}
	if(	javaTrim(FormName.zdzsgds)=="") {
		alert("������[���������ʩ������]��");
		FormName.zdzsgds.focus();
		return false;
	}
	if(!(isNumber(FormName.zdzsgds, "���������ʩ������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
