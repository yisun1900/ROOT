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
String dwbh1=request.getParameter("dwbh");
String wheresql="";
if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh1!=null)
	{
		if (!(dwbh1.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh1+"'";
	}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;

String ls_sql=null;
try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>家居预订单占家装签约单比例分析<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>

<%
	//获取最大数
	String  maxqyl="";

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.zt='2'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh1!=null)
	{
		if (!(dwbh1.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh1+"'";
	}
	ls_sql+=" group by TO_CHAR(qyrq,'YYYY'),TO_CHAR(qyrq,'MM')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	maxqyl=cf.executeQuery(ls_sql);
	

	String nian=null;
	String yue=null;
	String cglx=null;
	String mmlx=null;
	String jjlx=null;
	String dwmc=null;
	String dwbh=null;

	int qds=0;
	int mmsl=0;
	int cgsl=0;
	int jjsl=0;
	
	int alllxsl=0;
	int allqds=0;

	double jjqye=0;
	double mmqye=0;
	double cgqye=0;
	double jzqye=0;

	Hashtable spanColHash=null;


	String bgcolor="#FFFFFF";
%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
	<tr bgcolor="#CCCCCC"  align="center">
	  <td  width="8%">年</td>
	  <td  width="6%">月</td>
	  <td  width="7%">类型</td>
	  <td  width="8%">家居定单数</td>
	  <td  width="7%">总额</td>
	  <td  width="7%">比例分析</td>
	</tr>
<%
	ls_sql="select nian,yue,lx,lstscs, htje,'<img src=\"/images/ColuGif.gif\" width='||lstscs*100/"+maxqyl+"||' height=14>' from";
	ls_sql+="(";
	ls_sql+=" SELECT TO_CHAR(htrq,'YYYY') nian,TO_CHAR(htrq,'MM') yue,'木门' as lx,count(*) lstscs,sum(jc_mmydd.htje) htje from jc_mmydd,crm_khxx,sq_dwxx where crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";

	ls_sql+=wheresql;
	ls_sql+=" group by TO_CHAR(htrq,'YYYY'),TO_CHAR(htrq,'MM')";

	ls_sql+=" union all ";
	ls_sql+="SELECT TO_CHAR(qhtsj,'YYYY') nian,TO_CHAR(qhtsj,'MM') yue, '橱柜' as lx,count(*) lstscs,sum(jc_cgdd.htze) htje from jc_cgdd,crm_khxx,sq_dwxx where crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	ls_sql+=" group by TO_CHAR(qhtsj,'YYYY'),TO_CHAR(qhtsj,'MM')";

	ls_sql+=" union all";
	ls_sql+=" SELECT TO_CHAR(qhtsj,'YYYY') nian,TO_CHAR(qhtsj,'MM') yue,'家具' as lx,count(*) lstscs,sum(jc_jjdd.htze) htje from jc_jjdd,crm_khxx,sq_dwxx where crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	ls_sql+=" group by TO_CHAR(qhtsj,'YYYY'),TO_CHAR(qhtsj,'MM')";

	ls_sql+=" )";
	ls_sql+="order by nian,yue,lx ";

	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(30000);//设置每页显示记录数
	pageObj.alignStr[5]="align='left'";//设置每页显示记录数

//设置显示合并列
	spanColHash=new Hashtable();
	spanColHash.put("yue","1");//列参数对象加入Hash表
	spanColHash.put("lx","1");
	spanColHash.put("nian","1");
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
	</table>
	<CENTER >
	<br>
	<b>订制式产品预定单与家装签约单对比表<br>(签约时间：<%=sjfw%>--<%=sjfw2%>)</B> </b></CENTER >
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
	<tr bgcolor="#CCCCCC"  align="center">
	  <td  width="8%">店面</td>
	  <td  width="6%">家装签约数</td>
	  <td  width="7%">类型</td>
	  
	  <td  width="8%">数量</td>
	 
	  <td  width="7%">比例分析</td>
	</tr>
<%
	  //注：这里得到的家居定单数是只针对客户来说的,因为每个客户对于每一类产品可能有多个定单，。
	ls_sql="SELECT dwmc,crm_khxx.dwbh,count(*)";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and crm_khxx.zt='2' ";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	ls_sql+="group by dwmc,crm_khxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while(rs.next())
	{
		int mmsl1=0;
		int cgsl1=0;
		int jjsl1=0;
		dwmc=rs.getString("dwmc");
		dwbh=rs.getString("dwbh");
		qds=rs.getInt(3);
		allqds+=qds;
		ls_sql=" SELECT '木门' as lx,count(jc_mmydd.khbh) from jc_mmydd,crm_khxx,sq_dwxx where jc_mmydd.khbh= crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.dwbh='"+dwbh+"'";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if(rs1.next())
		{
			mmlx=rs1.getString("lx");
			mmsl1=rs1.getInt(2);
			
			
		}
		ps1.close();
		rs1.close();		
		ls_sql=" SELECT  '橱柜' as lx,count(jc_cgdd.khbh) from jc_cgdd,crm_khxx,sq_dwxx where jc_cgdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.dwbh='"+dwbh+"'";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if(rs1.next())
		{
			cglx=rs1.getString("lx");
			cgsl1=rs1.getInt(2);	
		}
		ps1.close();
		rs1.close();
		ls_sql="SELECT '家具' as lx,count(jc_jjdd.khbh) from jc_jjdd,crm_khxx,sq_dwxx where jc_jjdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.dwbh='"+dwbh+"'";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if(rs1.next())
		{
			jjlx=rs1.getString("lx");
			jjsl1=rs1.getInt(2);	
		}
		ps1.close();
		rs1.close();
		alllxsl+=mmsl1+jjsl1+cgsl1;
	%>
		<tr   align="center">
		  <td  width="8%" rowspan="3"><%=dwmc%></td>
		  <td  width="6%" rowspan="3"><%=qds%></td>
		  <td  width="6%">木门</td>
		  <td  width="7%"><%=mmsl1%></td>
		  <td  width="7%" align="left"><img src="/images/ColuGif.gif" width="<%=mmsl1*100/qds%>" height="14"><%=mmsl1*100/qds%>%</td> 
		</tr>
		<tr  align="center">
		  <td  width="6%">橱柜</td>
		  <td  width="8%"><%=cgsl1%></td>
		  <td  width="7%" align="left"><img src="/images/ColuGif.gif" width="<%=cgsl1*100/qds%>" height="14"><%=cgsl1*100/qds%>%</td> 
		</tr>
		<tr   align="center">
		  <td  width="6%">家具</td>
		  <td  width="8%"><%=jjsl1%></td>
		  <td  width="7%" align="left"><img src="/images/ColuGif.gif" width="<%=jjsl1*100/qds%>" height="14"><%=jjsl1*100/qds%>%</td> 
		</tr>

	<%
	}
	rs.close();
	ps.close();
%>
<tr   align="center">
  <td  width="8%">总计</td>
  <td  width="6%"><%=allqds%></td>
  <td  width="7%">&nbsp;</td>
  <td  width="8%"><%=alllxsl%></td>
  <td  width="7%">&nbsp;</td>
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
