<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>�ͻ�Ͷ�ߡ��绰�طü�¼��</title>
</head>
<%
String khbh=null;
String crm_khxx_hth=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_sjs=null;
String crm_khxx_sjkgrq=null;
String crm_khxx_sjjgrq=null;
String crm_khxx_sgbz=null;
String crm_khxx_zjxm=null;
String wherecrm_khxx_khbh=null;
wherecrm_khxx_khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
//���ݿͻ����ȡ�ÿͻ�������Ϣ
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select distinct crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.sjs,crm_khxx.hth  ,";
	ls_sql+="crm_khxx.sjkgrq,crm_khxx.sjjgrq,crm_khxx.sgbz,crm_khxx.zjxm,crm_khxx.tsjlh ";
    ls_sql+="from crm_khxx ";
	ls_sql+="where crm_khxx.khbh='"+wherecrm_khxx_khbh+"'";
	//out.println(ls_sql);
//ls_sql+="crm_tsjl.tsnr,crm_tsjl.slsj,crm_tsjl.slr,";
//ls_sql+="crm_tsclqk.clqk,crm_tsclqk.lrr";
//ls_sql+="from crm_khxx,crm_tsjl,crm_tsclqk";
//ls_sql+="where crm_khxx.tsjlh=crm_tsjl.tsjlh(+) and crm_tsjl.tsjlh=crm_tsclqk.tsjlh(+)";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		 khbh=cf.fillNull(rs.getString("khbh"));
		crm_khxx_hth=cf.fillNull(rs.getString("hth"));
		crm_khxx_khxm=cf.fillNull(rs.getString("khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("lxfs"));
		crm_khxx_sjs=cf.fillNull(rs.getString("sjs"));
		crm_khxx_sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		crm_khxx_sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		crm_khxx_sgbz=cf.fillNull(rs.getString("sgbz"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("zjxm"));
		
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

<%
//���ݿͻ���ź�Ͷ�߼�¼��ȡ��Ͷ�ߺʹ������

int xh=0;
String tsnr[]={"","","","",""};
String slsj[]={"","","","",""};
String slr[]={"","","","",""};

String clqk[]={"","","","",""};
String clsj[]={"","","","",""};
String lrr[]={"","","","",""};

ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select crm_tsjl.tsnr,crm_tsjl.slsj,crm_tsjl.slr,crm_tsclqk.clqk,crm_tsclqk.clsj,crm_tsclqk.lrr ";
    ls_sql+="from crm_tsjl,crm_tsclqk ";
    ls_sql+="where crm_tsjl.khbh='"+wherecrm_khxx_khbh+"' and crm_tsjl.tsjlh=crm_tsclqk.tsjlh(+)";
	//out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		 
		
		tsnr[xh]=cf.fillNull(rs.getString("tsnr"));
		slsj[xh]=cf.fillNull(rs.getDate("slsj"));
		 slr[xh]=cf.fillNull(rs.getString("slr"));

		clqk[xh]=cf.fillNull(rs.getString("clqk"));
		clsj[xh]=cf.fillNull(rs.getDate("clsj"));
		 lrr[xh]=cf.fillNull(rs.getString("lrr"));
		 xh++;
		 
	}
}
catch (Exception e) {
	out.print("����: " + e);
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
<body>
<p class="style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
<b><font size="6">ҵ ֮ �� װ �� �� �� ��˾</font></b></p> 
<p class="style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
<font size="5">&nbsp;&nbsp;&nbsp�ͻ�Ͷ�ߡ��绰�طü�¼��</font></p>
<p class="style11">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp��ͬ��ţ�<%=crm_khxx_hth%></p>
<table width="648" height="586" border="1" cellspacing="0">
  <tr bordercolor="#D6D3CE">
    <td colspan="2" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style8"><font face="����">�ͻ�����&nbsp;</font></span></td>
    <td width="94" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style9"><font face="����">&nbsp;<%=crm_khxx_khxm%> </font></span></td>
    <td width="88" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style8"><font face="����">���̵�ַ</font></span></td>
    <td colspan="4" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style9"><font face="����">&nbsp;<%=crm_khxx_fwdz%></font></span></td>
  </tr>
  <tr bordercolor="#D6D3CE">
    <td colspan="2" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style8"><font face="����">��ϵ�绰</font></span></td>
    <td colspan="4" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style9"><font face="����">&nbsp;<%=crm_khxx_lxfs%></font></span></td>
    <td width="50" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style8"><font face="����">���ʦ</font></span></td>
    <td width="119" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style9"><font face="����">&nbsp;<%=crm_khxx_sjs%></font></span></td>
  </tr>
  <tr bordercolor="#D6D3CE">
    <td colspan="2" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style8"><font face="����">����������</font></span></td>
    <td colspan="2" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style9"><font face="����">&nbsp;<%=crm_khxx_sjkgrq%>��<%=crm_khxx_sjjgrq%></font></span></td>
    <td width="51" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style8"><font face="����">����</font></span></td>
    <td width="97" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style9"><font face="����">&nbsp;<%=crm_khxx_sgbz%></font></span></td>
    <td bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style8"><font face="����">Ѳ��</font></span></td>
    <td bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style9"><font face="����">&nbsp;<%=crm_khxx_sjs%></font></span></td>
  </tr>
  <tr bordercolor="#D6D3CE">
    <td width="23" rowspan="5" bordercolorlight="#000000" bordercolordark="#000000" height="248">
	<p class="style3"><font face="����">��</font></p>
    <p class="style3"><font face="����">��</font></p>
    <p class="style3"><font face="����">Ͷ</font></p>
    <p class="style3"><font face="����">��</font></p>
    <p class="style3"><font face="����">��</font></p>
    <p class="style3"><font face="����">¼</font></p></td>
    <td width="63" height="46" bordercolorlight="#000000" bordercolordark="#000000"><font face="����">��һ��</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="46"><font face="����">&nbsp;<%=tsnr[0]%><p><font face="����"><p align="right">��¼�ˣ�<%=slr[0]%>&nbsp;&nbsp;&nbsp;<%=slsj[0]%></font></p></font></td>
  </tr>
  <tr>
    <td height="44" bordercolorlight="#000000" bordercolordark="#000000"><font face="����">�ڶ���</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="44"><font face="����">&nbsp;<%=tsnr[1]%><p><font face="����"><p align="right">��¼�ˣ�<%=slr[1]%>&nbsp;&nbsp;&nbsp;<%=slsj[1]%></font></p></font></td>
  </tr>
  <tr>
    <td bordercolorlight="#000000" bordercolordark="#000000" height="45"><font face="����">������</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="45"><font face="����">&nbsp;<%=tsnr[2]%><p><font face="����"><p align="right">��¼�ˣ�<%=slr[2]%>&nbsp;&nbsp;&nbsp;<%=slsj[2]%></font></p></font></td>
  </tr>
  <tr>
    <td height="46" bordercolorlight="#000000" bordercolordark="#000000"><font face="����">���Ĵ�</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="46"><font face="����">&nbsp;<%=tsnr[3]%><p><font face="����"><p align="right">��¼�ˣ�<%=slr[3]%>&nbsp;&nbsp;&nbsp;<%=slsj[3]%></font></p></font></td>
  </tr>
  <tr>
    <td height="51" bordercolorlight="#000000" bordercolordark="#000000"><font face="����">�����</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="51"><font face="����">&nbsp;<%=tsnr[4]%><p><font face="����"><p align="right">��¼�ˣ�<%=slr[4]%>&nbsp;&nbsp;&nbsp;<%=slsj[4]%></font></p></font></td>
  </tr>
  <tr bordercolor="#D6D3CE">
    <td rowspan="5" bordercolorlight="#000000" bordercolordark="#000000" height="249">
	<p class="style3"><font face="����">��</font></p>
    <p class="style3"><font face="����">��</font></p>
    <p class="style3"><font face="����">��</font></p>
    <p class="style3"><font face="����">��</font></p></td>
    <td width="63" bordercolorlight="#000000" bordercolordark="#000000" height="51"><font face="����">��һ��</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="51"><font face="����">&nbsp;<%=clqk[0]%><p><font face="����"><p align="right">��¼�ˣ�<%=lrr[0]%>&nbsp;&nbsp;&nbsp;<%=clsj[0]%></font></p></font></td>
  </tr>
  <tr>
    <td bordercolorlight="#000000" bordercolordark="#000000" height="40"><font face="����">�ڶ���</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="40"><font face="����">&nbsp;<%=clqk[1]%><p><font face="����"><p align="right">��¼�ˣ�<%=lrr[1]%>&nbsp;&nbsp;&nbsp;<%=clsj[1]%></font></p></font></td>
  </tr>
  <tr>
    <td bordercolorlight="#000000" bordercolordark="#000000" height="47"><font face="����">������</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="47"><font face="����">&nbsp;<%=clqk[2]%><p><font face="����"><p align="right">��¼�ˣ�<%=lrr[2]%>&nbsp;&nbsp;&nbsp;<%=clsj[2]%></font></p></font></td>
  </tr>
  <tr>
    <td bordercolorlight="#000000" bordercolordark="#000000" height="46"><font face="����">���Ĵ�</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="46"><font face="����">&nbsp;<%=clqk[3]%><p><font face="����"><p align="right">��¼�ˣ�<%=lrr[3]%>&nbsp;&nbsp;&nbsp;<%=clsj[3]%></font></p></font></td>
  </tr>
  <tr>
    <td height="49" bordercolorlight="#000000" bordercolordark="#000000"><font face="����">�����</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="49"><font face="����">&nbsp;<%=clqk[4]%><p><font face="����"><p align="right">��¼�ˣ�<%=lrr[4]%>&nbsp;&nbsp;&nbsp;<%=clsj[4]%></font></p></font></td>
  </tr>
</table>
<p>���ʱ�䣺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p> 
<p>�鵵ʱ�䣺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
�绰�ط�Աǩ�֣�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p> 
</body>
</html>
