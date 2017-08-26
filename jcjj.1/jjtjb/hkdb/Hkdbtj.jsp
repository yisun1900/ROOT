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
String dwbh=request.getParameter("dwbh");
sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");
String yue=request.getParameter("yue");
String fgs=request.getParameter("fgs");
String wheresql="";
if (fgs!=null)
{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
}
if (dwbh!=null)
{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
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


int row=0;

int ddzl=0;
double mmfkje=0;
double mmze=0;
double jzze=0;
double cgze=0;
double zcze=0;
double jjze=0;
double heze=0;
String flag=null;
		
String nian=null;

Hashtable spanColHash=null;

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
  <B>集成回款对比分析</B><b>(时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="8%">年</td>
  <td  width="6%">月</td>
  <td  width="7%">类型</td>
  
  <td  width="7%">总额</td>
  <td  width="7%">比例分析</td>
</tr>
<%
	//家居产品总回款(没有计入定金）
	ls_sql="select ROUND(sum(fkje)) from cw_khfkjl,crm_khxx";
	ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh and scbz='N' and fklxbm in ('21','22','23','24')";
	ls_sql+=" and sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	if(rs1.next())
	{
		jjze=rs1.getDouble(1);
	}
	ps1.close();
	rs1.close();
	//分类进行统计
	ls_sql="select nian,yue,lx,htje,'<img src=\"/images/ColuGif.gif\" width='||htje*100/"+jjze+"||' height=14>' from";
	ls_sql+="(";
	ls_sql+="select TO_CHAR(sksj,'YYYY') nian,TO_CHAR(sksj,'MM') yue,'木门' lx,sum(fkje) htje from cw_khfkjl,crm_khxx";
	ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh and  scbz='N' and fklxbm in('21','31')";
	ls_sql+=" and sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by TO_CHAR(sksj,'YYYY'),TO_CHAR(sksj,'MM')";
	ls_sql+=" union all ";
	ls_sql+=" select TO_CHAR(sksj,'YYYY') nian,TO_CHAR(sksj,'MM') yue,'橱柜' lx,sum(fkje) htje from cw_khfkjl,crm_khxx";
	ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh and scbz='N' and fklxbm in ('22','32')";
	ls_sql+=" and sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by TO_CHAR(sksj,'YYYY'),TO_CHAR(sksj,'MM')";

	ls_sql+=" union all ";
	ls_sql+=" select TO_CHAR(sksj,'YYYY') nian,TO_CHAR(sksj,'MM') yue,'家具' lx,sum(fkje) htje from cw_khfkjl,crm_khxx";
	ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh and scbz='N' and fklxbm in('24','34')";
	ls_sql+=" and sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by TO_CHAR(sksj,'YYYY'),TO_CHAR(sksj,'MM')";
	ls_sql+=" union all ";
	ls_sql+=" select TO_CHAR(sksj,'YYYY') nian,TO_CHAR(sksj,'MM') yue,'主材' lx,sum(fkje) htje from cw_khfkjl,crm_khxx";
	ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh and scbz='N' and fklxbm in('23','33')";
	ls_sql+=" and sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by TO_CHAR(sksj,'YYYY'),TO_CHAR(sksj,'MM')";
	ls_sql+=" )";
	ls_sql+="order by nian,yue,lx ";
	//out.print(ls_sql);
	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(30000);//设置每页显示记录数
	pageObj.alignStr[4]="align='left'";//设置每页显示记录数

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




<br>
<div align="center"><b>主材完结额<b/><b>(时间：<%=sjfw%>--<%=sjfw2%>)</b><BR></div>
<table border="1"  cellspacing="0" cellpadding="1"  width="100%" style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td align="center" >序号</td>
  <td  align="center" >年</td>
  <td  align="center" >月</td>
  <td  align="center" >类型</td>
    <td  align="center" >实收款额</td>
  <td  align="center" >对比分析</td>
  
</tr>

<%
		double jjze1=0;//主材完结总额(以完结时间为准)
		ls_sql=" select sum(jc_zcdd.hkze+jc_zcdd.zjhze) from crm_KHXX,jc_zcdd  where  CRM_khxx.khbh=jc_zcdd.khbh  and jc_zcdd.clzt='20' ";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if(rs1.next())
		{
			jjze1=rs1.getDouble(1);
		}
		ps1.close();
		rs1.close();
		ls_sql=" select TO_CHAR(jc_zcdd.wjsj,'YYYY') nian,TO_CHAR(jc_zcdd.wjsj,'MM') yue,sum(jc_zcdd.hkze+jc_zcdd.zjhze) from crm_KHXX,jc_zcdd  where  CRM_khxx.khbh=jc_zcdd.khbh  and jc_zcdd.clzt='20' ";
		ls_sql+=" and jc_zcdd.wjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.wjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=wheresql;
		ls_sql+=" group by TO_CHAR(jc_zcdd.wjsj,'YYYY'),TO_CHAR(jc_zcdd.wjsj,'MM')";
		ls_sql+=" order by TO_CHAR(jc_zcdd.wjsj,'YYYY'),TO_CHAR(jc_zcdd.wjsj,'MM')";		
		//out.print(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);	
		while (rs1.next())
		{
			mmfkje=rs1.getDouble(3);
			nian=rs1.getString("nian");
			yue=rs1.getString("yue");
			zcze++;
			row++;
%>
		<tr align="center">
		<td><%=row%></td>
		<td><%=nian%></td>
		<td><%=yue%></td>
		<td >主材</td>
		<td><%=mmfkje%></td>
		<td align="left"><img src="/images/ColuGif.gif" width="<%=mmfkje*100/jjze1%>" height="14"><%=cf.formatDouble(mmfkje*100/jjze1)%>%
		</td>
		</tr>
<%
		}
		ps1.close();
		rs1.close();
	
%>	
<tr align="center">
		<td>合计</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td >&nbsp;</td>
		<td><%=zcze%></td>
		<td align="left">&nbsp;
		</td>
		</tr>
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " +e);
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