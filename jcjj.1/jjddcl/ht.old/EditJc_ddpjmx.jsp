<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gtxh=null;
String ddbh=null;
String jjpjmcbm=null;
String pjxh=null;
String pjcd=null;
String pjkd=null;
String pjgd=null;
String sl=null;
String dj=null;
String je=null;
String bz=null;
String xinghao=null;
String wherepjxh=cf.GB2Uni(request.getParameter("pjxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gtxh,ddbh,jjpjmcbm,pjxh,pjcd,pjkd,pjgd,sl,dj,je,bz,xinghao ";
	ls_sql+=" from  jc_ddpjmx";
	ls_sql+=" where  (pjxh='"+wherepjxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gtxh=cf.fillNull(rs.getString("gtxh"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		jjpjmcbm=cf.fillNull(rs.getString("jjpjmcbm"));
		pjxh=cf.fillNull(rs.getString("pjxh"));
		pjcd=cf.fillNull(rs.getString("pjcd"));
		pjkd=cf.fillNull(rs.getString("pjkd"));
		pjgd=cf.fillNull(rs.getString("pjgd"));
		sl=cf.fillNull(rs.getString("sl"));
		dj=cf.fillNull(rs.getString("dj"));
		je=cf.fillNull(rs.getString("je"));
		bz=cf.fillNull(rs.getString("bz"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸Ĺ������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_ddpjmx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" readonly>
              </td>
              <td width="18%"> 
                <div align="right">�������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="gtxh" size="20" maxlength="8"  value="<%=gtxh%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�������</div>
              </td>
              <td width="31%"> 
                <select name="jjpjmcbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jjpjmcbm,jjpjmc from jdm_jjpjmcbm order by jjpjmcbm",jjpjmcbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">����ͺ�</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xinghao" size="20" maxlength="20"  value="<%=xinghao%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">������ȣ�mm��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="pjcd" size="20" maxlength="8"  value="<%=pjcd%>" >
              </td>
              <td width="18%"> 
                <div align="right">�����ȣ�mm��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="pjkd" size="20" maxlength="8"  value="<%=pjkd%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">����߶ȣ�mm��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="pjgd" size="20" maxlength="8"  value="<%=pjgd%>" >
              </td>
              <td width="18%"> 
                <div align="right">����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="sl" size="20" maxlength="8"  value="<%=sl%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="dj" size="20" maxlength="8"  value="<%=dj%>" >
              </td>
              <td width="18%"> 
                <div align="right">���</div>
              </td>
              <td width="32%"> 
                <input type="text" name="je" size="20" maxlength="8"  value="<%=je%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherepjxh"  value="<%=wherepjxh%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="hidden" name="pjxh" size="20" maxlength="20"  value="<%=pjxh%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                </div>
              </td>
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
	if(	javaTrim(FormName.gtxh)=="") {
		alert("������[�������]��");
		FormName.gtxh.focus();
		return false;
	}
	if(!(isNumber(FormName.gtxh, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.jjpjmcbm)=="") {
		alert("��ѡ��[�������]��");
		FormName.jjpjmcbm.focus();
		return false;
	}
	if(!(isNumber(FormName.pjcd, "������ȣ�mm��"))) {
		return false;
	}
	if(!(isNumber(FormName.pjkd, "�����ȣ�mm��"))) {
		return false;
	}
	if(!(isNumber(FormName.pjgd, "����߶ȣ�mm��"))) {
		return false;
	}
	if(!(isNumber(FormName.sl, "����"))) {
		return false;
	}
	if(!(isNumber(FormName.dj, "����"))) {
		return false;
	}
	if(!(isNumber(FormName.je, "���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
