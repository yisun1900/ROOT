<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String xchfrq=null;
String hflxbm=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String clzt=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wherexchfrq=cf.GB2Uni(request.getParameter("xchfrq"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,xchfrq,hflxbm,khxm,xb,fwdz,lxfs,clzt ";
	ls_sql+=" from  crm_khhfjh";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (xchfrq=TO_DATE('"+wherexchfrq+"','yyyy-mm-dd'))  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		xchfrq=cf.fillNull(rs.getDate("xchfrq"));
		hflxbm=cf.fillNull(rs.getString("hflxbm"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		clzt=cf.fillNull(rs.getString("clzt"));
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

<form method="post" action="SaveEditCrm_khhfjh.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" >
              </td>
              <td width="15%"> 
                <div align="right">����״̬</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xchfrq" size="20" maxlength="10"  value="<%=xchfrq%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="khxm" size="20" maxlength="20"  value="<%=khxm%>" >
              </td>
              <td width="15%"> 
                <div align="right">�Ա�</div>
              </td>
              <td width="35%"> 
                <select name="xb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"M+��&W+Ů",xb);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���ݵ�ַ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="fwdz" size="20" maxlength="100"  value="<%=fwdz%>" >
              </td>
              <td width="15%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lxfs" size="20" maxlength="50"  value="<%=lxfs%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�ط�����</td>
              <td width="35%"> 
                <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm",hflxbm);
%> 
                </select>
              </td>
              <td width="15%" align="right">�ط�����</td>
              <td width="35%"> 
                <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"N+δ�ط�&Y+�ѻط�",clzt);
%> 
                </select>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <input type="hidden" name="wherexchfrq"  value="<%=wherexchfrq%>" >
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xchfrq)=="") {
		alert("������[�´λط�����]��");
		FormName.xchfrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xchfrq, "�´λط�����"))) {
		return false;
	}
	if(	javaTrim(FormName.hflxbm)=="") {
		alert("��ѡ��[�ط�����]��");
		FormName.hflxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.xb)=="") {
		alert("��ѡ��[�Ա�]��");
		FormName.xb.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.clzt)=="") {
		alert("��ѡ��[����״̬]��");
		FormName.clzt.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
