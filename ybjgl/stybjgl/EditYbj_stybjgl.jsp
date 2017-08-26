<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ybjbh=null;
String mj=null;
String fgms=null;
String zxzj=null;
String lx=null;
String clzt=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String ssfgs=null;
String bz=null;
String whereybjbh=cf.GB2Uni(request.getParameter("ybjbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ybjbh,mj,fgms,zxzj,lx,clzt,lrr,lrsj,lrbm,ssfgs,bz ";
	ls_sql+=" from  ybj_stybjgl";
	ls_sql+=" where  (ybjbh='"+whereybjbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ybjbh=cf.fillNull(rs.getString("ybjbh"));
		mj=cf.fillNull(rs.getString("mj"));
		fgms=cf.fillNull(rs.getString("fgms"));
		zxzj=cf.fillNull(rs.getString("zxzj"));
		lx=cf.fillNull(rs.getString("lx"));
		clzt=cf.fillNull(rs.getString("clzt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		bz=cf.fillNull(rs.getString("bz"));
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
<form method="post" action="SaveEditYbj_stybjgl.jsp" name="editform">
<div align="center">ʵ��������޸�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>�������</td> 
  <td width="35%"> 
    <input type="text" name="ybjbh" size="20" maxlength="20"  value="<%=ybjbh%>" >  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>�����ֹ�˾</td> 
  <td width="35%"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh",ssfgs);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>���</td>
  <td><input type="text" name="mj" size="20" maxlength="17"  value="<%=mj%>" ></td>
  <td align="right"><span class="STYLE1">*</span>װ�����</td>
  <td><input type="text" name="zxzj" size="20" maxlength="17"  value="<%=zxzj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>�������</td> 
  <td colspan="3"> 
    <textarea name="fgms" cols="72" rows="6"><%=fgms%></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>����</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "lx","1+�����&2+��������",lx);
%>  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>״̬</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "clzt","1+��ʹ��&2+����",clzt);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td> 
  <td width="35%"> 
    <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"' ","");
%>
    </select>  </td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>      </td>
  </tr>
<input type="hidden" name="whereybjbh"  value="<%=whereybjbh%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
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
	if(	javaTrim(FormName.ybjbh)=="") {
		alert("������[�������]��");
		FormName.ybjbh.focus();
		return false;
	}
	if(	javaTrim(FormName.mj)=="") {
		alert("������[���]��");
		FormName.mj.focus();
		return false;
	}
	if(!(isFloat(FormName.mj, "���"))) {
		return false;
	}
	if(	javaTrim(FormName.fgms)=="") {
		alert("������[�������]��");
		FormName.fgms.focus();
		return false;
	}
	if(	javaTrim(FormName.zxzj)=="") {
		alert("������[װ�����]��");
		FormName.zxzj.focus();
		return false;
	}
	if(!(isFloat(FormName.zxzj, "װ�����"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.clzt)) {
		alert("��ѡ��[״̬]��");
		FormName.clzt[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
