<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String pfxmbm=null;
String xjlxbm=null;
String fz=null;
String wherepfxmbm=cf.GB2Uni(request.getParameter("pfxmbm"));
String wherexjlxbm=cf.GB2Uni(request.getParameter("xjlxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select pfxmbm,xjlxbm,fz ";
	ls_sql+=" from  kp_pfzxmbm";
	ls_sql+=" where  (pfxmbm='"+wherepfxmbm+"') and  (xjlxbm='"+wherexjlxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pfxmbm=cf.fillNull(rs.getString("pfxmbm"));
		xjlxbm=cf.fillNull(rs.getString("xjlxbm"));
		fz=cf.fillNull(rs.getString("fz"));
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

<form method="post" action="SaveEditKp_pfzxmbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">������Ŀ����</div>
  </td>
  <td width="35%"> 
    <select name="pfxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select pfxmbm,pfxmmc from kp_pfxmbm order by pfxmbm",pfxmbm);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">Ѳ�����ͱ���</div>
  </td>
  <td width="35%"> 
    <select name="xjlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xjlxbm,xjlxmc from kp_xjlxbm order by xjlxbm",xjlxbm);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��ֵ</div>
  </td>
  <td width="35%"> 
    <input type="text" name="fz" size="20" maxlength="8"  value="<%=fz%>" >
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherepfxmbm"  value="<%=wherepfxmbm%>" >
<input type="hidden" name="wherexjlxbm"  value="<%=wherexjlxbm%>" >
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.pfxmbm)=="") {
		alert("��ѡ��[������Ŀ����]��");
		FormName.pfxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xjlxbm)=="") {
		alert("��ѡ��[Ѳ�����ͱ���]��");
		FormName.xjlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fz)=="") {
		alert("������[��ֵ]��");
		FormName.fz.focus();
		return false;
	}
	if(!(isNumber(FormName.fz, "��ֵ"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
