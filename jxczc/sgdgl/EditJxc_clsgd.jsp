<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�޸��깺��</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");


String sgph=cf.GB2Uni(request.getParameter("sgph"));

String lx=cf.GB2Uni(request.getParameter("lx"));
if (lx.equals("1"))//��ʾ¼�����ֱ��ת����
{
	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	//-->
	</SCRIPT>
	<%
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String psfs=null;
String jhshsj=null;
String sgr=null;
String sgrq=null;
String ssfgs=null;
String ssbm=null;
String bz=null;
String sglb=null;
String dqbm=null;
try {
	conn=cf.getConnection();

	ls_sql="select psfs,jhshsj,sgr,sgrq,ssfgs,ssbm,bz,sglb";
	ls_sql+=" from  jxc_clsgd";
	ls_sql+=" where sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		sgr=cf.fillNull(rs.getString("sgr"));
		sgrq=cf.fillNull(rs.getDate("sgrq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ssbm=cf.fillNull(rs.getString("ssbm"));
		bz=cf.fillNull(rs.getString("bz"));
		sglb=cf.fillNull(rs.getString("sglb"));
	}
	rs.close();
	ps.close();


	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
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

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">���޸��깺�����깺���ţ�<%=sgph%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">�깺�ֹ�˾</span></td>
  <td>
  <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		%> 
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">�깺���</span></td>
  <td><select name="sglb" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="0">����</option>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�깺��</td>
  <td><input type="text" name="sgr" value="<%=sgr%>" size="20" maxlength="20" ></td>
  <td align="right"><span class="STYLE1">*</span>�깺����</td>
  <td><input type="text" name="sgrq" value="<%=sgrq%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><span class="STYLE1">*</span>���ͷ�ʽ</td>
              <td width="32%"><%
	cf.radioToken(out, "psfs","1+����&2+����&9+����",psfs);
%></td>
              <td width="18%" align="right">�ƻ��ͻ�ʱ��</td>
              <td width="32%"> 
      <input type="text" name="jhshsj" value="<%=jhshsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
    </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE2"><span class="STYLE1">*</span>¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">¼�벿��</font></td>
  <td><select name="ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3" ><%=bz%></textarea>      </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	  <input type="hidden" name="sgph" value="<%=sgph%>" >
	  <input type="hidden" name="dqbm" value="<%=dqbm%>" >
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="button"  value="���ò���¼��" onClick="f_pllr(insertform)" name="pllr">
    <input type="button"  value="ѡ��¼��" onClick="f_cklr(insertform)" name="cklr" >
    <input type="button"  value="�鿴��ϸ" onClick="f_ck(insertform)" name="ckmx" >
    <input type="button"  value=" �� �� " onClick="f_tj(insertform)" name="tj" >
	<input type="button" onClick="f_print(insertform)"  value="��ӡ�깺��">
	<input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.sgph)=="") {
		alert("������[�깺����]��");
		FormName.sgph.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�깺�ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	!radioChecked(FormName.psfs)) {
		alert("��ѡ��[���ͷ�ʽ]��");
		FormName.psfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.sgr)=="") {
		alert("������[�깺��]��");
		FormName.sgr.focus();
		return false;
	}
	if(	javaTrim(FormName.sgrq)=="") {
		alert("������[�깺����]��");
		FormName.sgrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sgrq, "�깺����"))) {
		return false;
	}
	if (FormName.psfs[0].checked)
	{
		if(	javaTrim(FormName.jhshsj)=="") {
			alert("������[�ƻ��ͻ�ʱ��]��");
			FormName.jhshsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.jhshsj, "�ƻ��ͻ�ʱ��"))) {
			return false;
		}
	}
	else{
		FormName.jhshsj.value="";
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
	if(	javaTrim(FormName.ssbm)=="") {
		alert("������[¼�벿��]��");
		FormName.ssbm.focus();
		return false;
	}

	FormName.action="SaveEditJxc_clsgd.jsp";
	FormName.submit();
	return true;
}


function f_pllr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sgph)=="") {
		alert("������[�깺����]��");
		FormName.sgph.focus();
		return false;
	}

	FormName.action="PlLrJxc_clbm.jsp";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}


function f_cklr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sgph)=="") {
		alert("������[�깺����]��");
		FormName.sgph.focus();
		return false;
	}

	FormName.action="SelectCxJxc_cljgb.jsp";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}


function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sgph)=="") {
		alert("������[�깺����]��");
		FormName.sgph.focus();
		return false;
	}

	FormName.action="EditAllJxc_clbm.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sgph)=="") {
		alert("������[�깺����]��");
		FormName.sgph.focus();
		return false;
	}

	FormName.action="tjsgd.jsp";
	FormName.submit();
	return true;
}
function f_print(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sgph)=="") {
		alert("������[�깺����]��");
		FormName.sgph.focus();
		return false;
	}

	FormName.action="/jxcdy/printzcsgd.jsp";
	FormName.submit();
	return true;
}

 //-->
</SCRIPT>
