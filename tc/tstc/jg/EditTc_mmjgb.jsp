<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
%>
<%

String dqbm=null;
String bjjbbm=null;
String tccplbbm=null;
String tccpdlbm=null;
String sfyqxtpp=null;
String jldw=null;
String bzsl=null;
String bzmj=null;
String mtmzjmj=null;
String ccbfjj=null;
String sfkjm=null;
String jmdj=null;
String sjzj=null;
String lrr=null;
String lrsj=null;
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherebjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String wheretccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,bjjbbm,tccplbbm,tccpdlbm,sfyqxtpp,jldw,bzsl,bzmj,mtmzjmj,ccbfjj,sfkjm,jmdj,sjzj,lrr,lrsj ";
	ls_sql+=" from  tc_mmjgb";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (tccplbbm="+wheretccplbbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		tccpdlbm=cf.fillNull(rs.getString("tccpdlbm"));
		sfyqxtpp=cf.fillNull(rs.getString("sfyqxtpp"));
		jldw=cf.fillNull(rs.getString("jldw"));
		bzsl=cf.fillNull(rs.getString("bzsl"));
		bzmj=cf.fillNull(rs.getString("bzmj"));
		mtmzjmj=cf.fillNull(rs.getString("mtmzjmj"));
		ccbfjj=cf.fillNull(rs.getString("ccbfjj"));
		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		jmdj=cf.fillNull(rs.getString("jmdj"));
		sjzj=cf.fillNull(rs.getString("sjzj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
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
<form method="post" action="SaveEditTc_mmjgb.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����</td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
%>
    </select>  </td>
  <td align="right" width="18%">���ۼ���</td> 
  <td width="32%"> 
    <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ʒ����</td>
  <td><select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldlbm='"+tccpdlbm+"'",tccpdlbm);
%>
  </select></td>
  <td align="right">��ƷС��</td>
  <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where cldlmc in(select cldlmc from jxc_cldlbm where cldlbm='"+tccpdlbm+"') order by clxlmc",tccplbbm);
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ�Ҫ����ͬƷ��</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyqxtpp","Y+��&N+��",sfyqxtpp);
%>  </td>
  <td align="right" width="18%">������λ</td> 
  <td width="32%"> 
    <select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldw);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��׼����</td> 
  <td width="32%"> 
    <input type="text" name="bzsl" size="20" maxlength="17"  value="<%=bzsl%>" >  </td>
  <td align="right" width="18%">��׼���</td> 
  <td width="32%"> 
    <input type="text" name="bzmj" size="20" maxlength="17"  value="<%=bzmj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ÿ���������</td> 
  <td width="32%"> 
    <input type="text" name="mtmzjmj" size="20" maxlength="17"  value="<%=mtmzjmj%>" >  </td>
  <td align="right" width="18%">�������ּӼ�</td> 
  <td width="32%"> 
    <input type="text" name="ccbfjj" size="20" maxlength="17"  value="<%=ccbfjj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ�ɼ���</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfkjm","1+���ɼ���&2+�ɼ���",sfkjm);
%>  </td>
  <td align="right" width="18%">���ⵥ��</td> 
  <td width="32%"> 
    <input type="text" name="jmdj" size="20" maxlength="17"  value="<%=jmdj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����ۼ�</td> 
  <td width="32%"> 
    <input type="text" name="sjzj" size="20" maxlength="17"  value="<%=sjzj%>" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>

<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
<input type="hidden" name="wherebjjbbm"  value="<%=wherebjjbbm%>" >
<input type="hidden" name="wheretccplbbm"  value="<%=wheretccplbbm%>" >
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("��ѡ��[��ƷС��]��");
		FormName.tccplbbm.focus();
		return false;
	}
	if(!(isNumber(FormName.tccplbbm, "��ƷС��"))) {
		return false;
	}
	if(	javaTrim(FormName.tccpdlbm)=="") {
		alert("��ѡ��[��Ʒ����]��");
		FormName.tccpdlbm.focus();
		return false;
	}
	if(!(isNumber(FormName.tccpdlbm, "��Ʒ����"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyqxtpp)) {
		alert("��ѡ��[�Ƿ�Ҫ����ͬƷ��]��");
		FormName.sfyqxtpp[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.bzsl)=="") {
		alert("������[��׼����]��");
		FormName.bzsl.focus();
		return false;
	}
	if(!(isFloat(FormName.bzsl, "��׼����"))) {
		return false;
	}
	if(	javaTrim(FormName.bzmj)=="") {
		alert("������[��׼���]��");
		FormName.bzmj.focus();
		return false;
	}
	if(!(isFloat(FormName.bzmj, "��׼���"))) {
		return false;
	}
	if(	javaTrim(FormName.mtmzjmj)=="") {
		alert("������[ÿ���������]��");
		FormName.mtmzjmj.focus();
		return false;
	}
	if(!(isFloat(FormName.mtmzjmj, "ÿ���������"))) {
		return false;
	}
	if(	javaTrim(FormName.ccbfjj)=="") {
		alert("������[�������ּӼ�]��");
		FormName.ccbfjj.focus();
		return false;
	}
	if(!(isFloat(FormName.ccbfjj, "�������ּӼ�"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfkjm)) {
		alert("��ѡ��[�Ƿ�ɼ���]��");
		FormName.sfkjm[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jmdj)=="") {
		alert("������[���ⵥ��]��");
		FormName.jmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.jmdj, "���ⵥ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzj)=="") {
		alert("������[�����ۼ�]��");
		FormName.sjzj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzj, "�����ۼ�"))) {
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
