<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jsjlh=null;
String khbh=null;
String bqyfkze=null;
String jsr=null;
String jssj=null;
String bz=null;
String qye=null;
String zjje=null;
String jsl=null;
String wherejsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jsjlh,khbh,bqyfkze,jsr,jssj,bz,qye,zjje,jsl ";
	ls_sql+=" from  cw_jsjl";
	ls_sql+=" where  (jsjlh='"+wherejsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		bqyfkze=cf.fillNull(rs.getString("bqyfkze"));
		jsr=cf.fillNull(rs.getString("jsr"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		bz=cf.fillNull(rs.getString("bz"));
		qye=cf.fillNull(rs.getString("qye"));
		zjje=cf.fillNull(rs.getString("zjje"));
		jsl=cf.fillNull(rs.getString("jsl"));
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
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ������Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCw_jsjl.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">�����¼��</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="jsjlh" size="20" maxlength="9"  value="<%=jsjlh%>" readonly>
              </td>
              <td width="18%" bgcolor="#CCCCFF"> 
                <div align="right">����Ӧ�տ��ܶ�</div>
              </td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <input type="text" name="bqyfkze" size="20" maxlength="17"  value="<%=bqyfkze%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">�ͻ����</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">ǩԼ��</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="qye" size="20" maxlength="17"  value="<%=qye%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">�����������</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="zjje" size="20" maxlength="17"  value="<%=zjje%>" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">���ڽ�����</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="jsl" size="18" maxlength="9"  value="<%=jsl%>" readonly>
                % </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">������</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="jsr" size="20" maxlength="20"  value="<%=jsr%>" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">����ʱ��</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="jssj" size="20" maxlength="10"  value="<%=jssj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherejsjlh"  value="<%=wherejsjlh%>" >
            <tr> 
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
                <div align="right"> </div>
              </td>
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2">&nbsp; </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jsjlh)=="") {
		alert("������[�����¼��]��");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fkbz)=="") {
		alert("��ѡ��[�����־]��");
		FormName.fkbz.focus();
		return false;
	}
	if(	javaTrim(FormName.bqyfkze)=="") {
		alert("������[����Ӧ�տ��ܶ�]��");
		FormName.bqyfkze.focus();
		return false;
	}
	if(!(isFloat(FormName.bqyfkze, "����Ӧ�տ��ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.jsr)=="") {
		alert("������[������]��");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("������[����ʱ��]��");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("������[ǩԼ��]��");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "ǩԼ��"))) {
		return false;
	}
	if(	javaTrim(FormName.zjje)=="") {
		alert("������[������]��");
		FormName.zjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjje, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.jxje)=="") {
		alert("������[������]��");
		FormName.jxje.focus();
		return false;
	}
	if(!(isFloat(FormName.jxje, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.jsl)=="") {
		alert("������[������]��");
		FormName.jsl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsl, "������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
