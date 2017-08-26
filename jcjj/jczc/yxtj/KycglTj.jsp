<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String px=request.getParameter("px");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String xxlybm=null;
String xxlymc=null;
int zxs=0;
int zxsbfb=0;

int cgs=0;
int sblxs=0;
int sbzs=0;
int cgsbfb=0;
int qtbfb=0;
int sbs=0;
String sbyymc=null;
int sbbfb=0;

int allzxs=0;

String bgcolor=null;

try {
	conn=cf.getConnection();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>客源成功率分析 <BR>
  (统计时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr bgcolor="#CCCCCC"> 
    <td  width="18%" align="center">客户来源</td>
    <td  width="10%" align="center">咨询数</td>
    <td  width="22%" align="center">咨询数百分比</td>
    <td  width="18%" align="center">结果</td>
    <td  width="10%" align="center">数量</td>
    <td  width="22%" align="center">所占百分比</td>
  </tr>
  <%

	
	//全部咨询数
	ls_sql="select count(*)";
	ls_sql+=" from crm_zxkhxx";
	ls_sql+=" where lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdjbm in(select dwbh from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdjbm='"+dwbh+"'";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allzxs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	
	int count=0;
	//信息来源
	ls_sql="select xxlybm,xxlymc";
	ls_sql+=" from dm_xxlybm";
	ls_sql+=" order by xxlybm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		xxlybm=rs1.getString("xxlybm");
		xxlymc=rs1.getString("xxlymc");

		count++;

		if (count%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		zxs=0;
		cgs=0;
		cgsbfb=0;
		sblxs=0;
		sbzs=0;

		qtbfb=0;

		//咨询数
		ls_sql="select count(*)";
		ls_sql+=" from crm_zxkhxx,crm_khxxly";
		ls_sql+=" where lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.khbh=crm_khxxly.khbh and crm_khxxly.khlx='2'";//1：签约客户；2：咨询客户
		ls_sql+=" and crm_khxxly.xxlybm='"+xxlybm+"'";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdjbm in(select dwbh from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+fgs+"'))";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdjbm='"+dwbh+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zxs=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//成功数
		ls_sql="select count(*)";
		ls_sql+=" from crm_zxkhxx,crm_khxxly";
		ls_sql+=" where lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.khbh=crm_khxxly.khbh and crm_khxxly.khlx='2'";//1：签约客户；2：咨询客户
		ls_sql+=" and crm_khxxly.xxlybm='"+xxlybm+"'";
		ls_sql+=" and crm_zxkhxx.zxzt='3'";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdjbm in(select dwbh from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+fgs+"'))";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdjbm='"+dwbh+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			cgs=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//失败类型数
		ls_sql="select count(distinct crm_zxkhxx.sbyybm),count(*)";
		ls_sql+=" from crm_zxkhxx,crm_khxxly";
		ls_sql+=" where lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.khbh=crm_khxxly.khbh and crm_khxxly.khlx='2'";//1：签约客户；2：咨询客户
		ls_sql+=" and crm_khxxly.xxlybm='"+xxlybm+"'";
		ls_sql+=" and crm_zxkhxx.zxzt='4'";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdjbm in(select dwbh from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+fgs+"'))";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdjbm='"+dwbh+"'";
		}
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			sblxs=rs.getInt(1);
			sbzs=rs.getInt(2);
		}
		rs.close();
		ps.close();


		if (allzxs!=0)
		{
			zxsbfb=zxs*100/allzxs;
		}
		else{
			zxsbfb=0;
		}

		if (zxs!=0)
		{
			cgsbfb=cgs*100/zxs;
		}
		else{
			cgsbfb=0;
		}

		if (zxs!=0)
		{
			qtbfb=(zxs-sbzs-cgs)*100/zxs;
		}
		else{
			qtbfb=0;
		}

		%> 
		  <tr bgcolor="<%=bgcolor%>"> 
			<td rowspan="<%=sblxs+2%>" align="center"><%=xxlymc%></td>
			<td rowspan="<%=sblxs+2%>" align="center"><%=zxs%></td>
			<td align="left" rowspan="<%=sblxs+2%>"><img src="/images/ColuGif.gif" width="<%=zxsbfb%>" height="14"><%=zxsbfb%>%</td>
			<td align="center">已签单</td>
			<td align="center"><%=cgs%></td>
			<td><img src="/images/ColuGif.gif" width="<%=cgsbfb%>" height="14"><%=cgsbfb%>%</td>
		  </tr>
		  <tr bgcolor="<%=bgcolor%>"> 
			<td align="center">在谈</td>
			<td align="center"><%=zxs-sbzs-cgs%></td>
			<td><img src="/images/ColuGif.gif" width="<%=qtbfb%>" height="14"><%=qtbfb%>%</td>
		  </tr>
		<%

		//失败数
		ls_sql="select sbyymc,count(*)";
		ls_sql+=" from crm_zxkhxx,crm_khxxly,dm_sbyybm";
		ls_sql+=" where lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.khbh=crm_khxxly.khbh and crm_khxxly.khlx='2'";//1：签约客户；2：咨询客户
		ls_sql+=" and crm_khxxly.xxlybm='"+xxlybm+"'";
		ls_sql+=" and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm and crm_zxkhxx.zxzt='4'";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdjbm in(select dwbh from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+fgs+"'))";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdjbm='"+dwbh+"'";
		}
		ls_sql+=" group by crm_zxkhxx.sbyybm,sbyymc";
		ls_sql+=" order by crm_zxkhxx.sbyybm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			sbs=0;
			sbbfb=0;

			sbyymc=rs.getString(1);
			sbs=rs.getInt(2);

			if (zxs!=0)
			{
				sbbfb=sbs*100/zxs;
			}
			else{
				sbbfb=0;
			}

			%> 
			  <tr bgcolor="<%=bgcolor%>"> 
				<td align="center"><%=sbyymc%></td>
				<td align="center"><%=sbs%></td>
				<td><img src="/images/ColuGif.gif" width="<%=sbbfb%>" height="14"><%=sbbfb%>%</td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();



	
	}
	rs1.close();
	ps1.close();
	

////////////////////////////总计/////////////////////////////////
	//成功数
	ls_sql="select count(*)";
	ls_sql+=" from crm_zxkhxx";
	ls_sql+=" where lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.zxzt='3'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdjbm in(select dwbh from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdjbm='"+dwbh+"'";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//失败类型数
	ls_sql="select count(distinct crm_zxkhxx.sbyybm),count(*)";
	ls_sql+=" from crm_zxkhxx";
	ls_sql+=" where lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.zxzt='4'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdjbm in(select dwbh from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdjbm='"+dwbh+"'";
	}
//		out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sblxs=rs.getInt(1);
		sbzs=rs.getInt(2);
	}
	rs.close();
	ps.close();


	if (allzxs!=0)
	{
		cgsbfb=cgs*100/allzxs;
	}
	else{
		cgsbfb=0;
	}

	if (allzxs!=0)
	{
		qtbfb=(allzxs-sbzs-cgs)*100/allzxs;
	}
	else{
		qtbfb=0;
	}

	%> 
	  <tr bgcolor="#E8E8FF"> 
		<td rowspan="<%=sblxs+2%>" align="center">总数</td>
		<td rowspan="<%=sblxs+2%>" align="center"><%=allzxs%></td>
		<td align="left" rowspan="<%=sblxs+2%>">&nbsp;</td>
		<td align="center">已签单</td>
		<td align="center"><%=cgs%></td>
		<td><img src="/images/ColuGif.gif" width="<%=cgsbfb%>" height="14"><%=cgsbfb%>%</td>
	  </tr>
	  <tr bgcolor="#E8E8FF"> 
		<td align="center">在谈</td>
		<td align="center"><%=allzxs-sbzs-cgs%></td>
		<td><img src="/images/ColuGif.gif" width="<%=qtbfb%>" height="14"><%=qtbfb%>%</td>
	  </tr>
	<%

	//失败数
	ls_sql="select sbyymc,count(*)";
	ls_sql+=" from crm_zxkhxx,dm_sbyybm";
	ls_sql+=" where lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm and crm_zxkhxx.zxzt='4'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdjbm in(select dwbh from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdjbm='"+dwbh+"'";
	}
	ls_sql+=" group by crm_zxkhxx.sbyybm,sbyymc";
	ls_sql+=" order by crm_zxkhxx.sbyybm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sbs=0;
		sbbfb=0;

		sbyymc=rs.getString(1);
		sbs=rs.getInt(2);

		if (allzxs!=0)
		{
			sbbfb=sbs*100/allzxs;
		}
		else{
			sbbfb=0;
		}

		%> 
		  <tr bgcolor="#E8E8FF"> 
			<td align="center"><%=sbyymc%></td>
			<td align="center"><%=sbs%></td>
			<td><img src="/images/ColuGif.gif" width="<%=sbbfb%>" height="14"><%=sbbfb%>%</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

%> 

</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
