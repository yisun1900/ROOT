<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String khbh=null;
String tzlx=null;
String tzsjd=null;
String tzts=null;
String gqtzyybm=null;
String tzyysm=null;
String lrr=null;
String lrsj=null;
String lrdw=null;
String djjlh=cf.GB2Uni(request.getParameter("djjlh"));

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qyrq=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String sgd=null;
String zjxm=null;
String gqts=null;
String yqlx=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,tzlx,tzsjd,tzts,gqtzyybm,tzyysm,lrr,lrsj,lrdw,yqlx ";
	ls_sql+=" from  crm_gqtzjl";
	ls_sql+=" where  (djjlh='"+djjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		tzlx=cf.fillNull(rs.getString("tzlx"));
		tzsjd=cf.fillNull(rs.getDate("tzsjd"));
		tzts=cf.fillNull(rs.getString("tzts"));
		gqtzyybm=cf.fillNull(rs.getString("gqtzyybm"));
		tzyysm=cf.fillNull(rs.getString("tzyysm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrdw=cf.fillNull(rs.getString("lrdw"));
		yqlx=cf.fillNull(rs.getString("yqlx"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,sgd,zjxm,gqts";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		gqts=cf.fillNull(rs.getString("gqts"));
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
.STYLE1 {color: #990000}
.STYLE2 {color: #0000CC}
.STYLE3 {	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCrm_gqtzjl.jsp" name="editform">
<div align="center">���޸Ĺ��ڵ�����¼���ǼǼ�¼�ţ�<%=djjlh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"> �ͻ���� </td>
    <td><%=khbh%> </td>
    <td align="right">��ͬ��</td>
    <td><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ͻ�����</td>
    <td><%=khxm%></td>
    <td align="right">�绰</td>
    <td><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ���ݵ�ַ </td>
    <td><%=fwdz%> </td>
    <td align="right">���ʦ </td>
    <td><%=sjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ǩԼ���� </td>
    <td><%=qyrq%> </td>
    <td align="right">����</td>
    <td><%=gqts%>��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ͬ�������� </td>
    <td><%=kgrq%></td>
    <td align="right">��ͬ�깤����</td>
    <td><%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ʵ�ʿ������� </td>
    <td><%=sjkgrq%></td>
    <td align="right">ʵ���깤����</td>
    <td><%=sjjgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ʩ����</td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgd",sgd,true);
%></td>
    <td align="right">���̵���</td>
    <td><%=zjxm%></td>
  </tr>
  <tr >
    <td height="22" colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "tzlx","1+����",tzlx);
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��������</td>
  <td><input type="text" name="tzts" size="10" maxlength="8"  value="<%=tzts%>" ></td>
  <td align="right"><span class="STYLE1">*</span>��������</td>
  <td><select name="yqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select yqlx c1,yqlx c2 from dm_yqlx  order by yqlxbm",yqlx);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>����ԭ��</td> 
  <td width="32%"><select name="gqtzyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gqtzyybm,gqtzyymc from dm_gqtzyybm order by lx,gqtzyybm",gqtzyybm);
%>
  </select></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>����ʱ���</td> 
  <td width="32%"><input type="text" name="tzsjd" size="20" maxlength="10"  value="<%=tzsjd%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>����ԭ��˵��</td> 
  <td colspan="3"> 
    <textarea name="tzyysm" cols="71" rows="3"><%=tzyysm%></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼�뵥λ</span></td>
  <td><select name="lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="djjlh"  value="<%=djjlh%>" >
	<input type="hidden" name="khbh"  value="<%=khbh%>" >
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yqlx)=="") {
		alert("������[��������]��");
		FormName.yqlx.focus();
		return false;
	}
	if(	javaTrim(FormName.tzsjd)=="") {
		alert("������[����ʱ���]��");
		FormName.tzsjd.focus();
		return false;
	}
	if(!(isDatetime(FormName.tzsjd, "����ʱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.tzts)=="") {
		alert("������[��������]��");
		FormName.tzts.focus();
		return false;
	}
	if(!(isInt(FormName.tzts, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.gqtzyybm)=="") {
		alert("��ѡ��[����ԭ�����]��");
		FormName.gqtzyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.tzyysm)=="") {
		alert("������[����ԭ��˵��]��");
		FormName.tzyysm.focus();
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
	if(	javaTrim(FormName.lrdw)=="") {
		alert("��ѡ��[¼�뵥λ]��");
		FormName.lrdw.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
