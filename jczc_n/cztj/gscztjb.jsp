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


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE2 {
	BORDER-LEFT: #000000 1px solid;
	BORDER-BOTTOM: #000000 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE3 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft);
	POSITION: relative;
	BACKGROUND-COLOR: #efe1ff;
}
.STYLE4 {
	BORDER-RIGHT: #000 1px solid;
	BORDER-BOTTOM: #000 1px solid;
}
.STYLE_TR {
	FONT-WEIGHT: bold;
	Z-INDEX: 5; 
	POSITION: relative;
	TOP: expression(this.offsetParent.scrollTop)
}
.STYLE_TAB {
	DISPLAY: inline;
	BORDER-COLLAPSE: collapse;
}
.STYLE_DIV {
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: #808080 2px solid;
	DISPLAY: inline;
	OVERFLOW: auto;
	BORDER-LEFT: #808080 2px solid;
	WIDTH: 100%;
	CURSOR: default;
	BORDER-BOTTOM: #808080 2px solid;
	HEIGHT:95%;
}
-->
</style>

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>业绩变动分析<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV"> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
  <td  width="8%" class="STYLE2">年</td>
  <td  width="6%" class="STYLE2">月</td>
  <td  width="7%" class="STYLE2">签约数</td>
  <td  width="14%" class="STYLE2">工程直接费</td>
  <td  width="14%" class="STYLE2">折前工程签约额</td>
  <td  width="14%" class="STYLE2">折后工程签约额</td>
  <td  width="8%" class="STYLE2">单额平均</td>
  <td  width="8%" class="STYLE2">平米均价</td>
  <td  width="9%" class="STYLE2">设计费</td>
  <td  width="7%" class="STYLE2">折扣率</td>
  <td  width="23%" class="STYLE2">总额 </td>
</tr>
<%
	//获取最大数
	double maxqye=0;

	ls_sql="SELECT max(sum(qye))";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.zt='2'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by TO_CHAR(qyrq,'YYYY'),TO_CHAR(qyrq,'MM')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		maxqye=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (maxqye==0)
	{
		return;
	}

	String oldnian="";
	String nian=null;
	String yue=null;
	int qys=0;
	double zqye=0;
	double wdzgce=0;
	double sjf=0;
	long fwmj=0;

	int xjqys=0;
	double xjzqye=0;
	double xjwdzgce=0;
	double xjsjf=0;
	long xjfwmj=0;
	double zqgcqye=0;
	double zhgcqye=0;

	int allqys=0;
	double allzqye=0;
	double allwdzgce=0;
	double allsjf=0;
	long allfwmj=0;
	double zkl=0;
	int pjde=0;
	int pmjj=0;
	double allzqgcqye=0;
	double nzqgcqye=0;
	double allzhgcqye=0;
	double nzhgcqye=0;

	int row=0;

	String bgcolor="#FFFFFF";


	ls_sql="SELECT TO_CHAR(qyrq,'YYYY') nian,TO_CHAR(qyrq,'MM') yue,count(*) qys,sum(qye) zqye,sum(wdzgce+NVL(zqguanlif,0)+NVL(suijin,0)) zqgcqye,sum(qye+NVL(guanlif,0)+NVL(suijin,0)) zhgcqye,sum(wdzgce) wdzgce,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.zt='2'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by TO_CHAR(qyrq,'YYYY'),TO_CHAR(qyrq,'MM')";
	ls_sql+=" order by TO_CHAR(qyrq,'YYYY'),TO_CHAR(qyrq,'MM')";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		nian=rs.getString("nian");
		yue=rs.getString("yue");
		qys=rs.getInt("qys");
		zqye=rs.getDouble("zqye");
		zqgcqye=rs.getDouble("zqgcqye");
		zhgcqye=rs.getDouble("zhgcqye");
		wdzgce=rs.getDouble("wdzgce");
		sjf=rs.getDouble("sjf");
		fwmj=rs.getLong("fwmj");


		if (nian.equals(oldnian))
		{
		}
		else if (row!=0){
			if (xjqys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(xjzqye/xjqys);
			}
			if (xjfwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(xjzqye/xjfwmj);
			}
			if (xjwdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=xjzqye*100/xjwdzgce;
			}

			%>
			<tr align="center"  height="25" bgcolor="#E8E8FF">
				<td colspan="2"><font color="#0000FF" size="3"><B><%=oldnian%>年小计</B></font></td>
				<td  align="right"><%=xjqys%></td>
				<td  align="right"><%=cf.formatDouble(xjzqye)%></td>
				<td  align="right"><%=cf.formatDouble(nzqgcqye)%></td>
				<td  align="right"><%=cf.formatDouble(nzhgcqye)%></td>
				<td  align="right"><%=cf.formatDouble(pjde)%></td>
				<td  align="right"><%=cf.formatDouble(pmjj)%></td>
				<td  align="right"><%=cf.formatDouble(xjsjf)%></td>
				<td  align="right"><%=cf.formatDouble(zkl)%>%</td>
				<td  align="left">&nbsp;</td>
			</tr>
			<%
			oldnian=nian;
			xjqys=0;
			xjzqye=0;
			nzqgcqye=0;
			xjwdzgce=0;
			xjfwmj=0;
			xjsjf=0;
		}
		else{
			oldnian=nian;
			xjqys=0;
			xjzqye=0;
			xjwdzgce=0;
			xjfwmj=0;
			xjsjf=0;
		}

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


		xjqys+=qys;
		xjzqye+=zqye;
		xjwdzgce+=wdzgce;
		xjfwmj+=fwmj;
		xjsjf+=sjf;

		allqys+=qys;
		allzqye+=zqye;
		allwdzgce+=wdzgce;
		allfwmj+=fwmj;
		allsjf+=sjf;
		row++;

		nzqgcqye+=zqgcqye;
		allzqgcqye+=zqgcqye;
		nzhgcqye+=zhgcqye;
		allzhgcqye+=zhgcqye;



		%>
		<tr align="center" bgcolor="<%=bgcolor%>">
			<td ><%=nian%></td>
			<td ><%=yue%></td>
			<td  align="right"><%=qys%></td>
			<td  align="right"><%=cf.formatDouble(zqye)%></td>
			<td  align="right"><%=cf.formatDouble(zqgcqye)%></td>
			<td  align="right"><%=cf.formatDouble(zhgcqye)%></td>
			<td  align="right"><%=cf.formatDouble(pjde)%></td>
			<td  align="right"><%=cf.formatDouble(pmjj)%></td>
			<td  align="right"><%=cf.formatDouble(sjf)%></td>
			<td  align="right"><%=cf.formatDouble(zkl)%>%</td>
			<td  align="left"><A HREF="ViewGscz.jsp?nian=<%=nian%>&yue=<%=yue%>&fgs=<%=fgs%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=zqye*150/maxqye%>" height="14"></A></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();

	if (xjqys==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(xjzqye/xjqys);
	}
	if (xjfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(xjzqye/xjfwmj);
	}
	if (xjwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=xjzqye*100/xjwdzgce;
	}

	%>
	<tr align="center"  height="25" bgcolor="#E8E8FF">
		<td colspan="2"><font color="#0000FF" size="3"><B><%=oldnian%>年小计</B></font></td>
		<td  align="right"><%=xjqys%></td>
		<td  align="right"><%=cf.formatDouble(xjzqye)%></td>
		<td  align="right"><%=cf.formatDouble(nzqgcqye)%></td>
		<td  align="right"><%=cf.formatDouble(nzhgcqye)%></td>
		<td  align="right"><%=cf.formatDouble(pjde)%></td>
		<td  align="right"><%=cf.formatDouble(pmjj)%></td>
		<td  align="right"><%=cf.formatDouble(xjsjf)%></td>
		<td  align="right"><%=cf.formatDouble(zkl)%>%</td>
		<td  align="left">&nbsp;</td>
	</tr>


<%
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
<tr align="center"  height="33" bgcolor="#E8E8FF">
	<td colspan="2"><font color="#0000FF" size="4"><B>总&nbsp;&nbsp;&nbsp;计</B></font></td>
	<td  align="right"><%=allqys%></td>
	<td  align="right"><%=cf.formatDouble(allzqye)%></td>
	<td  align="right"><%=cf.formatDouble(allzqgcqye)%></td>
	<td  align="right"><%=cf.formatDouble(allzhgcqye)%></td>
	<td  align="right"><%=cf.formatDouble(pjde)%></td>
	<td  align="right"><%=cf.formatDouble(pmjj)%></td>
	<td  align="right"><%=cf.formatDouble(allsjf)%></td>
	<td  align="right"><%=cf.formatDouble(zkl)%>%</td>
	<td  align="left">&nbsp;</td>
</tr>
</table>
</DIV>
<P><b><font color="#0000CC">注意：此统计表以[签约日期]为准、而非[首付款日期]</font></b>
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
