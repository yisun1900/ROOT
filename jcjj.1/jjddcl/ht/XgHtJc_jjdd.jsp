<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
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

	ls_sql="select jc_jjdd.khbh,jhazrq,kjxsj,qhtr,qhtsj,htbz,jjje,xcmje,cpjjje,htze,zqjjje,zqxcmje,zqcpjjje,wdzje,jjzkl,dzyy";
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
  <div align="center">�Ҿ߶�������--�޸ĺ�ͬ�������ţ�<%=ddbh%>�� 
	<input type="button"  value="��ӡ��ͬ" onClick="window.open('/jcjj/dygl/jjht.jsp?ddbh=<%=ddbh%>')">
  </div>
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" >
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right" bgcolor="#FFFFFF"><strong>�Ҿߺ�ͬ���-��ǰ</strong></td>
      <td width="29%"><%=zqjjje%></td>
      <td width="22%" align="right"><strong><font color="#0000CC">�Ҿߺ�ͬ���-�ۺ�</font></strong></td>
      <td width="28%"><%=jjje%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><strong>�Ͳ��ź�ͬ���-��ǰ</strong></td>
      <td><%=zqxcmje%></td>
      <td align="right"><strong><font color="#0000CC">�Ͳ��ź�ͬ���-�ۺ�</font></strong></td>
      <td><%=xcmje%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><strong>��Ʒ�Ҿߺ�ͬ���-��ǰ</strong></td>
      <td><%=zqcpjjje%></td>
      <td align="right"><strong><font color="#0000CC">��Ʒ�Ҿߺ�ͬ���-�ۺ�</font></strong></td>
      <td><%=cpjjje%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right" bgcolor="#FFFFFF"><strong>δ���۽��</strong></td>
      <td width="29%"> <%=wdzje%></td>
      <td width="22%" align="right"><strong><font color="#0000CC">��ͬ�ܶ�</font></strong></td>
      <td width="28%"> <%=htze%></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>�����ۿ�</td>
      <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="jjzkl" size="8" maxlength="8" value="<%=jjzkl%>" onChange="f_jsjg(insertform)">
          <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">����ԭ��</td>
      <td colspan="3" bgcolor="#FFFFFF"><textarea name="dzyy" cols="73" rows="2"><%=dzyy%></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>�ƻ���װ����</td>
      <td width="29%"> 
      <input type="text" name="jhazrq" size="20" maxlength="10"  value="<%=jhazrq%>"  onDblClick="JSCalendar(this)">      </td>
      <td width="22%" align="right"><font color="#FF0033">*</font>�ɼ����ֹʱ��</td>
      <td width="28%"> 
        <input type="text" name="kjxsj" size="20" maxlength="10"  value="<%=kjxsj%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font><font color="#0000CC">ǩ��ͬ��</font></td>
      <td width="29%"> 
      <input type="text" name="qhtr" size="20" maxlength="20"  value="<%=qhtr%>" readonly>      </td>
      <td width="22%" align="right"><font color="#FF0033">*</font>ǩ��ͬʱ��</td>
      <td width="28%"> 
        <input type="text" name="qhtsj" size="20" maxlength="20"  value="<%=qhtsj%>" onDblClick="JSCalendar(this)" onBlur="f_getrq(insertform)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right" >��ͬ��ע</td>
      <td colspan="3" > 
        <textarea name="htbz" cols="73" rows="2"><%=htbz%></textarea>      </td>
    </tr>
    <tr > 
      <td colspan="4" align="center" > 
        <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
        <input type="button"  value="����" onClick="f_do(insertform)" name="button">
        <input type="reset" name="Reset" value="����">
        <input type="button"  value="¼�����" onClick="f_lrmm(insertform)" name="lrmm" >
        <input type="button"  value="�鿴����" onClick="f_ckmm(insertform)" name="ckmm" >
        <input type="button"  value="¼���Ͳ���" onClick="f_lrbgmmm(insertform)" name="lrbgmmm" >
        <input type="button"  value="�鿴�Ͳ���" onClick="f_ckbgmmm(insertform)" name="ckbgmmm" >
        <input type="button"  value="¼���Ʒ�Ҿ�" onClick="f_lrcpjj(insertform)" name="lrcpjj" >
        <input type="button"  value="�鿴��Ʒ�Ҿ�" onClick="f_ckcpjj(insertform)" name="ckcpjj" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td colspan="4" height="435"> 
	  <iframe width="100%" height="100%" src="InsertJc_jjgtmx.jsp?ddbh=<%=ddbh%>" name="childframe" marginwidth="0" marginheight="0" scrolling="YES" frameborder="0">        </iframe> </td>
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

function f_do(FormName)//����FormName:Form������
{
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
	FormName.action="SaveXgHtJc_jjdd.jsp";
	FormName.submit();
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
