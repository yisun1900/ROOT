<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String wheresql="";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String cqbm=null;
	cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		cqbm=cf.GB2Uni(cqbm);
		if (!(cqbm.equals("")))	wheresql+=" and  (crm_khxx.cqbm='"+cqbm+"')";
	}
	String rddqbm=null;
	rddqbm=request.getParameter("rddqbm");
	if (rddqbm!=null)
	{
		rddqbm=cf.GB2Uni(rddqbm);
		if (!(rddqbm.equals("")))	wheresql+=" and  (crm_khxx.rddqbm='"+rddqbm+"')";
	}
	String hxwzbm=null;
	hxwzbm=request.getParameter("hxwzbm");
	if (hxwzbm!=null)
	{
		hxwzbm=cf.GB2Uni(hxwzbm);
		if (!(hxwzbm.equals("")))	wheresql+=" and  (crm_khxx.hxwzbm='"+hxwzbm+"')";
	}
	String ysrbm=null;
	ysrbm=request.getParameter("ysrbm");
	if (ysrbm!=null)
	{
		ysrbm=cf.GB2Uni(ysrbm);
		if (!(ysrbm.equals("")))	wheresql+=" and  (crm_khxx.ysrbm='"+ysrbm+"')";
	}
	String nlqjbm=null;
	nlqjbm=request.getParameter("nlqjbm");
	if (nlqjbm!=null)
	{
		nlqjbm=cf.GB2Uni(nlqjbm);
		if (!(nlqjbm.equals("")))	wheresql+=" and  (crm_khxx.nlqjbm='"+nlqjbm+"')";
	}
	String zybm=null;
	zybm=request.getParameter("zybm");
	if (zybm!=null)
	{
		zybm=cf.GB2Uni(zybm);
		if (!(zybm.equals("")))	wheresql+=" and  (crm_khxx.zybm='"+zybm+"')";
	}


	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}


	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}

	String khlxbm=null;
	khlxbm=request.getParameter("khlxbm");
	if (khlxbm!=null)
	{
		khlxbm=cf.GB2Uni(khlxbm);
		if (!(khlxbm.equals("")))	wheresql+=" and  (crm_khxx.khlxbm='"+khlxbm+"')";
	}

	String fwmj=null;
	fwmj=request.getParameter("fwmj");
	if (fwmj!=null)
	{
		if (!(fwmj.equals("")))	wheresql+=" and  (crm_khxx.fwmj>="+fwmj+") ";
	}
	fwmj=request.getParameter("fwmj2");
	if (fwmj!=null)
	{
		if (!(fwmj.equals("")))	wheresql+=" and  (crm_khxx.fwmj<="+fwmj+") ";
	}
	String qye=null;
	qye=request.getParameter("qye");
	if (qye!=null)
	{
		qye=qye.trim();
		if (!(qye.equals("")))	wheresql+=" and  (crm_khxx.qye>="+qye+") ";
	}
	qye=request.getParameter("qye2");
	if (qye!=null)
	{
		qye=qye.trim();
		if (!(qye.equals("")))	wheresql+=" and  (crm_khxx.qye<="+qye+") ";
	}
	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY/MM/DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY/MM/DD'))";
	}

	String sjjgrq=null;
	sjjgrq=request.getParameter("sjjgrq");
	if (sjjgrq!=null)
	{
		sjjgrq=sjjgrq.trim();
		if (!(sjjgrq.equals("")))	wheresql+="  and (crm_khxx.sjjgrq>=TO_DATE('"+sjjgrq+"','YYYY/MM/DD'))";
	}
	sjjgrq=request.getParameter("sjjgrq2");
	if (sjjgrq!=null)
	{
		sjjgrq=sjjgrq.trim();
		if (!(sjjgrq.equals("")))	wheresql+="  and (crm_khxx.sjjgrq<=TO_DATE('"+sjjgrq+"','YYYY/MM/DD'))";
	}

	String yqts=null;
	yqts=request.getParameter("yqts");
	if (yqts!=null)
	{
		if (!(yqts.equals("")))	wheresql+=" and  (crm_khxx.yqts>="+yqts+")";
	}
	yqts=request.getParameter("yqts2");
	if (yqts!=null)
	{
		if (!(yqts.equals("")))	wheresql+=" and  (crm_khxx.yqts<="+yqts+")";
	}

	String[] hxmjbm=null;
	hxmjbm=request.getParameterValues("hxmjbm");
	if (hxmjbm!=null)
	{
		wheresql+=cf.arrayToSQL(hxmjbm,"crm_khxx.hxmjbm");
	}

	String[] zxjwbm=null;
	zxjwbm=request.getParameterValues("zxjwbm");
	if (zxjwbm!=null)
	{
		wheresql+=cf.arrayToSQL(zxjwbm,"crm_khxx.zxjwbm");
	}


	String tj1=cf.GB2Uni(request.getParameter("tj1"));
	String tj1name=cf.GB2Uni(request.getParameter("tj1name"));

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px'>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int khzs=0;
String c1="";
String c2="";
int c3=0;
int allc3=0;
int c4=0;
int allc4=0;
double c5=0;
int c6=0;
int allc6=0;
double c7=0;
int c8=0;
int allc8=0;
double c9=0;

try {
	conn=cf.getConnection();

	//获取客户总数
	ls_sql="SELECT count(crm_khxx.khbh)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where (crm_khxx.gcjdbm in('4','5') and crm_khxx.zt='2')";
    ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khzs=rs.getInt(1);
	}
	rs.close();
	ps.close();

%>

<CENTER >
  <B>工期分析</B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="14%"><%=tj1name%></td>
	<td  width="8%">客户数量</td>
	<td  width="8%">合同工期</td>
	<td  width="10%">合同平均工期</td>
	<td  width="8%">实际工期</td>
	<td  width="10%">实际平均工期</td>
	<td  width="8%">实际工期延长</td>
	<td  width="10%">工期平均延长</td>
	<td  width="24%">实际平均工期</td>
</tr>
<%


	if (tj1.equals("pmjjbm"))
	{
		ls_sql=" select dm_pmjjbm.pmjjbm,dm_pmjjbm.pmjjmc,count(crm_khxx.khbh),sum(jgrq-kgrq),ROUND(sum(jgrq-kgrq)/count(crm_khxx.khbh),1),sum(sjjgrq-sjkgrq),ROUND(sum(sjjgrq-sjkgrq)/count(crm_khxx.khbh),1),sum((sjjgrq-sjkgrq))-sum((jgrq-kgrq)),ROUND((sum((sjjgrq-sjkgrq))-sum((jgrq-kgrq)))/count(crm_khxx.khbh),1)";
		ls_sql+=" FROM crm_khxx,dm_pmjjbm";
		ls_sql+=" where dm_pmjjbm.qd<crm_khxx.pmjj and crm_khxx.pmjj<=dm_pmjjbm.zd";
		ls_sql+=" and (crm_khxx.gcjdbm in('4','5') and crm_khxx.zt='2')";
		ls_sql+=" and jgrq is not null and kgrq is not null and sjjgrq is not null and sjkgrq is not null";
		ls_sql+=wheresql;
		ls_sql+=" group by dm_pmjjbm.pmjjbm,dm_pmjjbm.pmjjmc";
		ls_sql+=" order by dm_pmjjbm.pmjjbm,dm_pmjjbm.pmjjmc";
	}
	else{
		ls_sql=" select "+tj1+",count(crm_khxx.khbh),sum(jgrq-kgrq),ROUND(sum(jgrq-kgrq)/count(crm_khxx.khbh),1),sum(sjjgrq-sjkgrq),ROUND(sum(sjjgrq-sjkgrq)/count(crm_khxx.khbh),1),sum((sjjgrq-sjkgrq))-sum((jgrq-kgrq)),ROUND((sum((sjjgrq-sjkgrq))-sum((jgrq-kgrq)))/count(crm_khxx.khbh),1)";
		ls_sql+=" FROM crm_khxx,dm_hxmjbm,dm_zxjwbm";
		ls_sql+=" where crm_khxx.hxmjbm=dm_hxmjbm.hxmjbm(+) and crm_khxx.zxjwbm=dm_zxjwbm.zxjwbm(+) ";
		ls_sql+=" and (crm_khxx.gcjdbm in('4','5') and crm_khxx.zt='2')";
		ls_sql+=" and jgrq is not null and kgrq is not null and sjjgrq is not null and sjkgrq is not null";
		ls_sql+=wheresql;
		ls_sql+=" group by "+tj1;
		ls_sql+=" order by "+tj1;
	}



//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		c1=rs.getString(1);
		c2=rs.getString(2);
		c3=rs.getInt(3);
		c4=rs.getInt(4);
		c5=rs.getDouble(5);
		c6=rs.getInt(6);
		c7=rs.getDouble(7);
		c8=rs.getInt(8);
		c9=rs.getDouble(9);

		allc3+=c3;
		allc4+=c4;
		allc6+=c6;
		allc8+=c8;


		if (c2==null)
		{
			c2="未知面积";
		}

		%>
		<tr align="center">
			<td ><%=c2%></td>
			<td  align="center"><%=c3%></td>
			<td  align="center"><%=c4%>天</td>
			<td  align="center"><%=c5%>天</td>
			<td  align="center"><%=c6%>天</td>
			<td  align="center"><%=c7%>天</td>
			<td  align="center"><%=c8%>天</td>
			<td  align="center"><%=c9%>天</td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=(1.1*c7)%>" height="14"><%=c7%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
<tr align="center" bgcolor="#CCCCCC">
	<td >合 计</td>
	<td  align="center"><%=allc3%></td>
	<td  align="center"><%=allc4%>天</td>
	<td  align="center"><%=cf.formatDouble(allc4*1.0/allc3)%>天</td>
	<td  align="center"><%=allc6%>天</td>
	<td  align="center"><%=cf.formatDouble(allc6*1.0/allc3)%>天</td>
	<td  align="center"><%=allc8%>天</td>
	<td  align="center"><%=cf.formatDouble(allc8*1.0/allc3)%>天</td>
	<td  align="left"><img src="/images/ColuGif.gif" width="<%=(1.1*allc6*1.0/allc3)%>" height="14"><%=cf.formatDouble(allc6*1.0/allc3)%></td>
</tr>
</table>

<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<p><b>备注：客户总数：<%=khzs%>，信息未完整录入：<%=khzs-allc3%></b></p>

</body>
</html>
