<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gys=null;
String jssj=null;
String jsr=null;
String cbzj=null;
String ycfzj=null;
String qtfzj=null;
String kcfy=null;
String jsje=null;
String jssm=null;
String cwzq=null;
String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));

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
try {
	conn=cf.getConnection();
	ls_sql="select gys,jssj,jsr,cbzj,ycfzj,qtfzj,kcfy,jsje,jssm,cwzq ";
	ls_sql+=" from  jc_fcgysjs";
	ls_sql+=" where  (jsjlh="+jsjlh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gys=cf.fillNull(rs.getString("gys"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		jsr=cf.fillNull(rs.getString("jsr"));
		cbzj=cf.fillNull(rs.getString("cbzj"));
		ycfzj=cf.fillNull(rs.getString("ycfzj"));
		qtfzj=cf.fillNull(rs.getString("qtfzj"));
		kcfy=cf.fillNull(rs.getString("kcfy"));
		jsje=cf.fillNull(rs.getString("jsje"));
		jssm=cf.fillNull(rs.getString("jssm"));
		cwzq=cf.fillNull(rs.getString("cwzq"));
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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJc_gysjs.jsp" name="editform" target="_blank">
<div align="center">���޸���Ϣ�������¼�ţ�<%=jsjlh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#0000CC">��Ӧ��</font></td> 
  <td width="32%"><%=gys%> </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">������</font></td>
  <td><input type="text" name="jsr" size="20" maxlength="20"  value="<%=jsr%>" readonly></td>
  <td align="right"><font color="#FF0000">*</font>����ʱ��</td>
  <td><input type="text" name="jssj" size="20" maxlength="10"  value="<%=jssj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">���ϳɱ�</font></td> 
  <td width="32%"><input type="text" name="cbzj" size="20" maxlength="17"  value="<%=cbzj%>" readonly></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>�۳�����</td> 
  <td width="32%"> 
    <input type="text" name="kcfy" size="20" maxlength="17"  value="<%=kcfy%>" onChange="f_jsjg(editform)">  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">������</font></td> 
  <td width="32%"> 
    <input type="text" name="jsje" size="20" maxlength="17"  value="<%=jsje%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����˵��</td> 
  <td colspan="3"> 
    <textarea name="jssm" cols="71" rows="3"><%=jssm%></textarea>    </td>
  </tr>
<input type="hidden" name="jsjlh"  value="<%=jsjlh%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	  <input type="button"  value="��ӡ" onClick="window.open('ViewJc_gysjs.jsp?jsjlh=<%=jsjlh%>')"  />
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
function f_jsjg(FormName)//����FormName:Form������
{
	var jsje=FormName.cbzj.value*1.0-FormName.kcfy.value*1.0;
	jsje=round(jsje,2);

	FormName.jsje.value=jsje;
}

function f_do(FormName)//����FormName:Form������
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.jssj)=="") {
		alert("������[����ʱ��]��");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jsr)=="") {
		alert("������[������]��");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.cbzj)=="") {
		alert("������[���ϳɱ�]��");
		FormName.cbzj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbzj, "���ϳɱ�"))) {
		return false;
	}

	if(	javaTrim(FormName.kcfy)=="") {
		alert("������[�۳�����]��");
		FormName.kcfy.focus();
		return false;
	}
	if(!(isFloat(FormName.kcfy, "�۳�����"))) {
		return false;
	}
	if(	javaTrim(FormName.jsje)=="") {
		alert("������[������]��");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
