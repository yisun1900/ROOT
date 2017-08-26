<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gtxh=null;
String ddbh=null;
String bjmc=null;
String bcpp=null;
String bclx=null;
String bchd=null;
String bzdj=null;
String cd=null;
String kd=null;
String sl=null;
String je=null;
String bz=null;
String wherebjxh=cf.GB2Uni(request.getParameter("bjxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select gtxh,ddbh,bjmc,bcpp,bchd,bzdj,cd,kd,sl,je,bz ";
	ls_sql+=" from  jc_gtbjmx";
	ls_sql+=" where  (bjxh="+wherebjxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gtxh=cf.fillNull(rs.getString("gtxh"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		bjmc=cf.fillNull(rs.getString("bjmc"));
		bclx=cf.fillNull(rs.getString("bcpp"));
		bchd=cf.fillNull(rs.getString("bchd"));
		bzdj=cf.fillNull(rs.getString("bzdj"));
		cd=cf.fillNull(rs.getString("cd"));
		kd=cf.fillNull(rs.getString("kd"));
		sl=cf.fillNull(rs.getString("sl"));
		je=cf.fillNull(rs.getString("je"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select bcpp";
	ls_sql+=" from  jc_jjgtmx";
	ls_sql+=" where  (gtxh="+gtxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bcpp=cf.fillNull(rs.getString("bcpp"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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

String dwstr=cf.getItemData("select bchd c1,bchd c2,bclx from jc_jjbjbj where bcpp='"+bcpp+"' order by bclx,bchd");

%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJc_gtbjmx.jsp" name="insertform">
  <div align="center">���޸Ĺ�������ϸ</div>  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000CC">�������</font></td>
      <td width="35%"> 
        <input type="text" name="gtxh" size="20" maxlength="11"  value="<%=gtxh%>" readonly>
      </td>
      <td align="right" width="15%"><font color="#0000CC">�������</font></td>
      <td width="35%"> 
        <input type="text" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�������</td>
      <td width="35%"> 
        <select name="bcpp" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="bzdj.value='';selectItem(bcpp,bchd,<%=dwstr%>);">
          <option value=""></option>
          <%
	cf.selectItem(out,"select distinct bclx c1,bclx c2 from jc_jjbjbj where bcpp='"+bcpp+"' order by bclx",bclx);
%> 
        </select>
      </td>
      <td align="right" width="15%">�������</td>
      <td width="35%">
        <select name="bjmc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select bjmc c1,bjmc c2 from jdm_gtbjmc order by bjmc",bjmc);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��ĺ��</td>
      <td width="35%"> 
        <select name="bchd" style="FONT-SIZE:12PX;WIDTH:112PX" onChange="getDj(insertform)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select distinct bchd c1,bchd c2 from jc_jjbjbj where bclx='"+bclx+"' order by bchd",bchd);
%> 
        </select>
        mm </td>
      <td align="right" width="15%"><font color="#0000CC">��׼����</font></td>
      <td width="35%"> 
        <input type="text" name="bzdj" size="20" maxlength="17"  value="<%=bzdj%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">����</td>
      <td width="35%"> 
        <input type="text" name="cd" size="14" maxlength="8"  value="<%=cd%>" onChange="f_wdzje(insertform)">
        mm </td>
      <td align="right" width="15%">���</td>
      <td width="35%"> 
        <input type="text" name="kd" size="14" maxlength="8"  value="<%=kd%>" onChange="f_wdzje(insertform)">
        mm </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��ͬ����</td>
      <td width="35%"> 
        <input type="text" name="sl" size="20" maxlength="8"  value="<%=sl%>" onChange="f_wdzje(insertform)">
      </td>
      <td align="right" width="15%"><font color="#0000CC">���</font></td>
      <td width="35%"> 
        <input type="text" name="je" size="20" maxlength="17"  value="<%=je%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <input type="hidden" name="wherebjxh"  value="<%=wherebjxh%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
        <div align="center"> 
          <input type="button"  value="����" onClick="f_do(insertform)">
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
function getDj(FormName)
{
	if(	javaTrim(FormName.bcpp)=="") {
		return false;
	}
	if(	javaTrim(FormName.bchd)=="") {
		return false;
	}
	if(!(isNumber(FormName.bchd, "��ĺ��"))) {
		return false;
	}

	FormName.bzdj.value="";
	FormName.je.value="";

	var str="Jc_gtbjmxCx.jsp?bcpp="+escape(escape(FormName.bcpp.value))+"&bchd="+FormName.bchd.value;
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function f_wdzje(FormName)//����FormName:Form������
{
	var je=0;
	je=(FormName.cd.value/1000.0*FormName.kd.value/1000.0)*FormName.bzdj.value*FormName.sl.value;
	je=round(je,2);
	FormName.je.value=je;
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gtxh)=="") {
		alert("������[�������]��");
		FormName.gtxh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bjmc)=="") {
		alert("��ѡ��[�������]��");
		FormName.bjmc.focus();
		return false;
	}
	if(	javaTrim(FormName.bcpp)=="") {
		alert("��ѡ��[���Ʒ��]��");
		FormName.bcpp.focus();
		return false;
	}
	if(	javaTrim(FormName.bchd)=="") {
		alert("������[��ĺ��]��");
		FormName.bchd.focus();
		return false;
	}
	if(!(isNumber(FormName.bchd, "��ĺ��"))) {
		return false;
	}
	if(	javaTrim(FormName.bzdj)=="") {
		alert("������[��׼����]��");
		FormName.bzdj.focus();
		return false;
	}
	if(!(isFloat(FormName.bzdj, "��׼����"))) {
		return false;
	}
	if(	javaTrim(FormName.cd)=="") {
		alert("������[����]��");
		FormName.cd.focus();
		return false;
	}
	if(!(isNumber(FormName.cd, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.kd)=="") {
		alert("������[���]��");
		FormName.kd.focus();
		return false;
	}
	if(!(isNumber(FormName.kd, "���"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("������[��ͬ����]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "��ͬ����"))) {
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("������[���]��");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
