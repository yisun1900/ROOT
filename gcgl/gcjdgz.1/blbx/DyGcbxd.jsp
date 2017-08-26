<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zgsmc=(String)session.getAttribute("zgsmc");
%>
<%

String crm_khxx_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_sjkgrq=null;
String crm_khxx_sjjgrq=null;
String crm_khxx_bxjzsj=null;
String crm_khxx_sgd=null;
String crm_khxx_sgbz=null;
String crm_khxx_zjxm=null;
String wherecrm_khxx_khbh=null;
wherecrm_khxx_khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select crm_khxx.khbh as crm_khxx_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.sjkgrq as crm_khxx_sjkgrq,crm_khxx.sjjgrq as crm_khxx_sjjgrq,crm_khxx.bxjzsj as crm_khxx_bxjzsj,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.sgbz as crm_khxx_sgbz,crm_khxx.zjxm as crm_khxx_zjxm ";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+wherecrm_khxx_khbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		crm_khxx_khbh=cf.fillNull(rs.getString("crm_khxx_khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_sjkgrq=cf.fillNull(rs.getDate("crm_khxx_sjkgrq"));
		crm_khxx_sjjgrq=cf.fillNull(rs.getDate("crm_khxx_sjjgrq"));
		crm_khxx_bxjzsj=cf.fillNull(rs.getDate("crm_khxx_bxjzsj"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_sgbz=cf.fillNull(rs.getString("crm_khxx_sgbz"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>���̱��޵�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.style1 {	font-size: 36px;
	font-weight: bold;
}
.style2 {	font-size: 24px;
	font-weight: bold;
}
.style5 {font-size: 16px; font-weight: bold; }
.style7 {font-size: 16px}
.style8 {font-size: 16px; font-weight: bold; }
.style9 {font-size: 20px}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><div align="center" class="style1"><%=zgsmc%>װ�����޹�˾</div></td>
  </tr>
  <tr>
    <td><div align="center"></div></td>
  </tr>
  <tr>
    <td><div align="center" class="style2">���̱��޵�</div></td>
  </tr>
</table>
<br>
<table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#000000">
  <tr bgcolor="#FFFFFF">
    <td width="16%" height="40"><div align="center"><span class="style5">�ͻ�����</span></div></td>
    <td width="16%" height="40"><span class="style7">&nbsp;<%=crm_khxx_khxm%> </span></td>
    <td width="16%" height="40"><div align="center" class="style5">��ͬ���</div></td>
    <td width="16%" height="40" class="style7">&nbsp;<%=crm_khxx_hth%></td>
    <td width="16%" height="40" class="style5"><div align="center">�ͻ����</div></td>
    <td width="16%" height="40" class="style7">&nbsp;<%=crm_khxx_khbh%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="16%" height="40"><div align="center"><span class="style5">��ϵ��ʽ</span></div></td>
    <td height="40" colspan="3" class="style7">&nbsp;<%=crm_khxx_lxfs%></td>
    <td width="16%" height="40" class="style5"><div align="center">��&nbsp;��&nbsp;ʦ</div></td>
    <td width="16%" height="40" class="style7">&nbsp;<%=crm_khxx_sjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="16%" height="40"><div align="center"><span class="style5">���̵�ַ</span></div></td>
    <td height="40" colspan="3" class="style7">&nbsp;<%=crm_khxx_fwdz%></td>
    <td width="16%" height="40" class="style5"><div align="center">Ѳ&nbsp;&nbsp;&nbsp;&nbsp;��</div></td>
    <td width="16%" height="40" class="style7">&nbsp;<%=crm_khxx_zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="16%" height="40"><div align="center"><span class="style5">��&nbsp;&nbsp;&nbsp;&nbsp;��</span></div></td>
    <td height="40" colspan="2" class="style7">&nbsp;<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd  order by sgd",crm_khxx_sgd,true);
%></td>
    <td width="16%" height="40" class="style5"><div align="center">��&nbsp;&nbsp;&nbsp;&nbsp;��</div></td>
    <td height="40" colspan="2" class="style7">&nbsp;<%=crm_khxx_sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="16%" height="40"><div align="center"><span class="style5">��������</span></div></td>
    <td height="40" colspan="2" class="style7">&nbsp;<%=crm_khxx_sjkgrq%></td>
    <td width="16%" height="40" class="style5"><div align="center">��������</div></td>
    <td height="40" colspan="2" class="style7">&nbsp;<%=crm_khxx_sjjgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="16%" height="40"><div align="center"><span class="style5">��������</span></div></td>
    <td height="40" colspan="5" class="style7" align="center">&nbsp;<%=crm_khxx_sjjgrq%>&nbsp;��&nbsp;<%=crm_khxx_bxjzsj%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���˴���д����������Ч��</td>
  </tr>
</table>
<br>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr class="style5">
    <td width="50%" height="60">�׷������ͻ���ǩ�֣�</td>
    <td width="50%" height="60">�ҷ�������˾��ǩ�֣����£���</td>
  </tr>
  <tr class="style5">
    <td width="50%" height="60">ǩ�����ڣ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
    <td width="50%" height="60">ǩ�����ڣ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
  </tr>
</table>
<br>
<br>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="40"><span class="style7">��ע��</span></td>
  </tr>
  <tr>
    <td height="40"><p class="style7">1.�ӿ�������֮������㣬������Ϊ���ꣻ����������ʵ�гɱ�ά�ޡ�<br>
    </p></td>
  </tr>
  <tr>
    <td height="40"><span class="style7">2.�������������ҷ�ʩ����������������⣬�ҷ��������ؽ���ά�ޣ�ά�޷����ҷ��е���</span></td>
  </tr>
  <tr>
    <td height="40"><span class="style7">3.�������������׷�ʹ�ò������װ�����𻵻�������ʹ�ã��ҷ������շѡ�</span></td>
  </tr>
  <tr>
    <td height="40"><span class="style7">4.���޷�ΧΪ���۵���������ϵĹ�����Ŀ��</span></td>
  </tr>
  <tr>
    <td height="40"><span class="style7">5.�����޵��ڼ׷�ǩ�֡��ҷ�ǩ�ָ��º���Ч��</span></td>
  </tr>
  <tr>
    <td height="40"><span class="style7">6.����Ϳ����Ч�������Ҫ�Ķ������뾭�ҷ�����������ǩ�ָ��º������Ч��</span></td>
  </tr>
  <tr>
    <td height="40"><span class="style7">7.����һʽ���ݣ��׷����ҷ���˾�鵵��һ�ݡ�</span></td>
  </tr>
  <tr>
    <td height="40">&nbsp;</td>
  </tr>
  <tr>
    <td height="40"><div align="center" class="style8">�ҷ�ά�޵绰��<span class="style9">68716766&nbsp;&nbsp;800-610-2868</span></div></td>
  </tr>
</table>
</body>
</html>

