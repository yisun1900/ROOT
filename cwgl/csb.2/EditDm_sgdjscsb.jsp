<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fgsbh=null;
String bfcs=null;
String bfjs=null;
String bfbl=null;
String sdlbfbl=null;
String kzbjjs=null;
String sfwgjs=null;
String sdljsfs=null;
String sfkclk=null;
String sfkgdyp=null;
String sfkyfgf=null;
String sfkzbj=null;
String sgdjbxg=null;
String sfhzjx=null;
double kzbjbl=0;
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String wherebfcs=cf.GB2Uni(request.getParameter("bfcs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgsbh,bfcs,bfjs,bfbl,sdlbfbl,kzbjjs,sfwgjs,sdljsfs,sfkclk,sfkgdyp,sfkyfgf,sfkzbj,sgdjbxg,sfhzjx,kzbjbl ";
	ls_sql+=" from  dm_sgdjscsb";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"') and  (bfcs="+wherebfcs+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kzbjbl=rs.getDouble("kzbjbl");
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		bfcs=cf.fillNull(rs.getString("bfcs"));
		bfjs=cf.fillNull(rs.getString("bfjs"));
		bfbl=cf.fillNull(rs.getString("bfbl"));
		sdlbfbl=cf.fillNull(rs.getString("sdlbfbl"));
		kzbjjs=cf.fillNull(rs.getString("kzbjjs"));
		sfwgjs=cf.fillNull(rs.getString("sfwgjs"));
		sdljsfs=cf.fillNull(rs.getString("sdljsfs"));
		sfkclk=cf.fillNull(rs.getString("sfkclk"));
		sfkgdyp=cf.fillNull(rs.getString("sfkgdyp"));
		sfkyfgf=cf.fillNull(rs.getString("sfkyfgf"));
		sfkzbj=cf.fillNull(rs.getString("sfkzbj"));
		sgdjbxg=cf.fillNull(rs.getString("sgdjbxg"));
		sfhzjx=cf.fillNull(rs.getString("sfhzjx"));
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
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditDm_sgdjscsb.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ֹ�˾</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%"> 
    <select name="bfcs" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectToken(out,"1+��һ��&2+�ڶ���&3+������&4+���Ĵ�&5+�����&6+������&7+���ߴ�&8+�ڰ˴�&9+�ھŴ�&10+��ʮ��",bfcs,false);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "bfjs","1+���̷�<BR>&2+���̷ѣ�������<BR>&3+ʵ�տ��ܶ�<BR>&4+һ�ڿ�<BR>&5+���ڿ�<BR>&6+���ڿ�<BR>&7+���̻�������<BR>&8+���̻������ۣ������ѻ�������<BR>&9+����ʩ���ɱ���<BR>&A+����ʩ���ɱ��ۣ�������ʩ���ɱ�<BR>&B+���̳ɱ���<BR>&C+���̳ɱ��ۣ������ѳɱ�",bfjs);
%>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%"> 
    <input type="text" name="bfbl" size="10" maxlength="9"  value="<%=bfbl%>" >
    %  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>ˮ��·���㷽ʽ</td>
  <td><%
	cf.radioToken(out, "sdljsfs","1+ͳһ��������<BR>&2+������������<BR>&3+�ֹ�¼�������<BR>&9+������",sdljsfs);
%></td>
  <td align="right">ˮ��·��������</td>
  <td><input type="text" name="sdlbfbl" size="10" maxlength="9"  value="<%=sdlbfbl%>" >
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ���ʱ���</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfkzbj","Y+���ʱ���������ɸ�<BR>&M+���ʱ�������ɸ�<BR>&N+�����ʱ���",sfkzbj);
%></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">���ʱ������</td>
  <td><%
	cf.radioToken(out, "kzbjjs","1+�������&2+�����ܶ�",kzbjjs);
%></td>
  <td align="right">���ʱ������</td>
  <td><input type="text" name="kzbjbl" value="<%=kzbjbl%>" size="10" maxlength="9" >
%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ�۲��Ͽ�</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfkclk","Y+��&N+��",sfkclk);
%>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ�۹�����Ʒ</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfkgdyp","Y+��&N+��",sfkgdyp);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ���Ѹ�����</td>
  <td><%
	cf.radioToken(out, "sfkyfgf","Y+��&N+��",sfkyfgf);
%></td>
  <td align="right"><span class="STYLE1">*</span>�Ƿ���ʩ���Ӽ������</td>
  <td><%
	cf.radioToken(out, "sgdjbxg","Y+��&N+��",sgdjbxg);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ��깤����</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfwgjs","Y+��&N+��",sfwgjs);
%></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ�������</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfhzjx","Y+��&N+��",sfhzjx);
%></td>
</tr>
<input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
<input type="hidden" name="wherebfcs"  value="<%=wherebfcs%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	  <input name="button3" type="button" onClick="f_lr(editform)"  value="����������">
	  <input type="button" onClick="f_lr(editform)"  value="���ʱ������">
	  <input name="button" type="button" onClick="f_jbtz(editform)"  value="ʩ���Ӽ�����������">
	  <input name="button2" type="button" onClick="f_zbjtz(editform)"  value="�ʱ�����������">
	</div>      </td>
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("��ѡ��[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}
	if(	!radioChecked(FormName.bfjs)) {
		alert("��ѡ��[��������]��");
		FormName.bfjs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.bfbl)=="") {
		alert("������[��������]��");
		FormName.bfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bfbl, "��������"))) {
		return false;
	}
	if(	!radioChecked(FormName.sdljsfs)) {
		alert("��ѡ��[ˮ��·���㷽ʽ]��");
		FormName.sdljsfs[0].focus();
		return false;
	}
	if (FormName.sdljsfs[1].checked)
	{
		if(	javaTrim(FormName.sdlbfbl)=="") {
			alert("������[ˮ��·��������]��");
			FormName.sdlbfbl.focus();
			return false;
		}
	}
	if(!(isFloat(FormName.sdlbfbl, "ˮ��·��������"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfwgjs)) {
		alert("��ѡ��[�Ƿ��깤����]��");
		FormName.sfwgjs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkclk)) {
		alert("��ѡ��[�Ƿ�۲��Ͽ�]��");
		FormName.sfkclk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkgdyp)) {
		alert("��ѡ��[�Ƿ�۹�����Ʒ]��");
		FormName.sfkgdyp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkyfgf)) {
		alert("��ѡ��[�Ƿ���Ѹ�����]��");
		FormName.sfkyfgf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkzbj)) {
		alert("��ѡ��[�Ƿ���ʱ���]��");
		FormName.sfkzbj[0].focus();
		return false;
	}
	if (FormName.sfkzbj[0].checked)
	{
		if(	!radioChecked(FormName.kzbjjs)) {
			alert("��ѡ��[���ʱ������]��");
			FormName.kzbjjs[0].focus();
			return false;
		}
		if(	javaTrim(FormName.kzbjbl)=="") {
			alert("������[���ʱ������]��");
			FormName.kzbjbl.focus();
			return false;
		}
		if(!(isFloat(FormName.kzbjbl, "���ʱ������"))) {
			return false;
		}
	}
	if(	!radioChecked(FormName.sgdjbxg)) {
		alert("��ѡ��[�Ƿ���ʩ���Ӽ������]��");
		FormName.sgdjbxg[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfhzjx)) {
		alert("��ѡ��[�Ƿ�������]��");
		FormName.sfhzjx[0].focus();
		return false;
	}

	FormName.action="SaveEditDm_sgdjscsb.jsp";
	FormName.target="";
	FormName.submit();
	return true;
}

function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("��ѡ��[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}

	FormName.action="InsertDm_kzbjbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_jbtz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("��ѡ��[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}

	FormName.action="InsertDm_jbtjsbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_zbjtz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("��ѡ��[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}

	FormName.action="InsertDm_zbjtjsbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
