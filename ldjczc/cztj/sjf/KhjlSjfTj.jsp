<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030405'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[客户经理设计费统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[客户经理设计费统计]："+xtrzyhmc+"') ";
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
String khjl=cf.GB2Uni(request.getParameter("khjl"));


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

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>客户经理设计费统计</B><BR>
  <b>(时间范围：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="3%" >序号 </td>
  <td  width="11%" >店面</td>
  <td  width="7%" >客户经理</td>

  <td  width="6%" >实收数</td>
  <td  width="11%" ><font color="#FF0000">实收金额</font></td>
  <td  width="11%" ><font color="#FF0000">财务审核</font></td>

  <td  width="6%" >设计合同数</td>
  <td  width="11%" >设计合同金额</td>
  <td  width="7%" >房屋面积</td>
  <td  width="7%" >平米收设计费</td>
  <td  width="7%" >户均收设计费</td>

  <td  width="6%" ><font color="#0000FF">入店客户数</font></td>
  <td  width="8%" ><font color="#0000FF">入店客户收设计费比例</font></td>
  </tr>
<%
	//实收设计费
	int zjsskhsl=0;
	double zjsjf=0;
	double zjcwsjf=0;

	int zjkhsl=0;
	double zjsjhtje=0;
	long zjfwmj=0;

	int zjrdkhs=0;
	//入店客户数


	int row=0;

	String getfgsbh=null;
	String fgsmc=null;
	String getdwbh=null;
	String dmmc=null;
	String cxbz="";
	String kdsj="";
	String gdsj="";

	ls_sql =" SELECT sq_dwxx.ssfgs,b.dwmc fgsmc,sq_dwxx.dwbh,sq_dwxx.dwmc,sq_dwxx.kdsj,sq_dwxx.gdsj,sq_dwxx.cxbz ";
	ls_sql+=" FROM sq_dwxx,sq_dwxx b";
	ls_sql+=" where  sq_dwxx.ssfgs=b.dwbh(+) and sq_dwxx.dwlx='F2'";
	ls_sql+=" and sq_dwxx.ssfgs='"+fgs+"'";

	if (!(dwbh.equals("")))
	{
		ls_sql+=" and  sq_dwxx.dwbh='"+dwbh+"'";
	}
	if (!(khjl.equals("")))
	{
		ls_sql+=" and  sq_dwxx.dwbh in(select dwbh from sq_yhxx where ssfgs='"+fgs+"' and yhmc='"+khjl+"' and zwbm in('03'))";
	}

	ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>TO_DATE('"+sjfw+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";

	ls_sql+=" order by sq_dwxx.ssfgs,sq_dwxx.dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		getfgsbh=rs2.getString("ssfgs");
		fgsmc=rs2.getString("fgsmc");
		getdwbh=rs2.getString("dwbh");
		dmmc=rs2.getString("dwmc");
		cxbz=rs2.getString("cxbz");
		kdsj=cf.fillNull(rs2.getDate("kdsj"));
		gdsj=cf.fillNull(rs2.getDate("gdsj"));


		//实收设计费
		int xjsskhsl=0;
		double xjsjf=0;
		double xjcwsjf=0;

		int xjkhsl=0;
		double xjsjhtje=0;
		long xjfwmj=0;

		//入店客户数
		int xjrdkhs=0;


		String sqlkhjl="";

		String getkhjl="";
		String sfzszg="";
		String rzsj="";
		String lzrq="";
		ls_sql =" SELECT yhmc,sfzszg,rzsj,lzrq";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where zwbm in('03')";
		ls_sql+=" and dwbh='"+getdwbh+"'";
		if (!(khjl.equals("")))
		{
			ls_sql+=" and yhmc='"+khjl+"'";
		}
		ls_sql+=" and (sfzszg in('Y','N') or lzrq+62>TO_DATE('"+sjfw+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
		ls_sql+=" order by yhmc";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			getkhjl=rs1.getString("yhmc");
			sfzszg=rs1.getString("sfzszg");
			rzsj=cf.fillNull(rs1.getDate("rzsj"));
			lzrq=cf.fillNull(rs1.getDate("lzrq"));

			sqlkhjl+=",'"+getkhjl+"'";

			//实收款
			double sjf=0;
			int sskhsl=0;
			ls_sql =" SELECT count(distinct cw_khfkjl.khbh) sskhsl,sum(cw_khfkjl.fkje) sjf ";
			ls_sql+=" FROM cw_khfkjl,crm_zxkhxx";
			ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh";

			ls_sql+=" and cw_khfkjl.scbz='N' ";
			ls_sql+=" and cw_khfkjl.fklxbm in('53')";//53：设计费

			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"' and crm_zxkhxx.khjl='"+getkhjl+"'";

			ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sskhsl=rs.getInt("sskhsl");
				sjf=rs.getDouble("sjf");
			}
			rs.close();
			ps.close();

			//财务审核实收款
			double cwsjf=0;
			ls_sql =" SELECT sum(cw_khfkjl.fkje) sjf ";
			ls_sql+=" FROM cw_khfkjl,crm_zxkhxx";
			ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh";

			ls_sql+=" and cw_khfkjl.scbz='N' ";
			ls_sql+=" and cw_khfkjl.fklxbm in('53')";//53：设计费
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";

			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"' and crm_zxkhxx.khjl='"+getkhjl+"'";

			ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				cwsjf=rs.getDouble("sjf");
			}
			rs.close();
			ps.close();
		
			//设计合同
			int khsl=0;
			double sjhtje=0;
			long fwmj=0;
			ls_sql =" SELECT count(khbh) khsl,sum(sjhtje) sjhtje,sum(fwmj) fwmj";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where qsjhtbz='Y' ";
			ls_sql+=" and qsjhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and qsjhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"' and crm_zxkhxx.khjl='"+getkhjl+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				khsl=rs.getInt("khsl");
				sjhtje=rs.getDouble("sjhtje");
				fwmj=rs.getLong("fwmj");
			}
			rs.close();
			ps.close();
			

			xjsskhsl+=sskhsl;
			xjsjf+=sjf;
			xjcwsjf+=cwsjf;

			xjkhsl+=khsl;
			xjsjhtje+=sjhtje;
			xjfwmj+=fwmj;

			zjsskhsl+=sskhsl;
			zjsjf+=sjf;
			zjcwsjf+=cwsjf;

			zjkhsl+=khsl;
			zjsjhtje+=sjhtje;
			zjfwmj+=fwmj;

			int pmjj=0;
			int pjde=0;

			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(sjhtje/fwmj);
			}

			if (khsl==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(sjhtje/khsl);
			}
			
			//入店客户数
			int rdkhs=0;
			ls_sql =" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx ";
			ls_sql+=" where crm_zxkhxx.zxdm='"+getdwbh+"' and crm_zxkhxx.khjl='"+getkhjl+"'";
			ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息
			ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				rdkhs=rs.getInt(1);
			}
			rs.close();
			ps.close();
			
			xjrdkhs+=rdkhs;
			zjrdkhs+=rdkhs;

			//入店客户收设计费比例
			double rdsjfbl=0;
			if (rdkhs==0)
			{
				rdsjfbl=0;
			}
			else{
				rdsjfbl=cf.round(khsl*100.0/rdkhs,2);
			}

			
			//撤店无数据不显示
			if (   (cxbz.equals("N") && sfzszg.equals("Y")) || (cxbz.equals("N") && sfzszg.equals("N")) || (khsl+rdkhs!=0)   )
			{
				row++;

				%>
				<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					<td align="center"><%=row%></td>
					<td align="center"><%=dmmc%></td>
					<td align="center"><%=getkhjl%></td>

					<td>
						<A HREF="ViewKhjlSjfMxSs.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&khjl=<%=getkhjl%>" target="_blank"><%=sskhsl%></A>			
					</td>
					<td><%=cf.formatDouble(sjf)%></td>
					<td><%=cf.formatDouble(cwsjf)%></td>

					<td>
						<A HREF="ViewKhjlSjfMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&khjl=<%=getkhjl%>" target="_blank"><%=khsl%></A>			
					</td>
					<td><%=cf.formatDouble(sjhtje)%></td>
					<td><%=fwmj%></td>
					<td><%=pmjj%></td>

					<td><%=pjde%></td>
					
					<td>
						<A HREF="ViewkhjlRdkhMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&khjl=<%=getkhjl%>" target="_blank"><%=rdkhs%></A>			
					</td>
					<td><%=rdsjfbl%>%</td>
				</tr>
				<%	
			}
		}
		rs1.close();
		ps1.close();



		ls_sql =" SELECT distinct khjl";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxdm='"+getdwbh+"'";
		if (!sqlkhjl.equals(""))
		{
			ls_sql+=" and crm_zxkhxx.khjl not in("+sqlkhjl.substring(1)+")";
		}
		ls_sql+=" and crm_zxkhxx.qsjhtbz='Y'";//N：未签；Y：签合同
		ls_sql+=" and crm_zxkhxx.qsjhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.qsjhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.khjl is not null";
		ls_sql+=" order by khjl";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			getkhjl=rs1.getString("khjl");

			//实收款
			double sjf=0;
			int sskhsl=0;
			ls_sql =" SELECT count(distinct cw_khfkjl.khbh) khsl,sum(cw_khfkjl.fkje) sjf ";
			ls_sql+=" FROM cw_khfkjl,crm_zxkhxx";
			ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh";

			ls_sql+=" and cw_khfkjl.scbz='N' ";
			ls_sql+=" and cw_khfkjl.fklxbm in('53')";//53：设计费

			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"' and crm_zxkhxx.khjl='"+getkhjl+"'";

			ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sskhsl=rs.getInt("khsl");
				sjf=rs.getDouble("sjf");
			}
			rs.close();
			ps.close();
			
			//财务审核实收款
			double cwsjf=0;
			ls_sql =" SELECT sum(cw_khfkjl.fkje) sjf ";
			ls_sql+=" FROM cw_khfkjl,crm_zxkhxx";
			ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh";

			ls_sql+=" and cw_khfkjl.scbz='N' ";
			ls_sql+=" and cw_khfkjl.fklxbm in('53')";//53：设计费
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";

			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"' and crm_zxkhxx.khjl='"+getkhjl+"'";

			ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				cwsjf=rs.getDouble("sjf");
			}
			rs.close();
			ps.close();
			
			//设计合同
			int khsl=0;
			double sjhtje=0;
			long fwmj=0;
			ls_sql =" SELECT count(khbh) khsl,sum(sjhtje) sjhtje,sum(fwmj) fwmj";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where qsjhtbz='Y' ";
			ls_sql+=" and qsjhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and qsjhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"' and crm_zxkhxx.khjl='"+getkhjl+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				khsl=rs.getInt("khsl");
				sjhtje=rs.getDouble("sjhtje");
				fwmj=rs.getLong("fwmj");
			}
			rs.close();
			ps.close();
		

			xjsskhsl+=sskhsl;
			xjsjf+=sjf;
			xjcwsjf+=cwsjf;

			xjkhsl+=khsl;
			xjsjhtje+=sjhtje;
			xjfwmj+=fwmj;

			zjsskhsl+=sskhsl;
			zjsjf+=sjf;
			zjcwsjf+=cwsjf;

			zjkhsl+=khsl;
			zjsjhtje+=sjhtje;
			zjfwmj+=fwmj;

			int pmjj=0;
			int pjde=0;

			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(sjhtje/fwmj);
			}

			if (khsl==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(sjhtje/khsl);
			}


			
			//入店客户数
			int rdkhs=0;
			ls_sql =" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx ";
			ls_sql+=" where crm_zxkhxx.zxdm='"+getdwbh+"' and crm_zxkhxx.khjl='"+getkhjl+"'";
			ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息
			ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				rdkhs=rs.getInt(1);
			}
			rs.close();
			ps.close();
			
			xjrdkhs+=rdkhs;
			zjrdkhs+=rdkhs;

			//入店客户收设计费比例
			double rdsjfbl=0;
			if (rdkhs==0)
			{
				rdsjfbl=0;
			}
			else{
				rdsjfbl=cf.round(khsl*100.0/rdkhs,2);
			}
			
			String zhdwmc="(不存在)";
			ls_sql =" SELECT dwmc";
			ls_sql+=" FROM sq_yhxx,sq_dwxx";
			ls_sql+=" where zwbm in('03')";
			ls_sql+=" and sq_yhxx.ssfgs='"+getfgsbh+"'";
			ls_sql+=" and yhmc='"+getkhjl+"'";
			ls_sql+=" and sq_yhxx.dwbh=sq_dwxx.dwbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zhdwmc=rs.getString("dwmc");
			}
			rs.close();
			ps.close();

			row++;

			%>
			<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				<td align="center"><%=row%></td>
				<td align="center"><%=dmmc%></td>
				<td align="center"><%=getkhjl%>:<%=zhdwmc%></td>

					<td>
						<A HREF="ViewKhjlSjfMxSs.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&khjl=<%=getkhjl%>" target="_blank"><%=sskhsl%></A>			
					</td>
					<td><%=cf.formatDouble(sjf)%></td>
					<td><%=cf.formatDouble(cwsjf)%></td>

					<td>
						<A HREF="ViewKhjlSjfMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&khjl=<%=getkhjl%>" target="_blank"><%=khsl%></A>			
					</td>
					<td><%=cf.formatDouble(sjhtje)%></td>
					<td><%=fwmj%></td>
					<td><%=pmjj%></td>
					<td><%=pjde%></td>
					
					<td>
						<A HREF="ViewkhjlRdkhMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&khjl=<%=getkhjl%>" target="_blank"><%=rdkhs%></A>			
					</td>
					<td><%=rdsjfbl%>%</td>
			</tr>
			<%	
		}
		rs1.close();
		ps1.close();


		int pmjj=0;
		int pjde=0;

		if (xjfwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(int)(xjsjhtje/xjfwmj);
		}
		if (xjkhsl==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(xjsjhtje/xjkhsl);
		}


		//入店客户收设计费比例
		double rdsjfbl=0;
		if (xjrdkhs==0)
		{
			rdsjfbl=0;
		}
		else{
			rdsjfbl=cf.round(xjkhsl*100.0/xjrdkhs,2);
		}

		%>
		<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td align="center" colspan="3"><font color="#ff0000">[<%=dmmc%>]小计</td>

			<td><B><%=xjsskhsl%></B></td>
			<td><B><%=cf.formatDouble(xjsjf)%></B></td>
			<td><B><%=cf.formatDouble(xjcwsjf)%></B></td>

			<td><B><%=xjkhsl%></B></td>
			<td><B><%=cf.formatDouble(xjsjhtje)%></B></td>
			<td><B><%=xjfwmj%></B></td>
			<td><B><%=pmjj%></B></td>
			<td><B><%=pjde%></B></td>
			
			<td><B><%=xjrdkhs%></B></td>
			<td><B><%=rdsjfbl%>%</B></td>
		</tr>
		<%
	}
	rs2.close();
	ps2.close();


	int pmjj=0;
	int pjde=0;

	if (zjfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(zjsjhtje/zjfwmj);
	}
	if (zjkhsl==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(zjsjhtje/zjkhsl);
	}

	//入店客户收设计费比例
	double rdsjfbl=0;
	if (zjrdkhs==0)
	{
		rdsjfbl=0;
	}
	else{
		rdsjfbl=cf.round(zjkhsl*100.0/zjrdkhs,2);
	}
%>
<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td align="center" colspan="3"><B>总 计</B></td>

	<td><B><%=zjsskhsl%></B></td>
	<td><B><%=cf.formatDouble(zjsjf)%></B></td>
	<td><B><%=cf.formatDouble(zjcwsjf)%></B></td>

	<td><B><%=zjkhsl%></B></td>
	<td><B><%=cf.formatDouble(zjsjhtje)%></B></td>
	<td><B><%=zjfwmj%></B></td>
	<td><B><%=pmjj%></B></td>
	<td><B><%=pjde%></B></td>
	
	<td><B><%=zjrdkhs%></B></td>
	<td><B><%=rdsjfbl%>%</B></td>
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