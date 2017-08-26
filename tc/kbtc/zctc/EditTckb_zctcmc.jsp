<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tcbm=null;
String dqbm=null;
String tcmc=null;
String yj=null;
String tcj=null;
String bz=null;
String bjjbbm=null;
String wheretcbm=cf.GB2Uni(request.getParameter("tcbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tcbm,dqbm,tcmc,yj,tcj,bz,bjjbbm ";
	ls_sql+=" from  tckb_zctcmc";
	ls_sql+=" where  (tcbm="+wheretcbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tcbm=cf.fillNull(rs.getString("tcbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		tcmc=cf.fillNull(rs.getString("tcmc"));
		yj=cf.fillNull(rs.getString("yj"));
		tcj=cf.fillNull(rs.getString("tcj"));
		bz=cf.fillNull(rs.getString("bz"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
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
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" target="_blank">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">������</span></td> 
  <td width="32%"> 
    <input type="text" name="tcbm" size="20" maxlength="8"  value="<%=tcbm%>" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">����</span></td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">���ۼ���</span></td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'   order by bjjbbm","");
	%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������</td> 
  <td colspan="3"> 
    <input type="text" name="tcmc" size="73" maxlength="100"  value="<%=tcmc%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>ԭ��</td>
  <td><input type="text" name="yj" size="20" maxlength="17"  value="<%=yj%>" ></td>
  <td align="right"><span class="STYLE1">*</span>ʵ����</td>
  <td><input type="text" name="tcj" size="20" maxlength="17"  value="<%=tcj%>" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>
<input type="hidden" name="wheretcbm"  value="<%=wheretcbm%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input name="button" type="button" onClick="f_lrmx(editform)"  value="¼����ϸ">
	  <input name="button22" type="button" onClick="f_ckmx(editform)"  value="�鿴��ϸ">
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
	if(	javaTrim(FormName.tcbm)=="") {
		alert("������[������]��");
		FormName.tcbm.focus();
		return false;
	}
	if(!(isNumber(FormName.tcbm, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("������[������]��");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.yj)=="") {
		alert("������[ԭ��]��");
		FormName.yj.focus();
		return false;
	}
	if(!(isFloat(FormName.yj, "ԭ��"))) {
		return false;
	}
	if(	javaTrim(FormName.tcj)=="") {
		alert("������[ʵ����]��");
		FormName.tcj.focus();
		return false;
	}
	if(!(isFloat(FormName.tcj, "ʵ����"))) {
		return false;
	}


	FormName.action="SaveEditTckb_zctcmc.jsp";
	FormName.submit();
	return true;
}

function f_lrmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tcbm)=="") {
		alert("������[������]��");
		FormName.tcbm.focus();
		return false;
	}
	if(!(isNumber(FormName.tcbm, "������"))) {
		return false;
	}

	FormName.action="InsertTckb_zctcmx.jsp";
	FormName.submit();
	return true;
}

function f_drmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tcbm)=="") {
		alert("������[������]��");
		FormName.tcbm.focus();
		return false;
	}
	if(!(isNumber(FormName.tcbm, "������"))) {
		return false;
	}

	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}

function f_ckmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tcbm)=="") {
		alert("������[������]��");
		FormName.tcbm.focus();
		return false;
	}
	if(!(isNumber(FormName.tcbm, "������"))) {
		return false;
	}

	FormName.action="Tckb_zctcmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
