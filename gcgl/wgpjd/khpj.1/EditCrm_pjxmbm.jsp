<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String pjxmbm=null;
String pjxm=null;
String spjrybm=null;
String spjry=null;
String xmflbm=null;
String xmfl=null;
String xsfs=null;
String xh=null;
String wherepjxmbm=cf.GB2Uni(request.getParameter("pjxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select pjxmbm,pjxm,spjrybm,spjry,xmflbm,xmfl,xsfs,xh ";
	ls_sql+=" from  crm_pjxmbm";
	ls_sql+=" where  (pjxmbm='"+wherepjxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pjxmbm=cf.fillNull(rs.getString("pjxmbm"));
		pjxm=cf.fillNull(rs.getString("pjxm"));
		spjrybm=cf.fillNull(rs.getString("spjrybm"));
		spjry=cf.fillNull(rs.getString("spjry"));
		xmflbm=cf.fillNull(rs.getString("xmflbm"));
		xmfl=cf.fillNull(rs.getString("xmfl"));
		xsfs=cf.fillNull(rs.getString("xsfs"));
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
<form method="post" action="SaveEditCrm_pjxmbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��������Ա</td>
      <td width="31%"> 
        <select name="spjrybm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="pjxmbm.value=spjrybm.value+xmflbm.value" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select spjrybm,spjry from crm_spjrybm order by spjrybm",spjrybm);
%> 
        </select>
      </td>
      <td align="right" width="17%">��Ŀ����</td>
      <td width="33%"> 
        <select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="pjxmbm.value=spjrybm.value+xmflbm.value">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xmflbm,xmfl from crm_xmflbm order by xmflbm",xmflbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">������Ŀ����(6λ)</td>
      <td width="31%"> 
        <input type="text" name="pjxmbm" size="20" maxlength="6"  value="<%=pjxmbm%>" >
      </td>
      <td align="right" width="17%">���</td>
      <td width="33%"> 
        <input type="text" name="xh" size="20" maxlength="8"  value="<%=xh%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">������Ŀ</td>
      <td colspan="3"> 
        <input type="text" name="pjxm" size="71" maxlength="40"  value="<%=pjxm%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ʾ��ʽ</td>
      <td colspan="3"> <%
	cf.radioToken(out, "xsfs","1+��Ŀ�����ѡ&2+��Ŀ���൥ѡ",xsfs);
%> </td>
    </tr>
    <input type="hidden" name="wherepjxmbm"  value="<%=wherepjxmbm%>" >
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
	if(	javaTrim(FormName.spjrybm)=="") {
		alert("��ѡ��[��������Ա]��");
		FormName.spjrybm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmflbm)=="") {
		alert("��ѡ��[��Ŀ����]��");
		FormName.xmflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pjxmbm)=="") {
		alert("������[������Ŀ����(6λ)]��");
		FormName.pjxmbm.focus();
		return false;
	}
	if (FormName.pjxmbm.value.length!=6)
	{
		alert("[������Ŀ����]ӦΪ6λ��");
		FormName.pjxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pjxm)=="") {
		alert("������[������Ŀ]��");
		FormName.pjxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xsfs)) {
		alert("��ѡ��[��ʾ��ʽ]��");
		FormName.xsfs[0].focus();
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
