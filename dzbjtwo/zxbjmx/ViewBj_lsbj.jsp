<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String khbh=request.getParameter("khbh");
String mbmc=cf.GB2Uni(request.getParameter("sclsbjmc"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String xh=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String oldjgwzmc="";
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
double xjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;

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


try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs ";
	ls_sql+=" FROM crm_zxkhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT bjjbmc";
	ls_sql+=" FROM bj_mbbjmc,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" and mbmc='"+mbmc+"'";
	ls_sql+=" and bj_mbbjmc.bjjb=bdm_bjjbbm.bjjbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=cf.fillHtml(rs.getString("bjjbmc"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(bj_mbgclmx.sl*bj_mbbjxmmx.dj)";
	ls_sql+=" FROM bj_mbbjxmmx,bj_mbgclmx";
    ls_sql+=" where bj_mbbjxmmx.khbh='"+khbh+"'";
    ls_sql+=" and bj_mbbjxmmx.mbmc='"+mbmc+"'";
    ls_sql+=" and bj_mbgclmx.mbmc='"+mbmc+"' ";
    ls_sql+=" and bj_mbbjxmmx.khbh=bj_mbgclmx.khbh and bj_mbbjxmmx.dqbm=bj_mbgclmx.dqbm and bj_mbbjxmmx.xmbh=bj_mbgclmx.xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xjqye=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//�����շ���Ŀ��ϸ
	ls_sql="SELECT sum(sfje)";
	ls_sql+=" FROM bj_mbsfxmmx";
    ls_sql+=" where bj_mbsfxmmx.khbh='"+khbh+"' and bj_mbsfxmmx.mbmc='"+mbmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xjqye+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center">
  <table width="100%" border="0">
    <tr> 
      <td colspan="2">
        <div align="center">
          <b><font size="5">�鿴��ʱ���ۣ����ƣ�<%=mbmc%>��</font></b></div>
      </td>
    </tr>
  </table>
</div>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td>�ͻ�������<%=khxm%></td>
    <td>��ϵ��ʽ��<%=lxfs%></td>
    <td>����ܼƣ�<%=cf.formatDouble(xjqye,"#########.##")%>Ԫ</td>
  </tr>
  <tr> 
    <td>���̵ص㣺<%=fwdz%></td>
    <td>�� �� ʦ��<%=sjs%></td>
    <td>���̵ȼ���<%=bjjb%></td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"> 
    <td  width="4%" align="center">���</td>
    <td  width="7%" align="center">��Ŀ���</td>
    <td  width="15%" align="center">��Ŀ����</td>
    <td  width="7%" align="center">��λ</td>
    <td  width="8%" align="center">���ۣ�Ԫ��</td>
    <td  width="6%" align="center">����</td>
    <td  width="8%" align="center">��Ԫ��</td>
    <td  width="45%" align="center">��������������˵��</td>
  </tr>

<%
	int i=0;
	ls_sql="SELECT bj_mbfjxx.jgwzbm";
	ls_sql+=" FROM bj_mbfjxx ";
    ls_sql+=" where khbh='"+khbh+"' and bj_mbfjxx.mbmc='"+mbmc+"'";
	ls_sql+=" order by bj_mbfjxx.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjsl=0;
		xjqye=0;
		
		//�������
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="8"> 
			  <div align="center"><b><i><font size="3">�ṹλ�ã�<%=jgwzmc%></font></i></b></div>
			</td>
		  </tr>
		<%

		//�����Ŀ��ϸ
		ls_sql="SELECT bj_mbbjxmmx.xmbh||DECODE(bjlx,'1','','2','��') xmbh,xmmc,jldwmc,TO_CHAR(bj_mbbjxmmx.dj) as dj,bj_mbgclmx.sl,bj_mbgclmx.sl*bj_mbbjxmmx.dj as je,gycl";
		ls_sql+=" FROM bj_mbbjxmmx,jdm_jldwbm,bj_mbgclmx  ";
		ls_sql+=" where bj_mbbjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_mbbjxmmx.khbh='"+khbh+"' and bj_mbgclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_mbbjxmmx.khbh=bj_mbgclmx.khbh and bj_mbbjxmmx.dqbm=bj_mbgclmx.dqbm and bj_mbbjxmmx.xmbh=bj_mbgclmx.xmbh";
		ls_sql+=" and bj_mbbjxmmx.mbmc='"+mbmc+"'";
		ls_sql+=" and bj_mbgclmx.mbmc='"+mbmc+"'";
		ls_sql+=" order by bj_mbgclmx.fjnxh,bj_mbbjxmmx.xmpx";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));


			xjsl+=sl;
			xjqye+=qye;
			allsl+=sl;
			allqye+=qye;

			row++;
			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td align="center" width="4%"><%=row%></td>
				<td align="center" width="7%"><%=xmbh%></td>
				<td align="center" width="15%"><%=xmmc%></td>
				<td align="center" width="7%"><%=jldwmc%></td>
				<td align="center" width="8%"><%=dj%></td>
				<td align="center" width="6%"><%=cf.formatDouble(sl)%></td>
				<td align="center" width="8%"><%=cf.formatDouble(qye,"#########.##")%></td>
				<td align="left" width="45%"><%=gycl%></td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();

		//���С��
		%> 
		  <tr bgcolor="#FFFFFF" align="right"> 
			<td colspan="8"><b><i><font size="3"><%=oldjgwzmc%>С�ƣ�<%=cf.formatDouble(xjqye,"#########.##")%>Ԫ&nbsp;&nbsp;&nbsp;&nbsp;</font></i></b></td>
		  </tr>
		<%
	
	}
	rs1.close();
	ps1.close();
%> 
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5"> 
      <div align="center"><b><i><font size="3">�����շ���Ŀ</font></i></b></div>
    </td>
  </tr>
  <%  
	double dxzkl=0;
	double sfje=0;
	double allsfje=0;
	String sfxmmc=null;
	String bz=null;
	ls_sql="SELECT sfxmmc,dxzkl,sfje,bz";
	ls_sql+=" FROM bj_mbsfxmmx  ";
    ls_sql+=" where bj_mbsfxmmx.khbh='"+khbh+"' and bj_mbsfxmmx.mbmc='"+mbmc+"'";
    ls_sql+=" order by bj_mbsfxmmx.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		dxzkl=rs.getDouble("dxzkl");
		sfje=rs.getDouble("sfje");

		allsfje+=sfje;

		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td align="center" width="11%" >&nbsp;</td>
			<td align="center" width="15%" ><%=sfxmmc%></td>
			<td align="center" width="21%" >�ۿۣ�<%=dxzkl%></td>
			<td align="center" width="8%"><%=cf.formatDouble(sfje,"#########.##")%></td>
			<td align="left" width="45%"><%=bz%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();
%> 
  <tr bgcolor="#FFFFFF" align="right"> 
    <td colspan="5"><i><b><font size="3">�����շ�С�ƣ�<%=cf.formatDouble(allsfje,"#########.##")%>Ԫ&nbsp;&nbsp;&nbsp;&nbsp;</font></b></i></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr> 
    <td height="33">�׷�ǩ�֣�</td>
    <td height="33">�ҷ�ǩ�֣�</td>
  </tr>
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("��������: " + ls_sql);
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