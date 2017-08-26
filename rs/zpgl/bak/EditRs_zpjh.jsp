<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");

String zprs=null;
String zpfy=null;
String fgs=null;
String jhkssj=null;
String jhjssj=null;
String bz=null;
String wherezpjhbh=cf.GB2Uni(request.getParameter("zpjhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zprs,zpfy,fgs,jhkssj,jhjssj,bz ";
	ls_sql+=" from  rs_zpjh";
	ls_sql+=" where  (zpjhbh='"+wherezpjhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zprs=cf.fillNull(rs.getString("zprs"));
		zpfy=cf.fillNull(rs.getString("zpfy"));
		fgs=cf.fillNull(rs.getString("fgs"));
		jhkssj=cf.fillNull(rs.getDate("jhkssj"));
		jhjssj=cf.fillNull(rs.getDate("jhjssj"));
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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform">
<div align="center"><b>�޸���Ƹ�ƻ�����ţ�<%=wherezpjhbh%>��</b></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ƹ����</td> 
  <td width="35%"> 
    <input type="text" name="zprs" size="20" maxlength="8"  value="<%=zprs%>" >
  </td>
  <td align="right" width="15%">��Ƹ����</td> 
  <td width="35%"> 
    <input type="text" name="zpfy" size="20" maxlength="9"  value="<%=zpfy%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ƻ����빫˾</td> 
  <td width="35%"> 
     <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') order by dwbh",fgs);
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",fgs);
	}
%> 
      </select>
  </td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ƻ���ʼʱ��</td> 
  <td width="35%"> 
    <input type="text" name="jhkssj" size="20" maxlength="10"  value="<%=jhkssj%>" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%">�ƻ�����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="jhjssj" size="20" maxlength="10"  value="<%=jhjssj%>" ondblclick="JSCalendar(this)">
  </td>
 </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="71" rows=""><%=bz%></textarea>
  </td>
</tr>
<input type="hidden" name="wherezpjhbh"  value="<%=wherezpjhbh%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
   	  <input type="button"  value="¼����ϸ" onClick="f_lrmx(editform)">
  	  <input type="button"  value="�޸���ϸ" onClick="f_mx(editform)">
	  <input type="button"  value="���" onClick="f_wc(editform)">
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
	if(	javaTrim(FormName.zprs)=="") {
		alert("������[��Ƹ����]��");
		FormName.zprs.focus();
		return false;
	}
	if(!(isNumber(FormName.zprs, "��Ƹ����"))) {
		return false;
	}
	if(	javaTrim(FormName.zpfy)=="") {
		alert("������[��Ƹ����]��");
		FormName.zpfy.focus();
		return false;
	}
	if(!(isFloat(FormName.zpfy, "��Ƹ����"))) {
		return false;
	}
	if(	javaTrim(FormName.fgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.fgs.focus();
		return false;
	}
	if(	javaTrim(FormName.jhkssj)=="") {
		alert("������[�ƻ���ʼʱ��]��");
		FormName.jhkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhkssj, "�ƻ���ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jhjssj)=="") {
		alert("������[�ƻ�����ʱ��]��");
		FormName.jhjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhjssj, "�ƻ�����ʱ��"))) {
		return false;
	}
	FormName.action="SaveEditRs_zpjh.jsp";
	FormName.submit();
	return true;
}
function f_wc(FormName)//����FormName:Form������
{
	FormName.action="EditRs_zpjhwc.jsp";
	FormName.submit();
	return true;
}
function f_mx(FormName)//����FormName:Form������
{
	FormName.action="Rs_zpjhmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrmx(FormName)//����FormName:Form������
{
	FormName.action="EditInsertRs_zpjhmx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
