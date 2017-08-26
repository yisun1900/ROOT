<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

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
<table border="1" width="170%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="4%">合同号</td>
	<td  width="4%">姓名</td>
	<td  width="12%">房屋地址</td>
	<td  width="3%">家装标志</td>
	<td  width="5%">促销活动</td>
	<td  width="5%">工程原报价</td>
	<td  width="3%">折扣率</td>
	<td  width="5%">工程签约额</td>
	<td  width="5%">增减项</td>
	<td  width="5%">增减后总额 </td>
	<td  width="5%">设计费</td>
	<td  width="5%">业务员业绩</td>
	<td  width="6%">签约店面</td>
	<td  width="5%">录入时间</td>
	<td  width="5%">签约日期</td>
	<td  width="3%">当月录入</td>
	<td  width="3%">施工队</td>
	<td  width="3%">质检员</td>
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
double zjxje=0;
double zjhze=0;
double zkl=0;
double sjf=0;
double ywyyj=0;
double xjwdzgce=0;
double xjqye=0;
double xjzjxje=0;
double xjzjhze=0;
double xjsjf=0;
double xjywyyj=0;

double zjwdzgce=0;
double zjqye=0;
double zjzjxje=0;
double zjzjhze=0;
double zjsjf=0;
double zjywyyj=0;

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
		xjywyyj=0;

		ywy[i]=cf.GB2Uni(ywy[i]);
		int pos=ywy[i].indexOf("+");
		lsywy=ywy[i].substring(0,pos);
		lsdwbh=ywy[i].substring(pos+1);

		ls_sql="SELECT hth,khxm,fwdz,DECODE(crm_khxx.jzbz,'1','家装','2','公装') jzbz,crm_khxx.cxhdbm,wdzgce,zkl,qye,zjxje,NVL(zjxje,0)+qye zjhze,sjf,ROUND(crm_khxx.wdzgce*jc_cxhd.ywyzkl/10,2) ywyyj,a.dwmc qydm,TO_CHAR(lrsj,'YYYY-MM-DD HH24:MI') lrsj,TO_CHAR(qyrq,'YYYY-MM-DD') qyrq,DECODE(TO_CHAR(lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'是','<font color=\"#FF0000\">跨月</font>') dylr,sgdmc sgd,zjxm";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
		ls_sql+=" and crm_khxx.ywy='"+lsywy+"' and crm_khxx.fgsbh='"+lsdwbh+"'";
		ls_sql+=" and crm_khxx.zt in('2','5')";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and jc_cxhd.hdlx='2'";
		ls_sql+=wheresql;

		ls_sql+=" UNION all";

		ls_sql+=" SELECT hth,khxm,fwdz,DECODE(crm_khxx.jzbz,'1','家装','2','公装') jzbz,crm_khxx.cxhdbm,wdzgce,zkl,qye,zjxje,NVL(zjxje,0)+qye zjhze,sjf,qye-NVL(gsfje,0) ywyyj,a.dwmc qydm,TO_CHAR(lrsj,'YYYY-MM-DD HH24:MI') lrsj,TO_CHAR(qyrq,'YYYY-MM-DD') qyrq,DECODE(TO_CHAR(lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'是','<font color=\"#FF0000\">跨月</font>') dylr,sgdmc sgd,zjxm";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
		ls_sql+=" and crm_khxx.ywy='"+lsywy+"' and crm_khxx.fgsbh='"+lsdwbh+"'";
		ls_sql+=" and crm_khxx.zt in('2','5')";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and (jc_cxhd.hdlx='1' OR crm_khxx.cxhdbm is null)";
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
			zjxje=rs.getDouble("zjxje");
			zjhze=rs.getDouble("zjhze");
			sjf=rs.getDouble("sjf");
			ywyyj=rs.getDouble("ywyyj");
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
			xjywyyj+=ywyyj;

			zjwdzgce+=wdzgce;
			zjqye+=qye;
			zjzjxje+=zjxje;
			zjzjhze+=zjhze;
			zjsjf+=sjf;
			zjywyyj+=ywyyj;

			%>
			<tr bgcolor="#FFFFFF"  align="center">
			<td ><%=row%></td>
			<td ><%=hth%></td>
			<td align="center"><%=khxm%></td>
			<td ><%=fwdz%></td>
			<td ><%=jzbz%></td>
			<td ><%=cxhdbm%></td>
			<td align="right"><%=cf.formatDouble(wdzgce)%></td>
			<td align="right"><%=cf.formatDouble(zkl)%></td>
			<td align="right"><%=cf.formatDouble(qye)%></td>
			<td align="right"><%=cf.formatDouble(zjxje)%></td>
			<td align="right"><%=cf.formatDouble(zjhze)%></td>
			<td align="right"><%=cf.formatDouble(sjf)%></td>
			<td align="right"><%=cf.formatDouble(ywyyj)%></td>
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
			<td align="right"><%=cf.formatDouble(xjwdzgce)%></td>
			<td >&nbsp;</td>
			<td align="right"><%=cf.formatDouble(xjqye)%></td>
			<td align="right"><%=cf.formatDouble(xjzjxje)%></td>
			<td align="right"><%=cf.formatDouble(xjzjhze)%></td>
			<td align="right"><%=cf.formatDouble(xjsjf)%></td>
			<td align="right"><%=cf.formatDouble(xjywyyj)%></td>
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
<td align="right"><%=cf.formatDouble(zjwdzgce)%></td>
<td >&nbsp;</td>
<td align="right"><%=cf.formatDouble(zjqye)%></td>
<td align="right"><%=cf.formatDouble(zjzjxje)%></td>
<td align="right"><%=cf.formatDouble(zjzjhze)%></td>
<td align="right"><%=cf.formatDouble(zjsjf)%></td>
<td align="right"><%=cf.formatDouble(zjywyyj)%></td>
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
