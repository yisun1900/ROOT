<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<%
String yhmc=(String)session.getAttribute("yhmc");
String skdw=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
int count=0;

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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";
String fkxh="";

String zcmmbz="";//主材收款检查


String fklxbm="23";
String gysstr="";

try {
	conn=cf.getConnection();

	ls_sql="select DECODE(zt,'2','家装客户','3','退单客户','4','非家装客户','5','设计客户') ztmc,cxhdbm,sffj,fjje,gsfje,sfyrz,rzsc,sfyyh,yhyy ,kqtk,kglf,gckk ,glf,gcjdmc,khxm,fwdz,lxfs,sjs,qye,hth,dwbh,sgd,sgbz,qyrq,jgrq,zjxm,zt,fgsbh,sjsbh";
	ls_sql+=" from  crm_khxx,dm_gcjdbm";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
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

	if (zt.equals("2"))//2：家装客户；3：家装已退单 ；4：非家装客户
	{
		if (fgsbh.equals(""))
		{
			out.println("<font color=\"#FF0000\">错误！所属分公司为空</font>");
			return;
		}
		if (dwbh.equals(""))
		{
			out.println("<font color=\"#FF0000\">错误！所属店面为空</font>");
			return;
		}

	}




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


	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();


	ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	int fkjsq=count;
	while (true)
	{
		fkjsq++;
		fkxh=khbh+cf.addZero(fkjsq,3);

		ls_sql="select count(*) ";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where fkxh='"+fkxh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			break;
		}
	}

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
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


	if (zcmmbz.equals("Y"))//Y：取订单；N：取数据字典；M：可空
	{
		String ddbh=null;
		String gysmc=null;
		double ddje=0;
		double zcfk=0;
		String ls="";
		String ddlx=null;
		String ddlxmc=null;
		ls_sql=" SELECT ddbh,ppbm,jc_zcdd.ddlx,hkze,sskje";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.hkze!=0";
		ls_sql+=" and jc_zcdd.clzt not in('98','99')";
		ls_sql+=" and (jc_zcdd.sfjrht is null OR jc_zcdd.sfjrht='N')";//是否计入家装合同  Y：计入；N：不计入
		ls_sql+=" order by jc_zcdd.ddlx,jc_zcdd.zctclx,ppbm,ddbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			ddbh=rs.getString("ddbh");
			gysmc=rs.getString("ppbm");
			ddlx=cf.fillNull(rs.getString("ddlx"));
			ddje=rs.getDouble("hkze");
			zcfk=rs.getDouble("sskje");

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


			gysstr+="<option value='"+gysmc+"*"+ddbh+"'>"+ddlxmc+"："+gysmc+"（单号:"+ddbh+"）（应付￥"+cf.round(ddje-zcfk,2)+"）（订货￥"+ddje+"、已付￥"+zcfk+"）"+"</option>";
		}
		rs.close();
		ps.close();

		String zjxbh=null;
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
			zjxbh=rs.getString("zjxbh");
			ddbh=rs.getString("ddbh");
			gysmc=rs.getString("ppbm");
			ddlx=cf.fillNull(rs.getString("ddlx"));
			ddje=rs.getDouble("zjxze");
			zcfk=rs.getDouble("sskje");

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


			gysstr+="<option value='"+gysmc+"*"+ddbh+"*"+zjxbh+"'>"+ddlxmc+"："+gysmc+"（单号:"+zjxbh+"）（应付￥"+cf.round(ddje-zcfk,2)+"）（订货￥"+ddje+"、已付￥"+zcfk+"）"+"</option>";
		}
		rs.close();
		ps.close();

	}
	else if (zcmmbz.equals("N"))//Y：取订单；N：取数据字典；M：可空
	{
		String gysmc=null;
		String ls="";

		ls="";

		ls_sql="select distinct jxc_ppgysdzb.ppmc ";
		ls_sql+=" from  jxc_ppgysdzb,jxc_ppxx";
		ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_ppxx.pplb in('1','3') and jxc_ppgysdzb.ssfgs='"+fgsbh+"' ";
		ls_sql+=" order  by jxc_ppgysdzb.ppmc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			gysmc=rs.getString("ppmc");

			gysstr+="<option value='"+gysmc+"'>"+gysmc+"</option>";

		}
		rs.close();
		ps.close();

	}
	//收款品牌----------------------------

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">订单号</td>
	<td  width="11%">处理状态</td>
	<td  width="11%">类型</td>
	<td  width="6%">项目专员</td>
	<td  width="6%">家居顾问</td>
	<td  width="12%">品牌</td>
	<td  width="9%">合同金额</td>
	<td  width="9%">实收款金额</td>
	<td  width="9%">欠款</td>
	<td  width="9%">录入时间</td>
	</tr>
<%
//订单信息

	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql=" SELECT jc_zcdd.ddbh,clztmc,DECODE(jc_zcdd.ddlx,'1','代销品','3','补录合同','4','有库存订单','5','标准套餐','6','家具健康套餐','7','温暖静音套餐','8','窗帘套餐','9','代购主材','A','顶配升级','B','顶配独立收费','C','选配主材','D','套餐外主材','E','散客'),jc_zcdd.xmzy,jc_zcdd.clgw,jc_zcdd.ppbm,jc_zcdd.hkze,jc_zcdd.sskje,jc_zcdd.hkze-jc_zcdd.sskje,jc_zcdd.lrsj";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a,jdm_zcdlbm,jdm_zcddzt ";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.dwbh=a.dwbh";
	ls_sql+=" and jc_zcdd.zcdlbm=jdm_zcdlbm.zcdlbm(+) ";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
	ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";
	ls_sql+=" and jc_zcdd.clzt not in('98','99')";
	ls_sql+=" and (jc_zcdd.hkze!=0 OR jc_zcdd.zjhze!=0)";
	ls_sql+=" order by jc_zcdd.ddlx,jc_zcdd.ppbm,jc_zcdd.ddbh";
	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();


	ls_sql="SELECT jc_zczjx.zjxbh,DECODE(jc_zczjx.clzt,'00','录入未完成','01','录入已完成','02','已确认','03','已送货','99','退单'),DECODE(jc_zcdd.ddlx,'1','代销品','3','补录合同','4','有库存订单','5','标准套餐','6','家具健康套餐','7','温暖静音套餐','8','窗帘套餐','9','代购主材','A','顶配升级','B','顶配独立收费','C','选配主材','D','套餐外主材','E','散客'),jc_zczjx.xmzy,jc_zczjx.clgw,jc_zczjx.ppbm,jc_zczjx.zjxze,jc_zczjx.sskje,jc_zczjx.zjxze-jc_zczjx.sskje,jc_zczjx.lrsj";
	ls_sql+=" FROM crm_khxx,jc_zczjx,jc_zcdd";
	ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh";
	ls_sql+=" and jc_zczjx.ddbh=jc_zcdd.ddbh";
	ls_sql+=" and jc_zczjx.khbh='"+khbh+"'";
	ls_sql+=" and jc_zczjx.clzt not in('00','99')";
	ls_sql+=" order by jc_zczjx.lrsj desc,jc_zczjx.zjxbh";
	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();

%>
</table>
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">收集成款（收款序号：<%=fkxh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 

<form method="post" action="" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">客户编号</td>
              <td width="33%"><%=khbh%>（<%=ztmc%>）</td>
              <td width="18%" align="right">合同号</td>
              <td width="32%"><%=hth%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"> 
                房屋地址              </td>
              <td width="33%"> <%=fwdz%></td>
              <td width="18%" align="right"> 
                客户姓名              </td>
              <td width="32%"><%=khxm%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"> 
                签约店面              </td>
              <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
              <td bgcolor="#E8E8FF" align="right" width="18%">设计师</td>
              <td width="32%"> <%=sjs%>（<%=sjsdh%>） </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">施工队（班长）</td>
              <td colspan="2"><%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>（<%=sgbz%><%=bzdh%>）</td>
              <td width="32%">质检：<%=zjxm%>（<%=zjdh%>） </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"> 
                签约－－合同竣工              </td>
              <td width="33%">[<%=qyrq%>]－－[<%=jgrq%>]</td>
              <td width="18%" align="right"> 
                工程进度              </td>
              <td width="32%"><%=gcjdmc%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">参加促销活动</td>
              <td colspan="3"><%=cxhdbm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font>收款订单</td>
              <td colspan="3"><select name="gysbh" style="FONT-SIZE:12PX;WIDTH:528PX" onChange="changeGysbh(insertform)">
                  <option value=""></option>
				  <%=gysstr%>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>实收款金额</td>
              <td><input type="text" name="fkje" value="" size="20" maxlength="17" onChange="checkZkje(insertform)"></td>
              <td align="right"><font color="#FF0000">*</font>支付方式</td>
              <td><select name="zffs" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select zffsbm,zffsmc from cw_zffsbm order by zffsbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">转帐款项</td>
              <td width="33%"><select name="zckx" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeZckx(insertform)">
                <option value=""></option>
                <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm order by fklxbm","");
%>
              </select></td>
              <td width="18%" align="right">银行转帐帐号</td>
              <td width="32%"><input name="zzyhkh" type="text" value="" size="20" maxlength="40"></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">转帐订单</td>
              <td colspan="3"><select name="zcgysbh" style="FONT-SIZE:12PX;WIDTH:528PX" onChange="checkZkje(insertform)">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#FF0000">*</font>收款人              </td>
              <td width="33%"> 
                <input type="text" name="skr" value="<%=yhmc%>" size="20" maxlength="20" >              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>收款时间</td>
              <td width="32%"> 
                <input type="text" name="sksj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">收款单位</font>              </td>
              <td width="33%"> 
                <select name="skdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+skdw+"'","");
%> 
                </select>              </td>
              <td width="18%" align="right">收据编号</td>
              <td width="32%"><input type="text" name="sjbh" value="" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="2"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="fkxh" value="<%=fkxh%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" size="20" >
                <input type="hidden" name="fkkhxm" value="<%=khxm%>" >
                <input type="hidden" name="fkfwdz" value="<%=fwdz%>" >
                <input type="hidden" name="sjs" value="<%=sjs%>" >
                <input type="hidden" name="sjsbh" value="<%=sjsbh%>" >
                <input type="hidden" name="dwbh" value="<%=dwbh%>" >
                <input type="hidden" name="fgsbh" value="<%=fgsbh%>" >
                <input type="hidden" name="lrr" value="<%=yhmc%>">
                <input type="hidden" name="lrsj" value="<%=cf.today()%>">
                <input type="hidden" name="lrdw" value="<%=skdw%>">
                <input type="hidden" name="fklxbm" value="<%=fklxbm%>">
                <input type="button" name="bc" value="存盘" onClick="f_do(insertform)">
                <input name="ks" type="button" onClick="f_new(insertform)"  value="录入下一笔" disabled>
                <input type="reset"  value="重输" name="reset">
                <input type="button" value="查看收款信息" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" name="button" >
                <input name="pr" type="button" value="打印收据" onClick="window.open('/cwgl/qyecx/PrintJcSj.jsp?fkxh=<%=fkxh%>&khbh=<%=khbh%>')" disabled>
                <input name="pr2" type="button" value="选择打印" onClick="window.open('/cwgl/qyecx/PrintChooseJcSj.jsp?fkxh=<%=fkxh%>')" disabled>              </td>
            </tr>
        </table>
</form>
	  
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
var fklx;

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

	if ("<%=zcmmbz%>"=="Y" || "<%=zcmmbz%>"=="N")
	{
		if(FormName.zcgysbh.value=="") 
		{
			return;
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
		FormName.fklxbm.focus();
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


	if (FormName.zffs.value=="15")//15:银行转帐
	{
		if(	javaTrim(FormName.zzyhkh)=="") {
			alert("请选择[银行转帐帐号]！");
			FormName.zzyhkh.focus();
			return false;
		}
	}
	else if (FormName.zffs.value=="31")//31：转出
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
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrdw)=="") {
		alert("请选择[录入单位]！");
		FormName.lrdw.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="SaveInsertCw_khfkjl.jsp";
	FormName.submit();
	FormName.bc.disabled=true;
	FormName.ks.disabled=false;
	FormName.pr.disabled=false;
	FormName.pr2.disabled=false;
	return true;
}
function f_new(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertCw_khfkjl.jsp";
	FormName.target="";
	FormName.submit();

	FormName.bc.disabled=false;
	FormName.ks.disabled=true;
	return true;
}
//-->
</SCRIPT>
