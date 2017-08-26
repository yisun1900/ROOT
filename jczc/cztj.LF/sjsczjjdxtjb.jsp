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

String tjsjlx=request.getParameter("tjsjlx");
String jzsj=request.getParameter("jzsj");
String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String px=request.getParameter("px");

String wheresql="";

if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}
if (tjsjlx.equals("qyrq"))
{
	wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else{
	wheresql+=" and lrsj>=TO_DATE('"+sjfw+" "+jzsj+":00:00','YYYY-MM-DD HH24:MI:SS')";
	wheresql+=" and lrsj<=TO_DATE('"+sjfw2+" "+jzsj+":00:00','YYYY-MM-DD HH24:MI:SS')";
}

String getsjs=null;
String olddm="";
String dm=null;
String dmbh=null;
int qys=0;
double zqye=0;
double wdzgce=0;
double sjf=0;
long fwmj=0;
int allqys=0;
double allzqye=0;
double allwdzgce=0;
double allsjf=0;
long allfwmj=0;
double zkl=0;
int pjde=0;
int pmjj=0;

int row=0;

String bgcolor="#FFFFFF";

Connection conn  = null;
PreparedStatement ps=null;

PreparedStatement ps1=null;
ResultSet rs1=null;

ResultSet rs=null;
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
  <B>设计师家居单项产值统计<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<form method="POST" name="listform" action="" >
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 13px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="3%">&nbsp;</td>
  <td  width="5%">排名</td>
  <td  width="6%">设计师</td>
  <td  width="14%">店面</td>
  <td  width="6%">签约数</td>
  <td  width="7%">工程签约额</td>
  <td  width="7%">木门签约额</td>
  <td  width="7%">木门签约额占家居金额比例</td>
   <td  width="7%">橱柜签约额</td>
  <td  width="7%">橱柜签约额占家居金额比例</td>
   <td  width="7%">家具签约额</td>
  <td  width="7%">家具签约额占家居金额比例</td>
   <td  width="7%">主材签约额</td>
  <td  width="7%">主材签约额占家居金额比例</td>

</tr>
<%
		double allsishtje=0;
		int maxkhsl=0;
		double anydmvalue=0;
		double Alljjze=0;//所有设计师的家居总额
		double Sjsmmvalue=0;
		double Sjscgvalue=0;
		double Sjsjjvalue=0;
		double Sjszcvalue=0;
		double AllSjsmmvalue=0;
		double AllSjscgvalue=0;
		double AllSjsjjvalue=0;
		double AllSjszcvalue=0;
	//获取最大数
		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,TRUNC(sum(zqye)) zqye,TRUNC(sum(wdzgce)) wdzgce,TRUNC(sum(sjf)) sjf,TRUNC(sum(fwmj)) fwmj";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(sjf) sjf,sum(fwmj) fwmj";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh ";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";
//		ls_sql+=" having sum(wdzgce)!=0 and sum(fwmj)!=0";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 wdzgce,0 sjf,0 fwmj";
		ls_sql+=" FROM sq_yhxx,sq_dwxx";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04'";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (sq_yhxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
		}

		ls_sql+=" ) ";

		ls_sql+=" group by sjs,dwmc,dwbh";
		ls_sql+=" order by zqye desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			anydmvalue=0;//清零
			getsjs=rs.getString("sjs");
			dm=rs.getString("dwmc");
			dmbh=rs.getString("dwbh");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			row++;
			//某一店面的总额
			ls_sql=" select sum(htze) htze from";
			ls_sql+="(";
			ls_sql+=" SELECT sum(jc_mmydd.htje) htze";
			ls_sql+=" FROM crm_khxx,sq_dwxx,jc_mmydd";
			ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
			ls_sql+=" and htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
			ls_sql+=" and htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.zt='2'";//是否全部定义为家装客户类型
			ls_sql+=wheresql;
			ls_sql+=" and crm_khxx.dwbh='"+dmbh+"'";
			
			ls_sql+=" union all ";

			ls_sql+=" SELECT sum(jc_cgdd.zjhze) htze";
			ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cgdd";
			ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
			ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
			ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.zt='2'";//是否全部定义为家装客户类型
			ls_sql+=wheresql;
			ls_sql+=" and crm_khxx.dwbh='"+dmbh+"'";

			ls_sql+=" union all";

			ls_sql+=" SELECT sum(jc_jjdd.zjhze) htze";
			ls_sql+=" FROM crm_khxx,sq_dwxx,jc_jjdd";
			ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
			ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
			ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.zt='2'";//是否全部定义为家装客户类型
			ls_sql+=" and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=wheresql;

			ls_sql+="union all ";

			ls_sql+=" SELECT sum(jc_zcdd.hkze+jc_zcdd.zjhze) htze";
			ls_sql+=" FROM crm_khxx,sq_dwxx,jc_zcdd";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
			ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
			ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.zt='2'";//是否全部定义为家装客户类型
			ls_sql+=wheresql;
			ls_sql+=" and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=") ";
		//	out.print(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				anydmvalue=rs1.getDouble(1);	
			}
			rs1.close();
			ps1.close();

			Sjsmmvalue=0;
			Sjscgvalue=0;
			Sjsjjvalue=0;
			Sjszcvalue=0;

			//木门金额计算
			ls_sql="SELECT sum(jc_mmydd.htje) htze";
			ls_sql+=" FROM crm_khxx,sq_dwxx,jc_mmydd";
			ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
			ls_sql+=" and htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
			ls_sql+=" and htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.zt='2'";//是否全部定义为家装客户类型
			ls_sql+=" and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
			ls_sql+=" and htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=wheresql;
			//out.println(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			//out.print(ls_sql);
			if(rs1.next())
			{
				Sjsmmvalue=rs1.getDouble(1);//设计师木门金额
			}
			rs1.close();
			ps1.close();

			AllSjsmmvalue+=Sjsmmvalue;

			//橱柜金额计算
			ls_sql="SELECT sum(jc_cgdd.zjhze) htze";
			ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cgdd";
			ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
			ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
			ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.zt='2'";//是否全部定义为家装客户类型
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and crm_khxx.dwbh='"+dmbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			//out.print(ls_sql);
			if(rs1.next())
			{
				Sjscgvalue=rs1.getDouble(1);//设计师橱柜金额
			}
			rs1.close();
			ps1.close();

			AllSjscgvalue+=Sjscgvalue;

			//家具金额计算
			ls_sql="SELECT sum(jc_jjdd.zjhze) htze";
			ls_sql+=" FROM crm_khxx,sq_dwxx,jc_jjdd";
			ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
			ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
			ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.zt='2'";//是否全部定义为家装客户类型
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and crm_khxx.dwbh='"+dmbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			//out.print(ls_sql);
			if(rs1.next())
			{
				Sjsjjvalue=rs1.getDouble(1);//设计师橱柜金额
			}
			rs1.close();
			ps1.close();

			AllSjsjjvalue+=Sjsjjvalue;

			//主材金额计算
			ls_sql="SELECT sum(jc_zcdd.hkze+jc_zcdd.zjhze) htze";
			ls_sql+=" FROM crm_khxx,sq_dwxx,jc_zcdd";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
			ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
			ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.zt='2'";//是否全部定义为家装客户类型
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and crm_khxx.dwbh='"+dmbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			//out.print(ls_sql);
			if(rs1.next())
			{
				Sjszcvalue=rs1.getDouble(1);//设计师橱柜金额
			}
			rs1.close();
			ps1.close();

			AllSjszcvalue+=Sjszcvalue;

			double tem=0;
			double tem1=0;
			double tem2=0;
			double tem3=0;
			if(anydmvalue==0)
			{
				tem=0;
				tem1=0;
				tem2=0;
				tem3=0;
			}
			else
			{
				tem=Sjsmmvalue*100/anydmvalue;
				tem1=Sjscgvalue*100/anydmvalue;
				tem2=Sjsjjvalue*100/anydmvalue;
				tem3=Sjszcvalue*100/anydmvalue;
			}

%>
<tr align="center" bgcolor="<%=bgcolor%>">
				<td ><input name="sjs" type="checkbox" value="<%=getsjs%>" checked></td>
				<td ><%=row%>
				</td>
				<td ><%=getsjs%></td>
				<td ><%=dm%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=cf.formatDouble(zqye)%></td>
				<td  align="right"><%=cf.formatDouble(Sjsmmvalue)%></td>
				<td  align="right"><%=cf.formatDouble(tem)%>%</td>
				<td  align="right"><%=cf.formatDouble(Sjscgvalue)%></td>
				<td  align="right"><%=cf.formatDouble(tem1)%>%</td>
				<td  align="right"><%=cf.formatDouble(Sjsjjvalue)%></td>
				<td  align="right"><%=cf.formatDouble(tem2)%>%</td>
				<td  align="right"><%=cf.formatDouble(Sjszcvalue)%></td>
				<td  align="right"><%=cf.formatDouble(tem3)%>%</td>
			</tr>
<%
}
%>
<tr align="center" bgcolor="<%=bgcolor%>">
				<td >总计</td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=cf.formatDouble(zqye)%></td>
				<td  align="right"><%=cf.formatDouble(AllSjsmmvalue)%></td>
				<td >&nbsp;</td>
				<td  align="right"><%=cf.formatDouble(AllSjscgvalue)%></td>
				<td >&nbsp;</td>
				<td  align="right"><%=cf.formatDouble(AllSjsjjvalue)%></td>
				<td >&nbsp;</td>				
				<td  align="right"><%=cf.formatDouble(AllSjszcvalue)%></td>
				<td >&nbsp;</td>
			</tr>
			</table>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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
<script  LANGUAGE="javascript">
<!--

function cf_submit(formName)
{
	var choo=0;

	var i = 0;
	if (<%=row%>==1){
		if( formName.sjs.checked ){
			choo=1;
		}
	} 
	else{ 
		for (i=0;i < <%=row%>;i++ ){
			if( formName.sjs[i].checked ){
				choo=1;
				break;
			}
		} 
	} 
	if (choo == 0){
		alert("请选择所要操作的数据");
		return false;
	}
	else{

		formName.action="ViewAllSjscz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
		formName.submit();
		return true;
	}

} 
function cf_do(formName)
{
	var choo=0;

	var i = 0;
	if (<%=row%>==1){
		if( formName.sjs.checked ){
			choo=1;
		}
	} 
	else{ 
		for (i=0;i < <%=row%>;i++ ){
			if( formName.sjs[i].checked ){
				choo=1;
				break;
			}
		} 
	} 
	if (choo == 0){
		alert("请选择所要操作的数据");
		return false;
	}
	else{

		formName.action="ViewExecAllSjscz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
		formName.submit();
		return true;
	}

} 
//-->
</script>

