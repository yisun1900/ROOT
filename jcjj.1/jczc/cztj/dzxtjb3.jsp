<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
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

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

	String wheresql="";
	String[] rddqbms=request.getParameterValues("rddqbm");
	if (rddqbms!=null)
	{
		wheresql+=cf.arrayToSQL(rddqbms,"crm_khxx.rddqbm");
	}
	String[] hxwzbms=request.getParameterValues("hxwzbm");
	if (hxwzbms!=null)
	{
		wheresql+=cf.arrayToSQL(hxwzbms,"crm_khxx.hxwzbm");
	}
	String[] cqbms=request.getParameterValues("cqbm");
	if (cqbms!=null)
	{
		wheresql+=cf.arrayToSQL(cqbms,"crm_khxx.cqbm");
	}
	String[] ysrbm=request.getParameterValues("ysrbm");
	if (ysrbm!=null)
	{
		wheresql+=cf.arrayToSQL(ysrbm,"crm_khxx.ysrbm");
	}
	String[] nlqjbm=request.getParameterValues("nlqjbm");
	if (nlqjbm!=null)
	{
		wheresql+=cf.arrayToSQL(nlqjbm,"crm_khxx.nlqjbm");
	}
	String[] zybm=request.getParameterValues("zybm");
	if (zybm!=null)
	{
		wheresql+=cf.arrayToSQL(zybm,"crm_khxx.zybm");
	}

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String rddqbm=null;
String rddq=null;
String deflbm=null;
String deflmc=null;
int dedy=0;
int dexy=0;

double bfb=0;

int allqys=0;
int allqye=0;
int allfwmj=0;
int allpjqye=0;
int allpmjj=0;

int qys=0;
int qye=0;
int fwmj=0;
int pjqye=0;
int pmjj=0;

int xjqys=0;
int xjqye=0;
int xjfwmj=0;
int xjpjqye=0;
int xjpmjj=0;

try {
	conn=cf.getConnection();

%>
	<CENTER >
	  <B>大小单所占百分比<BR>
	  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
	</CENTER>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
	<tr bgcolor="#CCCCCC"  align="center">
	  <td  width="10%">单额分类</td>
	  <td  width="10%">签约数</td>
	  <td  width="14%">工程签约额</td>
	  <td  width="10%">平均单额</td>
	  <td  width="10%">平米均价</td>
	  <td  width="35%">签约数百分比 </td>
	</tr>

<%
	//获取总数
	ls_sql="SELECT count(*),sum(qye),sum(fwmj)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where ";
	ls_sql+="  qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
    ls_sql+=wheresql;
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allqys=rs.getInt(1);
		allqye=rs.getInt(2);
		fwmj=rs.getInt(3);

		if (allqys!=0)
		{
			allpjqye=allqye/allqys;
		}
		else{
			allpjqye=0;
		}
		if (fwmj!=0)
		{
			allpmjj=allqye/fwmj;
		}
		else{
			allpmjj=0;
		}
	}
	rs.close();
	ps.close();

	if (allqys==0)
	{
		return;
	}
		
	ls_sql="SELECT deflbm,deflmc,dedy,dexy";
	ls_sql+=" FROM kp_deflbm";
	ls_sql+=" order by deflbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		deflbm=rs1.getString("deflbm");
		deflmc=rs1.getString("deflmc");
		dedy=rs1.getInt("dedy");
		dexy=rs1.getInt("dexy");

		ls_sql="SELECT count(*),sum(qye),sum(fwmj)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.qye>="+dedy+" and crm_khxx.qye<"+dexy;
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			qys=rs.getInt(1);
			qye=rs.getInt(2);
			fwmj=rs.getInt(3);

			if (qys!=0)
			{
				pjqye=qye/qys;
			}
			else{
				pjqye=0;
			}
			if (fwmj!=0)
			{
				pmjj=qye/fwmj;
			}
			else{
				pmjj=0;
			}
		}
		rs.close();
		ps.close();

		%>
		<tr align="center">
			<td ><%=deflmc%></td>
			<td  align="right"><%=qys%></td>
			<td  align="right"><%=qye%></td>
			<td  align="right"><%=pjqye%></td>
			<td  align="right"><%=pmjj%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=(250*qys/allqys)%>" height="14"><%=(qys*100/allqys)%>%</td>
		</tr>
		<%
	}
	rs1.close();
	ps1.close();

%>
	<tr align="center">
		<td >合计</td>
		<td  align="right"><%=allqys%></td>
		<td  align="right"><%=allqye%></td>
		<td  align="right"><%=allpjqye%></td>
		<td  align="right"><%=allpmjj%></td>
		<td  align="left"><img src="/images/ColuGif.gif" width="250" height="14">100%</td>
	</tr>
</table>

<CENTER >
  <B>热点地区所占百分比<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="20%">热点地区</td>
  <td  width="10%">签约数</td>
  <td  width="15%">工程签约额</td>
  <td  width="10%">平均单额</td>
  <td  width="10%">平米均价</td>
  <td  width="35%">签约数百分比 </td>
</tr>

<%
	//获取总数
	if (allqys==0)
	{
		return;
	}

		
	ls_sql="SELECT rddq,count(*),sum(qye),sum(fwmj)";
	ls_sql+=" FROM crm_khxx,dm_rddqbm";
	ls_sql+=" where crm_khxx.rddqbm=dm_rddqbm.rddqbm ";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by dm_rddqbm.rddq";
	ls_sql+=" order by count(*) desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		rddq=rs.getString(1);
		qys=rs.getInt(2);
		qye=rs.getInt(3);
		fwmj=rs.getInt(4);

		if (qys!=0)
		{
			pjqye=qye/qys;
		}
		else{
			pjqye=0;
		}
		if (fwmj!=0)
		{
			pmjj=qye/fwmj;
		}
		else{
			pmjj=0;
		}

		if (qys==0)
		{
			continue;
		}

		bfb=qys*100.0/allqys;

		%>
		<tr align="center">
			<td ><%=rddq%></td>
			<td  align="right"><%=qys%></td>
			<td  align="right"><%=qye%></td>
			<td  align="right"><%=pjqye%></td>
			<td  align="right"><%=pmjj%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=(2.5*bfb)%>" height="14"><%=cf.formatDouble(bfb)%>%</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
	<tr align="center">
		<td >合计</td>
		<td  align="right"><%=allqys%></td>
		<td  align="right"><%=allqye%></td>
		<td  align="right"><%=allpjqye%></td>
		<td  align="right"><%=allpmjj%></td>
		<td  align="left"><img src="/images/ColuGif.gif" width="250" height="14"></td>
	</tr>
</table>

<P>
<CENTER >
	<B>热点地区大小单统计<BR>
	(签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
  </CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="20%">热点地区</td>
  <td  width="10%">签约数</td>
  <td  width="15%">工程签约额</td>
  <td  width="10%">平均单额</td>
  <td  width="10%">平米均价</td>
  <td  width="35%">签约数百分比 </td>
</tr>
<%
	//热点地区大小单统计
	ls_sql="SELECT deflbm,deflmc,dedy,dexy";
	ls_sql+=" FROM kp_deflbm";
	ls_sql+=" order by deflbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		deflbm=rs1.getString("deflbm");
		deflmc=rs1.getString("deflmc");
		dedy=rs1.getInt("dedy");
		dexy=rs1.getInt("dexy");

		//分类小计
		ls_sql="SELECT count(*),sum(qye),sum(fwmj)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.qye>="+dedy+" and crm_khxx.qye<"+dexy;
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xjqys=rs.getInt(1);
			xjqye=rs.getInt(2);
			xjfwmj=rs.getInt(3);

			if (xjqys!=0)
			{
				xjpjqye=xjqye/xjqys;
			}
			else{
				xjpjqye=0;
			}
			if (xjfwmj!=0)
			{
				xjpmjj=xjqye/xjfwmj;
			}
			else{
				xjpmjj=0;
			}
		}
		rs.close();
		ps.close();

		//分类明细
		ls_sql="SELECT rddq,count(*),sum(qye),sum(fwmj)";
		ls_sql+=" FROM crm_khxx,dm_rddqbm";
		ls_sql+=" where crm_khxx.qye>="+dedy+" and crm_khxx.qye<"+dexy;
		ls_sql+=" and crm_khxx.rddqbm=dm_rddqbm.rddqbm";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ls_sql+=" group by dm_rddqbm.rddqbm,rddq";
		ls_sql+=" order by count(*) desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			rddq=rs.getString(1);
			qys=rs.getInt(2);
			qye=rs.getInt(3);
			fwmj=rs.getInt(4);

			if (qys!=0)
			{
				pjqye=qye/qys;
			}
			else{
				pjqye=0;
			}
			if (fwmj!=0)
			{
				pmjj=qye/fwmj;
			}
			else{
				pmjj=0;
			}

			bfb=qys*100.0/xjqys;

			%>
			<tr align="center">
				<td ><%=rddq%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=qye%></td>
				<td  align="right"><%=pjqye%></td>
				<td  align="right"><%=pmjj%></td>
				<td  align="left"><img src="/images/ColuGif.gif" width="<%=(2.5*bfb)%>" height="14"><%=cf.formatDouble(bfb)%>%</td>
			</tr>
			<%
		}
		rs.close();
		ps.close();


		%>
		<tr align="center">
			<td ><%=deflmc%>小计</td>
			<td  align="right"><%=xjqys%></td>
			<td  align="right"><%=xjqye%></td>
			<td  align="right"><%=xjpjqye%></td>
			<td  align="right"><%=xjpmjj%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="250" height="14"></td>
		</tr>
		<tr align="center" height="30">
			<td colspan="6">&nbsp;</td>
		</tr>
		<%
	}
	rs1.close();
	ps1.close();
%>
</table>

<P>
<CENTER >
	<B>热点地区大小单统计<BR>
	(签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
  </CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="20%">大小单</td>
  <td  width="10%">签约数</td>
  <td  width="15%">工程签约额</td>
  <td  width="10%">平均单额</td>
  <td  width="10%">平米均价</td>
  <td  width="35%">签约数百分比 </td>
</tr>
<%
	//热点地区大小单统计
	ls_sql="SELECT rddqbm,rddq";
	ls_sql+=" FROM dm_rddqbm";
	ls_sql+=" order by rddqbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		rddqbm=rs1.getString("rddqbm");
		rddq=rs1.getString("rddq");

		//分类小计
		ls_sql="SELECT count(*),sum(qye),sum(fwmj)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.rddqbm='"+rddqbm+"'";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xjqys=rs.getInt(1);
			xjqye=rs.getInt(2);
			xjfwmj=rs.getInt(3);

			if (xjqys!=0)
			{
				xjpjqye=xjqye/xjqys;
			}
			else{
				xjpjqye=0;
			}
			if (xjfwmj!=0)
			{
				xjpmjj=xjqye/xjfwmj;
			}
			else{
				xjpmjj=0;
			}
		}
		rs.close();
		ps.close();
		if (xjqys==0)
		{
			continue;
		}

		//分类明细
		ls_sql="SELECT deflmc,count(*),sum(qye),sum(fwmj)";
		ls_sql+=" FROM crm_khxx,kp_deflbm";
		ls_sql+=" where crm_khxx.qye>=kp_deflbm.dedy and crm_khxx.qye<kp_deflbm.dexy";
		ls_sql+=" and crm_khxx.rddqbm='"+rddqbm+"'";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ls_sql+=" group by deflbm,deflmc";
		ls_sql+=" order by deflbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			deflmc=rs.getString(1);
			qys=rs.getInt(2);
			qye=rs.getInt(3);
			fwmj=rs.getInt(4);

			if (qys!=0)
			{
				pjqye=qye/qys;
			}
			else{
				pjqye=0;
			}
			if (fwmj!=0)
			{
				pmjj=qye/fwmj;
			}
			else{
				pmjj=0;
			}

			bfb=qys*100.0/xjqys;

			%>
			<tr align="center">
				<td ><%=deflmc%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=qye%></td>
				<td  align="right"><%=pjqye%></td>
				<td  align="right"><%=pmjj%></td>
				<td  align="left"><img src="/images/ColuGif.gif" width="<%=(2.5*bfb)%>" height="14"><%=cf.formatDouble(bfb)%>%</td>
			</tr>
			<%
		}
		rs.close();
		ps.close();


		%>
		<tr align="center">
			<td ><%=rddq%>小计</td>
			<td  align="right"><%=xjqys%></td>
			<td  align="right"><%=xjqye%></td>
			<td  align="right"><%=xjpjqye%></td>
			<td  align="right"><%=xjpmjj%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="250" height="14"></td>
		</tr>
		<tr align="center" height="20">
			<td colspan="6">&nbsp;</td>
		</tr>
		<%
	}
	rs1.close();
	ps1.close();
%>
</table>

<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


</body>
</html>