<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>
<%

String dwbh=null;
String xm=null;
String zw=null;
String je=null;
String wheredwbh=cf.GB2Uni(request.getParameter("dwbh"));
String wherexm=request.getParameter("xm");
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select dwbh,xm,zw,je ";
	ls_sql+=" from  oa_bgypbz";
	ls_sql+=" where  (dwbh='"+wheredwbh+"') and  (xm='"+wherexm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		xm=cf.fillNull(rs.getString("xm"));
		zw=cf.fillNull(rs.getString("zw"));
		je=cf.fillNull(rs.getString("je"));
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

<form method="post" action="SaveEditOa_bgypbz.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��λ</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2','Y0') and cxbz='N' order by ssfgs,dwbh",dwbh);
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh",dwbh);
	}
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xm" size="20" maxlength="20"  value="<%=xm%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ְλ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zw" size="20" maxlength="20"  value="<%=zw%>" >
              </td>
              <td width="15%"> 
                <div align="right">���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="je" size="20" maxlength="8"  value="<%=je%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ȡ��Χ</td>
              <td width="35%"> 
                <select name="flbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="4" multiple>
                  <option ></option>
<%
	cf.mutilSelectItem(out,"select flbm,flmc from oa_flbm order by flbm","select flbm from oa_lqfw where dwbh='"+dwbh+"' and xm='"+xm+"'");
%> 
                </select>
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <input type="hidden" name="wheredwbh"  value="<%=wheredwbh%>" >
            <input type="hidden" name="wherexm"  value="<%=wherexm%>" >
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[��λ]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xm)=="") {
		alert("������[����]��");
		FormName.xm.focus();
		return false;
	}
	if(	javaTrim(FormName.zw)=="") {
		alert("������[ְλ]��");
		FormName.zw.focus();
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("������[���]��");
		FormName.je.focus();
		return false;
	}
	if(!(isNumber(FormName.je, "���"))) {
		return false;
	}
	if(!selectChecked(FormName.flbm)) {
		alert("������[��ȡ��Χ]��");
		FormName.flbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
