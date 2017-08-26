<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dxpjzbbm=null;
String pfbm=null;
String pfmc=null;
String df=null;
String xh=null;
String wheredxpjzbbm=cf.GB2Uni(request.getParameter("dxpjzbbm"));
String wherepfbm=cf.GB2Uni(request.getParameter("pfbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dxpjzbbm,pfbm,pfmc,df,xh ";
	ls_sql+=" from  hdm_pjzbpf";
	ls_sql+=" where dxpjzbbm='"+wheredxpjzbbm+"' and pfbm='"+wherepfbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dxpjzbbm=cf.fillNull(rs.getString("dxpjzbbm"));
		pfbm=cf.fillNull(rs.getString("pfbm"));
		pfmc=cf.fillNull(rs.getString("pfmc"));
		df=cf.fillNull(rs.getString("df"));
		xh=cf.fillNull(rs.getString("xh"));
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
<form method="post" action="SaveEditHdm_pjzbpf.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">�طö�������ָ��</td>
  <td colspan="3"><select name="dxpjzbbm" style="FONT-SIZE:12PX;WIDTH:525PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select hdm_dxpjzb.dxpjzbbm,hdm_dxpjzb.dxpjzb||'---��'||hfdxmc||'��' from hdm_dxpjzb,hdm_hfdxbm where hdm_dxpjzb.hfdxbm=hdm_hfdxbm.hfdxbm order by hdm_dxpjzb.hfdxbm,hdm_dxpjzb.dxpjzbbm",dxpjzbbm);
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ֱ���</td> 
  <td width="32%"><input type="text" name="pfbm" size="20" maxlength="1"  value="<%=pfbm%>" ></td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"><input type="text" name="pfmc" size="20" maxlength="50"  value="<%=pfmc%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�÷�</td> 
  <td width="32%"><input type="text" name="df" size="20" maxlength="17"  value="<%=df%>" ></td>
  <td align="right" width="15%">���</td> 
  <td width="35%"><input type="text" name="xh" size="20" maxlength="8"  value="<%=xh%>" ></td>
</tr>

    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="wheredxpjzbbm"  value="<%=wheredxpjzbbm%>" >
	<input type="hidden" name="wherepfbm"  value="<%=wherepfbm%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
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
	if(	javaTrim(FormName.dxpjzbbm)=="") {
		alert("��ѡ��[�طö�������ָ�����]��");
		FormName.dxpjzbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pfbm)=="") {
		alert("������[���ֱ���]��");
		FormName.pfbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pfmc)=="") {
		alert("������[��������]��");
		FormName.pfmc.focus();
		return false;
	}
	if(	javaTrim(FormName.df)=="") {
		alert("������[�÷�]��");
		FormName.df.focus();
		return false;
	}
	if(!(isFloat(FormName.df, "�÷�"))) {
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("������[���]��");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
