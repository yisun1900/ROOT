<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String bjhm=null;
String mac=null;
String yhbm=null;
String ssfgs=null;
String lywjml=null;
String lrr=null;
String lrsj=null;
String wherebjhm=cf.GB2Uni(request.getParameter("bjhm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bjhm,mac,yhbm,ssfgs,lywjml,lrr,lrsj ";
	ls_sql+=" from  call_init";
	ls_sql+=" where  (bjhm='"+wherebjhm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bjhm=cf.fillNull(rs.getString("bjhm"));
		mac=cf.fillNull(rs.getString("mac"));
		yhbm=cf.fillNull(rs.getString("yhbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		lywjml=cf.fillNull(rs.getString("lywjml"));
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
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCall_init.jsp" name="editform">
<div align="center">��ʼ��������ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>�����ֹ�˾</td>
  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') and cxbz='N' order by dwbh",ssfgs);
%>
  </select></td>
  <td align="right"><span class="STYLE2">*</span>�û�����</td>
  <td><input type="text" name="yhbm" size="20" maxlength="30"  value="<%=yhbm%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">*</span>��������</td> 
  <td width="32%"> 
    <input type="text" name="bjhm" size="20" maxlength="30"  value="<%=bjhm%>" >  </td>
  <td align="right" width="18%"><span class="STYLE2">*</span>Mac��ַ</td> 
  <td width="32%"> 
    <input type="text" name="mac" size="20" maxlength="30"  value="<%=mac%>" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">*</span>¼���ļ�Ŀ¼</td> 
  <td colspan="3"> 
    <input type="text" name="lywjml" size="73" maxlength="100"  value="<%=lywjml%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span><span class="STYLE1">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE2">*</span><span class="STYLE1">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span><span class="STYLE1">¼�벿��</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<input type="hidden" name="wherebjhm"  value="<%=wherebjhm%>" >
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
	if(	javaTrim(FormName.bjhm)=="") {
		alert("������[��������]��");
		FormName.bjhm.focus();
		return false;
	}
	if(	javaTrim(FormName.mac)=="") {
		alert("������[Mac��ַ]��");
		FormName.mac.focus();
		return false;
	}
	if(	javaTrim(FormName.yhbm)=="") {
		alert("������[�û�����]��");
		FormName.yhbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.lywjml)=="") {
		alert("������[¼���ļ�Ŀ¼]��");
		FormName.lywjml.focus();
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
