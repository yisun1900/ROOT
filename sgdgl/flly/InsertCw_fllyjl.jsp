<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String sgd=cf.GB2Uni(request.getParameter("sgd"));

String ssfgs=null;
String jlh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select ssfgs";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString(1);
	}
	rs.close();
	ps.close();



	int count=0;
	ls_sql="select NVL(max(substr(jlh,6,3)),0)";
	ls_sql+=" from  cw_fllyjl";
	ls_sql+=" where sgd='"+sgd+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jlh=sgd+cf.addZero(count+1,3);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
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
<div align="center">�������ü�¼</div>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">��¼��</td>
	<td  width="5%">ʩ����</td>
	<td  width="7%">����</td>
	<td  width="8%">���</td>
	<td  width="6%">������</td>
	<td  width="8%">����ʱ��</td>
	<td  width="6%">¼����</td>
	<td  width="6%">�����־</td>
	<td  width="6%">ɾ����־</td>
	<td  width="44%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_fllyjl.jlh,sq_sgd.sgdmc,cw_fllyjl.zsl,cw_fllyjl.zje,cw_fllyjl.jkblr,cw_fllyjl.jkblsj,cw_fllyjl.lrr, DECODE(cw_fllyjl.jsbz,'0','δ����','1','�ѽ���'), DECODE(cw_fllyjl.scbz,'N','δɾ��','Y','ɾ��'),cw_fllyjl.bz  ";
	ls_sql+=" FROM cw_fllyjl,sq_sgd  ";
    ls_sql+=" where cw_fllyjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_fllyjl.sgd='"+sgd+"'";
    ls_sql+=" order by cw_fllyjl.lrsj desc";
    pageObj.sql=ls_sql;
	pageObj.initPage("cw_fllyjlCxList.jsp","","","");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">��¼��</span></td> 
  <td width="32%"> 
    <input type="text" name="jlh" value="<%=jlh%>" size="20" maxlength="10" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">ʩ����</span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
    </select></td>
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">�ֹ�˾</span></td>
    <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
      <%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">������</span></td> 
  <td width="32%"> 
    <input type="text" name="zsl" value="0" size="20" maxlength="17"  onchange="getJe(insertform)">  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">�ܽ��</span></td> 
  <td width="32%"> 
    <input type="text" name="zje" value="0" size="20" maxlength="17" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������</td> 
  <td width="32%"> 
    <input type="text" name="jkblr" value="<%=yhmc%>" size="20" maxlength="20" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>����ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="jkblsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input name="lrmx" type="button" onClick="f_lrmx(insertform)"  value="¼����ϸ" disabled>
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
	if(	javaTrim(FormName.jlh)=="") {
		alert("������[��¼��]��");
		FormName.jlh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.zsl)=="") {
		alert("������[������]��");
		FormName.zsl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsl, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.zje)=="") {
		alert("������[�ܽ��]��");
		FormName.zje.focus();
		return false;
	}
	if(!(isFloat(FormName.zje, "�ܽ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jkblr)=="") {
		alert("������[������]��");
		FormName.jkblr.focus();
		return false;
	}
	if(	javaTrim(FormName.jkblsj)=="") {
		alert("������[����ʱ��]��");
		FormName.jkblsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jkblsj, "����ʱ��"))) {
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
	FormName.action="SaveInsertCw_fllyjl.jsp";
	FormName.submit();
	FormName.lrmx.disabled=false;
	return true;
}

function f_lrmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jlh)=="") {
		alert("������[��¼��]��");
		FormName.jlh.focus();
		return false;
	}

	FormName.action="InsertCw_fllymx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
