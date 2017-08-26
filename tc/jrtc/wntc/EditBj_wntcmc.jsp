<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=null;
String tcmc=null;
String hxbm=null;
String bzmj=null;
String tcjg=null;
String pmzjdj=null;
String mjsfkzj=null;
String zcsfxxz=null;
String lx=null;

String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wheretcmc=cf.getParameter(request,"tcmc");
String wherehxbm=cf.GB2Uni(request.getParameter("hxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,tcmc,hxbm,bzmj,tcjg,pmzjdj,mjsfkzj,zcsfxxz,lx ";
	ls_sql+=" from  bj_wntcmc";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (tcmc='"+wheretcmc+"') and  (hxbm='"+wherehxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		tcmc=cf.fillNull(rs.getString("tcmc"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		bzmj=cf.fillNull(rs.getString("bzmj"));
		tcjg=cf.fillNull(rs.getString("tcjg"));
		pmzjdj=cf.fillNull(rs.getString("pmzjdj"));
		mjsfkzj=cf.fillNull(rs.getString("mjsfkzj"));
		zcsfxxz=cf.fillNull(rs.getString("zcsfxxz"));
		lx=cf.fillNull(rs.getString("lx"));
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
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">����</span></td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">����</span></td> 
  <td width="32%"><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm where hxbm='"+hxbm+"'",hxbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�ײ�����</td>
  <td colspan="3"><input type="text" name="tcmc" value="<%=tcmc%>" size="73" maxlength="50" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��׼���</td> 
  <td width="32%"> 
    <input type="text" name="bzmj" size="20" maxlength="8"  value="<%=bzmj%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�ײͼ۸�</td> 
  <td width="32%"> 
    <input type="text" name="tcjg" size="20" maxlength="17"  value="<%=tcjg%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>ƽ�����ӵ���</td> 
  <td width="32%"> 
    <input type="text" name="pmzjdj" size="20" maxlength="17"  value="<%=pmzjdj%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>����Ƿ������</td> 
  <td width="32%"><%
	cf.radioToken(out, "mjsfkzj","1+��������&2+���ӼӼۻ�",mjsfkzj);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�����Ƿ���ѡ��</td>
  <td><%
	cf.radioToken(out, "zcsfxxz","1+�Զ�ѡ��&2+�˹�ѡ��",zcsfxxz);
%></td>
  <td align="right"><span class="STYLE1">*</span>����</td>
  <td><%
	cf.radioToken(out, "lx","1+�Ҿ��ײ�&2+�����ƻ�",lx);
%></td>
</tr>
<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
<input type="hidden" name="wheretcmc"  value="<%=wheretcmc%>" >
<input type="hidden" name="wherehxbm"  value="<%=wherehxbm%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
      <input name="button" type="button" onClick="f_lrmx(editform)"  value="¼����ϸ">
      <input name="button2" type="button" onClick="f_drmx(editform)"  value="������ϸ">
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("��ѡ��[�ײ�����]��");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("��ѡ��[����]��");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bzmj)=="") {
		alert("������[��׼���]��");
		FormName.bzmj.focus();
		return false;
	}
	if(!(isNumber(FormName.bzmj, "��׼���"))) {
		return false;
	}
	if(	javaTrim(FormName.tcjg)=="") {
		alert("������[�ײͼ۸�]��");
		FormName.tcjg.focus();
		return false;
	}
	if(!(isFloat(FormName.tcjg, "�ײͼ۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.pmzjdj)=="") {
		alert("������[ƽ�����ӵ���]��");
		FormName.pmzjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.pmzjdj, "ƽ�����ӵ���"))) {
		return false;
	}
	if(	!radioChecked(FormName.mjsfkzj)) {
		alert("��ѡ��[����Ƿ������]��");
		FormName.mjsfkzj[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zcsfxxz)) {
		alert("��ѡ��[�����Ƿ���ѡ��]��");
		FormName.zcsfxxz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}

	FormName.action="SaveEditBj_wntcmc.jsp";
	FormName.submit();
	return true;
}
function f_lrmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("��ѡ��[�ײ�����]��");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("��ѡ��[����]��");
		FormName.hxbm.focus();
		return false;
	}

	FormName.action="InsertBj_wntczcmx.jsp";
	FormName.submit();
	return true;
}

function f_drmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("��ѡ��[�ײ�����]��");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("��ѡ��[����]��");
		FormName.hxbm.focus();
		return false;
	}

	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}

function f_ckmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("��ѡ��[�ײ�����]��");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("��ѡ��[����]��");
		FormName.hxbm.focus();
		return false;
	}

	FormName.action="Bj_wntczcmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
