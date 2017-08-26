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

String dwmc=null;
String zxdm=null;
String sjs=null;
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>设计师成功率分析 <BR>
  (统计时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr bgcolor="#CCCCCC"> 
    <td  width="14%" align="center">店面</td>
    <td  width="8%" align="center">设计师</td>
    <td  width="8%" align="center">咨询数</td>
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
	ls_sql+=" and crm_zxkhxx.sjs is not null";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdm in(select dwbh from sq_dwxx where dwlx in('F2') and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
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
	//咨询数
	ls_sql="select dwmc,crm_zxkhxx.zxdm,sjs,count(*)";
	ls_sql+=" from crm_zxkhxx,sq_dwxx";
	ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.sjs is not null";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdm in(select dwbh from sq_dwxx where dwlx in('F2') and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
	}
	ls_sql+=" group by dwmc,crm_zxkhxx.zxdm,sjs";

	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		dwmc=rs1.getString(1);
		zxdm=rs1.getString(2);
		sjs=rs1.getString(3);
		zxs=rs1.getInt(4);

		count++;

		if (count%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		//成功数
		ls_sql="select count(*)";
		ls_sql+=" from crm_zxkhxx";
		ls_sql+=" where lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.zxzt='3'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+zxdm+"' and crm_zxkhxx.sjs='"+sjs+"'";
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
		ls_sql+=" and crm_zxkhxx.zxdm='"+zxdm+"' and crm_zxkhxx.sjs='"+sjs+"'";
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
			<td rowspan="<%=sblxs+2%>" align="center"><%=dwmc%></td>
			<td rowspan="<%=sblxs+2%>" align="center"><%=sjs%></td>
			<td rowspan="<%=sblxs+2%>" align="center"><%=zxs%></td>
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
		ls_sql+=" from crm_zxkhxx,dm_sbyybm";
		ls_sql+=" where lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm and crm_zxkhxx.zxzt='4'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+zxdm+"' and crm_zxkhxx.sjs='"+sjs+"'";
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
	ls_sql+=" and crm_zxkhxx.sjs is not null";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdm in(select dwbh from sq_dwxx where dwlx in('F2') and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
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
	ls_sql+=" and crm_zxkhxx.sjs is not null";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdm in(select dwbh from sq_dwxx where dwlx in('F2') and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
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
		<td rowspan="<%=sblxs+2%>" align="center" colspan="2">总计</td>
		<td rowspan="<%=sblxs+2%>" align="center"><%=allzxs%></td>
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
	ls_sql+=" and crm_zxkhxx.sjs is not null";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_zxkhxx.zxdm in(select dwbh from sq_dwxx where dwlx in('F2') and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
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
	out.print("Exception: " + ls_sql);
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
