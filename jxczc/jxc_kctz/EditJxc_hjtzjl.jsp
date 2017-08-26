<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���ܵ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<%
String tzph=request.getParameter("tzph");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String ckbh=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String ssfgs=null;
String bz=null;
try {
	conn=cf.getConnection();

	ls_sql="select ckbh,lrr,lrsj,lrbm,ssfgs,bz";
	ls_sql+=" from  jxc_hjtzjl";
	ls_sql+=" where tzph='"+tzph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ckbh=rs.getString("ckbh");
		lrr=rs.getString("lrr");
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=rs.getString("lrbm");
		ssfgs=rs.getString("ssfgs");
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">���ܵ���(��������:<%=tzph%>)</div>


<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>�ֿ�</td> 
  <td width="35%"> 
   <select name="ckbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc where ckbh='"+ckbh+"'","");
%>
  </select>  </td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=lrr%>" size="20"  readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=lrsj%>" size="20"  readonly></td>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'  order by dwbh","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">�����ֹ�˾</span></td>
  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'  order by dwbh","");
%>
</select></td>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3" ><%=bz%></textarea> </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
		<input type="hidden" name="tzph" value="<%=tzph%>">
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="button" onClick="f_lrmx(insertform)"  value="¼����ϸ">
	<input type="button" onClick="f_xgmx(insertform)"  value="�޸���ϸ">
	<input type="button" onClick="f_tj(insertform)"  value="�ύ">
	<input type="button" onClick="f_sctj(insertform)"  value="ɾ���ύ">
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
	if(	javaTrim(FormName.tzph)=="") {
		alert("������[��������]��");
		FormName.tzph.focus();
		return false;
	}

	if(	javaTrim(FormName.ckbh)=="") {
		alert("������[�ֿ�]��");
		FormName.ckbh.focus();
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
		alert("������[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}

	FormName.action="SaveEditJxc_hjtzjl.jsp";
	FormName.submit();
	return true;
}

function f_lrmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tzph)=="") {
		alert("������[��������]��");
		FormName.tzph.focus();
		return false;
	}

	FormName.action="SelectCxJxc_kcb.jsp";
	FormName.submit();
	return true;
}

function f_xgmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tzph)=="") {
		alert("������[��������]��");
		FormName.tzph.focus();
		return false;
	}

	FormName.action="Jxc_hjtzmxList.jsp";
	FormName.submit();
	return true;
}

function f_tj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tzph)=="") {
		alert("������[��������]��");
		FormName.tzph.focus();
		return false;
	}

	FormName.action="tj.jsp";
	FormName.submit();
	return true;
}

function f_sctj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tzph)=="") {
		alert("������[��������]��");
		FormName.tzph.focus();
		return false;
	}

	FormName.action="sctj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
