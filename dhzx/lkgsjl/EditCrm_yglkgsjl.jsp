<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ygbh=null;
String yhmc=null;
String ygbm=null;
String rylx=null;
String jhlkrq=null;
String jhlksj=null;
String jhfhsj=null;
String lkgsmd=null;
String lkgssm=null;
String sjlksj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String ssfgs=null;
String bz=null;
String jlh=cf.GB2Uni(request.getParameter("jlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ygbh,yhmc,ygbm,rylx,jhlkrq,jhlksj,jhfhsj,lkgsmd,lkgssm,sjlksj,lrr,lrsj,lrbm,ssfgs,bz ";
	ls_sql+=" from  crm_yglkgsjl";
	ls_sql+=" where jlh="+jlh ;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		ygbm=cf.fillNull(rs.getString("ygbm"));
		rylx=cf.fillNull(rs.getString("rylx"));
		jhlkrq=cf.fillNull(rs.getDate("jhlkrq"));
		jhlksj=cf.fillNull(rs.getString("jhlksj"));
		jhfhsj=cf.fillNull(rs.getString("jhfhsj"));
		lkgsmd=cf.fillNull(rs.getString("lkgsmd"));
		lkgssm=cf.fillNull(rs.getString("lkgssm"));
		sjlksj=cf.fillNull(rs.getString("sjlksj"));
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
<form method="post" action="SaveEditCrm_yglkgsjl.jsp" name="editform">
<div align="center">�뿪��˾���룭ά������¼�ţ�<%=jlh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">Ա�����</span></td> 
  <td width="32%"><input type="text" name="ygbh" size="20" maxlength="8"  value="<%=ygbh%>" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>��Ա����</td> 
  <td width="32%"><select name="rylx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select rylx c1,rylx c2 from dm_rylx order by rylx",rylx);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">Ա������</span></td> 
  <td width="32%"> 
    <input type="text" name="yhmc" size="20" maxlength="20"  value="<%=yhmc%>" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">Ա������</span></td> 
  <td width="32%"> 
    <select name="ygbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ygbm+"'",ygbm);
%>
    </select>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�ƻ��뿪����</td>
  <td><input type="text" name="jhlkrq" size="20" maxlength="10"  value="<%=jhlkrq%>" onDblClick="JSCalendar(this)"></td>
  <td align="right"><span class="STYLE1">*</span>�뿪��˾Ŀ��</td>
  <td><select name="lkgsmd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select lkgsmd c1,lkgsmd c2 from dm_lkgsmd order by lkgsmd",lkgsmd);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ƻ��뿪ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="jhlksj" size="8" maxlength="9"  value="<%=jhlksj%>" >
    <strong>��¼��Сʱ��</strong> </td>
  <td align="right" width="18%">�ƻ�����ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="jhfhsj" size="8" maxlength="9"  value="<%=jhfhsj%>" >
    <strong>��¼��Сʱ��</strong> </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�뿪��˾˵��</td>
  <td colspan="3"><textarea name="lkgssm" cols="72" rows="3"><%=lkgssm%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">�����ֹ�˾</span></td>
  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="hidden" name="jlh" value="<%=jlh%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jlh)=="") {
		alert("������[��¼��]��");
		FormName.jlh.focus();
		return false;
	}
	if(!(isNumber(FormName.jlh, "��¼��"))) {
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("������[Ա�����]��");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}
	if(	javaTrim(FormName.yhmc)=="") {
		alert("������[Ա������]��");
		FormName.yhmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbm)=="") {
		alert("��ѡ��[Ա������]��");
		FormName.ygbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rylx)=="") {
		alert("��ѡ��[��Ա����]��");
		FormName.rylx.focus();
		return false;
	}
	if(	javaTrim(FormName.jhlkrq)=="") {
		alert("������[�ƻ��뿪����]��");
		FormName.jhlkrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhlkrq, "�ƻ��뿪����"))) {
		return false;
	}
	if(	javaTrim(FormName.jhlksj)=="") {
		alert("������[�ƻ��뿪ʱ��]��");
		FormName.jhlksj.focus();
		return false;
	}
	if(!(isFloat(FormName.jhlksj, "�ƻ��뿪ʱ��"))) {
		return false;
	}
	if (FormName.jhlksj.value<0 || FormName.jhlksj.value>24)
	{
		alert("[�ƻ��뿪ʱ��]ֻ����0��24Сʱ֮�䣡");
		FormName.jhlksj.select();
		return false;
	}
	if(!(isFloat(FormName.jhfhsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if (FormName.jhfhsj.value<0 || FormName.jhfhsj.value>24)
	{
		alert("[�ƻ�����ʱ��]ֻ����0��24Сʱ֮�䣡");
		FormName.jhfhsj.select();
		return false;
	}
	if(	javaTrim(FormName.lkgsmd)=="") {
		alert("��ѡ��[�뿪��˾Ŀ��]��");
		FormName.lkgsmd.focus();
		return false;
	}
	if(	javaTrim(FormName.lkgssm)=="") {
		alert("������[�뿪��˾˵��]��");
		FormName.lkgssm.focus();
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
		alert("��ѡ��[������˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
