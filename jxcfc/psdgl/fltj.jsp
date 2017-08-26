<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<%
String psph=request.getParameter("psph");
String khbh=request.getParameter("khbh");
String dqbm=(String)session.getAttribute("dqbm");


String bgcolor="";

int row=0;

String fgsbh=null;
String hth=null;
String sgd=null;
String khxm=null;
String fwdz=null;
double qye=0;

double allbzlyje=0;
double alllyxxje=0;
double alllysxje=0;
double allpsje=0;
double allljpsje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql=" select hth,khxm,fwdz,fgsbh,sgd,NVL(guanlif,0)+NVL(suijin,0)+qye qye";
    ls_sql+=" from crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		fgsbh=rs.getString("fgsbh");
		qye=rs.getDouble("qye");
		fgsbh=rs.getString("fgsbh");
		sgd=cf.fillNull(rs.getString("sgd"));
	}
	rs.close();
	ps.close();

    double sgcbj=0;
    double zxsgcbj=0;
	ls_sql=" select sgcbj,zxsgcbj";
    ls_sql+=" from crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgcbj=rs.getDouble("sgcbj");
		zxsgcbj=rs.getDouble("zxsgcbj");
	}
	rs.close();
	ps.close();

	double khbzlybl=0;
	double khbzlyje=0;
	double khllyblxx=0;
	double khlyxxje=0;
	double khllyblsx=0;
	double khlysxje=0;
	ls_sql=" select bzlybl,ROUND(bzlybl/100*"+zxsgcbj+",2),lyblxx,ROUND(lyblxx/100*"+zxsgcbj+",2),lyblsx,ROUND(lyblsx/100*"+zxsgcbj+",2)";
	ls_sql+=" FROM sq_dwxx ";
    ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbzlybl=rs.getDouble(1);
		khbzlyje=rs.getDouble(2);
		khllyblxx=rs.getDouble(3);
		khlyxxje=rs.getDouble(4);
		khllyblsx=rs.getDouble(5);
		khlysxje=rs.getDouble(6);
	}
	rs.close();
	ps.close();

	double pszsl=0;
	double pszje=0;
	ls_sql="SELECT sum(jxc_clpsd.pszsl),sum(jxc_clpsd.pszje)";
	ls_sql+=" FROM jxc_clpsd ";
	ls_sql+=" where jxc_clpsd.khbh='"+khbh+"'";
	ls_sql+=" and (jxc_clpsd.psdzt in('2','3','5') OR jxc_clpsd.psph='"+psph+"')";//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		pszsl=rs1.getDouble(1);
		pszje=rs1.getDouble(2);
	}
	rs1.close();
	ps1.close();

	double pszjebl=0;
	if (qye==0)
	{
		pszjebl=0;
	}
	else{
		pszjebl=pszje*100/qye;
	}

	String tx="";
	if (pszjebl<khllyblxx)
	{
		tx="<B><font color='#FF0000'>小于下限</font><B>";
	}

	if (pszjebl>khllyblsx)
	{
		tx="<B><font color='#0000CC'>大于上限</font></B>";
	}


%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">材料单－小类领用统计(材料单号:<%=psph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right">客户编号 </td>
      <td width="32%"><%=khbh%> </td>
      <td width="18%" align="right">合同号 </td>
      <td width="32%"><%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">客户姓名 </td>
      <td><%=khxm%> </td>
      <td align="right">房屋地址</td>
      <td><%=fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">施工队</td>
      <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
      <td align="right">签约额</td>
      <td><%=qye%>（工程＋管理费＋税金）</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><strong>标准领用比例</strong></td>
      <td><%=khbzlybl%>%</td>
      <td align="right"><strong>标准领用金额</strong></td>
      <td><%=khbzlyje%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><strong>领用下限比例</strong></td>
      <td><%=khllyblxx%>%</td>
      <td align="right"><strong>领用下限金额</strong></td>
      <td><%=khlyxxje%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><strong>领用上限比例</strong></td>
      <td><%=khllyblsx%>%</td>
      <td align="right"><strong>领用上限金额</strong></td>
      <td><%=khlysxje%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><strong>累计领用比例</strong></td>
      <td><%=cf.formatDouble(pszjebl)%>%<BR><%=tx%></td>
      <td align="right"><strong>累计领用金额</strong></td>
      <td><%=pszje%></td>
    </tr>
</table>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="4%" rowspan="2">&nbsp;</td>
  <td  width="21%" rowspan="2"><strong>小类</strong></td>
  <td colspan="2"><font color="#0000CC"><strong>标准领用</strong></font></td>
  <td colspan="2"><font color="#0000CC"><strong>本单领用</strong></font></td>
  <td colspan="2"><font color="#0000CC"><strong>累计领用</strong></font></td>
  <td colspan="2"><strong>领用下限</strong></td>
  <td colspan="2"><strong>领用上限</strong></td>
  </tr>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="9%"><font color="#0000CC"><strong>金额</strong></font></td>
	<td  width="6%"><font color="#0000CC"><strong>比例</strong></font></td>
    <td  width="9%"><font color="#0000CC"><strong>金额</strong></font></td>
	<td  width="6%"><font color="#0000CC"><strong>比例</strong></font></td>
    <td  width="9%"><font color="#0000CC"><strong>金额</strong></font></td>
	<td  width="6%"><font color="#0000CC"><strong>比例</strong></font></td>
    <td  width="9%"><strong>金额</strong></td>
	<td  width="6%"><strong>比例</strong></td>
    <td  width="9%"><strong>金额</strong></td>
	<td  width="6%"><strong>比例</strong></td>
</tr>
<%
	String cldlmc=null;
	String clxlmc=null;
	ls_sql="SELECT jxc_clxlbm.cldlmc,jxc_clxlbm.clxlmc";
	ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm";
	ls_sql+=" where jxc_cldlbm.cldlmc=jxc_clxlbm.cldlmc and jxc_cldlbm.cldllb in('2','3') ";
	ls_sql+=" order by jxc_clxlbm.cldlmc,jxc_clxlbm.clxlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		clxlmc=cf.fillNull(rs.getString("clxlmc"));

		row++;

		double pssl=0;
		double psje=0;
		ls_sql="SELECT sum(jxc_clpsmx.pssl),sum(jxc_clpsmx.psje)";
		ls_sql+=" FROM jxc_clpsmx ";
		ls_sql+=" where jxc_clpsmx.psph='"+psph+"' and jxc_clpsmx.clxlbm='"+clxlmc+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			pssl=rs1.getDouble(1);
			psje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		double bdbl=0;
		if (qye==0)
		{
			bdbl=0;
		}
		else{
			bdbl=psje*100/qye;
		}

		double ljpssl=0;
		double ljpsje=0;
		ls_sql="SELECT sum(jxc_clpsmx.pssl),sum(jxc_clpsmx.psje)";
		ls_sql+=" FROM jxc_clpsd,jxc_clpsmx ";
		ls_sql+=" where jxc_clpsd.psph=jxc_clpsmx.psph ";
		ls_sql+=" and jxc_clpsd.khbh='"+khbh+"' and jxc_clpsmx.clxlbm='"+clxlmc+"' ";
		ls_sql+=" and (jxc_clpsd.psdzt in('2','3','5') OR jxc_clpsd.psph='"+psph+"')";//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljpssl=rs1.getDouble(1);
			ljpsje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		double ljbl=0;
		if (qye==0)
		{
			ljbl=0;
		}
		else{
			ljbl=ljpsje*100/qye;
		}

		double bzlybl=0;
		double lyblxx=0;
		double lyblsx=0;
		ls_sql=" select bzlybl,lyblxx,lyblsx";
		ls_sql+=" from jxc_fclybl";
		ls_sql+=" where dwbh='"+fgsbh+"' and clxlmc='"+clxlmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			bzlybl=rs1.getDouble("bzlybl");
			lyblxx=rs1.getDouble("lyblxx");
			lyblsx=rs1.getDouble("lyblsx");
		}
		rs1.close();
		ps1.close();

		double bzlyje=0;
		double lyxxje=0;
		double lysxje=0;
		bzlyje=cf.round(bzlybl/100*zxsgcbj,2);
		lyxxje=cf.round(lyblxx/100*zxsgcbj,2);
		lysxje=cf.round(lyblsx/100*zxsgcbj,2);

		tx="";
		if (ljbl<lyblxx)
		{
			tx="<B><font color='#FF0000'>小于下限</font><B>";
		}

		if (ljbl>lyblsx && lyblsx!=0)
		{
			tx="<B><font color='#0000CC'>大于上限</font></B>";
		}

		allbzlyje+=bzlyje;
		alllyxxje+=lyxxje;
		alllysxje+=lysxje;
		allpsje+=psje;
		allljpsje+=ljpsje;
	

			
		if (row%2==0)
		{
			bgcolor="E8E8FF";
		}
		else{
			bgcolor="FFFFFF";
		}
	%>
		<tr bgcolor="<%=bgcolor%>" align="center">
			<td><%=row%></td>
			<td><%=clxlmc%></td>
			<td><%=bzlyje%></td>
			<td><%=bzlybl%>%</td>
			<td><%=psje%></td>
			<td><%=cf.formatDouble(bdbl)%>%</td>
			<td><%=ljpsje%><BR><%=tx%></td>
			<td><%=cf.formatDouble(ljbl)%>%</td>
			<td><%=lyxxje%></td>
			<td><%=lyblxx%>%</td>
			<td><%=lysxje%></td>
			<td><%=lyblsx%>%</td>
		</tr>
	<%
	
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("发生意外: " + e);
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

double bzbl=0;
if (qye==0)
{
	bzbl=0;
}
else{
	bzbl=allbzlyje*100/qye;
}

double bdbl=0;
if (qye==0)
{
	bdbl=0;
}
else{
	bdbl=allpsje*100/qye;
}

double ljbl=0;
if (qye==0)
{
	ljbl=0;
}
else{
	ljbl=allljpsje*100/qye;
}

double xxbl=0;
if (qye==0)
{
	xxbl=0;
}
else{
	xxbl=alllyxxje*100/qye;
}

double sxbl=0;
if (qye==0)
{
	sxbl=0;
}
else{
	sxbl=alllysxje*100/qye;
}
%>

<tr bgcolor="<%=bgcolor%>" align="center">
	<td colspan="2">小 计</td>
	<td><%=cf.formatDouble(allbzlyje)%></td>
	<td><%=cf.formatDouble(bzbl)%>%</td>
	<td><%=cf.formatDouble(allpsje)%></td>
	<td><%=cf.formatDouble(bdbl)%>%</td>
	<td><%=cf.formatDouble(allljpsje)%></td>
	<td><%=cf.formatDouble(ljbl)%>%</td>
	<td><%=cf.formatDouble(alllyxxje)%></td>
	<td><%=cf.formatDouble(xxbl)%>%</td>
	<td><%=cf.formatDouble(alllysxje)%></td>
	<td><%=cf.formatDouble(sxbl)%>%</td>
</tr>
</table>
</form>
</body>

</html>

