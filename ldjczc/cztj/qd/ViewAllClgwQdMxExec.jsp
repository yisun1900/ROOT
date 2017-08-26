<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

	String[] clgw=request.getParameterValues("clgw");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

	String wheresql="";

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		wheresql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		wheresql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">材料员签单明细
  <BR>(签约时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="290%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">材料员</td>
	<td  width="2%">合同号</td>
	<td  width="2%">姓名</td>
	<td  width="6%">房屋地址</td>
	<td  width="2%">家装标志</td>
	<td  width="2%">施工队</td>
	<td  width="2%">质检员</td>
	<td  width="4%">促销活动</td>
	<td  width="3%">折前合同总额</td>
	<td  width="2%">折扣率</td>
	<td  width="3%">折后合同总额</td>
	<td  width="3%">折前工程费</td>
	<td  width="3%">折后工程费</td>
	<td  width="2%">税率</td>
	<td  width="3%">折前税金</td>
	<td  width="3%">税金</td>
	<td  width="2%">管理费百分比</td>
	<td  width="3%">折前管理费</td>
	<td  width="3%">折后管理费</td>
	<td  width="3%">折前记入业绩其它费</td>
	<td  width="3%">折后记入业绩其它费</td>
	<td  width="3%">折前不记业绩其它费</td>
	<td  width="3%">折后不记业绩其它费</td>
	<td  width="3%">折前设计费</td>
	<td  width="3%">折后设计费</td>


	<td  width="3%">财务实收款</td>
	<td  width="3%">首次收装款时间</td>
	<td  width="3%">财务首次审核时间</td>


	<td  width="3%">返券总金额</td>
	<td  width="3%">公司承担返券额</td>
	<td  width="3%">认证市场</td>
	<td  width="3%">签约店面</td>
	<td  width="5%">录入时间</td>
	<td  width="3%">签约日期</td>
</tr>
<%
String lsclgw=null;
String lsdwbh=null;

String khbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
double wdzgce=0;
double zkl=0;
double qye=0;
double zqgczjf=0;
double zhgczjf=0;

double suijinbfb=0;
double zqsuijin=0;
double suijin=0;
double glfbfb=0;
double zqguanlif=0;
double guanlif=0;
double zqqtsf=0;
double zhqtsf=0;
double zqwjrqyexm=0;
double zhwjrqyexm=0;
double zqsjf=0;
double sjf=0;

double cwsfke=0;

String qydm=null;
String qyrq=null;
String sjkgrq=null;
String sjjgrq=null;
String sgdmc=null;
String zjxm=null;
String lrsj=null;
String jzbz=null;
String cxhdbm=null;

String sffj=null;
double fjje=0;
double gsfje=0;
String sfyrz=null;
String rzsc=null;
String jzkscsj=null;
String cwjzkscsj=null;

double xjwdzgce=0;
double xjqye=0;
double xjzqgczjf=0;
double xjzhgczjf=0;

double xjzqsuijin=0;
double xjsuijin=0;
double xjzqguanlif=0;
double xjguanlif=0;
double xjzqqtsf=0;
double xjzhqtsf=0;
double xjzqwjrqyexm=0;
double xjzhwjrqyexm=0;
double xjzqsjf=0;
double xjsjf=0;

double xjcwsfke=0;
double xjfjje=0;
double xjgsfje=0;

double zjwdzgce=0;
double zjqye=0;
double zjzqgczjf=0;
double zjzhgczjf=0;

double zjzqsuijin=0;
double zjsuijin=0;
double zjzqguanlif=0;
double zjguanlif=0;
double zjzqqtsf=0;
double zjzhqtsf=0;
double zjzqwjrqyexm=0;
double zjzhwjrqyexm=0;
double zjzqsjf=0;
double zjsjf=0;

double zjcwsfke=0;
double zjfjje=0;
double zjgsfje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int row=0;
	for (int i=0;i<clgw.length ;i++ )
	{
		xjwdzgce=0;
		xjqye=0;
		xjzqgczjf=0;
		xjzhgczjf=0;

		xjzqsuijin=0;
		xjsuijin=0;
		xjzqguanlif=0;
		xjguanlif=0;
		xjzqqtsf=0;
		xjzhqtsf=0;
		xjzqwjrqyexm=0;
		xjzhwjrqyexm=0;
		xjzqsjf=0;
		xjsjf=0;

		xjcwsfke=0;
		xjfjje=0;
		xjgsfje=0;

		clgw[i]=cf.GB2Uni(clgw[i]);
		int pos=clgw[i].indexOf("+");
		lsclgw=clgw[i].substring(0,pos);
		lsdwbh=clgw[i].substring(pos+1);


		ls_sql="SELECT hth,khxm,fwdz,DECODE(crm_khxx.jzbz,'1','家装','2','公装') jzbz,sgdmc,zjxm,cxhdbm";
		ls_sql+=" ,wdzgce,zkl,qye,zqgczjf,zhgczjf,suijinbfb,zqsuijin,suijin,glfbfb,zqguanlif,guanlif ";
		ls_sql+=" ,zqqtsf,zhqtsf,zqwjrqyexm,zhwjrqyexm,NVL(zqsjf,0)+NVL(sjhtsjf,0) zqsjf,NVL(sjf,0)+NVL(sjhtsjf,0) sjf ";
		ls_sql+=" ,cwsfke,jzkscsj,cwjzkscsj,DECODE(crm_khxx.sffj,'Y','返券','N','否') sffj,crm_khxx.fjje,crm_khxx.gsfje ";
		ls_sql+=" ,DECODE(crm_khxx.sfyrz,'Y','认证','N','否') sfyrz,b.dwmc rzsc,a.dwmc qydm,lrsj,qyrq";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd";
		ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
		ls_sql+=" and crm_khxx.clgw='"+lsclgw+"' and crm_khxx.dwbh='"+lsdwbh+"'";
		ls_sql+=" and crm_khxx.zt in('2','5')";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ls_sql+=" order by qyrq";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			row++;

			hth=cf.fillHtml(rs.getString("hth"));
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			jzbz=cf.fillHtml(rs.getString("jzbz"));
			sgdmc=cf.fillHtml(rs.getString("sgdmc"));
			zjxm=cf.fillHtml(rs.getString("zjxm"));
			cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));

			wdzgce=rs.getDouble("wdzgce");
			zkl=rs.getDouble("zkl");
			qye=rs.getDouble("qye");
			zqgczjf=rs.getDouble("zqgczjf");
			zhgczjf=rs.getDouble("zhgczjf");
			suijinbfb=rs.getDouble("suijinbfb");
			zqsuijin=rs.getDouble("zqsuijin");
			suijin=rs.getDouble("suijin");
			glfbfb=rs.getDouble("glfbfb");
			zqguanlif=rs.getDouble("zqguanlif");
			guanlif=rs.getDouble("guanlif");

			zqqtsf=rs.getDouble("zqqtsf");
			zhqtsf=rs.getDouble("zhqtsf");
			zqwjrqyexm=rs.getDouble("zqwjrqyexm");
			zhwjrqyexm=rs.getDouble("zhwjrqyexm");
			zqsjf=rs.getDouble("zqsjf");
			sjf=rs.getDouble("sjf");

			cwsfke=rs.getDouble("cwsfke");
			jzkscsj=cf.fillHtml(rs.getDate("jzkscsj"));
			cwjzkscsj=cf.fillHtml(rs.getDate("cwjzkscsj"));
			sffj=cf.fillHtml(rs.getString("sffj"));
			fjje=rs.getDouble("fjje");
			gsfje=rs.getDouble("gsfje");

			sfyrz=cf.fillHtml(rs.getString("sfyrz"));
			rzsc=cf.fillHtml(rs.getString("rzsc"));
			qydm=cf.fillHtml(rs.getString("qydm"));
			lrsj=cf.fillHtml(rs.getString("lrsj"));
			qyrq=cf.fillHtml(rs.getDate("qyrq"));


			xjwdzgce+=wdzgce;
			xjwdzgce=cf.round(xjwdzgce,2);
			xjqye+=qye;
			xjqye=cf.round(xjqye,2);
			xjzqgczjf+=zqgczjf;
			xjzqgczjf=cf.round(xjzqgczjf,2);
			xjzhgczjf+=zhgczjf;
			xjzhgczjf=cf.round(xjzhgczjf,2);
			xjzqsuijin+=zqsuijin;
			xjzqsuijin=cf.round(xjzqsuijin,2);
			xjsuijin+=suijin;
			xjsuijin=cf.round(xjsuijin,2);
			xjzqguanlif+=zqguanlif;
			xjzqguanlif=cf.round(xjzqguanlif,2);
			xjguanlif+=guanlif;
			xjguanlif=cf.round(xjguanlif,2);
			xjzqqtsf+=zqqtsf;
			xjzqqtsf=cf.round(xjzqqtsf,2);
			xjzhqtsf+=zhqtsf;
			xjzhqtsf=cf.round(xjzhqtsf,2);
			xjzqwjrqyexm+=zqwjrqyexm;
			xjzqwjrqyexm=cf.round(xjzqwjrqyexm,2);
			xjzhwjrqyexm+=zhwjrqyexm;
			xjzhwjrqyexm=cf.round(xjzhwjrqyexm,2);
			xjzqsjf+=zqsjf;
			xjzqsjf=cf.round(xjzqsjf,2);
			xjsjf+=sjf;
			xjsjf=cf.round(xjsjf,2);
			xjcwsfke+=cwsfke;
			xjcwsfke=cf.round(xjcwsfke,2);
			xjfjje+=fjje;
			xjfjje=cf.round(xjfjje,2);
			xjgsfje+=gsfje;
			xjgsfje=cf.round(xjgsfje,2);

			zjwdzgce+=wdzgce;
			zjwdzgce=cf.round(zjwdzgce,2);
			zjqye+=qye;
			zjqye=cf.round(zjqye,2);
			zjzqgczjf+=zqgczjf;
			zjzqgczjf=cf.round(zjzqgczjf,2);
			zjzhgczjf+=zhgczjf;
			zjzhgczjf=cf.round(zjzhgczjf,2);
			zjzqsuijin+=zqsuijin;
			zjzqsuijin=cf.round(zjzqsuijin,2);
			zjsuijin+=suijin;
			zjsuijin=cf.round(zjsuijin,2);
			zjzqguanlif+=zqguanlif;
			zjzqguanlif=cf.round(zjzqguanlif,2);
			zjguanlif+=guanlif;
			zjguanlif=cf.round(zjguanlif,2);
			zjzqqtsf+=zqqtsf;
			zjzqqtsf=cf.round(zjzqqtsf,2);
			zjzhqtsf+=zhqtsf;
			zjzhqtsf=cf.round(zjzhqtsf,2);
			zjzqwjrqyexm+=zqwjrqyexm;
			zjzqwjrqyexm=cf.round(zjzqwjrqyexm,2);
			zjzhwjrqyexm+=zhwjrqyexm;
			zjzhwjrqyexm=cf.round(zjzhwjrqyexm,2);
			zjzqsjf+=zqsjf;
			zjzqsjf=cf.round(zjzqsjf,2);
			zjsjf+=sjf;
			zjsjf=cf.round(zjsjf,2);
			zjcwsfke+=cwsfke;
			zjcwsfke=cf.round(zjcwsfke,2);
			zjfjje+=fjje;
			zjfjje=cf.round(zjfjje,2);
			zjgsfje+=gsfje;
			zjgsfje=cf.round(zjgsfje,2);

			%>
			<tr bgcolor="#FFFFFF"  align="center" align="right">
				<td ><%=row%></td>
				<td ><%=lsclgw%></td>
				<td ><%=hth%></td>
				<td align="center"><%=khxm%></td>
				<td ><A target='_blank' HREF="/khxx/ViewHthCrm_khxx.jsp?hth=<%=hth%>"><%=fwdz%></A></td>
				<td ><%=jzbz%></td>
				<td ><%=sgdmc%></td>
				<td ><%=zjxm%></td>
				<td ><%=cxhdbm%></td>
				<td><%=wdzgce%></td>
				<td ><%=zkl%></td>
				<td ><%=qye%></td>
				<td ><%=zqgczjf%></td>
				<td ><%=zhgczjf%></td>
				<td ><%=suijinbfb%>%</td>
				<td ><%=zqsuijin%></td>
				<td ><%=suijin%></td>
				<td ><%=glfbfb%>%</td>
				<td ><%=zqguanlif%></td>
				<td ><%=guanlif%></td>
				<td ><%=zqqtsf%></td>
				<td ><%=zhqtsf%></td>
				<td ><%=zqwjrqyexm%></td>
				<td ><%=zhwjrqyexm%></td>
				<td ><%=zqsjf%></td>
				<td ><%=sjf%></td>

				<td><%=cwsfke%></td>
				<td><%=jzkscsj%></td>
				<td><%=cwjzkscsj%></td>

				<td ><%=fjje%></td>
				<td ><%=gsfje%></td>
				<td ><%=rzsc%></td>
				<td ><%=qydm%></td>
				<td ><%=lrsj%></td>
				<td ><%=qyrq%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		if (xjwdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=cf.round(xjqye*10/xjwdzgce,2);
		}

		%>
		<tr bgcolor="#E8E8FF"  align="center" height="25">
			<td align="center" colspan="3"><B>[<%=lsclgw%>]小 计</B></td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td><%=xjwdzgce%></td>
			<td ><%=zkl%></td>
			<td ><%=xjqye%></td>
			<td ><%=xjzqgczjf%></td>
			<td ><%=xjzhgczjf%></td>
			<td >&nbsp;</td>
			<td ><%=xjzqsuijin%></td>
			<td ><%=xjsuijin%></td>
			<td >&nbsp;</td>
			<td ><%=xjzqguanlif%></td>
			<td ><%=xjguanlif%></td>
			<td ><%=xjzqqtsf%></td>
			<td ><%=xjzhqtsf%></td>
			<td ><%=xjzqwjrqyexm%></td>
			<td ><%=xjzhwjrqyexm%></td>
			<td ><%=xjzqsjf%></td>
			<td ><%=xjsjf%></td>

			<td><%=xjcwsfke%></td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>

			<td ><%=xjfjje%></td>
			<td ><%=xjgsfje%></td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
		</tr>

		<%

	}

	if (zjwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=cf.round(zjqye*10/zjwdzgce,2);
	}
%> 

<tr bgcolor="#CCCCCC"  align="center" height="25">
	<td align="center" colspan="3"><B>总   计</B></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><%=zjwdzgce%></td>
	<td ><%=zkl%></td>
	<td ><%=zjqye%></td>
	<td ><%=zjzqgczjf%></td>
	<td ><%=zjzhgczjf%></td>
	<td >&nbsp;</td>
	<td ><%=zjzqsuijin%></td>
	<td ><%=zjsuijin%></td>
	<td >&nbsp;</td>
	<td ><%=zjzqguanlif%></td>
	<td ><%=zjguanlif%></td>
	<td ><%=zjzqqtsf%></td>
	<td ><%=zjzhqtsf%></td>
	<td ><%=zjzqwjrqyexm%></td>
	<td ><%=zjzhwjrqyexm%></td>
	<td ><%=zjzqsjf%></td>
	<td ><%=zjsjf%></td>

	<td><%=zjcwsfke%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>

	<td ><%=zjfjje%></td>
	<td ><%=zjgsfje%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
</tr>

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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
