<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String qhjgqjbm=null;
String qhjgqj=null;
String qshd=null;
String zzhd=null;
String mmdglxbm=null;
String whereqhjgqjbm=cf.GB2Uni(request.getParameter("qhjgqjbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select qhjgqjbm,qhjgqj,qshd,zzhd,mmdglxbm ";
	ls_sql+=" from  jdm_qhjgqj";
	ls_sql+=" where  (qhjgqjbm='"+whereqhjgqjbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		qhjgqjbm=cf.fillNull(rs.getString("qhjgqjbm"));
		qhjgqj=cf.fillNull(rs.getString("qhjgqj"));
		qshd=cf.fillNull(rs.getString("qshd"));
		zzhd=cf.fillNull(rs.getString("zzhd"));
		mmdglxbm=cf.fillNull(rs.getString("mmdglxbm"));
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
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJdm_qhjgqj.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">ľ�Ŷ�������</td>
              <td width="35%"> 
                <select name="mmdglxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx order by mmdglxbm",mmdglxbm);
%> 
                </select>
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ǽ��۸��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qhjgqjbm" size="20" maxlength="2"  value="<%=qhjgqjbm%>" >
              </td>
              <td width="15%"> 
                <div align="right">ǽ��۸�����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qhjgqj" size="20" maxlength="50"  value="<%=qhjgqj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ʼ��ȣ�>��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qshd" size="20" maxlength="8"  value="<%=qshd%>" >
                mm </td>
              <td width="15%"> 
                <div align="right">��ֹ��ȣ�<=��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zzhd" size="20" maxlength="8"  value="<%=zzhd%>" >
                mm </td>
            </tr>
            <input type="hidden" name="whereqhjgqjbm"  value="<%=whereqhjgqjbm%>" >
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="����">
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
	if(	javaTrim(FormName.mmdglxbm)=="") {
		alert("��ѡ��[ľ�Ŷ�������]��");
		FormName.mmdglxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.qhjgqjbm)=="") {
		alert("������[ǽ��۸��������]��");
		FormName.qhjgqjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.qhjgqj)=="") {
		alert("������[ǽ��۸�����]��");
		FormName.qhjgqj.focus();
		return false;
	}
	if(	javaTrim(FormName.qshd)=="") {
		alert("������[��ʼ���]��");
		FormName.qshd.focus();
		return false;
	}
	if(!(isNumber(FormName.qshd, "��ʼ���"))) {
		return false;
	}
	if(	javaTrim(FormName.zzhd)=="") {
		alert("������[��ֹ���]��");
		FormName.zzhd.focus();
		return false;
	}
	if(!(isNumber(FormName.zzhd, "��ֹ���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
