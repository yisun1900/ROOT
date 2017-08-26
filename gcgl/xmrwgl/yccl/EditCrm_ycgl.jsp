<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ycdbh=null;
String khbh=null;
String ycflbm=null;
String ycfssj=null;
String zrr=null;
String ycqksm=null;
String fazdr=null;
String fazdsj=null;
String jhjjsj=null;
String jjfa=null;
String sjclr=null;
String sjclsj=null;
String sjclqk=null;
String wcsj=null;
String sfjj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String whereycdbh=cf.GB2Uni(request.getParameter("ycdbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ycdbh,khbh,ycflbm,ycfssj,zrr,ycqksm,fazdr,fazdsj,jhjjsj,jjfa,sjclr,sjclsj,sjclqk,wcsj,sfjj,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  crm_ycgl";
	ls_sql+=" where  (ycdbh='"+whereycdbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ycdbh=cf.fillNull(rs.getString("ycdbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		ycflbm=cf.fillNull(rs.getString("ycflbm"));
		ycfssj=cf.fillNull(rs.getDate("ycfssj"));
		zrr=cf.fillNull(rs.getString("zrr"));
		ycqksm=cf.fillNull(rs.getString("ycqksm"));
		fazdr=cf.fillNull(rs.getString("fazdr"));
		fazdsj=cf.fillNull(rs.getDate("fazdsj"));
		jhjjsj=cf.fillNull(rs.getDate("jhjjsj"));
		jjfa=cf.fillNull(rs.getString("jjfa"));
		sjclr=cf.fillNull(rs.getString("sjclr"));
		sjclsj=cf.fillNull(rs.getDate("sjclsj"));
		sjclqk=cf.fillNull(rs.getString("sjclqk"));
		wcsj=cf.fillNull(rs.getDate("wcsj"));
		sfjj=cf.fillNull(rs.getString("sfjj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCrm_ycgl.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�쳣�����</td> 
  <td width="35%"> 
    <input type="text" name="ycdbh" size="20" maxlength="10"  value="<%=ycdbh%>" >
  </td>
  <td align="right" width="15%">�ͻ����</td> 
  <td width="35%"> 
    <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�쳣����</td> 
  <td width="35%"> 
    <select name="ycflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ycflbm,ycflmc from dm_ycflbm order by ycflbm",ycflbm);
%>
    </select>
  </td>
  <td align="right" width="15%">�쳣����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="ycfssj" size="20" maxlength="10"  value="<%=ycfssj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="zrr" size="20" maxlength="20"  value="<%=zrr%>" >
  </td>
  <td align="right" width="15%">�쳣���˵��</td> 
  <td width="35%"> 
    <textarea name="ycqksm" cols="29" rows="6"><%=ycqksm%></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����ƶ���</td> 
  <td width="35%"> 
    <input type="text" name="fazdr" size="20" maxlength="20"  value="<%=fazdr%>" >
  </td>
  <td align="right" width="15%">�����ƶ�ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="fazdsj" size="20" maxlength="10"  value="<%=fazdsj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ƻ����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="jhjjsj" size="20" maxlength="10"  value="<%=jhjjsj%>" >
  </td>
  <td align="right" width="15%">�������</td> 
  <td width="35%"> 
    <textarea name="jjfa" cols="29" rows="6"><%=jjfa%></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ʵ�ʴ�����</td> 
  <td width="35%"> 
    <input type="text" name="sjclr" size="20" maxlength="20"  value="<%=sjclr%>" >
  </td>
  <td align="right" width="15%">ʵ�ʴ���ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="sjclsj" size="20" maxlength="10"  value="<%=sjclsj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ʵ�ʴ������</td> 
  <td width="35%"> 
    <textarea name="sjclqk" cols="29" rows="6"><%=sjclqk%></textarea>
  </td>
  <td align="right" width="15%">���ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="wcsj" size="20" maxlength="10"  value="<%=wcsj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�Ƿ���</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "sfjj","1+¼���쳣&2+�ƶ�����&3+���",sfjj);
%>
  </td>
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼��ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" >
  </td>
  <td align="right" width="15%">¼�벿��</td> 
  <td width="35%"> 
    <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh",lrbm);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td width="35%"> 
    <textarea name="bz" cols="29" rows="2"><%=bz%></textarea>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="whereycdbh"  value="<%=whereycdbh%>" >
    <tr> 
      <td colspan="4" >
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
	if(	javaTrim(FormName.ycdbh)=="") {
		alert("������[�쳣�����]��");
		FormName.ycdbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ycflbm)=="") {
		alert("��ѡ��[�쳣����]��");
		FormName.ycflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ycfssj)=="") {
		alert("������[�쳣����ʱ��]��");
		FormName.ycfssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ycfssj, "�쳣����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.ycqksm)=="") {
		alert("������[�쳣���˵��]��");
		FormName.ycqksm.focus();
		return false;
	}
	if(!(isDatetime(FormName.fazdsj, "�����ƶ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjjsj, "�ƻ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjclsj, "ʵ�ʴ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.wcsj, "���ʱ��"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfjj)) {
		alert("��ѡ��[�Ƿ���]��");
		FormName.sfjj[0].focus();
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
