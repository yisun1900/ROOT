<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
/*
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='090420'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[订金统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[订金统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
*/
%>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=cf.fillNull(request.getParameter("fgs"));
String dwbh=cf.fillNull(request.getParameter("dwbh"));


String wheresql="";
String wheresql1="";


if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (a.ssfgs='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	wheresql1+=" and  a.dwbh='"+dwbh+"'";
}

wheresql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


	//获取最大数
	String getfgs=null;
	String oldfgs="";
	String dm=null;
	String getdwbh=null;

	int sjdjqds=0;
	int hddjqds=0;
	int wjdjqds=0;

	int yqysjsjs=0;
	int qdsbsjdjs=0;
	int ljsjdjs=0;

	int yqyhddjs=0;
	int qdsbhddjs=0;
	int ljhddjs=0;

	int qfdjs=0;
	int lywxhdjs=0;
	int sywxhdjs=0;

	int ZYsjdjqds=0;
	int ZYhddjqds=0;
	int ZYwjdjqds=0;

	int ZYyqysjsjs=0;
	int ZYqdsbsjdjs=0;
	int ZYljsjdjs=0;

	int ZYyqyhddjs=0;
	int ZYqdsbhddjs=0;
	int ZYljhddjs=0;

	int ZYqfdjs=0;
	int ZYlywxhdjs=0;
	int ZYsywxhdjs=0;


	int ALLsjdjqds=0;
	int ALLhddjqds=0;
	int ALLwjdjqds=0;

	int ALLyqysjsjs=0;
	int ALLqdsbsjdjs=0;
	int ALLljsjdjs=0;

	int ALLyqyhddjs=0;
	int ALLqdsbhddjs=0;
	int ALLljhddjs=0;

	int ALLqfdjs=0;
	int ALLlywxhdjs=0;
	int ALLsywxhdjs=0;

	int row=0;

try {
	conn=cf.getConnection();

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>订金统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>



<DIV onselectstart="return false" style="BORDER-RIGHT: #808080 2px solid; BORDER-TOP: #808080 2px solid; DISPLAY: inline; OVERFLOW: auto; BORDER-LEFT: #808080 2px solid; WIDTH: 100%; CURSOR: default; BORDER-BOTTOM: #808080 2px solid; HEIGHT:95%"> 


<TABLE style="DISPLAY: inline; BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=2 border=0 width="140%" style='FONT-SIZE: 14px'>

<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)">
  <td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td colspan="3" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签单统计</td>
  <td colspan="3" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">设计定金数</td>
  <td colspan="3" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">活动定金数</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
</tr>
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
  <td  width="3%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">序号</td>
  <td  width="11%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">分公司</td>
  <td  width="14%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">店面</td>
  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">设计定金签单数量</td>
  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">活动定金签单数量</td>
  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">未交定金签单数量</td>
  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">己签约设计定金数</td>
  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签单失败设计定金数</td>
  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">累积设计定金数</td>
  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">己签约活动定金数</td>

  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签单失败活动定金数</td>
  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">累积活动定金数</td>

  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">期房定金数</td>
  <td width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">超两个月未消化定金数</td>
  <td width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">超三个月未消化定金数</td>
</tr>

<%


	ls_sql=" SELECT b.dwmc fgs,a.dwbh dwbh,a.dwmc dm";
	ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
	ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N'";
	ls_sql+=wheresql1;
	ls_sql+=" order by a.ssfgs,a.dwbh ";
//	out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgs=rs.getString("fgs");
		getdwbh=rs.getString("dwbh");
		dm=rs.getString("dm");

		row++;
	
		//设计定金签单数量
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_khxx,crm_zxkhxx ";
		ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh";
		ls_sql+=" and crm_khxx.zt in('2') ";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' ";
		ls_sql+=" and crm_zxkhxx.lfdjbz in('Y','T')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjdjqds=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
	
		//活动定金签单数量
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_khxx,crm_zxkhxx ";
		ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh";
		ls_sql+=" and crm_khxx.zt in('2') ";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' ";
		ls_sql+=" and crm_zxkhxx.hddjbz in('Y','T')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			hddjqds=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
	
		//未交定金签单数量
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_khxx,crm_zxkhxx ";
		ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh";
		ls_sql+=" and crm_khxx.zt in('2') ";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' ";
		ls_sql+=" and crm_zxkhxx.hddjbz='N'";
		ls_sql+=" and crm_zxkhxx.lfdjbz='N'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			wjdjqds=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		ZYsjdjqds+=sjdjqds;
		ZYhddjqds+=hddjqds;
		ZYwjdjqds+=wjdjqds;
	
		//己签约设计定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt in('3') ";
		ls_sql+=" and crm_zxkhxx.jlfdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.lfdjbz in('Y','T')";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yqysjsjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
	
		//签单失败设计定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt in('2','4') ";
		ls_sql+=" and crm_zxkhxx.jlfdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.lfdjbz in('Y','T')";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qdsbsjdjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//累积设计定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.jlfdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.lfdjbz in('Y','T')";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljsjdjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		ZYyqysjsjs+=yqysjsjs;
		ZYqdsbsjdjs+=qdsbsjdjs;
		ZYljsjdjs+=ljsjdjs;
		

	
		//己签约活动定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt in('3') ";
		ls_sql+=" and crm_zxkhxx.jhddjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.jhddjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.hddjbz in('Y','T')";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yqyhddjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
	
		//签单失败活动定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt in('2','4') ";
		ls_sql+=" and crm_zxkhxx.jhddjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.jhddjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.hddjbz in('Y','T')";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qdsbhddjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//累积活动定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.jhddjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.jhddjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.hddjbz in('Y','T')";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljhddjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		ZYyqyhddjs+=yqyhddjs;
		ZYqdsbhddjs+=qdsbhddjs;
		ZYljhddjs+=ljhddjs;
		
	
		//期房定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt not in('2','3','4') ";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"' ";
		ls_sql+=" and crm_zxkhxx.fwlxbm='1' ";//1:期房

		ls_sql+=" and (crm_zxkhxx.lfdjbz in('Y','T') OR crm_zxkhxx.hddjbz in('Y','T'))";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qfdjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
	
		//超两个月未消化定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt not in('2','3','4') ";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"' ";

		ls_sql+=" and (crm_zxkhxx.lfdjbz in('Y','T') OR crm_zxkhxx.hddjbz in('Y','T'))";

		ls_sql+=" and (MONTHS_BETWEEN(SYSDATE,crm_zxkhxx.jlfdjsj)>2 OR MONTHS_BETWEEN(SYSDATE,crm_zxkhxx.jhddjsj)>2)";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			lywxhdjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//超三个月未消化定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt not in('2','3','4') ";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"' ";

		ls_sql+=" and (crm_zxkhxx.lfdjbz in('Y','T') OR crm_zxkhxx.hddjbz in('Y','T'))";

		ls_sql+=" and (MONTHS_BETWEEN(SYSDATE,crm_zxkhxx.jlfdjsj)>3 OR MONTHS_BETWEEN(SYSDATE,crm_zxkhxx.jhddjsj)>3)";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sywxhdjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		ZYqfdjs+=qfdjs;
		ZYlywxhdjs+=lywxhdjs;
		ZYsywxhdjs+=sywxhdjs;
		
	

		%>
		<tr align="center">
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=row%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=getfgs%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
			<%=dm%>

			
			</td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><A HREF="ViewSjdjQd.jsp?dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=sjdjqds%></A></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><A HREF="ViewHddjQd.jsp?dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=hddjqds%></A></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><A HREF="ViewWjdjQd.jsp?dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=wjdjqds%></A></td>

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><A HREF="ViewYqySjDjs.jsp?dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=yqysjsjs%></A></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><A HREF="ViewQdsbSjDjs.jsp?dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=qdsbsjdjs%></A></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><A HREF="ViewLjSjDjs.jsp?dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljsjdjs%></A></td>

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><A HREF="ViewYqyHdDjs.jsp?dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=yqyhddjs%></A></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><A HREF="ViewQdsbHdDjs.jsp?dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=qdsbhddjs%></A></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><A HREF="ViewLjHdDjs.jsp?dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljhddjs%></A></td>

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><A HREF="ViewQfDjs.jsp?dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=qfdjs%></A></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><A HREF="ViewClyDjs.jsp?dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=lywxhdjs%></A></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><A HREF="ViewCsyDjs.jsp?dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=sywxhdjs%></A></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();


%>

<tr align="center">
	<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">&nbsp;</td>
	<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">小 计</td>
	<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">&nbsp;</td>

	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ZYsjdjqds%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=ZYhddjqds%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ZYwjdjqds%></td>

	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ZYyqysjsjs%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=ZYqdsbsjdjs%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ZYljsjdjs%></td>

	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ZYyqyhddjs%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=ZYqdsbhddjs%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ZYljhddjs%></td>

	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ZYqfdjs%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=ZYlywxhdjs%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ZYsywxhdjs%></td>
</tr>


</table>




</DIV>


<DIV onselectstart="return false" style="BORDER-RIGHT: #808080 2px solid; BORDER-TOP: #808080 2px solid; DISPLAY: inline; OVERFLOW: auto; BORDER-LEFT: #808080 2px solid; WIDTH: 100%; CURSOR: default; BORDER-BOTTOM: #808080 2px solid; HEIGHT:95%"> 


<TABLE style="DISPLAY: inline; BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=2 border=0 width="140%" style='FONT-SIZE: 14px'>

<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)">
  <td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td colspan="3" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签单统计</td>
  <td colspan="3" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">设计定金数</td>
  <td colspan="3" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">活动定金数</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
</tr>
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
  <td  width="3%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">序号</td>
  <td  width="11%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">分公司</td>
  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">设计定金签单数量</td>
  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">活动定金签单数量</td>
  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">未交定金签单数量</td>
  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">己签约设计定金数</td>
  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签单失败设计定金数</td>
  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">累积设计定金数</td>
  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">己签约活动定金数</td>

  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签单失败活动定金数</td>
  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">累积活动定金数</td>

  <td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">期房定金数</td>
  <td width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">超两个月未消化定金数</td>
  <td width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">超三个月未消化定金数</td>
</tr>

<%

	row=0;
	ZYsjdjqds=0;
	ZYhddjqds=0;
	ZYwjdjqds=0;

	ZYyqysjsjs=0;
	ZYqdsbsjdjs=0;
	ZYljsjdjs=0;

	ZYyqyhddjs=0;
	ZYqdsbhddjs=0;
	ZYljhddjs=0;

	ZYqfdjs=0;
	ZYlywxhdjs=0;
	ZYsywxhdjs=0;

	ls_sql=" SELECT dwmc fgs,dwbh ";
	ls_sql+=" FROM sq_dwxx a";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
	ls_sql+=wheresql1;
	ls_sql+=" order by dwbh";
//	out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgs=rs.getString("fgs");
		getdwbh=rs.getString("dwbh");

		row++;
	
		//设计定金签单数量
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_khxx,crm_zxkhxx ";
		ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh";
		ls_sql+=" and crm_khxx.zt in('2') ";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.fgsbh='"+getdwbh+"' ";
		ls_sql+=" and crm_zxkhxx.lfdjbz in('Y','T')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjdjqds=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
	
		//活动定金签单数量
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_khxx,crm_zxkhxx ";
		ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh";
		ls_sql+=" and crm_khxx.zt in('2') ";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.fgsbh='"+getdwbh+"' ";
		ls_sql+=" and crm_zxkhxx.hddjbz in('Y','T')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			hddjqds=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
	
		//未交定金签单数量
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_khxx,crm_zxkhxx ";
		ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh";
		ls_sql+=" and crm_khxx.zt in('2') ";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.fgsbh='"+getdwbh+"' ";
		ls_sql+=" and crm_zxkhxx.hddjbz='N' ";
		ls_sql+=" and crm_zxkhxx.lfdjbz='N'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			wjdjqds=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		ZYsjdjqds+=sjdjqds;
		ZYhddjqds+=hddjqds;
		ZYwjdjqds+=wjdjqds;
	
		//己签约设计定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt in('3') ";
		ls_sql+=" and crm_zxkhxx.jlfdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.lfdjbz in('Y','T')";
		ls_sql+=" and crm_zxkhxx.ssfgs='"+getdwbh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yqysjsjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
	
		//签单失败设计定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt in('2','4') ";
		ls_sql+=" and crm_zxkhxx.jlfdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.lfdjbz in('Y','T')";
		ls_sql+=" and crm_zxkhxx.ssfgs='"+getdwbh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qdsbsjdjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//累积设计定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt not in('2','3','4') ";
		ls_sql+=" and crm_zxkhxx.jlfdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.lfdjbz in('Y','T')";
		ls_sql+=" and crm_zxkhxx.ssfgs='"+getdwbh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljsjdjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		ZYyqysjsjs+=yqysjsjs;
		ZYqdsbsjdjs+=qdsbsjdjs;
		ZYljsjdjs+=ljsjdjs;
		

	
		//己签约活动定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt in('3') ";
		ls_sql+=" and crm_zxkhxx.jhddjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.jhddjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.hddjbz in('Y','T')";
		ls_sql+=" and crm_zxkhxx.ssfgs='"+getdwbh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yqyhddjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
	
		//签单失败活动定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt in('2','4') ";
		ls_sql+=" and crm_zxkhxx.jhddjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.jhddjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.hddjbz in('Y','T')";
		ls_sql+=" and crm_zxkhxx.ssfgs='"+getdwbh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qdsbhddjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//累积活动定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt not in('2','3','4') ";
		ls_sql+=" and crm_zxkhxx.jhddjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.jhddjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.hddjbz in('Y','T')";
		ls_sql+=" and crm_zxkhxx.ssfgs='"+getdwbh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljhddjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		ZYyqyhddjs+=yqyhddjs;
		ZYqdsbhddjs+=qdsbhddjs;
		ZYljhddjs+=ljhddjs;
		
	
		//期房定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt not in('2','3','4') ";
		ls_sql+=" and crm_zxkhxx.ssfgs='"+getdwbh+"' ";
		ls_sql+=" and crm_zxkhxx.fwlxbm='1' ";//1:期房

		ls_sql+=" and (crm_zxkhxx.lfdjbz in('Y','T') OR crm_zxkhxx.hddjbz in('Y','T'))";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qfdjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
	
		//超两个月未消化定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt not in('2','3','4') ";
		ls_sql+=" and crm_zxkhxx.ssfgs='"+getdwbh+"' ";

		ls_sql+=" and (crm_zxkhxx.lfdjbz in('Y','T') OR crm_zxkhxx.hddjbz in('Y','T'))";

		ls_sql+=" and (MONTHS_BETWEEN(SYSDATE,crm_zxkhxx.jlfdjsj)>2 OR MONTHS_BETWEEN(SYSDATE,crm_zxkhxx.jhddjsj)>2)";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			lywxhdjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//超三个月未消化定金数
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt not in('2','3','4') ";
		ls_sql+=" and crm_zxkhxx.ssfgs='"+getdwbh+"' ";

		ls_sql+=" and (crm_zxkhxx.lfdjbz in('Y','T') OR crm_zxkhxx.hddjbz in('Y','T'))";

		ls_sql+=" and (MONTHS_BETWEEN(SYSDATE,crm_zxkhxx.jlfdjsj)>3 OR MONTHS_BETWEEN(SYSDATE,crm_zxkhxx.jhddjsj)>3)";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sywxhdjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		ZYqfdjs+=qfdjs;
		ZYlywxhdjs+=lywxhdjs;
		ZYsywxhdjs+=sywxhdjs;
		
	

		%>
		<tr align="center">
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=row%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=getfgs%></td>

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=sjdjqds%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=hddjqds%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=wjdjqds%></td>

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=yqysjsjs%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=qdsbsjdjs%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ljsjdjs%></td>

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=yqyhddjs%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=qdsbhddjs%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ljhddjs%></td>

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=qfdjs%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=lywxhdjs%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=sywxhdjs%></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();


%>

<tr align="center">
	<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">&nbsp;</td>
	<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">小 计</td>

	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ZYsjdjqds%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=ZYhddjqds%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ZYwjdjqds%></td>

	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ZYyqysjsjs%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=ZYqdsbsjdjs%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ZYljsjdjs%></td>

	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ZYyqyhddjs%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=ZYqdsbhddjs%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ZYljhddjs%></td>

	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ZYqfdjs%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=ZYlywxhdjs%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ZYsywxhdjs%></td>
</tr>


</table>




</DIV>

</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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

