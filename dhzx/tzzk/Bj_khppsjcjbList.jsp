<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<style>
@media print{
	INPUT {display:none}
}
.STYLE2 {font-size: 18px}
</style>

</head>


<%
//���������ռ䡢����С����ʾ

String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String jldwmc=null;
double dj=0;
double qye=0;
String gycl=null;
String flmcgg=null;
String bjbz=null;
double xjqye=0;
double zjqye=0;
double allqye=0;
double allsl=0;
double allzj=0;

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


%>
<body >

<TABLE border="0" cellspacing="0" cellpadding="0" width="100%" cellspacing="0 style='FONT-SIZE: 14px'">

<THEAD bgcolor="#FFFFFF" style="display:table-header-group;font-weight:bold">
<tr><td>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="8" align="center" class="STYLE2" ><B>�ײͣ�����Ʒ�������嵥&nbspLWTC-03</B></td>
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



<center>Ʒ�������Ż�</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td  width="6%" align="center">�ռ�</td>
    <td  width="10%" align="center">��Ʒ���</td>
    <td  width="10%" align="center">��������</td>
    <td  width="10%" align="center">Ʒ��</td>
	<td  width="3%">&nbsp;</td>
	<td  width="3%">&nbsp;</td>
	<td  width="10%" align="center">��������</td>
    <td  width="8%" align="center">��������</td>
    <td  width="8%" align="center">������۽��</td>
    <td  width="8%" align="center">����</td>
  </tr>

	
<%
		String tccplbbm=null;
		String tccplbmc=null;
		String tcsjflbm=null;
		String tcsjflmc=null;
		String xh=null;
		String gg=null;
		String jldw=null;
		double bzsl=0;
		double sjsl=0;
		double sjjshsl=0;
		double sjcj=0;
		double sjcjje=0;
		String ptcpsm=null;
		String bjjbmc=null;
		String khbjjbbm=null;
		String bjjbbm=null;
		String sjsfycx=null;
	String ppmc=null;

	double xjje=0;
	double xjsl=0;
	ls_sql="SELECT bj_khppsjcjb.jgwzbm,clxlmc,ppmc,bj_khppsjcjb.tccplbbm,bj_khppsjcjb.tcsjflbm,tcsjflmc,bjjbmc,bj_khppsjcjb.khbjjbbm,bj_khppsjcjb.bjjbbm,bj_khppsjcjb.sjsfsl,bj_khppsjcjb.sjcj,bj_khppsjcjb.sjsfje";
	ls_sql+=" FROM bj_khppsjcjb,bj_khzcxmxj,bj_tcsjflbm,jxc_clxlbm,bdm_bjjbbm ";
    ls_sql+=" where bj_khppsjcjb.tcsjflbm=bj_tcsjflbm.tcsjflbm and bj_khppsjcjb.tccplbbm=jxc_clxlbm.clxlbm";

    ls_sql+=" and bj_khppsjcjb.khbh=bj_khzcxmxj.khbh";
    ls_sql+=" and bj_khppsjcjb.jgwzbm=bj_khzcxmxj.jgwzbm";
    ls_sql+=" and bj_khppsjcjb.tccplbbm=bj_khzcxmxj.tccplbbm";
	ls_sql+=" and bj_khzcxmxj.sfyxsj='Y' ";//�����Ƿ��շ�  Y���ǣ�N����

	
	ls_sql+=" and bj_khppsjcjb.bjjbbm=bdm_bjjbbm.bjjbbm ";
    ls_sql+=" and bj_khppsjcjb.khbh='"+khbh+"' and bj_khppsjcjb.khbjjbbm!=bj_khppsjcjb.bjjbbm";
	ls_sql+=" order by bj_khppsjcjb.jgwzbm,bj_khppsjcjb.tcsjflbm,bj_khppsjcjb.tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		jgwzmc=rs.getString("jgwzbm");

		tccplbmc=rs.getString("clxlmc");
		tccplbbm=rs.getString("tccplbbm");
		ppmc=rs.getString("ppmc");
		tcsjflbm=rs.getString("tcsjflbm");
		tcsjflmc=rs.getString("tcsjflmc");
		khbjjbbm=rs.getString("khbjjbbm");
		bjjbbm=rs.getString("bjjbbm");

		bjjbmc=rs.getString("bjjbmc");

		sjsl=rs.getDouble("sjsfsl");
		sjcj=rs.getDouble("sjcj");
		sjcjje=rs.getDouble("sjsfje");


		xjje+=sjcjje;
		xjsl+=sjsl;

		allsl+=sjsl;
		allqye+=sjcjje;
		

		row++;
		//���ÿ������
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td align="center" ><%=jgwzmc%></td>
		
			<td align="center"><%=tccplbmc%></td>
			<td align="center"><%=tcsjflmc%></td>
			<td align="center"><%=ppmc%></td>
			<td align="center"><A HREF="EditBj_khppsjcjb.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzmc%>&tccplbbm=<%=tccplbbm%>&ppmc=<%=ppmc%>" target="_blank">�޸�</A></td>
			<td align="center"><A HREF="DeleteBj_khppsjcjb.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzmc%>&tccplbbm=<%=tccplbbm%>&ppmc=<%=ppmc%>" target="_blank">ɾ��</A></td>
			<td align="center"><%=cf.formatDouble(sjcj)%></td>
			<td align="center"><%=cf.formatDouble(sjsl)%></td>
			<td align="center"><%=cf.formatDouble(sjcjje)%></td>
			<td align="center"><%=bjjbmc%></td>
		  </tr>
		  
	
		<%
	}
	rs.close();
	ps.close();
%> 
  		
  <tr bgcolor="#FFFFFF"> 
	<td align="center" colspan="2">�ϼ�</td>

	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center"><%=cf.formatDouble(xjsl)%></td>
	<td align="center"><%=cf.formatDouble(xjje)%></td>
	<td align="center">&nbsp;</td>
  </tr>



</table>

</body>
</html>

<%
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






