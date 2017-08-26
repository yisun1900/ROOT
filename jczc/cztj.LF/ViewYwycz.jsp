<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%

	String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
	String ywy=cf.GB2Uni(cf.getParameter(request,"ywy"));
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String jzsj=request.getParameter("jzsj");

	String wheresql="";

		wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">业务员签约明细（<%=ywy%>）
  <BR>(统计时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="360%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">业务员</td>
	<td  width="3%">合同号</td>
	<td  width="3%">姓名</td>
	<td  width="6%">房屋地址</td>
	<td  width="2%">家装标志</td>
	<td  width="4%">公司促销活动</td>
	<td  width="4%">小区促销活动</td>
	<td  width="4%">展会促销活动</td>
	<td  width="3%">工程费</td>
	<td  width="2%">折扣率</td>
	<td  width="3%">工程签约额</td>
	<td  width="2%">税率</td>
	<td  width="3%">税金</td>
	<td  width="3%">项目管理费</td>
	<td  width="3%">工程签约额</td>
	<td  width="3%">实收设计费</td>
	<td  width="3%">实收款</td>
	<td  width="3%">家装顾问签约业绩</td>
	<td  width="2%">是否有市场返券</td>
	<td  width="3%">市场返券总金额</td>
	<td  width="3%">公司承担市场返券额</td>
	<td  width="2%">是否认证</td>
	<td  width="3%">认证市场</td>
	<td  width="3%">签约店面</td>
	<td  width="4%">录入时间</td>
	<td  width="2%">签约日期</td>
	<td  width="2%">当月录入</td>
	<td  width="2%">施工队</td>
	<td  width="2%">质检员</td>
</tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	
	String khbh=null;
	String getywy=null;
	String hth=null;
	String khxm=null;
	String fwdz=null;
	String sgdmc=null;
	String zjxm=null;
	String jzbz=null;
//	String fgsbh=null;
	String cxhdmc=null;
	String cxhdbmxq=null;
	String cxhdbmzh=null;

	double wdzgce=0;
	double zkl=0;
	double qye=0;
	double suijinbfb=0;
	double suijin=0;
	double guanlif=0;
	double zjxje=0;
	double sjf=0;
	double sfke=0;
	double ze=0;

	String sffj=null;
	double fjje=0;
	double gsfje=0;
	String sfyrz=null;
	String rzsc=null;
	String qydm=null;
	String lrsj=null;
	String qyrq=null;
	String dylr=null;

	double ywyqye=0;

	double sssjf=0;


	double allwdzgce=0;
	double allqye=0;
	double allsuijin=0;
	double allguanlif=0;
	double allzjxje=0;
	double allsjf=0;
	double allsfke=0;
	double allfjje=0;
	double allgsfje=0;
	double allywyqye=0;
	double allsssjf=0;

	int row=0;

	ls_sql="SELECT khbh,fgsbh,cxhdbm,cxhdbmxq,cxhdbmzh,ywy,hth,khxm,fwdz,sgdmc,zjxm,DECODE(crm_khxx.jzbz,'1','家装','2','工装') jzbz";
	ls_sql+=" ,wdzgce,zkl,qye,suijinbfb,suijin,guanlif,qye+suijin+guanlif,zjxje,NVL(zjxje,0)+qye,sjf,sfke";
	ls_sql+=" ,DECODE(crm_khxx.sffj,'Y','返卷','N','否') sffj,crm_khxx.fjje,crm_khxx.gsfje";
	ls_sql+=" ,DECODE(crm_khxx.sfyrz,'Y','认证','N','否') sfyrz,b.dwmc rzsc,a.dwmc qydm,lrsj";
	ls_sql+=" ,qyrq,DECODE(TO_CHAR(lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'是','<font color=\"#FF0000\">跨月</font>') dylr";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.ywy='"+ywy+"' and crm_khxx.fgsbh='"+fgsbh+"'";
	ls_sql+=" and crm_khxx.zt in('2','5')";
	ls_sql+=wheresql;
	ls_sql+=" order by ywy,lrsj";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		cxhdmc=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		getywy=cf.fillHtml(rs.getString("ywy"));
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		jzbz=cf.fillHtml(rs.getString("jzbz"));


		wdzgce=rs.getDouble("wdzgce");
		zkl=rs.getDouble("zkl");
		qye=rs.getDouble("qye");
		suijinbfb=rs.getDouble("suijinbfb");
		suijin=rs.getDouble("suijin");
		guanlif=rs.getDouble("guanlif");
		zjxje=rs.getDouble("zjxje");
		sjf=rs.getDouble("sjf");
		sfke=rs.getDouble("sfke");

		sffj=cf.fillHtml(rs.getString("sffj"));
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		sfyrz=cf.fillHtml(rs.getString("sfyrz"));
		rzsc=cf.fillHtml(rs.getString("rzsc"));
		qydm=cf.fillHtml(rs.getString("qydm"));
		lrsj=cf.fillHtml(rs.getString("lrsj"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		dylr=cf.fillHtml(rs.getString("dylr"));

		ls_sql=" select sum(fkje)";
		ls_sql+=" from cw_khfkjl";
		ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and cw_khfkjl.fklxbm='53' and cw_khfkjl.scbz='N' ";//53:设计装修费
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sssjf=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		allsssjf+=sssjf;

		ze=wdzgce;
		
		
		row++;

		double yjxs11=10;//02：店面签约业绩系数
		double yjxs12=10;//04：家装设计师业绩系数
		double yjxs13=10;//06：业务员系数
		double yjxs14=10;//07：市场部经理系数

		if (!cxhdmc.equals(""))//公司活动
		{
			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='02'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs11=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='04'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs12=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='06'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs13=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='07'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs14=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();
		}

		double yjxs21=10;
		double yjxs22=10;
		double yjxs23=10;
		double yjxs24=10;
		if (!cxhdbmxq.equals(""))
		{
			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='02'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs21=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='04'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs22=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='06'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs23=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='07'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs24=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();
		}

		double yjxs31=10;
		double yjxs32=10;
		double yjxs33=10;
		double yjxs34=10;
		if (!cxhdbmzh.equals(""))
		{
			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='02'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs31=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='04'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs32=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='06'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs33=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='07'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs34=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();
		}

		double yjxs1=10;//02：店面签约业绩系数
		double yjxs2=10;//04：家装设计师业绩系数
		double yjxs3=10;//06：业务员系数
		double yjxs4=10;//07：市场部经理系数

		yjxs1=10-(10-yjxs11)-(10-yjxs21)-(10-yjxs31);
		yjxs2=10-(10-yjxs12)-(10-yjxs22)-(10-yjxs32);
		yjxs3=10-(10-yjxs13)-(10-yjxs23)-(10-yjxs33);
		yjxs4=10-(10-yjxs14)-(10-yjxs24)-(10-yjxs34);


		if ( cxhdmc!=null || cxhdbmxq!=null || cxhdbmzh!=null )
		{
			ywyqye=qye*yjxs3/10+guanlif;
		}
		else{
			ywyqye=qye+guanlif;
		}


		ywyqye=cf.round(ywyqye,2);

		allwdzgce+=wdzgce;
		allqye+=qye;
		allsuijin+=suijin;
		allguanlif+=guanlif;
		allzjxje+=zjxje;
		allsjf+=sjf;
		allsfke+=sfke;
		allfjje+=fjje;
		allgsfje+=gsfje;
		allywyqye+=ywyqye;

		if (cxhdmc.equals(""))
		{
			cxhdmc="&nbsp;";
		}
		if (cxhdbmxq.equals(""))
		{
			cxhdbmxq="&nbsp;";
		}
		if (cxhdbmzh.equals(""))
		{
			cxhdbmzh="&nbsp;";
		}

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=row%></td>
			<td><%=getywy%></td>
			<td><%=hth%></td>
			<td><%=khxm%></td>
			<td><%=fwdz%></td>
			<td><%=jzbz%></td>
			<td><%=cxhdmc%></td>
			<td><%=cxhdbmxq%></td>
			<td><%=cxhdbmzh%></td>

			<td><%=wdzgce%></td>
			<td><%=zkl%></td>
			<td><%=qye%></td>
			<td><%=suijinbfb%></td>
			<td><%=suijin%></td>
			<td><%=guanlif%></td>
			<td><%=cf.formatDouble(qye+suijin+guanlif)%></td>

			<td><%=sssjf%></td>
			<td><%=sfke%></td>

			<td><%=ywyqye%></td>

			<td><%=sffj%></td>
			<td><%=fjje%></td>
			<td><%=gsfje%></td>

			<td><%=sfyrz%></td>
			<td><%=rzsc%></td>
			<td><%=qydm%></td>
			<td><%=lrsj%></td>
			<td><%=qyrq%></td>
			<td><%=dylr%></td>
			<td><%=sgdmc%></td>
			<td><%=zjxm%></td>
		</tr>
		<%
	
	
	
	}
	rs.close();
	ps.close();

	if (allwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=cf.round(allqye*10/allwdzgce,1);
	}



%>
<tr bgcolor="#FFFFFF"  align="center">
	<td colspan="2">小 计</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>

	<td><%=cf.formatDouble(allwdzgce)%></td>
	<td><%=zkl%></td>
	<td><%=cf.formatDouble(allqye)%></td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allsuijin)%></td>
	<td><%=cf.formatDouble(allguanlif)%></td>
	<td><%=cf.formatDouble(allqye+allsuijin+allguanlif)%></td>

	<td><%=cf.formatDouble(allsssjf)%></td>
	<td><%=cf.formatDouble(allsfke)%></td>

	<td><%=cf.formatDouble(allywyqye)%></td>

	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allfjje)%></td>
	<td><%=cf.formatDouble(allgsfje)%></td>

	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>

</table>
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



