<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhkl=null;
String kdlbz=null;
String yhmc=null;
String yhdlm=null;
String lxfs=null;
String fwdz=null;
 String zlsmqk=null;



String hth=cf.GB2Uni(request.getParameter("hth"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select kdlbz,khxm,hth,lxfs,fwdz,bz,yhdlm,yhkl ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (hth='"+hth+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		yhmc=cf.fillNull(rs.getString("khxm"));
		yhkl=cf.fillNull(rs.getString("yhkl"));
		kdlbz=cf.fillNull(rs.getString("kdlbz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		zlsmqk=cf.fillNull(rs.getString("bz"));
		
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
    <td width="100%"> <div align="center"> ϵͳ��Ȩ</div></td>
  </tr>
  <tr> 
    <td width="100%" > <div align="center"> 
        <form method="post" action="" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="20%" bgcolor="#CCCCFF" height="12"> 
                <div align="right"><font color="#FF0000">*</font>�ɵ�½ϵͳ��־</div>
              </td>
              <td width="30%" bgcolor="#CCCCFF" height="12"> <%
	cf.radioToken(out, "kdlbz","01+�ɵ�½&02+���ɵ�½",kdlbz);
%> </td>
              <td width="17%" bgcolor="#CCCCFF" height="12"> 
                <div align="right">�û�����</div></td>
              <td width="33%" bgcolor="#CCCCFF" height="12"> 
                <input type="text" name="yhmc" size="20" maxlength="50"  value="<%=yhmc%>" readonly></td>
            </tr>
            <tr> 
              <td bgcolor="#CCCCFF" width="20%">
                <div align="right"><font color="#FF0000">*</font>�û���½��</div>
              </td>
              <td bgcolor="#CCCCFF" width="30%"> 
                <input type="text" name="yhdlm" size="20" maxlength="16"  value="<%=yhdlm%>" >
              </td>
              <td bgcolor="#CCCCFF" width="17%"> 
                <div align="right">�û�����</div>
              </td>
              <td bgcolor="#CCCCFF" width="33%">
                <input type="text" name="yhkl" size="20" maxlength="20"  value="<%=yhkl%>" >
              </td>
            </tr>
            <tr> 
              <td bgcolor="#CCCCFF" width="20%">
<div align="right">�绰</div></td>
              <td colspan="3" bgcolor="#CCCCFF"><input type="text" name="dh" size="20" maxlength="30"  value="<%=lxfs%>" ></td>
            </tr>
            <tr> 
              <td bgcolor="#CCCCFF" width="20%">
<div align="right">סַ</div></td>
              <td colspan="3" bgcolor="#CCCCFF"><input type="text" name="zz" size="71" maxlength="100"  value="<%=fwdz%>"  readonly=""></td>
            </tr>
            <tr> 
              <td bgcolor="#CCCCFF" width="20%">
<div align="right">��ע</div></td>
              <td colspan="3" bgcolor="#CCCCFF"> <div align="left"> 
                  <textarea name="bz" cols="71" rows="3"><%=zlsmqk%></textarea>
                </div></td>
            </tr>
            <input type="hidden" name="hth"  value="<%=hth%>" >
            <tr> 
              <td colspan="4" height="2"> <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                </div></td>
            </tr>
          </table>
        </form>
      </div></td>
  </tr>
  <tr>
    <td >&nbsp;</td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.kdlbz)) {
		alert("��ѡ��[�ɵ�½ϵͳ��־]��");
		FormName.kdlbz[0].focus();
		return false;
	}
	if (FormName.kdlbz[0].checked)
	{
		if(	javaTrim(FormName.yhmc)=="") {
			alert("������[�û�����]��");
			FormName.yhmc.focus();
			return false;
		}
		if(	javaTrim(FormName.yhkl)=="") {
			alert("������[�û�����]��");
			FormName.yhkl.focus();
			return false;
		}
	}
	


	FormName.action="SaveEditSq_khxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
