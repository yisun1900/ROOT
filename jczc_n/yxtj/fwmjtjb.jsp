<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
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

if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}

wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";




Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>签单客户房屋面积统计（分公司）</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="11%">分公司</td>
  <td  width="13%">房屋面积</td>
  <td  width="7%">签约数</td>
  <td  width="11%">工程签约额</td>
  <td  width="8%">单额平均</td>
  <td  width="8%">平米均价</td>
  <td  width="9%">设计费</td>
  <td  width="7%">折扣率</td>
  <td  width="28%">签约数 </td>
</tr>
<%
	//获取最大数
	int maxqys=0;
	String fgsbh=null;
	String getfgs=null;
	String oldfgs="";
	String hxmjmc=null;
	String gethxmjbm=null;
	int qys=0;
	double zqye=0;
	double wdzgce=0;
	long fwmj=0;
	double sjf=0;

	int fgsqys=0;
	double fgszqye=0;
	double fgswdzgce=0;
	long fgsfwmj=0;
	double fgssjf=0;

	int allqys=0;
	double allzqye=0;
	double allwdzgce=0;
	long allfwmj=0;
	double allsjf=0;

	double bfb=0;
	double zkl=0;
	int pjde=0;
	int pmjj=0;

	int row=0;

	ls_sql="SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwlx='F0' ";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and dwbh='"+fgs+"'";
	}
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		fgsbh=rs1.getString("dwbh");
		getfgs=rs1.getString("dwmc");

		fgsqys=0;
		fgszqye=0;
		fgswdzgce=0;
		fgssjf=0;
		fgsfwmj=0;

		ls_sql=" SELECT count(*) qys,TRUNC(sum(qye)) zqye,TRUNC(sum(wdzgce)) wdzgce,TRUNC(sum(sjf)) sjf,TRUNC(sum(fwmj)) fwmj";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2' and fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			fgsqys=rs.getInt("qys");
			fgszqye=rs.getDouble("zqye");
			fgswdzgce=rs.getDouble("wdzgce");
			fgssjf=rs.getDouble("sjf");
			fgsfwmj=rs.getLong("fwmj");
		}
		rs.close();
		ps.close();

		if (fgsqys==0)
		{
			continue;
		}

		allqys+=fgsqys;
		allzqye+=fgszqye;
		allwdzgce+=fgswdzgce;
		allfwmj+=fgsfwmj;
		allsjf+=fgssjf;
		

		int rowsl=0;
		ls_sql=" SELECT count(distinct crm_khxx.hxmjbm)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2' and fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			rowsl=rs.getInt(1);
		}
		rs.close();
		ps.close();
		
		
		ls_sql=" SELECT crm_khxx.hxmjbm,hxmjmc,count(*) qys,TRUNC(sum(qye)) zqye,TRUNC(sum(wdzgce)) wdzgce,TRUNC(sum(sjf)) sjf,TRUNC(sum(fwmj)) fwmj";
		ls_sql+=" FROM crm_khxx,dm_hxmjbm";
		ls_sql+=" where crm_khxx.hxmjbm=dm_hxmjbm.hxmjbm";
		ls_sql+=" and crm_khxx.zt='2' and fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" group by crm_khxx.hxmjbm,hxmjmc";
		ls_sql+=" order by crm_khxx.hxmjbm ";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gethxmjbm=rs.getString("hxmjbm");
			hxmjmc=rs.getString("hxmjmc");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			wdzgce=rs.getDouble("wdzgce");
			sjf=rs.getDouble("sjf");
			fwmj=rs.getLong("fwmj");

			if (qys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(zqye/qys);
			}
			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(zqye/fwmj);
			}
			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=zqye*100/wdzgce;
			}

			if (fgsqys!=0)
			{
				bfb=qys*100.0/fgsqys;
			}
			else{
				bfb=0;
			}

			row++;

			%>
			<tr align="center">
				<td rowspan="<%=(rowsl+1)%>"><%=getfgs%></td>
				<td ><%=hxmjmc%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=cf.formatDouble(zqye)%></td>
				<td  align="right"><%=cf.formatDouble(pjde)%></td>
				<td  align="right"><%=cf.formatDouble(pmjj)%></td>
				<td  align="right"><%=cf.formatDouble(sjf)%></td>
				<td  align="right"><%=cf.formatDouble(zkl)%>%</td>
				<td  align="left"><A HREF="ViewHxmj.jsp?fgs=<%=fgsbh%>&dwbh=<%=dwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&hxmjbm=<%=gethxmjbm%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=bfb*3%>" height="14"></A><%=cf.formatDouble(bfb)%>%</td>
			</tr>
			<%	
		}

		while (rs.next())
		{
			gethxmjbm=rs.getString("hxmjbm");
			hxmjmc=rs.getString("hxmjmc");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			wdzgce=rs.getDouble("wdzgce");
			sjf=rs.getDouble("sjf");
			fwmj=rs.getLong("fwmj");

			if (qys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(zqye/qys);
			}
			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(zqye/fwmj);
			}
			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=zqye*100/wdzgce;
			}

			if (fgsqys!=0)
			{
				bfb=qys*100.0/fgsqys;
			}
			else{
				bfb=0;
			}

			row++;

			%>
			<tr align="center">
				<td ><%=hxmjmc%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=cf.formatDouble(zqye)%></td>
				<td  align="right"><%=cf.formatDouble(pjde)%></td>
				<td  align="right"><%=cf.formatDouble(pmjj)%></td>
				<td  align="right"><%=cf.formatDouble(sjf)%></td>
				<td  align="right"><%=cf.formatDouble(zkl)%>%</td>
				<td  align="left"><A HREF="ViewHxmj.jsp?fgs=<%=fgsbh%>&dwbh=<%=dwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&hxmjbm=<%=gethxmjbm%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=bfb*3%>" height="14"></A><%=cf.formatDouble(bfb)%>%</td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();


		if (fgsqys==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(fgszqye/fgsqys);
		}
		if (fgsfwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(int)(fgszqye/fgsfwmj);
		}
		if (fgswdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=fgszqye*100/fgswdzgce;
		}
		%>
		<tr align="center">
			<td >小计</td>
			<td  align="right"><%=fgsqys%></td>
			<td  align="right"><%=cf.formatDouble(fgszqye)%></td>
			<td  align="right"><%=cf.formatDouble(pjde)%></td>
			<td  align="right"><%=cf.formatDouble(pmjj)%></td>
			<td  align="right"><%=cf.formatDouble(fgssjf)%></td>
			<td  align="right"><%=cf.formatDouble(zkl)%>%</td>
			<td  align="left">&nbsp;</td>
		</tr>
		<%
	}
	rs1.close();
	ps1.close();

	if (allqys==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(allzqye/allqys);
	}
	if (allfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(allzqye/allfwmj);
	}
	if (allwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=allzqye*100/allwdzgce;
	}
%>
<tr align="center">
	<td >总计</td>
	<td >&nbsp;</td>
	<td  align="right"><%=allqys%></td>
	<td  align="right"><%=cf.formatDouble(allzqye)%></td>
	<td  align="right"><%=cf.formatDouble(pjde)%></td>
	<td  align="right"><%=cf.formatDouble(pmjj)%></td>
	<td  align="right"><%=cf.formatDouble(allsjf)%></td>
	<td  align="right"><%=cf.formatDouble(zkl)%>%</td>
	<td  align="left">&nbsp;</td>
</tr>
</table>


<BR>
<CENTER >
  <B>房屋面积统计（全部）</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="13%">房屋面积</td>
  <td  width="7%">签约数</td>
  <td  width="11%">工程签约额</td>
  <td  width="8%">单额平均</td>
  <td  width="8%">平米均价</td>
  <td  width="9%">设计费</td>
  <td  width="7%">折扣率</td>
  <td  width="28%">签约数 </td>
</tr>
<%
	ls_sql=" SELECT crm_khxx.hxmjbm,hxmjmc,count(*) qys,TRUNC(sum(qye)) zqye,TRUNC(sum(wdzgce)) wdzgce,TRUNC(sum(sjf)) sjf,TRUNC(sum(fwmj)) fwmj";
	ls_sql+=" FROM crm_khxx,dm_hxmjbm";
	ls_sql+=" where crm_khxx.hxmjbm=dm_hxmjbm.hxmjbm";
	ls_sql+=" and crm_khxx.zt='2' ";
	ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.hxmjbm,hxmjmc";
	ls_sql+=" order by crm_khxx.hxmjbm ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		gethxmjbm=rs.getString("hxmjbm");
		hxmjmc=rs.getString("hxmjmc");
		qys=rs.getInt("qys");
		zqye=rs.getDouble("zqye");
		wdzgce=rs.getDouble("wdzgce");
		sjf=rs.getDouble("sjf");
		fwmj=rs.getLong("fwmj");

		if (qys==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(zqye/qys);
		}
		if (fwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(int)(zqye/fwmj);
		}
		if (wdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=zqye*100/wdzgce;
		}

		if (allqys!=0)
		{
			bfb=qys*100.0/allqys;
		}
		else{
			bfb=0;
		}

		%>
		<tr align="center">
			<td ><%=hxmjmc%></td>
			<td  align="right"><%=qys%></td>
			<td  align="right"><%=cf.formatDouble(zqye)%></td>
			<td  align="right"><%=cf.formatDouble(pjde)%></td>
			<td  align="right"><%=cf.formatDouble(pmjj)%></td>
			<td  align="right"><%=cf.formatDouble(sjf)%></td>
			<td  align="right"><%=cf.formatDouble(zkl)%>%</td>
			<td  align="left"><A HREF="ViewHxmj.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&hxmjbm=<%=gethxmjbm%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=bfb*3%>" height="14"></A><%=cf.formatDouble(bfb)%>%</td>
		</tr>
		<%	
	}

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

