<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yhdlm=null;
String ygbh=null;
String yhmc=null;
String txfs=null;
String txlx=null;
String txgjz=null;
String txnr=null;
String kstxsj=null;
String txzt=null;
String txsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yhdlm,ygbh,yhmc,txfs,txlx,txgjz,txnr,kstxsj,txzt,txsj,lrr,lrsj,lrbm ";
	ls_sql+=" from  sq_txxxb";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		txfs=cf.fillNull(rs.getString("txfs"));
		txlx=cf.fillNull(rs.getString("txlx"));
		txgjz=cf.fillNull(rs.getString("txgjz"));
		txnr=cf.fillNull(rs.getString("txnr"));
		kstxsj=cf.fillNull(rs.getDate("kstxsj"));
		txzt=cf.fillNull(rs.getString("txzt"));
		txsj=cf.fillNull(rs.getDate("txsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
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
<form method="post" action="SaveEditSq_txxxb.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�û���¼��</td> 
  <td width="35%"> 
    <input type="text" name="yhdlm" size="20" maxlength="16"  value="<%=yhdlm%>" >
  </td>
  <td align="right" width="15%">Ա�����</td> 
  <td width="35%"> 
    <input type="text" name="ygbh" size="20" maxlength="8"  value="<%=ygbh%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">Ա������</td> 
  <td width="35%"> 
    <input type="text" name="yhmc" size="20" maxlength="20"  value="<%=yhmc%>" >
  </td>
  <td align="right" width="15%">���ѷ�ʽ</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "txfs","1+ϵͳ&2+�绰&3+����&4+����&9+ȫ��",txfs);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <select name="txlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"01+��ѯ�ط�&02+��ʩ���̻ط�&03+Ͷ�߱��޻ط�&04+Ͷ�߱���",txlx);
%>
    </select>
  </td>
  <td align="right" width="15%">���ѹؼ���</td> 
  <td width="35%"> 
    <input type="text" name="txgjz" size="20" maxlength="50"  value="<%=txgjz%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <textarea name="txnr" cols="29" rows=""><%=txnr%></textarea>
  </td>
  <td align="right" width="15%">��ʼ����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="kstxsj" size="20" maxlength="10"  value="<%=kstxsj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����״̬</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "txzt","1+δ����&2+����&3+����",txzt);
%>
  </td>
  <td align="right" width="15%">����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="txsj" size="20" maxlength="10"  value="<%=txsj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" >
  </td>
  <td align="right" width="15%">¼��ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼�벿��</td> 
  <td width="35%"> 
    <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by ssfgs,dwbh",lrbm);
%>
    </select>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherexh"  value="<%=wherexh%>" >
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
	if(	javaTrim(FormName.yhdlm)=="") {
		alert("������[�û���¼��]��");
		FormName.yhdlm.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("������[Ա�����]��");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}
	if(	javaTrim(FormName.yhmc)=="") {
		alert("������[Ա������]��");
		FormName.yhmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.txfs)) {
		alert("��ѡ��[���ѷ�ʽ]��");
		FormName.txfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.txlx)=="") {
		alert("��ѡ��[��������]��");
		FormName.txlx.focus();
		return false;
	}
	if(	javaTrim(FormName.txgjz)=="") {
		alert("������[���ѹؼ���]��");
		FormName.txgjz.focus();
		return false;
	}
	if(	javaTrim(FormName.txnr)=="") {
		alert("������[��������]��");
		FormName.txnr.focus();
		return false;
	}
	if(	javaTrim(FormName.kstxsj)=="") {
		alert("������[��ʼ����ʱ��]��");
		FormName.kstxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kstxsj, "��ʼ����ʱ��"))) {
		return false;
	}
	if(	!radioChecked(FormName.txzt)) {
		alert("��ѡ��[����״̬]��");
		FormName.txzt[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.txsj, "����ʱ��"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
