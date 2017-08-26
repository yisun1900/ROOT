<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String sjbh=null;
String fklxbm=null;
double fkje=0;
String jkr=null;
String skr=null;
String sksj=null;
String skdw=null;
String lrr=null;
String lrsj=null;
String shbz=null;
String bz=null;
String zffs=null;
String zckx=null;
String lrdw=null;
String gysbh=null;
String ddbh=null;
String zjxbh=null;
String zcgysbh=null;
String zcddbh=null;
String zczjxbh=null;
String glxh=null;
String gljlbz=null;
String zzyhkh=null;


String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String qye=null;
String hth=null;
String dwbh=null;
String sgd=null;
String sgbz=null;
String sjsdh=null;
String bzdh=null;
String zjdh=null;
String zjxm=null;
String qyrq=null;
String jgrq=null;
String zt=null;

String sjsbh=null;
String fgsbh=null;
String gcjdmc=null;
String ztmc=null;

String cxhdbm="";
String sffj="";
double fjje=0;
double gsfje=0;
String sfyrz="";
String rzsc="";
String sfyyh="";
String yhyy="";

double kglf=0;
double kqtk=0;
double gckk=0;
double glf=0;

String yjjzsj=null;

String dsksjbz=null;
String sjr=null;
String shsj=null;
String shyj="";


String fkxh=cf.GB2Uni(request.getParameter("fkxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


String zcmmbz="";//主材收款检查

String gysbhStr="";

try {
	conn=cf.getConnection();
	ls_sql="select zzyhkh,yjjzsj,zckx,lrdw,khbh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr,lrsj,bz,zffs,gysbh,ddbh,zjxbh,zcgysbh,zcddbh,zczjxbh,glxh,gljlbz ";
	ls_sql+=" ,DECODE(cw_khfkjl.dsksjbz,'N','未审核','Y','审核通过','M','审核未通过') dsksjbz,sjr,shsj,shyj";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where fkxh='"+fkxh+"' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zzyhkh=cf.fillNull(rs.getString("zzyhkh"));
		dsksjbz=cf.fillNull(rs.getString("dsksjbz"));
		sjr=cf.fillNull(rs.getString("sjr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shyj=cf.fillNull(rs.getString("shyj"));

		yjjzsj=cf.fillNull(rs.getString("yjjzsj"));
		zckx=cf.fillNull(rs.getString("zckx"));
		lrdw=cf.fillNull(rs.getString("lrdw"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sjbh=cf.fillNull(rs.getString("sjbh"));
		fklxbm=cf.fillNull(rs.getString("fklxbm"));
		fkje=rs.getDouble("fkje");
		jkr=cf.fillNull(rs.getString("jkr"));
		skr=cf.fillNull(rs.getString("skr"));
		sksj=cf.fillNull(rs.getDate("sksj"));
		skdw=cf.fillNull(rs.getString("skdw"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		zffs=cf.fillNull(rs.getString("zffs"));
		gysbh=cf.fillNull(rs.getString("gysbh"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		zjxbh=cf.fillNull(rs.getString("zjxbh"));
		zcgysbh=cf.fillNull(rs.getString("zcgysbh"));
		zcddbh=cf.fillNull(rs.getString("zcddbh"));
		zczjxbh=cf.fillNull(rs.getString("zczjxbh"));
		glxh=cf.fillNull(rs.getString("glxh"));
		gljlbz=cf.fillNull(rs.getString("gljlbz"));
	}
	else{
		rs.close();
		ps.close();

		out.println("不存在的收款记录");
		return;
	}
	rs.close();
	ps.close();

	//检查客户结算＋＋＋＋＋＋＋＋＋＋＋＋开始
	String getkhjsbz="";
	ls_sql=" select khjsbz ";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getkhjsbz=cf.fillNull(rs.getString("khjsbz"));
	}
	rs.close();
	ps.close();

	if (getkhjsbz.equals("Y") || getkhjsbz.equals("2") )//N：未结算；Y：已结算；2：审批同意；3：审批不同意
	{
		out.println("<font color=\"#FF0000\">错误！客户已结算</font>:"+getkhjsbz);
		return;
	}
	//检查客户结算＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	if (!yjjzsj.equals(""))
	{
//		out.println("收款记录已结转，不能再修改，结转时间："+yjjzsj);
//		return;
	}

	if (gljlbz.equals("Y"))//N：非关联记录；Y：关联记录
	{
		String glfkxh=null;
		ls_sql="select fkxh";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where glxh='"+glxh+"' and gljlbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			glfkxh=cf.fillNull(rs.getString("fkxh"));
		}
		rs.close();
		ps.close();

		out.println("错误！该条记录是关联记录，不能直接进行修改，请修改原始记录："+glfkxh);
		return;
	}

	ls_sql="select DECODE(zt,'2','家装客户','3','退单客户','4','非家装客户','5','设计客户') ztmc,cxhdbm,sffj,fjje,gsfje,sfyrz,rzsc,sfyyh,yhyy ,kqtk,kglf,gckk ,glf,gcjdmc,khxm,fwdz,lxfs,sjs,qye,hth,dwbh,sgd,sgbz,qyrq,jgrq,zjxm,zt,fgsbh,sjsbh";
	ls_sql+=" from  crm_khxx,dm_gcjdbm";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ztmc=cf.fillNull(rs.getString("ztmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sffj=cf.fillNull(rs.getString("sffj"));
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
		rzsc=cf.fillNull(rs.getString("rzsc"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhyy=cf.fillNull(rs.getString("yhyy"));

		kglf=rs.getDouble("kglf");
		kqtk=rs.getDouble("kqtk");
		gckk=rs.getDouble("gckk");

		glf=rs.getDouble("glf");

		gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		hth=cf.fillNull(rs.getString("hth"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		zt=cf.fillNull(rs.getString("zt"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
	}
	rs.close();
	ps.close();


	ls_sql=" select zcmmbz ";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcmmbz=cf.fillNull(rs.getString("zcmmbz"));
	}
	rs.close();
	ps.close();

	//设计师电话
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	//班长电话
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//质检电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+fgsbh+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();




	if (zcmmbz.equals("Y"))//Y：取订单；N：取数据字典；M：可空
	{
		if (zjxbh.equals(""))
		{
			gysbh=gysbh+"*"+ddbh;
		}
		else{
			gysbh=gysbh+"*"+ddbh+"*"+zjxbh;
		}

		String getddbh=null;
		String gysmc=null;
		double ddje=0;
		double zcfk=0;
		String ddlx=null;
		String ddlxmc=null;
		ls_sql=" SELECT ddbh,ppbm,hkze,sskje,ddlx";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.hkze!=0";
		ls_sql+=" and jc_zcdd.clzt not in('98','99')";
		ls_sql+=" and (jc_zcdd.sfjrht is null OR jc_zcdd.sfjrht='N')";//是否计入家装合同  Y：计入；N：不计入
		ls_sql+=" order by ppbm,ddbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getddbh=rs.getString("ddbh");
			gysmc=rs.getString("ppbm");
			ddje=rs.getDouble("hkze");
			zcfk=rs.getDouble("sskje");
			ddlx=cf.fillNull(rs.getString("ddlx"));

			zcfk=cf.round(zcfk-fkje,2);

			//1：代销品；3：补录合同；4：有库存订单；5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；
			//9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材
			if (ddlx.equals("1"))
			{
				ddlxmc="代销品";
			}
			else if (ddlx.equals("3"))
			{
				ddlxmc="补录合同";
			}
			else if (ddlx.equals("4"))
			{
				ddlxmc="有库存订单";
			}
			else if (ddlx.equals("5"))
			{
				ddlxmc="标准套餐";
			}
			else if (ddlx.equals("9"))
			{
				ddlxmc="代购主材";
			}
			else if (ddlx.equals("A"))
			{
				ddlxmc="顶配升级";
			}
			else if (ddlx.equals("B"))
			{
				ddlxmc="顶配独立收费";
			}
			else if (ddlx.equals("C"))
			{
				ddlxmc="选配主材";
			}
			else if (ddlx.equals("D"))
			{
				ddlxmc="套餐外主材";
			}
			else if (ddlx.equals("E"))
			{
				ddlxmc="散客";
			}
			else
			{
				ddlxmc="主材套餐";
			}

			if (gysbh.equals(gysmc+"*"+getddbh))
			{
				gysbhStr+="<option value=\""+gysmc+"*"+getddbh+"\" SELECTED>"+ddlxmc+"："+gysmc+"（单号:"+ddbh+"）（应付￥"+cf.round(ddje-zcfk,2)+"）（订货￥"+ddje+"、已付￥"+zcfk+"）</option>";
			}
			else{
				gysbhStr+="<option value=\""+gysmc+"*"+getddbh+"\">"+ddlxmc+"："+gysmc+"（单号:"+ddbh+"）（应付￥"+cf.round(ddje-zcfk,2)+"）（订货￥"+ddje+"、已付￥"+zcfk+"）</option>";
			}

		}
		rs.close();
		ps.close();

		String getzjxbh=null;
		ls_sql=" SELECT jc_zczjx.zjxbh,jc_zczjx.ddbh,jc_zczjx.ppbm,jc_zcdd.ddlx,jc_zczjx.zjxze,jc_zczjx.sskje";
		ls_sql+=" FROM jc_zczjx,jc_zcdd";
		ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
		ls_sql+=" and jc_zczjx.khbh='"+khbh+"'";
		ls_sql+=" and jc_zczjx.zjxze!=0";
		ls_sql+=" and jc_zczjx.clzt not in('00','99')";
		ls_sql+=" order by jc_zcdd.ddlx,jc_zcdd.zctclx,ppbm,ddbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getzjxbh=rs.getString("zjxbh");
			getddbh=rs.getString("ddbh");
			gysmc=rs.getString("ppbm");
			ddlx=cf.fillNull(rs.getString("ddlx"));
			ddje=rs.getDouble("zjxze");
			zcfk=rs.getDouble("sskje");

			zcfk=cf.round(zcfk-fkje,2);

			//1：代销品；3：补录合同；4：有库存订单；5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；
			//9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材
			if (ddlx.equals("1"))
			{
				ddlxmc="代销品";
			}
			else if (ddlx.equals("3"))
			{
				ddlxmc="补录合同";
			}
			else if (ddlx.equals("4"))
			{
				ddlxmc="有库存订单";
			}
			else if (ddlx.equals("5"))
			{
				ddlxmc="标准套餐";
			}
			else if (ddlx.equals("9"))
			{
				ddlxmc="代购主材";
			}
			else if (ddlx.equals("A"))
			{
				ddlxmc="顶配升级";
			}
			else if (ddlx.equals("B"))
			{
				ddlxmc="顶配独立收费";
			}
			else if (ddlx.equals("C"))
			{
				ddlxmc="选配主材";
			}
			else if (ddlx.equals("D"))
			{
				ddlxmc="套餐外主材";
			}
			else if (ddlx.equals("E"))
			{
				ddlxmc="散客";
			}
			else
			{
				ddlxmc="主材套餐";
			}

			if (gysbh.equals(gysmc+"*"+getddbh+"*"+getzjxbh))
			{
				gysbhStr+="<option value=\""+gysmc+"*"+getddbh+"*"+getzjxbh+"\" SELECTED>"+ddlxmc+"："+gysmc+"（单号:"+getzjxbh+"）（应付￥"+cf.round(ddje-zcfk,2)+"）（订货￥"+ddje+"、已付￥"+zcfk+"）</option>";
			}
			else{
				gysbhStr+="<option value=\""+gysmc+"*"+getddbh+"*"+getzjxbh+"\">"+ddlxmc+"："+gysmc+"（单号:"+getzjxbh+"）（应付￥"+cf.round(ddje-zcfk,2)+"）（订货￥"+ddje+"、已付￥"+zcfk+"）</option>";
			}

		}
		rs.close();
		ps.close();

	}
	else if (zcmmbz.equals("N"))//Y：取订单；N：取数据字典；M：可空
	{
		String gysmc=null;

		ls_sql="select distinct jxc_ppgysdzb.ppmc ";
		ls_sql+=" from  jxc_ppgysdzb,jxc_ppxx";
		ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_ppxx.pplb in('1','3') and jxc_ppgysdzb.ssfgs='"+fgsbh+"' ";
		ls_sql+=" order  by jxc_ppgysdzb.ppmc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			gysmc=rs.getString("ppmc");

			if (gysbh.equals(gysmc))
			{
				gysbhStr+="<option value=\""+gysmc+"\" SELECTED>"+gysmc+"</option>";
			}
			else{
				gysbhStr+="<option value=\""+gysmc+"\">"+gysmc+"</option>";
			}
		}
		rs.close();
		ps.close();
	}
	//收款品牌----------------------------


	%>
		<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="7%">收款序号</td>
			<td  width="14%" colspan="2">收款类型</td>
			<td  width="9%" bgcolor="#CCCCCC">收款品牌</td>
			<td  width="7%" bgcolor="#CCCCCC">收款订单编号</td>
			<td  width="7%" bgcolor="#CCCCCC">收款增减项编号</td>
			<td  width="8%">实收款金额</td>
			<td  width="5%">审核</td>
			<td  width="6%">支付</td>
			<td  width="7%">转帐款项</td>
			<td  width="9%">转帐品牌</td>
			<td  width="7%">转帐订单编号</td>
			<td  width="7%">转帐增减项编号</td>
			<td  width="7%">收款时间</td>
		</tr>
		<%
		String getfkxh=null;
		String fklxmc=null;
		String getfkcsmc=null;
		String getgysbh=null;
		String getddbh=null;
		String getzjxbh=null;
		double getfkje=0;
		double xjfkje=0;
		double zjfkje=0;
		String skdd=null;
		String zffsmc=null;
		String getzckx=null;
		String getzcgysbh=null;
		String getzcddbh=null;
		String getzczjxbh=null;
		String getsksj=null;

		String getddlxmc="";

		String oldfklxmc="";

		ls_sql="SELECT fkxh,a.fklxmc,fkcsmc,gysbh,cw_khfkjl.ddbh,cw_khfkjl.zjxbh,cw_khfkjl.fkje,DECODE(skdd,'1','不需','2','需审核') skdd";
		ls_sql+=" ,zffsmc,b.fklxmc zckx,zcgysbh,zcddbh,zczjxbh,cw_khfkjl.sksj";
		ls_sql+=" ,DECODE(jc_zcdd.ddlx,'1','代销品','3','补录合同','4','有库存订单','5','标准套餐','6','家具健康套餐','7','温暖静音套餐','8','窗帘套餐','9','代购主材','A','顶配升级','B','顶配独立收费','C','选配主材') ddlxmc";
		ls_sql+=" FROM cw_khfkjl,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,cw_fkcs,jc_zcdd  ";
		ls_sql+=" where cw_khfkjl.skdw=sq_dwxx.dwbh ";
		ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.fklxbm=a.fklxbm(+) and cw_khfkjl.zckx=b.fklxbm(+)";
		ls_sql+=" and cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
		ls_sql+=" and cw_khfkjl.fkcs=cw_fkcs.fkcs(+) ";
		ls_sql+=" and cw_khfkjl.ddbh=jc_zcdd.ddbh(+) ";
		ls_sql+=" order by cw_khfkjl.fklxbm,jc_zcdd.ddlx,gysbh,fkxh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getddlxmc=cf.fillHtml(rs.getString("ddlxmc"));
			getfkxh=rs.getString("fkxh");
			fklxmc=cf.fillHtml(rs.getString("fklxmc"));
			getfkcsmc=cf.fillHtml(rs.getString("fkcsmc"));
			getgysbh=cf.fillHtml(rs.getString("gysbh"));
			getddbh=cf.fillHtml(rs.getString("ddbh"));
			getzjxbh=cf.fillHtml(rs.getString("zjxbh"));
			getfkje=rs.getDouble("fkje");
			skdd=cf.fillHtml(rs.getString("skdd"));
			zffsmc=cf.fillHtml(rs.getString("zffsmc"));
			getzckx=cf.fillHtml(rs.getString("zckx"));
			getzcgysbh=cf.fillHtml(rs.getString("zcgysbh"));
			getzcddbh=cf.fillHtml(rs.getString("zcddbh"));
			getzczjxbh=cf.fillHtml(rs.getString("zczjxbh"));
			getsksj=cf.fillHtml(rs.getDate("sksj"));

			if (getfkcsmc.equals("&nbsp;"))
			{
				getfkcsmc=getddlxmc;
			}

			if (!oldfklxmc.equals(fklxmc))
			{
				if (!oldfklxmc.equals(""))
				{
					%>
					<tr bgcolor="#FFFFFF"  align="center">
						<td colspan='2'><B><<%=oldfklxmc%>>小计</B></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td align="right"><B><%=cf.formatDouble(xjfkje)%></B></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<%
				}

				oldfklxmc=fklxmc;
				xjfkje=0;
			}

			xjfkje+=getfkje;
			zjfkje+=getfkje;

			%>
			<tr bgcolor="#FFFFFF"  align="center">
				<td><A target='_blank' HREF="/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh=<%=getfkxh%>"><%=getfkxh%></A></td>
				<td><%=fklxmc%></td>
				<td><%=getfkcsmc%></td>
				<td><%=getgysbh%></td>
				<td><%=getddbh%></td>
				<td><%=getzjxbh%></td>
				<td align="right"><%=cf.formatDouble(getfkje)%></td>
				<td><%=skdd%></td>
				<td><%=zffsmc%></td>
				<td><%=getzckx%></td>
				<td><%=getzcgysbh%></td>
				<td><%=getzcddbh%></td>
				<td><%=getzczjxbh%></td>
				<td><%=getsksj%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td colspan='2'><B><<%=fklxmc%>>小计</B></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td align="right"><B><%=cf.formatDouble(xjfkje)%></B></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr bgcolor="#FFFFFF"  align="center">
			<td colspan='5'><B>总 计</B></td>
			<td>&nbsp;</td>
			<td align="right"><B><%=cf.formatDouble(zjfkje)%></B></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		</table>
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

<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改客户付款记录（<font color="#0000CC">收款序号：<%=fkxh%></font>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCw_khfkjl.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">客户编号</td>
              <td width="33%"><%=khbh%>（<%=ztmc%>）</td>
              <td width="18%" align="right">合同号</td>
              <td width="33%"><%=hth%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">房屋地址              </td>
              <td width="33%"> <%=fwdz%></td>
              <td width="18%" align="right"> 客户姓名              </td>
              <td width="33%"><%=khxm%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">签约店面              </td>
              <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
              <td bgcolor="#E8E8FF" align="right" width="18%">设计师</td>
              <td width="33%"> <%=sjs%>（<%=sjsdh%>） </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">施工队（班长）</td>
              <td colspan="2"><%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>（<%=sgbz%><%=bzdh%>）</td>
              <td width="33%">质检：<%=zjxm%>（<%=zjdh%>） </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">签约－－合同竣工              </td>
              <td width="33%">[<%=qyrq%>]－－[<%=jgrq%>]</td>
              <td width="18%" align="right">工程进度              </td>
              <td width="33%"><%=gcjdmc%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">参加促销活动</td>
              <td colspan="3"><%=cxhdbm%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0033"><strong>审核结果</strong></font></td>
              <td><%=dsksjbz%></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0033"><strong>审核人</strong></font></td>
              <td><%=sjr%> </td>
              <td align="right"><strong><font color="#CC0033">审核时间</font></strong></td>
              <td><%=shsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0033"><strong>审核意见</strong></font></td>
              <td colspan="3"><%=shyj%> </td>
            </tr>

            <tr bgcolor="#FFFFFF">
              <td align="right">收款订单</td>
              <td colspan="3">
                <select name="gysbh" style="FONT-SIZE:12PX;WIDTH:528PX" onChange="changeGysbh(insertform)">
                <option value=""></option>
                <%=gysbhStr%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#FF0000">*</font>收款金额</td>
              <td><input type="text" name="fkje" size="20" maxlength="17"  value="<%=fkje%>" onChange="checkZkje(insertform)"></td>
              <td align="right"><font color="#FF0000">*</font>支付方式</td>
              <td><select name="zffs" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select zffsbm,zffsmc from cw_zffsbm order by zffsbm",zffs);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right">转帐款项</td>
              <td width="33%"><select name="zckx" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeZckx(insertform)">
                <option value=""></option>
                <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm order by fklxbm",zckx);
%>
              </select></td>
              <td width="18%" align="right">银行转帐帐号</td>
              <td width="33%"><input name="zzyhkh" type="text" value="<%=zzyhkh%>" size="20" maxlength="40"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right">转帐订单</td>
              <td colspan="3"> 
                <select name="zcgysbh" style="FONT-SIZE:12PX;WIDTH:528PX" onChange="checkZkje(insertform)">
                  <option value=""></option>
                  <%
	if (zckx.equals("23"))//主材款
	{
		if (zcmmbz.equals("Y"))//Y：取订单；N：取数据字典；M：可空
		{
			if (zczjxbh.equals(""))
			{
				zcgysbh=zcgysbh+"*"+zcddbh;
			}
			else {
				zcgysbh=zcgysbh+"*"+zcddbh+"*"+zczjxbh;
			}


			if (zjxbh.equals(""))
			{
				ls_sql="SELECT gysbh||'*'||ddbh  c1,gysbh||'（单号:'||ddbh||'）（￥'||sum(fkje)||'）'  c2";
				ls_sql+=" from cw_khfkjl ";
				ls_sql+=" where khbh='"+khbh+"' and zjxbh is null and scbz='N' and fklxbm='23' ";
				ls_sql+=" and (glxh is null OR glxh!=(select glxh from cw_glfkjl where fkxh='"+fkxh+"'))";
				ls_sql+=" and ddbh!='"+ddbh+"'";
				ls_sql+=" group by gysbh,ddbh";
				ls_sql+=" order by gysbh,ddbh ";

				
				cf.selectItem(out,ls_sql,zcgysbh);
			
				ls_sql="SELECT gysbh||'*'||ddbh||'*'||zjxbh  c1,gysbh||'（单号:'||zjxbh||'）（￥'||sum(fkje)||'）'  c2";
				ls_sql+=" from cw_khfkjl ";
				ls_sql+=" where khbh='"+khbh+"' and zjxbh is not null and scbz='N' and fklxbm='23' ";
				ls_sql+=" and (glxh is null OR glxh!=(select glxh from cw_glfkjl where fkxh='"+fkxh+"'))";
				ls_sql+=" group by gysbh,ddbh,zjxbh";
				ls_sql+=" order by gysbh,ddbh,zjxbh ";
				
				cf.selectItem(out,ls_sql,zcgysbh);
			}
			else {
				ls_sql="SELECT gysbh||'*'||ddbh  c1,gysbh||'（单号:'||ddbh||'）（￥'||sum(fkje)||'）'  c2";
				ls_sql+=" from cw_khfkjl ";
				ls_sql+=" where khbh='"+khbh+"' and zjxbh is null and scbz='N' and fklxbm='23' ";
				ls_sql+=" and (glxh is null OR glxh!=(select glxh from cw_glfkjl where fkxh='"+fkxh+"'))";
				ls_sql+=" group by gysbh,ddbh";
				ls_sql+=" order by gysbh,ddbh ";

				
				cf.selectItem(out,ls_sql,zcgysbh);
			
				ls_sql="SELECT gysbh||'*'||ddbh||'*'||zjxbh  c1,gysbh||'（单号:'||zjxbh||'）（￥'||sum(fkje)||'）'  c2";
				ls_sql+=" from cw_khfkjl ";
				ls_sql+=" where khbh='"+khbh+"' and zjxbh is not null and scbz='N' and fklxbm='23' ";
				ls_sql+=" and (glxh is null OR glxh!=(select glxh from cw_glfkjl where fkxh='"+fkxh+"'))";
				ls_sql+=" and zjxbh!='"+zjxbh+"'";
				ls_sql+=" group by gysbh,ddbh,zjxbh";
				ls_sql+=" order by gysbh,ddbh,zjxbh ";
				
				cf.selectItem(out,ls_sql,zcgysbh);
			}
		}
		else if (zcmmbz.equals("N"))//Y：取订单；N：取数据字典；M：可空
		{
			ls_sql="SELECT gysbh c1,gysbh||'（￥'||sum(fkje)||'）'  c2";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23' ";
			ls_sql+=" and gysbh is not null";
			ls_sql+=" group by gysbh";
			ls_sql+=" order by gysbh ";

			cf.selectItem(out,ls_sql,zcgysbh);
		}
		//收款品牌----------------------------
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>收款人              </td>
              <td width="33%"> 
                <input type="text" name="skr" size="20" maxlength="20"  value="<%=skr%>" >              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>收款时间              </td>
              <td width="33%"> 
                <input type="text" name="sksj" size="20" maxlength="10"  value="<%=sksj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">收款单位</font>              </td>
              <td width="33%"> 
                <select name="skdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+skdw+"'",skdw);
%> 
                </select>              </td>
              <td width="18%" align="right" bgcolor="#FFFFFF">收据编号</td>
              <td width="33%"><input type="text" name="sjbh" size="20" maxlength="20"  value="<%=sjbh%>" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="hidden" name="lrr" value="<%=yhmc%>" readonly>
                  <input type="hidden" name="lrsj" value="<%=cf.today()%>" readonly>
                  <input type="hidden" name="lrdw" value="<%=lrdw%>" readonly>
                  <input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="hidden" name="fkxh"  value="<%=fkxh%>" >
                  <input type="hidden" name="fklxbm" value="<%=fklxbm%>">
                  <input type="button"  value="保存" onClick="f_do(insertform)">
                  <input type="reset"  value="重输">
                  <input type="button" value="查看收款信息" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" name="button" >
                  <input name="pr" type="button" value="打印收据" onClick="window.open('/cwgl/dy/PrintJcSj.jsp?fkxh=<%=fkxh%>&khbh=<%=khbh%>')" >
                  <input name="pr2" type="button" value="选择打印" onClick="window.open('/cwgl/dy/PrintChooseJcSj.jsp?fkxh=<%=fkxh%>')" >
                </div>              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//启用AJAX
%>


var lx;
var fklx="<%=fklxbm%>";

function changeGysbh(FormName) 
{
	FormName.zcgysbh.length=1;
	FormName.zckx.value="";
}


function checkZkje(FormName) 
{
	if(FormName.fkje.value=="") 
	{
		alert("请输入[收款金额]！");
		FormName.fkje.focus();
		return false;
	}


	if(FormName.zckx.value=="") 
	{
		return;
	}

	if ( FormName.zckx.value=='23' )
	{
		if ("<%=zcmmbz%>"=="Y" || "<%=zcmmbz%>"=="N")
		{
			if(FormName.zcgysbh.value=="") 
			{
				return;
			}
		}
	}

	lx=2;


	var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;

//	window.open(actionStr);
	openAjax(actionStr);
}

function changeZckx(FormName) 
{
	if(FormName.fklxbm.value=="") {

		FormName.zcgysbh.length=1;
		FormName.zckx.value="";

		alert("请选择[收款类型]！");
		FormName.fklxbm[0].focus();
		return false;
	}


	if(FormName.fkje.value=="") 
	{

		FormName.zcgysbh.length=1;
		FormName.zckx.value="";

		alert("请输入[收款金额]！");
		FormName.fkje.focus();
		return false;
	}

	if(FormName.zckx.value=="") 
	{
		return;
	}


	FormName.zcgysbh.length=1;

	if ( FormName.zckx.value=='23' )
	{
		if ("<%=zcmmbz%>"=="M")
		{
			lx=2;
			var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
		}
		else{
			lx=3;
			var actionStr="/cwgl/cwsk/fgck/GetZcPpGys.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&gysbh="+FormName.gysbh.value+"&fklxbm="+FormName.fklxbm.value;
		}
	}
	else{
		lx=2;
		var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
	}

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	ajaxRetStr=ajaxRetStr.substring(14);

	if (lx==1)
	{
		strToSelect(insertform.gysbh,ajaxRetStr);
	}
	else if (lx==2)
	{
		if (ajaxRetStr!="")
		{
			alert(ajaxRetStr);
		}
	}
	else if (lx==3)
	{
		strToSelect(insertform.zcgysbh,ajaxRetStr);
	}
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fkxh)=="") 
	{
		alert("请输入[收款序号]！");
		FormName.fkxh.focus();
		return false;
	}

	if(	javaTrim(FormName.fklxbm)=="") 
	{
		alert("请选择[收款类型]！");
		FormName.fklxbm.focus();
		return false;
	}

	if ("<%=zcmmbz%>"=="Y" || "<%=zcmmbz%>"=="N")
	{
		if(	javaTrim(FormName.gysbh)=="") {
			alert("请选择[收款品牌]！");
			FormName.gysbh.focus();
			return false;
		}
	}


	if(	javaTrim(FormName.zffs)=="") {
		alert("请选择[支付方式]！");
		FormName.zffs.focus();
		return false;
	}

	if (FormName.zffs.value=="31")//31：转出
	{
		if(	javaTrim(FormName.zckx)=="") {
			alert("请选择[转帐款项]！");
			FormName.zckx.focus();
			return false;
		}
		if ( FormName.zckx.value=="23" )//23:主材；
		{
			if ("<%=zcmmbz%>"=="Y" || "<%=zcmmbz%>"=="N")
			{
				if(	javaTrim(FormName.zcgysbh)=="") {
					alert("转出主材款，必须选择[转帐品牌]！");
					FormName.zcgysbh.focus();
					return false;
				}

				if(FormName.gysbh.value==FormName.zcgysbh.value) {
					alert("错误！[收款品牌]与[转帐品牌]不能相同！");
					FormName.zcgysbh.focus();
					return false;
				}
			}
		}
		else{
			
			if(	javaTrim(FormName.zcgysbh)!="") {
				alert("未选择【转出集成款】，不能选择[转帐品牌]！");
				FormName.zcgysbh.focus();
				return false;
			}
		}
	}
	else{
		FormName.zckx.value="";
		FormName.zcgysbh.value="";
	}


	if(	javaTrim(FormName.fkje)=="") {
		alert("请输入[实收款金额]！");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "实收款金额"))) {
		return false;
	}

	if (parseFloat(FormName.fkje.value)==0)
	{
		alert("错误！[收款金额]不能为0");
		FormName.fkje.select();
		return false;
	}

	if(	javaTrim(FormName.skr)=="") {
		alert("请输入[收款人]！");
		FormName.skr.focus();
		return false;
	}
	if(	javaTrim(FormName.sksj)=="") {
		alert("请输入[收款时间]！");
		FormName.sksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sksj, "收款时间"))) {
		return false;
	}
	if(	javaTrim(FormName.skdw)=="") {
		alert("请选择[收款单位]！");
		FormName.skdw.focus();
		return false;
	}
	
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
