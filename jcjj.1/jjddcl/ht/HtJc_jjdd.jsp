<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String jhazrq=null;
String kjxsj=null;
String qhtr=null;
String qhtsj=null;
String htbz=null;
double jjje=0;
double xcmje=0;
double cpjjje=0;
double htze=0;
double zqjjje=0;
double zqxcmje=0;
double zqcpjjje=0;
double wdzje=0;

double jjzkl=0;
String dzyy=null;
String khbh=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select jc_jjdd.khbh,jhazrq,kjxsj,qhtr,qhtsj,htbz,htze,jjje,xcmje,cpjjje,wdzje,zqjjje,zqxcmje,zqcpjjje,jjzkl,dzyy";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		qhtr=cf.fillNull(rs.getString("qhtr"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		htbz=cf.fillNull(rs.getString("htbz"));
		jjje=rs.getDouble("jjje");
		xcmje=rs.getDouble("xcmje");
		cpjjje=rs.getDouble("cpjjje");
		htze=rs.getDouble("htze");
		zqjjje=rs.getDouble("zqjjje");
		zqxcmje=rs.getDouble("zqxcmje");
		zqcpjjje=rs.getDouble("zqcpjjje");
		wdzje=rs.getDouble("wdzje");
		jjzkl=rs.getDouble("jjzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
	}
	rs.close();


	String jjwjbz="";
	ls_sql="select crm_khxx.jjwjbz";
	ls_sql+=" from  crm_khxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
	}
	rs.close();

	if (jjwjbz.equals("Y"))
	{
		out.println("���󣡿ͻ��Ҿ�����ᣬ������¼�붩��");
		return;
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>ǩ����ͬ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
  <div align="center">�Ҿ߶�������--ǩ����ͬ�������ţ�<%=ddbh%>��
	<input type="button"  value="��ӡ��ͬ" onClick="window.open('/jcjj/dygl/jjht.jsp?ddbh=<%=ddbh%>')"></div> 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr>
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>�����ۿ�</td>
      <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="jjzkl" size="8" maxlength="8" value="<%=jjzkl%>" onChange="f_jsjg(insertform)">
          <b><font color="#0000FF">��>0��<=10��
          <input type="hidden" name="zqjjje" size="20" maxlength="20"  value="<%=zqjjje%>" readonly onChange="f_wdzje(insertform)" >
          <input type="hidden" name="zqxcmje" size="20" maxlength="20"  value="<%=zqxcmje%>" readonly onChange="f_wdzje(insertform)" >
          <input type="hidden" name="zqcpjjje" size="20" maxlength="20"  value="<%=zqcpjjje%>" readonly onChange="f_wdzje(insertform)" >
          <input type="hidden" name="wdzje" size="20" maxlength="20"  value="<%=wdzje%>" readonly>
          <input type="hidden" name="jjje" size="20" maxlength="20"  value="<%=jjje%>" onChange="f_wdzje(insertform)" readonly>
          <input type="hidden" name="xcmje" size="20" maxlength="20"  value="<%=xcmje%>" onChange="f_wdzje(insertform)" readonly>
          <input type="hidden" name="cpjjje" size="20" maxlength="20"  value="<%=cpjjje%>" onChange="f_wdzje(insertform)" readonly>
          <input type="hidden" name="htze" size="20" maxlength="20"  value="<%=htze%>" readonly>
          </font></b></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">����ԭ��</td>
      <td colspan="3" bgcolor="#FFFFFF"><textarea name="dzyy" cols="71" rows="2"><%=dzyy%></textarea></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>�ƻ���װ����</td>
      <td width="29%"> 
        <input type="text" name="jhazrq" size="20" maxlength="10"  value="<%=jhazrq%>"  ondblclick="JSCalendar(this)">      </td>
      <td width="22%" align="right"><font color="#FF0033">*</font>�ɼ����ֹʱ��</td>
      <td width="28%"> 
        <input type="text" name="kjxsj" size="20" maxlength="10"  value="<%=cf.addDay(7)%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font><font color="#0000CC">ǩ��ͬ��</font></td>
      <td width="29%"> 
        <input type="text" name="qhtr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>      </td>
      <td width="22%" align="right"><font color="#FF0033">*</font>ǩ��ͬʱ��</td>
      <td width="28%"> 
        <input type="text" name="qhtsj" size="20" maxlength="20"  value="<%=cf.today()%>" onDblClick="JSCalendar(this)" onBlur="f_getrq(insertform)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">��ͬ��ע</td>
      <td colspan="3"> 
        <textarea name="htbz" cols="71" rows="2"><%=htbz%></textarea>      </td>
    </tr>
    <tr > 
      <td colspan="4" align="center" > 
          <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
          <input type="button"  value="����" onClick="f_do(insertform)" name="button">
          <input type="reset" name="Reset" value="����">
            <input type="button"  value="¼�����" onClick="f_lrmm(insertform)" name="lrmm" disabled>
            <input type="button"  value="�鿴����" onClick="f_ckmm(insertform)" name="ckmm" disabled>
            <input type="button"  value="¼���Ͳ���" onClick="f_lrbgmmm(insertform)" name="lrbgmmm" disabled>
            <input type="button"  value="�鿴�Ͳ���" onClick="f_ckbgmmm(insertform)" name="ckbgmmm" disabled>
        <input type="button"  value="¼���Ʒ�Ҿ�" onClick="f_lrcpjj(insertform)" name="lrcpjj" disabled>
        <input type="button"  value="�鿴��Ʒ�Ҿ�" onClick="f_ckcpjj(insertform)" name="ckcpjj" disabled>      </td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td colspan="4" height="435"> 
	  <iframe width="100%" height="100%" src="" name="childframe" marginwidth="0" marginheight="0" scrolling="YES" frameborder="0">        </iframe> </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_getrq(FormName)
{
	FormName.kjxsj.value=addDay(FormName.qhtsj.value,7);
}

function f_wdzje(FormName)//����FormName:Form������
{
	var wdzje=0;
	wdzje=FormName.zqjjje.value*1.0+FormName.zqxcmje.value*1.0+FormName.zqcpjjje.value*1.0;
	wdzje=round(wdzje,2);
	FormName.wdzje.value=wdzje;

	FormName.jjje.value=FormName.zqjjje.value*FormName.jjzkl.value/10;
	FormName.xcmje.value=FormName.zqxcmje.value*FormName.jjzkl.value/10;
	FormName.cpjjje.value=FormName.zqcpjjje.value*FormName.jjzkl.value/10;


	var je=0;
	je=FormName.jjje.value*1.0+FormName.xcmje.value*1.0+FormName.cpjjje.value*1.0;
	je=round(je,2);
	FormName.htze.value=je;
}
function f_do(FormName)//����FormName:Form������
{
	f_wdzje(FormName);	

	if(	javaTrim(FormName.jjzkl)=="") {
		alert("������[�����ۿ�]��");
		FormName.jjzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.jjzkl, "�����ۿ�"))) {
		return false;
	}
	if (FormName.jjzkl.value<=0 || FormName.jjzkl.value>10)
	{
		alert("����[�����ۿ�]Ӧ����0��10֮�䣡");
		FormName.jjzkl.select();
		return false;
	}
	if (FormName.jjzkl.value!=10)
	{
		if(	javaTrim(FormName.dzyy)=="") {
			alert("������[����ԭ��]��");
			FormName.dzyy.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.jjje)=="") {
		alert("������[�Ҿߺ�ͬ���]��");
		FormName.jjje.focus();
		return false;
	}
	if(!(isFloat(FormName.jjje, "�Ҿߺ�ͬ���"))) {
		return false;
	}
	if(	javaTrim(FormName.xcmje)=="") {
		alert("������[�Ͳ��ź�ͬ���]��");
		FormName.xcmje.focus();
		return false;
	}
	if(!(isFloat(FormName.xcmje, "�Ͳ��ź�ͬ���"))) {
		return false;
	}
	if(	javaTrim(FormName.cpjjje)=="") {
		alert("������[��Ʒ�Ҿߺ�ͬ���-�ۺ�]��");
		FormName.cpjjje.focus();
		return false;
	}
	if(!(isFloat(FormName.cpjjje, "��Ʒ�Ҿߺ�ͬ���-�ۺ�"))) {
		return false;
	}

	if(	javaTrim(FormName.htze)=="") {
		alert("������[��ͬ�ܶ�]��");
		FormName.htze.focus();
		return false;
	}
	if(!(isFloat(FormName.htze, "��ͬ�ܶ�"))) {
		return false;
	}
/*
	if (parseFloat(FormName.htze.value)==0)
	{
		alert("[��ͬ�ܶ�]����Ϊ0��");
		FormName.htze.select();
		return false;
	}
*/
	if(	javaTrim(FormName.zqjjje)=="") {
		alert("������[�Ҿߺ�ͬ����ǰ]��");
		FormName.zqjjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqjjje, "�Ҿߺ�ͬ����ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.zqxcmje)=="") {
		alert("������[�Ͳ��ź�ͬ����ǰ]��");
		FormName.zqxcmje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqxcmje, "�Ͳ��ź�ͬ����ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.zqcpjjje)=="") {
		alert("������[��Ʒ�Ҿߺ�ͬ����ǰ]��");
		FormName.zqcpjjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqcpjjje, "��Ʒ�Ҿߺ�ͬ����ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.wdzje)=="") {
		alert("������[δ���۽��]��");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "δ���۽��"))) {
		return false;
	}
	if (parseFloat(FormName.wdzje.value)<parseFloat(FormName.htze.value))
	{
		alert("[δ���۽��]����С��[��ͬ�ܶ�]��");
		FormName.htze.select();
		return false;
	}

	if(	javaTrim(FormName.jhazrq)=="") {
		alert("������[�ƻ���װ����]��");
		FormName.jhazrq.focus();
		return false;
	}

	if(!(isDatetime(FormName.jhazrq, "�ƻ���װ����"))) {
		return false;
	}

	if(	javaTrim(FormName.kjxsj)=="") {
		alert("������[�ɼ����ֹʱ��]��");
		FormName.kjxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kjxsj, "�ɼ����ֹʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.qhtr)=="") {
		alert("������[ǩ��ͬ��]��");
		FormName.qhtr.focus();
		return false;
	}
	if(	javaTrim(FormName.qhtsj)=="") {
		alert("������[ǩ��ͬʱ��]��");
		FormName.qhtsj.focus();
		return false;
	}
		if(!(isDatetime(FormName.qhtsj, "ǩ��ͬʱ��"))) {
		return false;
	}

	FormName.target="_blank";
	FormName.action="SaveHtJc_jjdd.jsp";
	FormName.submit();
	FormName.lrmm.disabled=false;
	FormName.ckmm.disabled=false;
	FormName.lrbgmmm.disabled=false;
	FormName.ckbgmmm.disabled=false;
	FormName.lrcpjj.disabled=false;
	FormName.ckcpjj.disabled=false;
	return true;
}

function f_lrmm(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.target="childframe";
	FormName.action="InsertJc_jjgtmx.jsp";
	FormName.submit();
	return true;
}

function f_ckmm(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.target="childframe";
	FormName.action="Jc_jjgtmxList.jsp?";
	FormName.submit();
	return true;
}
function f_lrbgmmm(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.target="childframe";
	FormName.action="InsertJc_jjxcmmxMain.jsp";
	FormName.submit();
	return true;
}

function f_ckbgmmm(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.target="childframe";
	FormName.action="Jc_jjxcmmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrcpjj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.target="childframe";
	FormName.action="InsertJc_cpjjddmxMain.jsp";
	FormName.submit();
	return true;
}

function f_ckcpjj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.target="childframe";
	FormName.action="Jc_cpjjddmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
