<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");

String gysbm=null;
String dqbm=null;
String gysmc=null;
String gysdz=null;
String gysfzr=null;
String gysdh=null;
String gyscz=null;
String email=null;
String cwdm=null;
String bz=null;
String gyslx=null;
String sfhz=null;
String cllx=null;


String wheregysbm=cf.GB2Uni(request.getParameter("gysbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cllx,gysbm,dqbm,gysmc,gysdz,gysfzr,gysdh,gyscz,email,cwdm,bz,gyslx,sfhz ";
	ls_sql+=" from  jxc_gysxx";
	ls_sql+=" where  (gysbm="+wheregysbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cllx=cf.fillNull(rs.getString("cllx"));
		sfhz=cf.fillNull(rs.getString("sfhz"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		gysdz=cf.fillNull(rs.getString("gysdz"));
		gysfzr=cf.fillNull(rs.getString("gysfzr"));
		gysdh=cf.fillNull(rs.getString("gysdh"));
		gyscz=cf.fillNull(rs.getString("gyscz"));
		email=cf.fillNull(rs.getString("email"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		bz=cf.fillNull(rs.getString("bz"));
		gyslx=cf.fillNull(rs.getString("gyslx"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">��Ӧ�̱���</span></td>
    <td><input type="text" name="gysbm" size="10" maxlength="8"  value="<%=gysbm%>" readonly>
      �������޸ģ�</td>
    <td align="right">�������</td>
    <td><input type="text" name="cwdm" size="20" maxlength="20"  value="<%=cwdm%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��Ӧ������</td>
  <td colspan="3"><input type="text" name="gysmc" size="73" maxlength="50"  value="<%=gysmc%>" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ����</td>
  <td>
<%
	cf.radioToken(out,"sfhz","Y+����&N+������",sfhz);
%>  </td>
  <td align="right"><span class="STYLE1">*</span>��Ӧ��������</td>
  <td><%
	cf.radioToken(out,"cllx","2+����",cllx);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
  </select></td>
  <td align="right" width="19%"><span class="STYLE1">*</span>��Ӧ������</td> 
  <td width="31%"><select name="gyslx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+����Ʒ������&1+��湩����&2+���ù�����",gyslx);
%>
    </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ�̵�ַ</td> 
  <td colspan="3"><input type="text" name="gysdz" size="73" maxlength="100"  value="<%=gysdz%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ�̸�����</td> 
  <td width="32%"> 
    <input type="text" name="gysfzr" size="20" maxlength="20"  value="<%=gysfzr%>" >  </td>
  <td align="right" width="19%">��Ӧ�̵绰</td> 
  <td width="31%"> 
    <input type="text" name="gysdh" size="20" maxlength="50"  value="<%=gysdh%>" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ�̴���</td> 
  <td width="32%"> 
    <input type="text" name="gyscz" size="20" maxlength="50"  value="<%=gyscz%>" >  </td>
  <td align="right" width="19%">EMail</td> 
  <td width="31%"> 
    <input type="text" name="email" size="20" maxlength="50"  value="<%=email%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע</td>
  <td colspan="3"><textarea name="bz" cols="72" rows="2"><%=bz%></textarea>  </td>
</tr>
<input type="hidden" name="wheregysbm"  value="<%=wheregysbm%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <p>
	    <input type="button"  value="����" onClick="f_do(editform)">
	    <input type="reset"  value="����">
	  </p>
	  <p>
	    <input type="button"  value="��Ʒ�ƹ�Ӧ�̶��ձ�" onClick="f_dzb(editform)" >
	    <input type="button"  value="¼����ϵ��" onClick="f_lr(editform)" name="lr" >
	    <input type="button"  value="�鿴��ϵ��" onClick="f_ck(editform)" name="ck" >
	  </p>
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
	if(	javaTrim(FormName.gysbm)=="") {
		alert("������[��Ӧ�̱���]��");
		FormName.gysbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfhz)) {
		alert("��ѡ��[�Ƿ����]��");
		FormName.sfhz[0].focus();
		return false;
	}
	if(	javaTrim(FormName.cllx)=="") {
		alert("������[��Ӧ��������]��");
		FormName.cllx.focus();
		return false;
	}
	if(!(isNumber(FormName.gysbm, "��Ӧ�̱���"))) {
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("������[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysmc)=="") {
		alert("������[��Ӧ������]��");
		FormName.gysmc.focus();
		return false;
	}



	FormName.target="";
	FormName.action="SaveEditJxc_gysxx.jsp";
	FormName.submit();
	return true;
}

function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("������[��Ӧ�̱���]��");
		FormName.gysbm.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="InsertJxc_gyslxr.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("������[��Ӧ�̱���]��");
		FormName.gysbm.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="Jxc_gyslxrList.jsp";
	FormName.submit();
	return true;
}

function f_dzb(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("������[��Ӧ�̱���]��");
		FormName.gysbm.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="InsertJxc_ppgysdzb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
