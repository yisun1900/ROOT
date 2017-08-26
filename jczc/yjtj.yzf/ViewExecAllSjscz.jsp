<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

	String[] sjs=request.getParameterValues("sjs");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String lrjzbz=request.getParameter("jzbz");

	String wheresql="";

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		wheresql+=" and cw_qmjzmx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		wheresql+=" and cw_qmjzmx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (cw_qmjzmx.fgsbh='"+fgs+"')";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  cw_qmjzmx.dwbh='"+dwbh+"'";
	}

	if (!lrjzbz.equals("0"))
	{
		wheresql+=" and  cw_qmjzmx.jzbz='"+lrjzbz+"'";
	}
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">设计师业绩明细
  <BR>(业绩时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="320%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">设计师</td>
	<td  width="3%">合同号</td>
	<td  width="3%">姓名</td>
	<td  width="2%">类型</td>
	<td  width="2%">家装标志</td>
	<td  width="7%">促销活动</td>
	<td  width="4%">未打折工程额(不含税金管理费)</td>
	<td  width="2%">折扣率</td>
	<td  width="4%">工程签约额(不含税金管理费)</td>
	<td  width="3%">税率</td>
	<td  width="4%">税金</td>
	<td  width="4%">管理费</td>
	<td  width="4%">签单总额(工程+税金+管理费)</td>

	<td  width="3%">首次付家装款时间</td>
	<td  width="3%">财务首次收家装款时间</td>
	<td  width="4%">设计费</td>
	<td  width="3%">服务费</td>
	<td  width="4%">折前增减项(不含税金管理费)</td>
	<td  width="4%">折后工程增减项(不含税金管理费)</td>
	<td  width="4%">增减项税金(折后)</td>
	<td  width="3%">增减项管理费(折后)</td>
	<td  width="4%">增减项小计(工程+税金+管理费)</td>
	<td  width="4%">增减后总额(工程+税金+管理费) </td>
	<td  width="4%">增减后税金总额</td>
	<td  width="5%">签约店面</td>
	<td  width="3%">签约日期</td>
	<td  width="3%">退单时间</td>
	<td  width="2%">施工队</td>
	<td  width="2%">质检员</td>
</tr>
<%
String lssjs=null;
String lsdwbh=null;

String zt=null;
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
double zjxguanlif=0;
double zjhze=0;
double suijinze=0;
double zkl=0;
double sjf=0;
double glf=0;
double guanlif=0;

double xjwdzgce=0;
double xjqye=0;
double xjzjxje=0;
double xjzjhze=0;
double xjsjf=0;
double xjglf=0;
double xjguanlif=0;

double zjwdzgce=0;
double zjqye=0;
double zjzjxje=0;
double zjzjhze=0;
double zjsjf=0;
double zjglf=0;
double zjguanlif=0;

String qydm=null;
String qyrq=null;
String tdsj=null;
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
String jzkscsj=null;
String cwjzkscsj=null;

double xjsuijin=0;
double xjzhzjxje=0;
double xjzjxsuijin=0;
double xjzjxguanlif=0;
double xjsuijinze=0;
double xjfjje=0;
double xjgsfje=0;

double zjsuijin=0;
double zjzhzjxje=0;
double zjzjxsuijin=0;
double zjzjxguanlif=0;
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
	for (int i=0;i<sjs.length ;i++ )
	{
		xjwdzgce=0;
		xjqye=0;
		xjzjxje=0;
		xjzjhze=0;
		xjsjf=0;
		xjglf=0;
		xjguanlif=0;

		xjsuijin=0;
		xjzhzjxje=0;
		xjzjxsuijin=0;
		xjsuijinze=0;
		xjfjje=0;
		xjgsfje=0;

		sjs[i]=cf.GB2Uni(sjs[i]);
		int pos=sjs[i].indexOf("+");
		lssjs=sjs[i].substring(0,pos);
		lsdwbh=sjs[i].substring(pos+1);


		ls_sql="SELECT khbh,hth,khxm,DECODE(cw_qmjzmx.zt,'2','家装','3','<font color=\"#FF0000\">已退单</font>','5','<font color=\"#0000FF\">纯设计</font>') zt,DECODE(cw_qmjzmx.jzbz,'1','家装','2','公装') jzbz,cxhdbm,DECODE(cw_qmjzmx.zt,'3',-1,1)*wdzgce wdzgce,TO_CHAR(zkl) zkl,DECODE(cw_qmjzmx.zt,'3',-1,1)*qye as qye,suijinbfb||'%' suijinbfb,DECODE(cw_qmjzmx.zt,'3',-1,1)*suijin suijin,DECODE(cw_qmjzmx.zt,'3',-1,1)*sjf sjf,DECODE(cw_qmjzmx.zt,'3',-1,1)*glf glf,DECODE(cw_qmjzmx.zt,'3',-1,1)*guanlif guanlif,DECODE(cw_qmjzmx.zt,'3',-1,1)*zjxje zjxje,DECODE(cw_qmjzmx.zt,'3',-1,1)*zhzjxje zhzjxje,DECODE(cw_qmjzmx.zt,'3',-1,1)*zjxsuijin zjxsuijin,DECODE(cw_qmjzmx.zt,'3',-1,1)*zjxguanlif zjxguanlif,DECODE(cw_qmjzmx.zt,'3',-1,1)*(NVL(zhzjxje,0)+qye) zjhze,DECODE(cw_qmjzmx.zt,'3',-1,1)*(NVL(suijin,0)+NVL(zjxsuijin,0)) suijinze,a.dwmc qydm,TO_CHAR(qyrq,'YYYY-MM-DD') qyrq,tdsj,sgdmc sgd,zjxm,jzkscsj,cwjzkscsj";
		ls_sql+=" FROM cw_qmjzmx,sq_dwxx a,sq_sgd";
		ls_sql+=" where cw_qmjzmx.dwbh=a.dwbh(+) and cw_qmjzmx.sgd=sq_sgd.sgd(+)";
		ls_sql+=" and cw_qmjzmx.sjs='"+lssjs+"' and cw_qmjzmx.dwbh='"+lsdwbh+"'";
		ls_sql+=" and cw_qmjzmx.zt in('2','3','5')";
		ls_sql+=" and cw_qmjzmx.jzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_qmjzmx.jzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ls_sql+=" order by cw_qmjzmx.jzrq";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			row++;

			zt=cf.fillNull(rs.getString("zt"));
			khbh=cf.fillNull(rs.getString("khbh"));
			khxm=cf.fillNull(rs.getString("khxm"));
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
			zjxguanlif=rs.getDouble("zjxguanlif");
			zjhze=rs.getDouble("zjhze");
			suijinze=rs.getDouble("suijinze");
			sjf=rs.getDouble("sjf");
			glf=rs.getDouble("glf");
			guanlif=rs.getDouble("guanlif");
			qydm=cf.fillNull(rs.getString("qydm"));
			qyrq=cf.fillHtml(rs.getString("qyrq"));
			tdsj=cf.fillHtml(rs.getDate("tdsj"));
			sgd=cf.fillHtml(rs.getString("sgd"));
			zjxm=cf.fillHtml(rs.getString("zjxm"));
			jzkscsj=cf.fillHtml(rs.getDate("jzkscsj"));
			cwjzkscsj=cf.fillHtml(rs.getDate("cwjzkscsj"));

			xjwdzgce+=wdzgce;
			xjqye+=qye;
			xjzjxje+=zjxje;
			xjzjhze+=zjhze;
			xjsjf+=sjf;
			xjglf+=glf;
			xjguanlif+=guanlif;

			xjsuijin+=suijin;
			xjzhzjxje+=zhzjxje;
			xjzjxsuijin+=zjxsuijin;
			xjzjxguanlif+=zjxguanlif;
			xjsuijinze+=suijinze;
			xjfjje+=fjje;
			xjgsfje+=gsfje;

			zjwdzgce+=wdzgce;
			zjqye+=qye;
			zjzjxje+=zjxje;
			zjzjhze+=zjhze;
			zjsjf+=sjf;
			zjglf+=glf;
			zjguanlif+=guanlif;

			zjsuijin+=suijin;
			zjzhzjxje+=zhzjxje;
			zjzjxsuijin+=zjxsuijin;
			zjzjxguanlif+=zjxguanlif;
			zjsuijinze+=suijinze;
			zjfjje+=fjje;
			zjgsfje+=gsfje;

			%>
			<tr bgcolor="#FFFFFF"  align="center">
				<td ><%=row%></td>
				<td ><%=lssjs%></td>
				<td ><%=hth%></td>
				<td ><A target='_blank' HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>"><%=khxm%></A></td>
				<td ><%=zt%></td>
				<td ><%=jzbz%></td>
				<td ><%=cxhdbm%></td>
				<td align="right"><%=cf.formatDouble(wdzgce)%></td>
				<td align="right"><%=cf.formatDouble(zkl)%></td>
				<td align="right"><%=cf.formatDouble(qye)%></td>
				<td align="right"><%=suijinbfb%></td>
				<td align="right"><%=cf.formatDouble(suijin)%></td>
				<td align="right"><%=cf.formatDouble(guanlif)%></td>
				<td align="right"><%=cf.formatDouble((long)(qye+suijin+guanlif))%></td>
				<td><%=jzkscsj%></td>
				<td><%=cwjzkscsj%></td>
				<td align="right"><%=cf.formatDouble(sjf)%></td>
				<td align="right"><%=cf.formatDouble(glf)%></td>
				<td align="right"><%=cf.formatDouble(zjxje)%></td>
				<td align="right"><%=cf.formatDouble(zhzjxje)%></td>
				<td align="right"><%=cf.formatDouble(zjxsuijin)%></td>
				<td align="right"><%=cf.formatDouble(zjxguanlif)%></td>
				<td align="right"><%=cf.formatDouble(zjxsuijin+zjxguanlif+zhzjxje)%></td>
				<td align="right"><%=cf.formatDouble(qye+suijin+guanlif+zhzjxje+zjxsuijin+zjxguanlif)%></td>
				<td align="right"><%=cf.formatDouble(suijinze)%></td>
				<td ><%=qydm%></td>
				<td ><%=qyrq%></td>
				<td ><%=tdsj%></td>
				<td ><%=sgd%></td>
				<td ><%=zjxm%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();


		if (xjqye>0)
		{
			%>
			<tr bgcolor="#E8E8FF"  align="center" height="25">
				<td align="center" colspan="3"><B>[<%=lssjs%>]小 计</B></td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td align="right"><%=cf.formatDouble(xjwdzgce)%></td>
				<td >&nbsp;</td>
				<td align="right"><%=cf.formatDouble(xjqye)%></td>
				<td >&nbsp;</td>
				<td align="right"><%=cf.formatDouble(xjsuijin)%></td>
				<td align="right"><%=cf.formatDouble(xjguanlif)%></td>
				<td align="right"><%=cf.formatDouble(xjqye+xjsuijin+xjguanlif)%></td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td align="right"><%=cf.formatDouble(xjsjf)%></td>
				<td align="right"><%=cf.formatDouble(xjglf)%></td>
				<td align="right"><%=cf.formatDouble(xjzjxje)%></td>
				<td align="right"><%=cf.formatDouble(xjzhzjxje)%></td>
				<td align="right"><%=cf.formatDouble(xjzjxsuijin)%></td>
				<td align="right"><%=cf.formatDouble(xjzjxguanlif)%></td>
				<td align="right"><%=cf.formatDouble(xjzhzjxje+xjzjxsuijin+xjzjxguanlif)%></td>
				<td align="right"><%=cf.formatDouble(xjqye+xjsuijin+xjguanlif+xjzhzjxje+xjzjxsuijin+xjzjxguanlif)%></td>
				<td align="right"><%=cf.formatDouble(xjsuijinze)%></td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
			</tr>

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
	<td align="right"><%=cf.formatDouble(zjguanlif)%></td>
	<td align="right"><%=cf.formatDouble(zjqye+zjsuijin+zjguanlif)%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td align="right"><%=cf.formatDouble(zjsjf)%></td>
	<td align="right"><%=cf.formatDouble(zjglf)%></td>
	<td align="right"><%=cf.formatDouble(zjzjxje)%></td>
	<td align="right"><%=cf.formatDouble(zjzhzjxje)%></td>
	<td align="right"><%=cf.formatDouble(zjzjxsuijin)%></td>
	<td align="right"><%=cf.formatDouble(zjzjxguanlif)%></td>
	<td align="right"><%=cf.formatDouble(zjzhzjxje+zjzjxsuijin+zjzjxguanlif)%></td>
	<td align="right"><%=cf.formatDouble(zjqye+zjsuijin+zjguanlif+zjzhzjxje+zjzjxsuijin+zjzjxguanlif)%></td>
	<td align="right"><%=cf.formatDouble(zjsuijinze)%></td>
	<td >&nbsp;</td>
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
