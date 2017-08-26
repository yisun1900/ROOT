<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cxhdmc=null;
String fgsbh=null;

double bzjgzk=10;
double mjzjzk=10;
double zcsjzk=10;
double zcclzk=10;
double zcsfzk=10;
double zcjmzk=10;
double ddzccjzk=10;
double ddzcclzk=10;
double tcwgczk=10;
double tcgcclzk=10;

String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select cxhdmc,fgsbh";
	ls_sql+=" from  jc_cxhd";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();


	ls_sql="select bzjgzk,mjzjzk,zcsjzk,zcclzk,zcsfzk,zcjmzk,ddzccjzk,ddzcclzk,tcwgczk,tcgcclzk ";
	ls_sql+=" from  jc_cxhdtczk";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bzjgzk=rs.getDouble("bzjgzk");
		mjzjzk=rs.getDouble("mjzjzk");
		zcsjzk=rs.getDouble("zcsjzk");
		zcclzk=rs.getDouble("zcclzk");
		zcsfzk=rs.getDouble("zcsfzk");
		zcjmzk=rs.getDouble("zcjmzk");
		ddzccjzk=rs.getDouble("ddzccjzk");
		ddzcclzk=rs.getDouble("ddzcclzk");
		tcwgczk=rs.getDouble("tcwgczk");
		tcgcclzk=rs.getDouble("tcgcclzk");
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
<title>��׼�ײͲ��ֲ��ö����ۿ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
  <div align="center">��׼�ײͲ��ֲ��ö����ۿ�</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr>
      <td colspan="4" ><div align="center">
            <input type="button"  value="����" onClick="f_do(insertform)">
            <input type="reset"  value="����">
            <input type="hidden" name="cxhdbm" size="20" maxlength="7"  value="<%=cxhdbm%>" readonly>
                <br>
      </div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">���������</font></td>
      <td width="32%"><%=cxhdbm%></td>
      <td align="right" width="18%"><font color="#0000FF">���������</font></td>
      <td width="32%"><%=cxhdmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�ײͱ�׼�۸��ۿ�</td>
      <td><input type="text" name="bzjgzk" size="8" maxlength="9"  value="<%=bzjgzk%>" >
          <b><font color="#0000FF">��>=0��<=10��</font></b> </td>
      <td align="right"><font color="#FF0000">*</font>������ӽ���ۿ�</td>
      <td><input type="text" name="mjzjzk" size="8" maxlength="9"  value="<%=mjzjzk%>" >
          <b><font color="#0000FF">��>=0��<=10��</font></b> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>������������ۿ�</td>
      <td><input type="text" name="zcsjzk" size="8" maxlength="9"  value="<%=zcsjzk%>" >
          <b><font color="#0000FF">��>=0��<=10��</font></b></td>
      <td align="right"><font color="#FF0000">*</font>���ĳ����Ӽ��ۿ�</td>
      <td><input type="text" name="zcclzk" size="8" maxlength="8" value="<%=zcclzk%>">
          <b><font color="#0000FF">��>=0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>���շ������ۿ�</td>
      <td><input type="text" name="zcsfzk" size="8" maxlength="8" value="<%=zcsfzk%>">
          <b><font color="#0000FF">��>=0��<=10��</font></b></td>
      <td align="right"><font color="#FF0000">*</font>���ļ����ۿ�</td>
      <td><input type="text" name="zcjmzk" size="8" maxlength="8" value="<%=zcjmzk%>">
          <b><font color="#0000FF">��>=0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>���������ۿ�</td>
      <td><input type="text" name="ddzccjzk" size="8" maxlength="8" value="<%=ddzccjzk%>">
          <b><font color="#0000FF">��>=0��<=10��</font></b></td>
      <td align="right"><font color="#FF0000">*</font>ѡ�������ۿ�</td>
      <td><input type="text" name="ddzcclzk" size="8" maxlength="8" value="<%=ddzcclzk%>">
        <b><font color="#0000FF">��>=0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�ײ���ʩ�����ۿ�</td>
      <td><input type="text" name="tcwgczk" size="8" maxlength="8" value="<%=tcwgczk%>">
        <b><font color="#0000FF">��>=0��<=10��</font></b></td>
      <td align="right"><font color="#FF0000">*</font>���̳����Ӽ��ۿ�</td>
      <td><input type="text" name="tcgcclzk" size="8" maxlength="8" value="<%=tcgcclzk%>">
        <b><font color="#0000FF">��>=0��<=10��</font></b></td>
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
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}

	if(	javaTrim(FormName.bzjgzk)=="") {
		alert("������[���ķ��ۿ�]��");
		FormName.bzjgzk.focus();
		return false;
	}
	if(!(isFloat(FormName.bzjgzk, "���ķ��ۿ�"))) {
		return false;
	}
	if (FormName.bzjgzk.value<0 || FormName.bzjgzk.value>10)
	{
		alert("����[���ķ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.bzjgzk.select();
		return false;
	}
	if(	javaTrim(FormName.mjzjzk)=="") {
		alert("������[���ķ��ۿ�]��");
		FormName.bzjgzk.focus();
		return false;
	}
	if(!(isFloat(FormName.mjzjzk, "���ķ��ۿ�"))) {
		return false;
	}
	if (FormName.mjzjzk.value<0 || FormName.mjzjzk.value>10)
	{
		alert("����[���ķ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.mjzjzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcsjzk)=="") {
		alert("������[�˹����ۿ�]��");
		FormName.zcsjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcsjzk, "�˹����ۿ�"))) {
		return false;
	}
	if (FormName.zcsjzk.value<0 || FormName.zcsjzk.value>10)
	{
		alert("����[�˹����ۿ�]Ӧ����0��10֮�䣡");
		FormName.zcsjzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcclzk)=="") {
		alert("������[������ۿ�]��");
		FormName.zcclzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcclzk, "������ۿ�"))) {
		return false;
	}
	if (FormName.zcclzk.value<0 || FormName.zcclzk.value>10)
	{
		alert("����[������ۿ�]Ӧ����0��10֮�䣡");
		FormName.zcclzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcsfzk)=="") {
		alert("������[��е���ۿ�]��");
		FormName.zcsfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcsfzk, "��е���ۿ�"))) {
		return false;
	}
	if (FormName.zcsfzk.value<0 || FormName.zcsfzk.value>10)
	{
		alert("����[��е���ۿ�]Ӧ����0��10֮�䣡");
		FormName.zcsfzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcjmzk)=="") {
		alert("������[��ķ��ۿ�]��");
		FormName.zcjmzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcjmzk, "��ķ��ۿ�"))) {
		return false;
	}
	if (FormName.zcjmzk.value<0 || FormName.zcjmzk.value>10)
	{
		alert("����[��ķ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.zcjmzk.select();
		return false;
	}
	if(	javaTrim(FormName.ddzccjzk)=="") {
		alert("������[�������ۿ�]��");
		FormName.ddzccjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.ddzccjzk, "�������ۿ�"))) {
		return false;
	}
	if (FormName.ddzccjzk.value<0 || FormName.ddzccjzk.value>10)
	{
		alert("����[�������ۿ�]Ӧ����0��10֮�䣡");
		FormName.ddzccjzk.select();
		return false;
	}
	
	if(	javaTrim(FormName.ddzcclzk)=="") {
		alert("������[ѡ�������ۿ�]��");
		FormName.ddzcclzk.focus();
		return false;
	}
	if(!(isFloat(FormName.ddzcclzk, "ѡ�������ۿ�"))) {
		return false;
	}
	if (FormName.ddzcclzk.value<0 || FormName.ddzcclzk.value>10)
	{
		alert("����[ѡ�������ۿ�]Ӧ����0��10֮�䣡");
		FormName.ddzcclzk.select();
		return false;
	}

	if(	javaTrim(FormName.tcwgczk)=="") {
		alert("������[�ײ���ʩ�����ۿ�]��");
		FormName.tcwgczk.focus();
		return false;
	}
	if(!(isFloat(FormName.tcwgczk, "�ײ���ʩ�����ۿ�"))) {
		return false;
	}
	if (FormName.tcwgczk.value<0 || FormName.tcwgczk.value>10)
	{
		alert("����[�ײ���ʩ�����ۿ�]Ӧ����0��10֮�䣡");
		FormName.tcwgczk.select();
		return false;
	}

	if(	javaTrim(FormName.tcgcclzk)=="") {
		alert("������[���̳����Ӽ��ۿ�]��");
		FormName.tcgcclzk.focus();
		return false;
	}
	if(!(isFloat(FormName.tcgcclzk, "���̳����Ӽ��ۿ�"))) {
		return false;
	}
	if (FormName.tcgcclzk.value<0 || FormName.tcgcclzk.value>10)
	{
		alert("����[���̳����Ӽ��ۿ�]Ӧ����0��10֮�䣡");
		FormName.tcgcclzk.select();
		return false;
	}
	FormName.action="SaveInsertJc_cxhdtczk.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
