<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���ܵ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<%
String tzph=request.getParameter("tzph");
String tzxh=request.getParameter("tzxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String lsh = null;
String clbm = null;
String clmc = null;
String ppmc = null;
String xh = null;
String nbbm = null;
String scph = null;
double kcsl=0;
String ckbh = null;
String hjbh = null;
String hjmc = null;
String hwbh = null;
String xhjbh = null;
try {
	conn=cf.getConnection();


	ls_sql=" select ckbh";
	ls_sql+=" from jxc_hjtzjl";
	ls_sql+=" where tzph='"+tzph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckbh=cf.fillNull(rs.getString("ckbh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select clbm,clmc,ppmc,xh,nbbm,scph,tzsl,jxc_hjtzmx.yhjbh,hjmc,yhwbh,xhjbh,ylsh";
	ls_sql+=" from jxc_hjtzmx,jxc_hjmc ";
	ls_sql+=" where jxc_hjtzmx.yhjbh=jxc_hjmc.hjbh(+) ";
	ls_sql+=" and tzph='"+tzph+"' and tzxh='"+tzxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		xh=cf.fillNull(rs.getString("xh"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		scph=cf.fillNull(rs.getString("scph"));
		kcsl=rs.getDouble("tzsl");
		hjbh=cf.fillNull(rs.getString("yhjbh"));
		hjmc=cf.fillNull(rs.getString("hjmc"));
		hwbh=cf.fillNull(rs.getString("yhwbh"));
		xhjbh=cf.fillNull(rs.getString("xhjbh"));
		lsh=cf.fillNull(rs.getString("ylsh"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJxc_hjtzmx.jsp" name="insertform">
<div align="center">���ܵ���(��������:<%=tzph%>)</div>


<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right">���ϱ���</td>
    <td><%=clbm%></td>
    <td align="right">��������</td>
    <td><%=clmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��Ʒ��</td>
    <td><%=ppmc%></td>
    <td align="right">�ͺ�</td>
    <td><%=xh%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ڲ�����</td>
    <td><%=nbbm%></td>
    <td align="right">��������</td>
    <td><%=scph%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">      ԭ��ˮ��</td>
    <td><%=lsh%></td>
    <td align="right">�������</td>
    <td><%=kcsl%></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right">ԭ����</td>
  <td><%=hjmc%></td>
  <td align="right">ԭ��λ</td>
  <td><%=hwbh%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�»���</td> 
  <td width="32%"> 
   <select name="xhjbh" style="FONT-SIZE:12PX;WIDTH:152PX">
	 <OPTION  value=""></OPTION>
    <%
	cf.selectItem(out,"select hjbh,hjmc from jxc_hjmc where ckbh='"+ckbh+"' order by hjbh",xhjbh);
%>
  </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
		<input type="hidden" name="hjbh" value="<%=hjbh%>">
		<input type="hidden" name="tzph" value="<%=tzph%>">
		<input type="hidden" name="tzxh" value="<%=tzxh%>">
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.tzph)=="") {
		alert("������[��������]��");
		FormName.tzph.focus();
		return false;
	}

	if(	javaTrim(FormName.xhjbh)=="") {
		alert("������[�»���]��");
		FormName.xhjbh.focus();
		return false;
	}

	if (FormName.hjbh.value==FormName.xhjbh.value)
	{
		alert("����[�»���]��[ԭ����]��ͬ");
		FormName.xhjbh.focus();
		return false;
	}



	FormName.submit();
	return true;
}


//-->
</SCRIPT>
