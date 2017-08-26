<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String yddbh=null;
String smrq=null;
String zcsmyybm=null;
String azqk=null;
String lrr=null;
String lrsj=null;
String whereyddbh=cf.GB2Uni(request.getParameter("yddbh"));
String wheresmrq=cf.GB2Uni(request.getParameter("smrq"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yddbh,smrq,zcsmyybm,azqk,lrr,lrsj ";
	ls_sql+=" from  jc_mmazjl";
	ls_sql+=" where  (yddbh='"+whereyddbh+"') and  (smrq=TO_DATE('"+wheresmrq+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		smrq=cf.fillNull(rs.getDate("smrq"));
		zcsmyybm=cf.fillNull(rs.getString("zcsmyybm"));
		azqk=cf.fillNull(rs.getString("azqk"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
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
      <div align="center"> ���޸�ľ�Ű�װ��¼��Ԥ������ţ�<%=yddbh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_mmazjl.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" height="14"> 
                <div align="right">��������</div>
              </td>
              <td width="35%" height="14"> 
                <input type="text" name="smrq" size="20" maxlength="10"  value="<%=smrq%>" ondblclick="JSCalendar(this)">
              </td>
              <td width="15%" height="14"> 
                <div align="right">�ٴ�����ԭ��</div>
              </td>
              <td width="35%" height="14"> 
                <select name="zcsmyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcsmyybm,zcsmyy from jdm_zcsmyybm order by zcsmyybm",zcsmyybm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">¼����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right">¼��ʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��װ���</td>
              <td colspan="3"> 
                <textarea name="azqk" cols="71" rows="5"><%=azqk%></textarea>
              </td>
            </tr>
            <input type="hidden" name="whereyddbh"  value="<%=whereyddbh%>" >
            <input type="hidden" name="wheresmrq"  value="<%=wheresmrq%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.smrq)=="") {
		alert("������[��������]��");
		FormName.smrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.smrq, "��������"))) {
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>