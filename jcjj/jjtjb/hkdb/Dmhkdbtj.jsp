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

String wheresql="";

if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}

String yhdlm=(String)session.getAttribute("yhdlm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>店面实收款对比分析</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
<tr bgcolor="#CCCCCC"  align="center">
  
  
  <td  width="8%">店面</td>
  <td  width="7%">类型</td>
  <td  width="7%">实收额</td>
 <td  width="11%" align="left" >对比分析</td>
</tr>
<%
	//获取最大数
	double maxqye=0;
	String getfgs=null;
	String oldfgs="";
	String dm=null;
	String getdwbh=null;
	String lx=null;
	Hashtable spanColHash=null;

	int qys=0;
	double zqye=0;
	double wdzgce=0;
	long fwmj=0;
	double sjf=0;
	int allqys=0;
	double allzqye=0;
	double allwdzgce=0;
	long allfwmj=0;
	double allsjf=0;
	double zkl=0;
	int pjde=0;
	int pmjj=0;

	int row=0;
	ls_sql="select ROUND(sum(fkje)) from cw_khfkjl,crm_khxx";
	ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh and scbz='N' and fklxbm in ('21','22','23','24')";
	ls_sql+=" and sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//	ls_sql+=wheresql;
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


	ls_sql=" SELECT a.dwmc dm,decode(fklxbm,'21','木门','22','橱柜','23','主材','24','家具') lx,sum(TRUNC(fkje)) wdzgce,'<img src=\"/images/ColuGif.gif\" width='||sum(TRUNC(fkje))*20/"+maxqye+"||' height=14>'";
	ls_sql+=" FROM cw_khfkjl,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where cw_khfkjl.dwbh=a.dwbh(+) and a.ssdw=b.dwbh(+) and fklxbm in ('21','22','23','24')";
	ls_sql+=" and sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" group by a.dwmc,fklxbm";
	
	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(30000);//设置每页显示记录数
	pageObj.alignStr[3]="align='left'";//设置每页显示记录数

//设置显示合并列
	spanColHash=new Hashtable();
	spanColHash.put("dm","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>

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
