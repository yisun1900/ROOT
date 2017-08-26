<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xuhao=null;
String kmdm=null;
String kmmc=null;
String kmlb=null;
String yefx=null;
String qm=null;
String xmfzhs=null;
String fklxbm=null;
String fkcs=null;
String jdbz=null;
String fgsbh=null;
String wherexuhao=cf.GB2Uni(request.getParameter("xuhao"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xuhao,kmdm,kmmc,kmlb,yefx,qm,xmfzhs,fklxbm,fkcs,jdbz,fgsbh ";
	ls_sql+=" from  cw_jzkmdm";
	ls_sql+=" where  (xuhao="+wherexuhao+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xuhao=cf.fillNull(rs.getString("xuhao"));
		kmdm=cf.fillNull(rs.getString("kmdm"));
		kmmc=cf.fillNull(rs.getString("kmmc"));
		kmlb=cf.fillNull(rs.getString("kmlb"));
		yefx=cf.fillNull(rs.getString("yefx"));
		qm=cf.fillNull(rs.getString("qm"));
		xmfzhs=cf.fillNull(rs.getString("xmfzhs"));
		fklxbm=cf.fillNull(rs.getString("fklxbm"));
		fkcs=cf.fillNull(rs.getString("fkcs"));
		jdbz=cf.fillNull(rs.getString("jdbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_jzkmdm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���</td> 
  <td width="35%"> 
    <input type="text" name="xuhao" size="20" maxlength="8"  value="<%=xuhao%>" >
  </td>
  <td align="right" width="15%">��Ŀ����</td> 
  <td width="35%"> 
    <input type="text" name="kmdm" size="20" maxlength="40"  value="<%=kmdm%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ŀ����</td> 
  <td width="35%"> 
    <input type="text" name="kmmc" size="20" maxlength="50"  value="<%=kmmc%>" >
  </td>
  <td align="right" width="15%">��Ŀ���</td> 
  <td width="35%"> 
    <input type="text" name="kmlb" size="20" maxlength="20"  value="<%=kmlb%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <input type="text" name="yefx" size="20" maxlength="10"  value="<%=yefx%>" >
  </td>
  <td align="right" width="15%">ȫ��</td> 
  <td width="35%"> 
    <input type="text" name="qm" size="20" maxlength="50"  value="<%=qm%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ŀ��������</td> 
  <td width="35%"> 
    <input type="text" name="xmfzhs" size="20" maxlength="50"  value="<%=xmfzhs%>" >
  </td>
  <td align="right" width="15%">�տ�����</td> 
  <td width="35%"> 
    <select name="fklxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where pzfl='1' order by fklxbm",fklxbm);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�տ�����</td> 
  <td width="35%"> 
    <select name="fkcs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs order by fkcs",fkcs);
%>
    </select>
  </td>
  <td align="right" width="15%">�����־</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "jdbz","1+�裨�˿&0+�����տ",jdbz);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ֹ�˾����</td> 
  <td width="35%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%> 
    </select>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherexuhao"  value="<%=wherexuhao%>" >
    <tr> 
      <td colspan="4" height="2">
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
	if(	javaTrim(FormName.xuhao)=="") {
		alert("������[���]��");
		FormName.xuhao.focus();
		return false;
	}
	if(!(isNumber(FormName.xuhao, "���"))) {
		return false;
	}
	if(	javaTrim(FormName.kmdm)=="") {
		alert("������[��Ŀ����]��");
		FormName.kmdm.focus();
		return false;
	}
	if(	javaTrim(FormName.kmmc)=="") {
		alert("������[��Ŀ����]��");
		FormName.kmmc.focus();
		return false;
	}
	if(!(isNumber(FormName.fkcs, "�տ�����"))) {
		return false;
	}
	if(	!radioChecked(FormName.jdbz)) {
		alert("��ѡ��[�����־]��");
		FormName.jdbz[0].focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾����]��");
		FormName.fgsbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
