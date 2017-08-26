<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='170131'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[客源分析表]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[客源分析表]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=cf.fillNull(request.getParameter("fgs"));
String dwbh=cf.fillNull(request.getParameter("dwbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	int khlysl=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  dm_xxlybm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khlysl=rs.getInt(1)+1;
	}
	rs.close();
	ps.close();

	int zysl=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  dm_zybm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zysl=rs.getInt(1)+1;
	}
	rs.close();
	ps.close();

	int nlsl=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  dm_nlqjbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		nlsl=rs.getInt(1)+1;
	}
	rs.close();
	ps.close();

	int mjsl=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  dm_hxmjbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mjsl=rs.getInt(1)+1;
	}
	rs.close();
	ps.close();
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>新增客源分析表</B><BR>
  <b>(时间范围：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="330%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="1%" rowspan="2" >序号</td>
  <td  width="4%" rowspan="2" >店面</td>
  <td  width="2%" rowspan="2" >客户数</td>


  <td colspan="<%=khlysl%>" >客户来源</td>
  <td colspan="<%=zysl%>" >职业</td>
  <td colspan="<%=nlsl%>" >年龄</td>
  <td colspan="<%=mjsl%>" >面积</td>
  </tr>
<TR bgcolor="#CCCCCC"  align="center"  > 
<%
	String xxlymc="";	
	ls_sql="select xxlymc";
	ls_sql+=" from  dm_xxlybm";
	ls_sql+=" order by xxlybm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xxlymc=rs.getString(1);

		%>
		<td width="2%"><%=xxlymc%></td>
		<%
	}
	rs.close();
	ps.close();

	%>
	<td width="2%">空</td>
	<%

	String zymc="";	
	ls_sql="select zymc";
	ls_sql+=" from  dm_zybm";
	ls_sql+=" order by zybm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zymc=rs.getString(1);

		%>
		<td width="2%"><%=zymc%></td>
		<%
	}
	rs.close();
	ps.close();

	%>
	<td width="2%">空</td>
	<%

	String nlqjmc="";	
	ls_sql="select nlqjmc";
	ls_sql+=" from  dm_nlqjbm";
	ls_sql+=" order by nlqjbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		nlqjmc=rs.getString(1);

		%>
		<td width="2%"><%=nlqjmc%></td>
		<%
	}
	rs.close();
	ps.close();

	%>
	<td width="2%">空</td>
	<%

	String hxmjmc="";	
	ls_sql="select hxmjmc";
	ls_sql+=" from  dm_hxmjbm";
	ls_sql+=" order by hxmjbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		hxmjmc=rs.getString(1);

		%>
		<td width="2%"><%=hxmjmc%></td>
		<%
	}
	rs.close();
	ps.close();


%>
	<td width="2%">空</td>

  </tr>
<%

int row=0;

//新客户量
int newkhs_zj=0;
//市场占比量
int newywykhs_zj=0;
//二次到店量
int newecddkhs_zj=0;
//量房量
int newlfkhs_zj=0;
//出图量
int newctkhs_zj=0;
//出图率
double newctl_zj=0;
//定金量
int newdjkhs_zj=0;
//回访量
int newhfkhs_zj=0;
//飞单量
int newfdkhs_zj=0;
//签单量
int newqdkhs_zj=0;
//签单率
double newqdl_zj=0;


//积单量
int ljkhs_zj=0;
//市场占比量
int ljywykhs_zj=0;
//二次到店量
int ljecddkhs_zj=0;
//量房量
int ljlfkhs_zj=0;
//出图量
int ljctkhs_zj=0;
//出图率
double ljctl_zj=0;
//定金量
int ljdjkhs_zj=0;
//回访量
int ljhfkhs_zj=0;
//飞单量
int ljfdkhs_zj=0;
//签单量
int ljqdkhs_zj=0;
//签单率
double ljqdl_zj=0;
//在施工地量
int zsgdkhs_zj=0;
//待开工地量
int wkgkhs_zj=0;


String fgsbh=null;
String fgsmc=null;
String getdwbh=null;
String dmmc=null;

ls_sql =" SELECT b.dwmc fgsmc,sq_dwxx.dwbh,sq_dwxx.dwmc,sq_dwxx.ssfgs";
ls_sql+=" FROM sq_dwxx,sq_dwxx b";
ls_sql+=" where  sq_dwxx.ssfgs=b.dwbh(+) and sq_dwxx.dwlx='F2' and sq_dwxx.cxbz='N'";
if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
{
	ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	ls_sql+=" and sq_dwxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
}
if (!(fgs.equals("")))
{
	ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	ls_sql+=" and  sq_dwxx.dwbh='"+dwbh+"'";
}
ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>SYSDATE)";
ls_sql+=" order by sq_dwxx.ssfgs,sq_dwxx.dwbh";
ps= conn.prepareStatement(ls_sql);
rs =ps.executeQuery();
while (rs.next())
{
	fgsmc=rs.getString("fgsmc");
	getdwbh=rs.getString("dwbh");
	dmmc=rs.getString("dwmc");
	fgsbh=rs.getString("ssfgs");

	row++;


	//新客户量
	int newkhs=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
	ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		newkhs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	%>
	<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		<td align="center"><%=row%></td>
		<td align="center"><%=dmmc%></td>

		<td><A HREF="ViewDmNew.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=newkhs%></A></td>
	<%

	int khs=0;
	double khbl=0;
	xxlymc="";	
	ls_sql="select xxlymc";
	ls_sql+=" from  dm_xxlybm";
	ls_sql+=" order by xxlybm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		xxlymc=rs2.getString(1);


		khs=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息

		ls_sql+=" and crm_zxkhxx.xxly='"+xxlymc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (newkhs!=0)
		{
			khbl=cf.round(khs*100.0/newkhs,2);
		}
		else{
			khbl=0;
		}
		
		%>
		<td><%=khbl%>%</td>
		<%
	}
	rs2.close();
	ps2.close();

	khs=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
	ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息

	ls_sql+=" and crm_zxkhxx.xxly is null";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		khs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	
	if (newkhs!=0)
	{
		khbl=cf.round(khs*100.0/newkhs,2);
	}
	else{
		khbl=0;
	}
	
	%>
	<td><%=khbl%>%</td>
	<%

	zymc="";	
	ls_sql="select zybm";
	ls_sql+=" from  dm_zybm";
	ls_sql+=" order by zybm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		zymc=rs2.getString(1);


		khs=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息

		ls_sql+=" and crm_zxkhxx.zybm='"+zymc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		
		if (newkhs!=0)
		{
			khbl=cf.round(khs*100.0/newkhs,2);
		}
		else{
			khbl=0;
		}
		
		%>
		<td><%=khbl%>%</td>
		<%
	}
	rs2.close();
	ps2.close();

	khs=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
	ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息

	ls_sql+=" and crm_zxkhxx.zybm is null";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		khs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	
	if (newkhs!=0)
	{
		khbl=cf.round(khs*100.0/newkhs,2);
	}
	else{
		khbl=0;
	}
	
	%>
	<td><%=khbl%>%</td>
	<%

	nlqjmc="";	
	ls_sql="select nlqjbm";
	ls_sql+=" from  dm_nlqjbm";
	ls_sql+=" order by nlqjbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		nlqjmc=rs2.getString(1);


		khs=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息

		ls_sql+=" and crm_zxkhxx.nlqjbm='"+nlqjmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		
		if (newkhs!=0)
		{
			khbl=cf.round(khs*100.0/newkhs,2);
		}
		else{
			khbl=0;
		}
		
		%>
		<td><%=khbl%>%</td>
		<%
	}
	rs2.close();
	ps2.close();

	khs=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
	ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息

	ls_sql+=" and crm_zxkhxx.nlqjbm is null";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		khs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	
	if (newkhs!=0)
	{
		khbl=cf.round(khs*100.0/newkhs,2);
	}
	else{
		khbl=0;
	}
	
	%>
	<td><%=khbl%>%</td>
	<%


	hxmjmc="";	
	ls_sql="select hxmjmc";
	ls_sql+=" from  dm_hxmjbm";
	ls_sql+=" order by hxmjbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		hxmjmc=rs2.getString(1);


		khs=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息

		ls_sql+=" and crm_zxkhxx.hxmjbm='"+hxmjmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		
		if (newkhs!=0)
		{
			khbl=cf.round(khs*100.0/newkhs,2);
		}
		else{
			khbl=0;
		}
		
		%>
		<td><%=khbl%>%</td>
		<%
	}
	rs2.close();
	ps2.close();

	khs=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
	ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息

	ls_sql+=" and crm_zxkhxx.hxmjbm is null";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		khs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	
	if (newkhs!=0)
	{
		khbl=cf.round(khs*100.0/newkhs,2);
	}
	else{
		khbl=0;
	}
	
	%>
	<td><%=khbl%>%</td>
	<%

	%>
	</tr>
	<%	

}
rs.close();
ps.close();

	//合计＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始


%>

<%
	//新客户量
	int newkhs=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		newkhs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	%>
<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td align="center" colspan="2"><B>总 计</B></td>

		<td><%=newkhs%></td>
	<%

	int khs=0;
	double khbl=0;
	xxlymc="";	
	ls_sql="select xxlymc";
	ls_sql+=" from  dm_xxlybm";
	ls_sql+=" order by xxlybm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		xxlymc=rs2.getString(1);


		khs=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息

		ls_sql+=" and crm_zxkhxx.xxly='"+xxlymc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (newkhs!=0)
		{
			khbl=cf.round(khs*100.0/newkhs,2);
		}
		else{
			khbl=0;
		}
		
		%>
		<td><%=khbl%>%</td>
		<%
	}
	rs2.close();
	ps2.close();

	khs=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息

	ls_sql+=" and crm_zxkhxx.xxly is null";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		khs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	
	if (newkhs!=0)
	{
		khbl=cf.round(khs*100.0/newkhs,2);
	}
	else{
		khbl=0;
	}
	
	%>
	<td><%=khbl%>%</td>
	<%

	zymc="";	
	ls_sql="select zybm";
	ls_sql+=" from  dm_zybm";
	ls_sql+=" order by zybm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		zymc=rs2.getString(1);


		khs=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息

		ls_sql+=" and crm_zxkhxx.zybm='"+zymc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		
		if (newkhs!=0)
		{
			khbl=cf.round(khs*100.0/newkhs,2);
		}
		else{
			khbl=0;
		}
		
		%>
		<td><%=khbl%>%</td>
		<%
	}
	rs2.close();
	ps2.close();

	khs=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息

	ls_sql+=" and crm_zxkhxx.zybm is null";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		khs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	
	if (newkhs!=0)
	{
		khbl=cf.round(khs*100.0/newkhs,2);
	}
	else{
		khbl=0;
	}
	
	%>
	<td><%=khbl%>%</td>
	<%

	nlqjmc="";	
	ls_sql="select nlqjbm";
	ls_sql+=" from  dm_nlqjbm";
	ls_sql+=" order by nlqjbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		nlqjmc=rs2.getString(1);


		khs=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息

		ls_sql+=" and crm_zxkhxx.nlqjbm='"+nlqjmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		
		if (newkhs!=0)
		{
			khbl=cf.round(khs*100.0/newkhs,2);
		}
		else{
			khbl=0;
		}
		
		%>
		<td><%=khbl%>%</td>
		<%
	}
	rs2.close();
	ps2.close();

	khs=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息

	ls_sql+=" and crm_zxkhxx.nlqjbm is null";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		khs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	
	if (newkhs!=0)
	{
		khbl=cf.round(khs*100.0/newkhs,2);
	}
	else{
		khbl=0;
	}
	
	%>
	<td><%=khbl%>%</td>
	<%


	hxmjmc="";	
	ls_sql="select hxmjmc";
	ls_sql+=" from  dm_hxmjbm";
	ls_sql+=" order by hxmjbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		hxmjmc=rs2.getString(1);


		khs=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息

		ls_sql+=" and crm_zxkhxx.hxmjbm='"+hxmjmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		
		if (newkhs!=0)
		{
			khbl=cf.round(khs*100.0/newkhs,2);
		}
		else{
			khbl=0;
		}
		
		%>
		<td><%=khbl%>%</td>
		<%
	}
	rs2.close();
	ps2.close();

	khs=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息

	ls_sql+=" and crm_zxkhxx.hxmjbm is null";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		khs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	
	if (newkhs!=0)
	{
		khbl=cf.round(khs*100.0/newkhs,2);
	}
	else{
		khbl=0;
	}
	
	%>
	<td><%=khbl%>%</td>
</tr>

</table>


</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<script>

function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

</script> 