<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String jzssk=null;
String cxhddj=null;
String jrhdje=null;
String ybkje=null;
String yfkje=null;
String lrr=null;
String lrsj=null;
String bz=null;
String blr=null;
String blsj=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));


String khxm=null;
String hth=null;
String lxfs=null;
String qtdh=null;
String sjs=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jzssk,cxhddj,jrhdje,ybkje,yfkje,lrr,lrsj,bz,blr,blsj ";
	ls_sql+=" from  cw_jcfkd";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jzssk=cf.fillNull(rs.getString("jzssk"));
		cxhddj=cf.fillNull(rs.getString("cxhddj"));
		jrhdje=cf.fillNull(rs.getString("jrhdje"));
		ybkje=cf.fillNull(rs.getString("ybkje"));
		yfkje=cf.fillNull(rs.getString("yfkje"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		blr=cf.fillNull(rs.getString("blr"));
		blsj=cf.fillNull(rs.getDate("blsj"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,hth,lxfs,qtdh,sjs";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		hth=cf.fillNull(rs.getString("hth"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		sjs=cf.fillNull(rs.getString("sjs"));
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
.STYLE1 {	color: #0000CC;
	font-weight: bold;
}
.STYLE2 {color: #FF0000}
.STYLE3 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_jcfkd.jsp" name="editform">
<div align="center">�޸ļ��ɷ�����ͻ���ţ�<%=khbh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">�ͻ�����</span></td>
    <td><%=khxm%></td>
    <td align="right"><span class="STYLE1">��ͬ��</span></td>
    <td><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">��ϵ�绰</span></td>
    <td><%=lxfs%>��<%=qtdh%></td>
    <td align="right"><span class="STYLE1">��װ���ʦ</span></td>
    <td><%=sjs%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1"><span class="STYLE2">*</span>��װʵ�տ�</span></td> 
  <td width="31%"> 
    <input type="text" name="jzssk" size="20" maxlength="17"  value="<%=jzssk%>" readonly>  </td>
  <td align="right" width="19%"><span class="STYLE1"><span class="STYLE2">*</span>���������</span></td> 
  <td width="31%"> 
    <input type="text" name="cxhddj" size="20" maxlength="17"  value="<%=cxhddj%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE2">*</span>���ɼҾӿɼ������</td> 
  <td colspan="3"> 
    <input type="text" name="jrhdje" size="20" maxlength="17"  value="<%=jrhdje%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>Ӧ�����ۣ���</td>
  <td colspan="3"><input type="text" name="ybkje" size="20" maxlength="17"  value="<%=ybkje%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE2">*</span>����Ӧ����</td> 
  <td colspan="3"> 
    <input type="text" name="yfkje" size="20" maxlength="17"  value="<%=yfkje%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>������</td>
  <td><input type="text" name="blr" size="20" maxlength="20"  value="<%=blr%>" ></td>
  <td align="right"><span class="STYLE2">*</span>����ʱ�� </td>
  <td><input type="text" name="blsj" size="20" maxlength="10"  value="<%=blsj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span><span class="STYLE3">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE2">*</span><span class="STYLE3">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span><span class="STYLE3">¼�벿��</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>  </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="khbh"  value="<%=khbh%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	  <input name="button" type="button" onClick="window.open('ViewCw_jcfkd.jsp?khbh=<%=khbh%>')"  value="��ӡ">
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jzssk)=="") {
		alert("������[��װʵ�տ�]��");
		FormName.jzssk.focus();
		return false;
	}
	if(!(isFloat(FormName.jzssk, "��װʵ�տ�"))) {
		return false;
	}
	if(	javaTrim(FormName.cxhddj)=="") {
		alert("������[���������]��");
		FormName.cxhddj.focus();
		return false;
	}
	if(!(isFloat(FormName.cxhddj, "���������"))) {
		return false;
	}
	if(	javaTrim(FormName.jrhdje)=="") {
		alert("������[�������]��");
		FormName.jrhdje.focus();
		return false;
	}
	if(!(isFloat(FormName.jrhdje, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.ybkje)=="") {
		alert("������[Ӧ�����ۣ�����]��");
		FormName.ybkje.focus();
		return false;
	}
	if(!(isFloat(FormName.ybkje, "Ӧ�����ۣ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.yfkje)=="") {
		alert("������[Ӧ������]��");
		FormName.yfkje.focus();
		return false;
	}
	if(!(isFloat(FormName.yfkje, "Ӧ������"))) {
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
	if(	javaTrim(FormName.blr)=="") {
		alert("������[������]��");
		FormName.blr.focus();
		return false;
	}
	if(	javaTrim(FormName.blsj)=="") {
		alert("������[����ʱ��]��");
		FormName.blsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.blsj, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
