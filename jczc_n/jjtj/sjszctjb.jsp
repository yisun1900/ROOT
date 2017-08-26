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

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String px=request.getParameter("px");
String jzbz="1";
String sjs=cf.GB2Uni(request.getParameter("sjs"));

String wheresql="";

if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
if (!(sjs.equals("")))	wheresql+=" and  crm_khxx.sjs='"+sjs+"'";

if (!jzbz.equals("0"))
{
	wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
}

wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
String getsjs=null;
String olddm="";
String dm=null;
String dmbh=null;
String getdwbh=null;
int qys=0;
double zqye=0;
int allqys=0;
double allzqye=0;

double zcsxe=0;//主材实销额
double allzcsxe=0;//主材实销总额
double zcyfk=0;//主材预付款
double allzcyfk=0;//主材预付款总额
double zcqde=0;//主材签单额
double zctde=0;//主材退单额
double zczjx=0;//主材增减项
double zcqye=0;//主材签约额
double allzcqye=0;//主材签约总额
double allxjzcqye=0;


int row=0;

String bgcolor="#FFFFFF";

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
  <B>设计师主材统计<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV"> 
<form method="POST" name="listform" action="" >
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 13px' class="STYLE_TAB">
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
  <td  width="5%" class="STYLE2">序号</td>
  <td  width="10%" class="STYLE2">店面</td>
  <td  width="6%" class="STYLE2">设计师</td>
  <td  width="8%" class="STYLE2">家装签约额</td>
  <td  width="8%" class="STYLE2">主材签单</td>
  <td  width="8%" class="STYLE2">主材退单</td>
  <td  width="8%" class="STYLE2">主材增减</td>
  <td  width="8%" class="STYLE2">主材业绩</td>
  <td  width="9%" class="STYLE2">主材实收款</td>
  <td  width="9%" class="STYLE2">主材预付款</td>
</tr>
<%

	//主材总金额计算
	//签单
	double allzcqde=0;
	ls_sql="SELECT sum(jc_zcdd.hkze) htze";
	ls_sql+=" FROM crm_khxx,jc_zcdd";
	ls_sql+=" where crm_khxx.khbh=jc_zcdd.khbh ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.clzt>='09'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if(rs1.next())
	{
		allzcqde=rs1.getDouble(1);//主材金额
	}
	rs1.close();
	ps1.close();
	//退单
	double allzctde=0;
	ls_sql="SELECT sum(jc_zcdd.hkze) htze";
	ls_sql+=" FROM crm_khxx,jc_zcdd";
	ls_sql+=" where crm_khxx.khbh=jc_zcdd.khbh ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.clzt='99' and jc_zcdd.hkze>0";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if(rs1.next())
	{
		allzctde=rs1.getDouble(1);//主材金额
	}
	rs1.close();
	ps1.close();

	//增减项
	double allzczjx=0;
	ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jc_zczjx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.ddbh=jc_zczjx.ddbh ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";
	ls_sql+=" and jc_zczjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zczjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zczjx.clzt!='00'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if(rs1.next())
	{
		allzczjx=rs1.getDouble(1);//主材金额
	}
	rs1.close();
	ps1.close();

	allxjzcqye=allzcqde-allzctde+allzczjx;

	ls_sql=" SELECT dwbh,sjs,sum(qys) qys,sum(zqye) zqye ";
	ls_sql+=" from ";
	ls_sql+=" ( ";
	ls_sql+=" SELECT dwbh,sjs,count(*) qys,sum(qye) zqye ";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where  ";
	ls_sql+="  crm_khxx.zt in('2','4')";
	ls_sql+=wheresql;
	ls_sql+=" group by dwbh,sjs";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwbh,yhmc sjs,0 qys,0 zqye";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where  zwbm='04' and sfzszg in('Y','N')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
	}
	if (!sjs.equals(""))
	{
		ls_sql+=" and  sq_yhxx.yhmc='"+sjs+"'";
	}

	ls_sql+=" ) ";

	ls_sql+=" group by dwbh,sjs";
	ls_sql+=" order by zqye desc";

//	out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		zcqye=0;
		getdwbh=rs.getString("dwbh");
		getsjs=rs.getString("sjs");
		qys=rs.getInt("qys");
		zqye=rs.getDouble("zqye");

		String getdwmc="";
		ls_sql="SELECT dwmc";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where dwbh='"+getdwbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			getdwmc=rs1.getString(1);
		}
		rs1.close();
		ps1.close();

		//主材金额计算
		//签单
		zcqde=0;
		ls_sql="SELECT sum(jc_zcdd.hkze) htze ";
		ls_sql+=" FROM crm_khxx,jc_zcdd";
		ls_sql+=" where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.dwbh='"+getdwbh+"' and crm_khxx.sjs='"+getsjs+"'";
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.clzt>='09'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zcqde=rs1.getDouble(1);//主材金额
		}
		rs1.close();
		ps1.close();

		//退单
		zctde=0;
		ls_sql="SELECT sum(jc_zcdd.hkze) htze ";
		ls_sql+=" FROM crm_khxx,jc_zcdd";
		ls_sql+=" where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.dwbh='"+getdwbh+"'  and crm_khxx.sjs='"+getsjs+"'";
		ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.clzt='99' and jc_zcdd.hkze>0";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zctde=rs1.getDouble(1);//主材金额
		}
		rs1.close();
		ps1.close();

		//增减项
		zczjx=0;
		ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
		ls_sql+=" FROM crm_khxx,jc_zcdd,jc_zczjx";
		ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.ddbh=jc_zczjx.ddbh and crm_khxx.dwbh='"+getdwbh+"'  and crm_khxx.sjs='"+getsjs+"'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";
		ls_sql+=" and jc_zczjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zczjx.clzt!='00'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zczjx=rs1.getDouble(1);//主材金额
		}
		rs1.close();
		ps1.close();

		zcqye=zcqde-zctde+zczjx;

		allzcqye+=zcqye;

//主材实收款
		ls_sql="SELECT sum(cw_khfkjl.fkje) fkje ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and cw_khfkjl.sjs='"+getsjs+"'";
		ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.fklxbm='23' and crm_khxx.zt='2'  ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zcsxe=rs1.getDouble(1);//主材实销金额
		}
		rs1.close();
		ps1.close();		
		allzcsxe+=zcsxe;

//主材预付款
		ls_sql="SELECT sum(cw_khfkjl.fkje) fkje ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and cw_khfkjl.sjs='"+getsjs+"'";
		ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.fklxbm='33' and crm_khxx.zt='2' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zcyfk=rs1.getDouble(1);//主材预付款
		}
		rs1.close();
		ps1.close();		
		allzcyfk+=zcyfk;

		allqys+=qys;
		allzqye+=zqye;
		row++;
		%>
		<tr align="center" bgcolor="<%=bgcolor%>">
			<td ><%=row%></td>
			<td ><%=getdwmc%></td>
			<td ><%=getsjs%></td>
			<td  align="right"><%=cf.formatDouble((int)zqye)%></td>
			<td  align="right"><%=cf.formatDouble((int)zcqde)%></td>
			<td  align="right"><%=cf.formatDouble((int)zctde)%></td>
			<td  align="right"><%=cf.formatDouble((int)zczjx)%></td>
			<td  align="right"><%=cf.formatDouble((int)zcqye)%></td>
			<td  align="right"><%=cf.formatDouble((int)zcsxe)%></td>
			<td  align="right"><%=cf.formatDouble(zcyfk)%></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();

%>
<tr align="center">
	<td	><font color="#FF0000">总计</font></td>
	<td  align="right">&nbsp;</td>
	<td >&nbsp;</td>
	<td  align="right"><%=cf.formatDouble((long)allzqye)%></td>
	<td  align="right">&nbsp;</td>
	<td  align="right">&nbsp;</td>
	<td  align="right">&nbsp;</td>
	<td  align="right"><%=cf.formatDouble((long)allzcqye)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzcsxe)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzcyfk)%></td>
</tr>
</table>
</form> 
</DIV>
<table  width="100%" border="0" cellpadding="1" cellspacing="0" style="FONT-SIZE:14">
<tr><td style="FONT-SIZE:16"><B>注意！</B></td></tr>
<tr><td>[总额比例]=[设计师主材签约额]/[总签约额]。</td></tr>
<tr><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<tr><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<tr><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<tr><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
</table>
</body>
</html>

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
		if (rs!= null) rs1.close(); 
		if (ps!= null) ps1.close(); 
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

		formName.action="ViewAllSjssjf.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&jzbz=<%=jzbz%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
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

		formName.action="ViewExecAllSjssjf.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&jzbz=<%=jzbz%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
		formName.submit();
		return true;
	}

} 
//-->
</script>


