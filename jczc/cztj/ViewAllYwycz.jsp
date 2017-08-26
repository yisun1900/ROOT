<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String[] ywy=request.getParameterValues("ywy");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String lrjzbz=request.getParameter("jzbz");

	String wheresql="";

	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}

	if (!lrjzbz.equals("0"))
	{
		wheresql+=" and  crm_khxx.jzbz='"+lrjzbz+"'";
	}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">业务员签单明细
  <BR>(签约时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="300%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">业务员</td>
	<td  width="3%">合同号</td>
	<td  width="3%">姓名</td>
	<td  width="8%">房屋地址</td>
	<td  width="2%">家装标志</td>
	<td  width="4%">促销活动</td>
	<td  width="4%">未打折金额</td>
	<td  width="3%">折扣率</td>
	<td  width="4%">签约额（无税）</td>
	<td  width="3%">税率</td>
	<td  width="4%">税金</td>
	<td  width="4%">设计费</td>
	<td  width="4%">折前增减项</td>
	<td  width="4%">折后增减项（无税）</td>
	<td  width="4%">增减项税金</td>
	<td  width="4%">增减后总额 </td>
	<td  width="4%">增减后税金总额</td>
	<td  width="2%">是否返卷</td>
	<td  width="3%">返卷总金额</td>
	<td  width="3%">公司承担返卷额</td>
	<td  width="2%">是否认证</td>
	<td  width="5%">认证市场</td>
	<td  width="6%">签约店面</td>
	<td  width="5%">录入时间</td>
	<td  width="3%">签约日期</td>
	<td  width="2%">当月录入</td>
	<td  width="2%">施工队</td>
	<td  width="2%">质检员</td>
</tr>
<%
String lsywy=null;
String lsdwbh=null;

String khbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
double wdzgce=0;
double qye=0;
String suijinbfb=null;
double suijin=0;
double zjxje=0;
double zhzjxje=0;
double zjxsuijin=0;
double zjhze=0;
double suijinze=0;
double zkl=0;
double sjf=0;
double xjwdzgce=0;
double xjqye=0;
double xjzjxje=0;
double xjzjhze=0;
double xjsjf=0;

double zjwdzgce=0;
double zjqye=0;
double zjzjxje=0;
double zjzjhze=0;
double zjsjf=0;

String qydm=null;
String qyrq=null;
String sjkgrq=null;
String sjjgrq=null;
String sgd=null;
String zjxm=null;
String lrsj=null;
String jzbz=null;
String cxhdbm=null;
String dylr=null;

String sffj=null;
double fjje=0;
double gsfje=0;
String sfyrz=null;
String rzsc=null;

double xjsuijin=0;
double xjzhzjxje=0;
double xjzjxsuijin=0;
double xjsuijinze=0;
double xjfjje=0;
double xjgsfje=0;

double zjsuijin=0;
double zjzhzjxje=0;
double zjzjxsuijin=0;
double zjsuijinze=0;
double zjfjje=0;
double zjgsfje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int row=0;
	for (int i=0;i<ywy.length ;i++ )
	{
		xjwdzgce=0;
		xjqye=0;
		xjzjxje=0;
		xjzjhze=0;
		xjsjf=0;

		xjsuijin=0;
		xjzhzjxje=0;
		xjzjxsuijin=0;
		xjsuijinze=0;
		xjfjje=0;
		xjgsfje=0;

		ywy[i]=cf.GB2Uni(ywy[i]);
		int pos=ywy[i].indexOf("+");
		lsywy=ywy[i].substring(0,pos);
		lsdwbh=ywy[i].substring(pos+1);


		ls_sql="SELECT hth,khxm,fwdz,DECODE(crm_khxx.jzbz,'1','家装','2','公装') jzbz,cxhdbm,wdzgce,TO_CHAR(zkl) zkl,qye,suijinbfb||'%' suijinbfb,suijin,sjf,zjxje,zhzjxje,zjxsuijin,NVL(zhzjxje,0)+qye zjhze,NVL(suijin,0)+NVL(zjxsuijin,0) suijinze,DECODE(crm_khxx.sffj,'Y','返卷','N','否') sffj,crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','认证','N','否') sfyrz,b.dwmc rzsc,a.dwmc qydm,TO_CHAR(lrsj,'YYYY-MM-DD HH24:MI') lrsj,TO_CHAR(qyrq,'YYYY-MM-DD') qyrq,DECODE(TO_CHAR(lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'是','<font color=\"#FF0000\">跨月</font>') dylr,sgdmc sgd,zjxm";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd";
		ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
		ls_sql+=" and crm_khxx.ywy='"+lsywy+"' and crm_khxx.fgsbh='"+lsdwbh+"'";
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

			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			hth=cf.fillHtml(rs.getString("hth"));
			jzbz=cf.fillNull(rs.getString("jzbz"));
			cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
			wdzgce=rs.getDouble("wdzgce");
			zkl=rs.getDouble("zkl");
			qye=rs.getDouble("qye");
			suijinbfb=cf.fillHtml(rs.getString("suijinbfb"));
			suijin=rs.getDouble("suijin");
			zjxje=rs.getDouble("zjxje");
			zhzjxje=rs.getDouble("zhzjxje");
			zjxsuijin=rs.getDouble("zjxsuijin");
			zjhze=rs.getDouble("zjhze");
			suijinze=rs.getDouble("suijinze");
			sjf=rs.getDouble("sjf");
			sffj=cf.fillNull(rs.getString("sffj"));
			fjje=rs.getDouble("fjje");
			gsfje=rs.getDouble("gsfje");
			sfyrz=cf.fillNull(rs.getString("sfyrz"));
			rzsc=cf.fillHtml(rs.getString("rzsc"));
			qydm=cf.fillNull(rs.getString("qydm"));
			qyrq=cf.fillHtml(rs.getString("qyrq"));
			lrsj=cf.fillHtml(rs.getString("lrsj"));
			sgd=cf.fillHtml(rs.getString("sgd"));
			zjxm=cf.fillHtml(rs.getString("zjxm"));
			dylr=cf.fillHtml(rs.getString("dylr"));

			xjwdzgce+=wdzgce;
			xjqye+=qye;
			xjzjxje+=zjxje;
			xjzjhze+=zjhze;
			xjsjf+=sjf;

			xjsuijin+=suijin;
			xjzhzjxje+=zhzjxje;
			xjzjxsuijin+=zjxsuijin;
			xjsuijinze+=suijinze;
			xjfjje+=fjje;
			xjgsfje+=gsfje;

			zjwdzgce+=wdzgce;
			zjqye+=qye;
			zjzjxje+=zjxje;
			zjzjhze+=zjhze;
			zjsjf+=sjf;

			zjsuijin+=suijin;
			zjzhzjxje+=zhzjxje;
			zjzjxsuijin+=zjxsuijin;
			zjsuijinze+=suijinze;
			zjfjje+=fjje;
			zjgsfje+=gsfje;

			%>
			<tr bgcolor="#FFFFFF"  align="center">
			<td ><%=row%></td>
			<td ><%=lsywy%></td>
			<td ><%=hth%></td>
			<td align="center"><%=khxm%></td>
			<td ><A target='_blank' HREF="/khxx/ViewHthCrm_khxx.jsp?hth=<%=hth%>"><%=fwdz%></A></td>
			<td ><%=jzbz%></td>
			<td ><%=cxhdbm%></td>
			<td align="right"><%=cf.formatDouble(wdzgce)%></td>
			<td align="right"><%=cf.formatDouble(zkl)%></td>
			<td align="right"><%=cf.formatDouble(qye)%></td>
			<td align="right"><%=suijinbfb%></td>
			<td align="right"><%=cf.formatDouble(suijin)%></td>
			<td align="right"><%=cf.formatDouble(sjf)%></td>
			<td align="right"><%=cf.formatDouble(zjxje)%></td>
			<td align="right"><%=cf.formatDouble(zhzjxje)%></td>
			<td align="right"><%=cf.formatDouble(zjxsuijin)%></td>
			<td align="right"><%=cf.formatDouble(zjhze)%></td>
			<td align="right"><%=cf.formatDouble(suijinze)%></td>
			<td ><%=sffj%></td>
			<td align="right"><%=cf.formatDouble(fjje)%></td>
			<td align="right"><%=cf.formatDouble(gsfje)%></td>
			<td ><%=sfyrz%></td>
			<td ><%=rzsc%></td>
			<td ><%=qydm%></td>
			<td ><%=lrsj%></td>
			<td ><%=qyrq%></td>
			<td ><%=dylr%></td>
			<td ><%=sgd%></td>
			<td ><%=zjxm%></td>
			<%
		}
		rs.close();
		ps.close();


		if (xjqye>0)
		{
			%>
			<tr bgcolor="#E8E8FF"  align="center" height="25">
			<td align="center" colspan="3"><B>[<%=lsywy%>]小 计</B></td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td align="right"><%=cf.formatDouble(xjwdzgce)%></td>
			<td >&nbsp;</td>
			<td align="right"><%=cf.formatDouble(xjqye)%></td>
			<td >&nbsp;</td>
			<td align="right"><%=cf.formatDouble(xjsuijin)%></td>
			<td align="right"><%=cf.formatDouble(xjsjf)%></td>
			<td align="right"><%=cf.formatDouble(xjzjxje)%></td>
			<td align="right"><%=cf.formatDouble(xjzhzjxje)%></td>
			<td align="right"><%=cf.formatDouble(xjzjxsuijin)%></td>
			<td align="right"><%=cf.formatDouble(xjzjhze)%></td>
			<td align="right"><%=cf.formatDouble(xjsuijinze)%></td>
			<td >&nbsp;</td>
			<td align="right"><%=cf.formatDouble(xjfjje)%></td>
			<td align="right"><%=cf.formatDouble(xjgsfje)%></td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>

			<%
		}

	}
%> 

<tr bgcolor="#CCCCCC"  align="center" height="25">
<td align="center" colspan="3"><B>总   计</B></td>
<td >&nbsp;</td>
<td >&nbsp;</td>
<td >&nbsp;</td>
<td >&nbsp;</td>
<td align="right"><%=cf.formatDouble(zjwdzgce)%></td>
<td >&nbsp;</td>
<td align="right"><%=cf.formatDouble(zjqye)%></td>
<td >&nbsp;</td>
<td align="right"><%=cf.formatDouble(zjsuijin)%></td>
<td align="right"><%=cf.formatDouble(zjsjf)%></td>
<td align="right"><%=cf.formatDouble(zjzjxje)%></td>
<td align="right"><%=cf.formatDouble(zjzhzjxje)%></td>
<td align="right"><%=cf.formatDouble(zjzjxsuijin)%></td>
<td align="right"><%=cf.formatDouble(zjzjhze)%></td>
<td align="right"><%=cf.formatDouble(zjsuijinze)%></td>
<td >&nbsp;</td>
<td align="right"><%=cf.formatDouble(zjfjje)%></td>
<td align="right"><%=cf.formatDouble(zjgsfje)%></td>
<td >&nbsp;</td>
<td >&nbsp;</td>
<td >&nbsp;</td>
<td >&nbsp;</td>
<td >&nbsp;</td>
<td >&nbsp;</td>
<td >&nbsp;</td>
<td >&nbsp;</td>

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
