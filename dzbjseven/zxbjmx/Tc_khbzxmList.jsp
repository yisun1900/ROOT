<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%

	String khbh=request.getParameter("khbh");



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int row=0;


String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
String dzbjbz=null;
String fwmj=null;
String dqbm=null;
String bjbbh=null;


try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,fwmj,bjbbh";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=cf.fillNull(rs.getString("fwmj"));
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("��������: " + e);
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

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="8" align="center" class="STYLE2" ><B>��װ������Ŀ</B></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >�ͻ�������<%=khxm%></td>
    <td colspan="3" >���̸����ˣ�</td>
    <td width="27%" >�� �� ʦ��<%=sjs%></td>
	<td width="21%" >�Ƶ����ڣ�<%=cf.today()%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="12"  >�ͻ���ַ��<%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >�ͻ��绰��<%=lxfs%></td>
    <td align="left" >����ʱ�䣺</td>
	<td >���������<%=fwmj%></td>
  </tr>
      <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >ǩԼ���棺&nbsp;</td>
    <td align="left" >���Ϲ��ʣ�&nbsp;</td>
	<td >�ײͼ���&nbsp;</td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="13%">��Ŀ����</td>
	<td  width="14%">Ʒ��</td>
	<td  width="14%">�ͺ�</td>
	<td  width="4%">������λ</td>
	<td  width="4%">��������</td>
	<td  width="32%">��ע������˵��</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT tc_csrjkhbzxm.xmmc,tc_csrjkhbzxm.ppmc,tc_csrjkhbzxm.xh,tc_csrjkhbzxm.jldw,tc_csrjkhbzxm.bhsl,tc_csrjkhbzxm.bz";
	ls_sql+=" FROM tc_csrjkhbzxm  ";
    ls_sql+=" where tc_csrjkhbzxm.khbh='"+khbh+"'";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();

%> 
	</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="32">�ͻ�ǩ�֣�            </td>
    <td colspan="2" height="32">���ʦǩ�֣�</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="32">���ڣ�</td>
    <td colspan="2" height="32">���ڣ�</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="32">����Աǩ�֣�</td>
    <td colspan="2" height="32">���澭��ǩ�֣�</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="32">���ڣ�</td>
    <td colspan="2" height="32">���ڣ�</td>
</table>
</body>
</html>