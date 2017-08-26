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
String lrdwbh=request.getParameter("dwbh");
String lrxmzy=request.getParameter("xmzy");
String wheresql="";
if (lrxmzy!=null)
{
	lrxmzy=cf.GB2Uni(lrxmzy);
	if (!(lrxmzy.equals("")))	wheresql+=" and  (xmzy='"+lrxmzy+"')";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String khbh=null;
String dwmc=null;
String xmzy=null;
String clzt=null;
String cxhdbm=null;
String sjs=null;
String jjsjs=null;
String cgsjs=null;
String khxm=null;

double all1=0;
double all2=0;
double all3=0;
double all4=0;
double all5=0;
int all6=0;
int allsl=0;
int row=0;

int ddzl=0;


int wwc=0;
int ywc=0;
int ypd=0;
int ycc=0;
int yfc=0;
int yht=0;
int yqr=0;
int yrk=0;
int yaz=0;

try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>集成家居完结统计</B><b>(完结时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table border="1"  cellspacing="0" cellpadding="1"  width="1200" style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td width="20" align="center" rowspan="2">序号</td>
  <td width="60" align="center" rowspan="2">接收日期</td>
  <td width="60" align="center" rowspan="2">建档日期</td>
  <td width="60" align="center" rowspan="2">跟单周期</td>
  <td width="60" align="center" rowspan="2">与家装实际完工日期比较（+/-）</td>
  <td width="60" align="center" rowspan="2">客户姓名</td>
  <td width="90" align="center" rowspan="2">签约店面</td>
  <td width="60" align="center" rowspan="2">设计师</td>
  <td width="60" rowspan="2">项目专员</td>
  <td width="60" rowspan="2">参加活动</td>
  <td width="60" rowspan="2">家居设计师</td>
  <td width="60" rowspan="2">是否订购集成产品</td>
  <td width="60" rowspan="2">收到申请单日期</td>
  <td width="60" rowspan="2">转出申请单日期</td>
  <td width="120" colspan="5">集成产品订购种类</td>
 
    <td width="60" colspan="2">消费金额统计</td>
	
</tr>
<tr  bgcolor="#CCCCCC"  align="center">
 <td width="25">代购类</td>
  <td width="25">木门类</td>
  <td width="25">家具类</td>
   <td width="25">橱柜类</td>
    <td width="25">合计</td>
    <td width="25">代购类合计金额</td>
	  <td width="25">订制式合计金额</td>
</tr>
<%

	//木门预订单统计:明细
	ls_sql="SELECT khbh,khxm,sjs,cxhdbm,sq_dwxx.dwmc,xmzy";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	if (!fgs.equals(""))
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (sq_dwxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (!lrdwbh.equals(""))
	{
		if (!(lrdwbh.equals("")))	ls_sql+=" and  sq_dwxx.dwbh='"+lrdwbh+"'";
	}
    ls_sql+=wheresql;
	ls_sql+=" order by khxm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		row++;
		khbh=rs1.getString("khbh");
		khxm=rs1.getString("khxm");
		dwmc=rs1.getString("dwmc");
		xmzy=cf.fillHtml(rs1.getString("xmzy"));
		cxhdbm=cf.fillHtml(rs1.getString("cxhdbm"));
		sjs=cf.fillHtml(rs1.getString("sjs"));

		int sl=0;
		int sl1=0;
		int sl2=0;
		int sl3=0;
		int s14=0;
		double htze=0;
		double htze1=0;
		double htze2=0;
		double htze3=0;
		double htze4=0;
		String flag=null;


		ls_sql="SELECT clzt,count(*),sum(zjhze)";
		ls_sql+=" FROM jc_mmydd";
		ls_sql+=" where jc_mmydd.clzt='20' and jc_mmydd.khlx='1'";
		ls_sql+=" and  jc_mmydd.khbh='"+khbh+"'";
		ls_sql+=" and jc_mmydd.wjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmydd.wjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by jc_mmydd.clzt";
		ls_sql+=" order by jc_mmydd.clzt";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if(rs.next())
		{
			clzt=rs.getString("clzt");
			sl=rs.getInt(2);
			htze+=rs.getDouble(3);
			
		}
		rs.close();
		ps.close();
		
		ls_sql="SELECT jjsjs,count(*),sum(zjhze)";
		ls_sql+=" FROM jc_jjdd";
		ls_sql+=" where jc_jjdd.clzt='35' and jc_jjdd.khlx='1'";
		ls_sql+=" and  jc_jjdd.khbh='"+khbh+"'";
		ls_sql+=" and jc_jjdd.wjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.wjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by jc_jjdd.jjsjs";
	

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while(rs.next())
		{
			jjsjs=cf.fillHtml(rs.getString("jjsjs"));
			sl1=rs.getInt(2);
			htze1+=rs.getDouble(3);
			
		}
		rs.close();
		ps.close();
		
		ls_sql="SELECT khbh,count(*),sum(zjhze)";
		ls_sql+=" FROM jc_cgdd";
		ls_sql+=" where jc_cgdd.clzt='35' and jc_cgdd.khlx='1'";
		ls_sql+=" and  jc_cgdd.khbh='"+khbh+"'";
		ls_sql+=" and jc_cgdd.wjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.wjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by jc_cgdd.khbh";
		

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if(rs.next())
		{
			cgsjs=rs.getString("khbh");
			sl2=rs.getInt(2);
			htze2=rs.getDouble(3);
			
		}
		rs.close();
		ps.close();
		
		ls_sql="SELECT khbh,count(*), ROUND(sum(hkze+zjhze))";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt='20' and jc_zcdd.khlx='2'";
		ls_sql+=" and  jc_zcdd.khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.wjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.wjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by jc_zcdd.khbh";
	
		
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if(rs.next())
		{
			cgsjs=rs.getString("khbh");
			sl2=rs.getInt(2);
			htze3=rs.getDouble(3);
			
		}
		rs.close();
		ps.close();
		
		s14=sl+sl1+sl2+sl3;
		if(s14>0)
		{
			flag="是";
		}else
		{
			flag="否";

		}
		htze4=htze2+htze1+htze;
		allsl+=s14;
		all1+=htze4;
		all2+=htze3;
		all3+=htze2;
		all4+=htze1;
		all5+=htze;
		
		%>
		 <tr align="center">
		<td><%=row%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=khxm%></td>
		<td><%=dwmc%></td>
		<td><%=sjs%></td>
		<td><%=xmzy%></td>
		<td><%=cxhdbm%></td>
		<td><%=cf.fillHtml(jjsjs)%></td>
		<td><%=flag%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=htze3%></td>
		<td><%=htze%></td>
		<td><%=htze1%></td>
		<td><%=htze2%></td>
		<td><%=s14%></td>
		<td><%=htze3%></td>
		<td><%=htze4%></td>
		
		</tr> 
<%
	
	}
	rs1.close();
	ps1.close();

	%>

	 <tr align="center">
		<td>合计</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=all2%></td>
		<td><%=all5%></td>
		<td><%=all4%></td>
		<td><%=all3%></td>
		<td><%=allsl%></td>
		<td><%=all2%></td>
		<td><%=all1%></td>
		
		</tr> 
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + ls_sql);
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