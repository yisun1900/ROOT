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
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

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
double xjsl=0;
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
    <td colspan="8" align="center" class="STYLE2" ><B>�ײͣ����ĳ����Ӽ��嵥</B></td>
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
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td  width="6%" align="center">�ռ�</td>
    <td  width="10%" align="center">��Ʒ���</td>
    <td  width="10%" align="center">��׼����</td>
	<td  width="10%" align="center">�������ּӼ�</td>
    <td  width="8%" align="center">ʵ������</td>
    <td  width="8%" align="center">��Ӽ�����</td>
    <td  width="8%" align="center">��Ӽ۽��</td>
  </tr>

	
<%
	String jgwzbm=null;
	String tccplbmc=null;
	double bzsl=0;
	double ccbfjj=0;
	double sjsl=0;
	double sjjshsl=0;
	double xjjsl=0;
	double allxjjsl=0;

	double xjjje=0;
	double allxjjje=0;

	int row=0;
	ls_sql="SELECT jgwzbm,clxlmc,bzsl,sjsl,bj_khzcxmxj.ccbfjj,sjjshsl,xjjsl";
	ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm ";
    ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm";
    ls_sql+=" and bj_khzcxmxj.khbh='"+khbh+"'";
    ls_sql+=" and bj_khzcxmxj.sfxzsl='1' ";//1�������2���������3��������
    ls_sql+=" and bj_khzcxmxj.xjjsl>0";
	ls_sql+=" order by bj_khzcxmxj.jgwzbm,bj_khzcxmxj.tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		jgwzmc=rs.getString("jgwzbm");
		tccplbmc=rs.getString("clxlmc");

		bzsl=rs.getDouble("bzsl");
		ccbfjj=rs.getDouble("ccbfjj");
		sjsl=rs.getDouble("sjsl");
		sjjshsl=rs.getDouble("sjjshsl");
		xjjsl=rs.getDouble("xjjsl");

		xjjje=ccbfjj*xjjsl;

		allxjjsl+=xjjsl;
		allxjjje+=xjjje;
		

		row++;
		//���ÿ������
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td align="center"><%=jgwzmc%></td>
		
			<td align="center"><%=tccplbmc%></td>
			<td align="center"><%=cf.formatDouble(bzsl)%></td>
			<td align="center"><%=cf.formatDouble(ccbfjj)%></td>
			<td align="center"><%=cf.formatDouble(sjsl)%></td>
			<td align="center"><%=cf.formatDouble(xjjsl)%></td>
			<td align="center"><%=cf.formatDouble(xjjje)%></td>
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
	<td align="center"><%=cf.formatDouble(allxjjsl)%></td>
	<td align="center"><%=cf.formatDouble(allxjjje)%></td>
  </tr>

</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td  width="10%" align="center">��Ʒ���</td>
    <td  width="10%" align="center">�����������</td>
	<td  width="10%" align="center">�������ּӼ�</td>
    <td  width="8%" align="center">ʵ������</td>
    <td  width="8%" align="center">��Ӽ�����</td>
    <td  width="8%" align="center">��Ӽ۽��</td>
  </tr>
<%
	//С�����ĳ����Ӽ�
	double zcxlcljj=0;
	double xjjsj=0;

	String gettccplbbm=null;
	String clxlmc=null;
	double getxlsl=0;
	ls_sql="SELECT bj_khzcxmxj.tccplbbm,clxlmc,sum(sjsl)";
	ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm";
    ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm and khbh='"+khbh+"'";//1�������2���������3��������
	ls_sql+=" group by bj_khzcxmxj.tccplbbm,clxlmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		gettccplbbm=rs.getString(1);
		clxlmc=rs.getString(2);
		getxlsl=rs.getDouble(3);

		double gettcslxz=0;//�ײ���������
		double getccbfjj=0;//�������ּӼ�
		String sfxzsl="";//�Ƿ���������  1�������ƣ�2�����ܳ�����3���ɳ�����Ӽ�
		ls_sql="SELECT tcslxz,ccbfjj,sfxzsl";
		ls_sql+=" FROM jxc_clxlbm";
		ls_sql+=" where clxlbm='"+gettccplbbm+"' and sfxzsl!='1'"; 
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			gettcslxz=rs1.getDouble("tcslxz");
			getccbfjj=rs1.getDouble("ccbfjj");
			sfxzsl=cf.fillNull(rs1.getString("sfxzsl"));

			if (sfxzsl.equals("3"))//3���ɳ�����Ӽ�
			{
				double sl=getxlsl-gettcslxz;
				sl=cf.round(sl,2);
				xjjsj+=sl;

				double je=sl*getccbfjj;
				je=cf.round(je,2);
				zcxlcljj+=je;


				%>
				  <tr align="center"> 
					<td><%=clxlmc%></td>
					<td><%=gettcslxz%></td>
					<td><%=getccbfjj%></td>
					<td><%=getxlsl%></td>
					<td><%=sl%></td>
					<td><%=je%></td>
				  </tr>
				<%
			}
		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();

%>

  <tr bgcolor="#FFFFFF"> 
	<td align="center" colspan="2">�ϼ�</td>

	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center"><%=cf.formatDouble(xjjsj)%></td>
	<td align="center"><%=cf.formatDouble(zcxlcljj)%></td>
  </tr>
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">�׷�ǩ�֣�</td>
    <td colspan="2" height="42">�ҷ�ǩ�֣�</td>
  </tr>
</table>

</td></tr>
</TBODY>

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






