<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ppbm=null;
String ppmc=null;
String gysbm=null;
String gysmc=null;
String whereppbm=cf.GB2Uni(request.getParameter("ppbm"));
String wheregysbm=cf.GB2Uni(request.getParameter("gysbm"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ppbm,ppmc,gysbm,gysmc ";
	ls_sql+=" from  jxc_ppgysdzb";
	ls_sql+=" where  (ppbm="+whereppbm+") and  (gysbm="+wheregysbm+") and  (ssfgs='"+ssfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
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
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJxc_ppgysdzb.jsp" name="editform">
<div align="center">���ģ���Ʒ�ƹ�Ӧ�̶��ձ��޸�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�ֹ�˾</td>
  <td width="82%" >
  <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��Ʒ��</td> 
  <td > 
    <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:522PX">
   <%
		cf.selectItem(out,"select jxc_ppxx.ppbm,jxc_ppxx.ppmc from jxc_ppxx where ppbm='"+ppbm+"'",ppbm);
%>
  </select>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��Ӧ��</td>
  <td><select name="gysbm" style="FONT-SIZE:12PX;WIDTH:522PX">
    <option value=""></option>
	<%
	cf.selectItem(out,"select jxc_gysxx.gysbm,'('||dqmc||')'||jxc_gysxx.gysmc||DECODE(jxc_gysxx.sfhz,'Y','��������','N','����������') from jxc_gysxx,dm_dqbm where jxc_gysxx.dqbm=dm_dqbm.dqbm and jxc_gysxx.cllx='2' order by jxc_gysxx.dqbm,sfhz desc,gysmc",gysbm);
%>
  </select></td>
  </tr>

    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="whereppbm"  value="<%=whereppbm%>" >
	<input type="hidden" name="wheregysbm"  value="<%=wheregysbm%>" >
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ppbm)=="") {
		alert("������[��Ʒ�Ʊ���]��");
		FormName.ppbm.focus();
		return false;
	}
	if(!(isNumber(FormName.ppbm, "��Ʒ�Ʊ���"))) {
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("������[��Ӧ�̱���]��");
		FormName.gysbm.focus();
		return false;
	}
	if(!(isNumber(FormName.gysbm, "��Ӧ�̱���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
