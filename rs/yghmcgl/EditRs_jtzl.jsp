<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xm=null;
String gx=null;
String csnf=null;
String gzdw=null;
String zw=null;
String lxdh=null;
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
String wherexm=cf.getParameter(request,"xm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xm,gx,csnf,gzdw,zw,lxdh ";
	ls_sql+=" from  rs_jtzl";
	ls_sql+=" where  (ygbh="+whereygbh+") and  (xm='"+wherexm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xm=cf.fillNull(rs.getString("xm"));
		gx=cf.fillNull(rs.getString("gx"));
		csnf=cf.fillNull(rs.getString("csnf"));
		gzdw=cf.fillNull(rs.getString("gzdw"));
		zw=cf.fillNull(rs.getString("zw"));
		lxdh=cf.fillNull(rs.getString("lxdh"));
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
<title>�޸ļ�ͥ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_jtzl.jsp" name="editform">
<div align="center">�޸ļ�ͥ���ϣ�Ա����ţ�<%=whereygbh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <input type="text" name="xm" size="20" maxlength="20"  value="<%=xm%>" >
  </td>
  <td align="right" width="15%">��ϵ</td> 
  <td width="35%"> 
    <input type="text" name="gx" size="20" maxlength="20"  value="<%=gx%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������</td> 
  <td width="35%"> 
    <input type="text" name="csnf" size="20" maxlength="4"  value="<%=csnf%>" >
  </td>
  <td align="right" width="15%">������λ</td> 
  <td width="35%"> 
    <input type="text" name="gzdw" size="20" maxlength="100"  value="<%=gzdw%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ְ��</td> 
  <td width="35%"> 
    <input type="text" name="zw" size="20" maxlength="50"  value="<%=zw%>" >
  </td>
  <td align="right" width="15%">��ϵ�绰</td> 
  <td width="35%"> 
    <input type="text" name="lxdh" size="20" maxlength="50"  value="<%=lxdh%>" >
  </td>
</tr>
<input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
<input type="hidden" name="wherexm"  value="<%=wherexm%>" >
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
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xm)=="") {
		alert("������[����]��");
		FormName.xm.focus();
		return false;
	}
	if(	javaTrim(FormName.gx)=="") {
		alert("������[��ϵ]��");
		FormName.gx.focus();
		return false;
	}
	if(	javaTrim(FormName.csnf)=="") {
		alert("������[�������]��");
		FormName.csnf.focus();
		return false;
	}
	if(	javaTrim(FormName.gzdw)=="") {
		alert("������[������λ]��");
		FormName.gzdw.focus();
		return false;
	}
	if(	javaTrim(FormName.zw)=="") {
		alert("������[ְ��]��");
		FormName.zw.focus();
		return false;
	}
	if(	javaTrim(FormName.lxdh)=="") {
		alert("������[��ϵ�绰]��");
		FormName.lxdh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
