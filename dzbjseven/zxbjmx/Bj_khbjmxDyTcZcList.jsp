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
//�����İ�������ʾ����
String qydmbh=null;
String qydm=null;

String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String jgwzmc=null;
String xdjldwmc=null;


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
String clgw=null;
int fwmj=0;

String bjbbh=null;
String dqbm =null;
String hxbm =null;
String bjjbmc  =null;
String bjjbbm  =null;
String ysshr="";
String ysshbz="";

try {
	conn=cf.getConnection();

	


	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,crm_zxkhxx.bjjb,bjjbmc,ssfgs,fwmj,bjbbh,hxbm,zxdm,ysshr,DECODE(ysshbz,'N','δ���','Y','ͨ��','M','���δͨ��')ysshbz";
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
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		bjjbbm=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		qydmbh=cf.fillNull(rs.getString("zxdm"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		
	}
	rs.close();
	ps.close();
	
	//��ѯǩԼ����
	ls_sql="SELECT dwmc from sq_dwxx";
    ls_sql+=" where dwbh='"+qydmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qydm=cf.fillNull(rs.getString("dwmc"));
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
		dqbm=cf.fillHtml(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	
	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc,ssfgs,fwmj";
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
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
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
    <td colspan="8" align="center" class="STYLE2" ><B>��װ������ϸ&nbsp;LWTC-02</B></td>
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
    <td colspan="6" >ǩԼ���棺&nbsp;<%=qydm%></td>
    <td align="left" >���Ϲ��ʣ�&nbsp;</td>
	<td >����<%=bjjbmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td colspan="7" >����ˣ�&nbsp;<%=ysshr%></td>
    <td align="left" >Ԥ����ˣ�&nbsp;<%=ysshbz%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td  width="6%">�ռ�</td>
    <td  width="8%">��Ʒ���</td>
    <td  width="8%">Ʒ��</td>
    <td  width="14%">�ͺ�</td>
	<td  width="15%">���</td>
    <td  width="5%">��λ</td>
    <td  width="5%">����</td>
    <td  width="6%">����</td>
    <td  width="8%">���</td>
    <td  width="19%">���ײ�Ʒ˵��</td>
    <td  width="6%">����</td>
  </tr>

	
<%
	int i=0;
	String tccplbbm=null;
	String oldjgwzmc="";
	double allje=0;
	ls_sql="SELECT distinct jgwzbm ";
	ls_sql+=" FROM tc_csrjkhzcqd ";
    ls_sql+=" where khbh='"+khbh+"' ";
	ls_sql+=" order by jgwzbm ";
//	out.println(ls_sql);
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");


		//������[��׼�ײͣ���Ʒ���]����
		int cpxdsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM tc_csrjkhzcqd";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzmc+"'";
//		ls_sql+=" and tc_csrjkhzcqd.xdsl!=0";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cpxdsl=rs.getInt(1);
		}
		rs.close();
		ps.close();



		//�����Ŀ��ϸ
		String ppmc=null;
		String xh=null;
		String gg=null;
		String xdjldw=null;
		double xdsl=0;
		double dj=0;
		double je=0;
		String ptcpsm=null;
		String lx=null;

		//�ײ�����
		ls_sql="SELECT ppmc,clxlmc,xh,gg,xdjldw,xdsl,dj,ptcpsm,bjjbmc,DECODE(tc_csrjkhzcqd.lx,'1','����','2','����','3','�����շ�') lx";
		ls_sql+=" FROM tc_csrjkhzcqd,bdm_bjjbbm,jxc_clxlbm";
		ls_sql+=" where tc_csrjkhzcqd.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
		ls_sql+=" and tc_csrjkhzcqd.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and tc_csrjkhzcqd.khbh='"+khbh+"' and tc_csrjkhzcqd.jgwzbm='"+jgwzmc+"'";
//		ls_sql+=" and tc_csrjkhzcqd.xdsl!=0";
		ls_sql+=" order by xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			ppmc=rs.getString("ppmc");
			tccplbbm=rs.getString("clxlmc");
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			xdjldw=rs.getString("xdjldw");
			xdsl=rs.getDouble("xdsl");
			dj=rs.getDouble("dj");
			ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
			bjjbmc=rs.getString("bjjbmc");
			lx=cf.fillHtml(rs.getString("lx"));

			je=cf.round(dj*xdsl,2);

			allje+=je;
			allje=cf.round(allje,2);

			row++;

			if (!oldjgwzmc.equals(jgwzmc))//��ʼ�·���
			{
				oldjgwzmc=jgwzmc;

				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=cpxdsl%>"><%=jgwzmc%></td>
					<td><%=tccplbbm%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=xdjldw%></td>
					<td><%=xdsl%></td>
					<td><%=dj%></td>
					<td><%=je%></td>
					<td align="left" ><%=ptcpsm%></td>
					<td><%=lx%></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=tccplbbm%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=xdjldw%></td>
					<td><%=xdsl%></td>
					<td><%=dj%></td>
					<td><%=je%></td>
					<td align="left" ><%=ptcpsm%></td>
					<td><%=lx%></td>
				  </tr>
				<%
			}
		}
		rs.close();
		ps.close();
	}
	rs1.close();
	ps1.close();
%> 
  		
  <tr bgcolor="#FFFFFF" align="center"> 
	<td>С��</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=allje%></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>

</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">�ͻ�ǩ�֣�            </td>
    <td colspan="2" height="42">���ʦǩ�֣�</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">���ڣ�</td>
    <td colspan="2" height="42">���ڣ�</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">����Աǩ�֣�</td>
    <td colspan="2" height="42">���澭��ǩ�֣�</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">���ڣ�</td>
    <td colspan="2" height="42">���ڣ�</td>
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






