<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">

</head>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
<CENTER >
  <B><font size="3">项目预控审批表</font></B>
</CENTER>

<%
String khbh=request.getParameter("khbh");

//客户基本信息
String khxm=null;
String hth=null;
String fwdz=null;
double fwmj=0;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
int sjgq=0;

//合同额
double wdzgce=0;
double qye=0;
//增减项
double zqljzjx=0;
double zhljzjx=0;
double zqhtzcbj=0;
double zhhtzcbj=0;


double htjz=0;//合同净值
double sgcbj=0;//合同施工成本价
double mle=0;//合同毛利额
double mll=0;//工程合同毛利率

double zxhtjz=0;//最新合同净值
double zxsgcbj=0;//最新施工成本价
double zxmle=0;//最新毛利额
double zxmll=0;//工程最新毛利率

double zchtje=0;//主材合同销售额
double zchtcb=0;//主材合同成本
double zchtml=0;//主材合同毛利

double zczxje=0;//主材最新销售额
double zczxcb=0;//主材最新成本
double zczxml=0;//主材最新毛利


double rfxszb=0;//人辅销售占比
double zcxszb=0;//主材销售占比

double rfcbzb=0;//人辅成本占比
double zccbzb=0;//主材成本占比

double rflrzb=0;//人辅利润占比
double zclrzb=0;//主材利润占比


//水电部分
double sdxse=0;//水电部分销售额
double sdcbe=0;//水电部分成本额
double sdxszb=0;//水电部分销售占比
double sdcbzb=0;//水电部分成本占比
double sdlrzb=0;//水电部分利润占比


//松下主材
double sxzcxse=0;//松下主材销售额
double sxzccbe=0;//松下主材成本额
double sxzcxszb=0;//松下主材销售占比
double sxzccbzb=0;//松下主材成本占比
double sxzclrzb=0;//松下主材利润占比

//集采主材
double jczcxse=0;//集采主材销售额
double jczccbe=0;//集采主材成本额
double jczcxszb=0;//集采主材销售占比
double jczccbzb=0;//集采主材成本占比
double jczclrzb=0;//集采主材利润占比

//松下核减
double sdhjxse=0;//松下核减销售额
double sdhjxszb=0;//松下核减销售占比

//税金
double allsuijin=0;

//公司优惠金额
double gsyhje=0;
//工程利润率
double gclrv=0;
//毛利率
double gcmll=0;
//实际毛利率
double gcsjmll=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	ls_sql="SELECT khxm,hth,fwdz,fwmj,kgrq,jgrq,sjkgrq,sjjgrq,jgrq-kgrq sjgq ";
	ls_sql+=" ,wdzgce,qye,zqljzjx,zhljzjx,zqhtzcbj,zhhtzcbj";
	ls_sql+=" FROM crm_khxx ";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		//客户基本信息
		khxm=rs.getString("khxm");
		hth=cf.fillHtml(rs.getString("hth"));
		fwdz=rs.getString("fwdz");
		fwmj=rs.getDouble("fwmj");


		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
		sjgq=rs.getInt("sjgq");

		//合同额
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zqljzjx=rs.getDouble("zqljzjx");
		zhljzjx=rs.getDouble("zhljzjx");
		zhljzjx=rs.getDouble("zhljzjx");
		zqhtzcbj=rs.getDouble("zqhtzcbj");
		zhhtzcbj=rs.getDouble("zhhtzcbj");

	}
	rs.close();
	ps.close();

	String fjtcbz="";
	ls_sql="select fjtcbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fjtcbz=cf.fillNull(rs.getString("fjtcbz"));
	}
	rs.close();
	ps.close();

	if (fjtcbz==null || !fjtcbz.equals("Y"))
	{
		out.println("<P><B><font color=\"#FF0000\" size=\"5\">提醒！客户未做价格审核，毛利不正确</font></B><P>");

	}


	htjz=0;//合同净值
	sgcbj=0;//合同施工成本价
	mle=0;//合同毛利额
	mll=0;//工程合同毛利率

	zxhtjz=0;//最新合同净值
	zxsgcbj=0;//最新施工成本价
	zxmle=0;//最新毛利额
	zxmll=0;//工程最新毛利率

	zchtje=0;//主材合同销售额
	zchtcb=0;//主材合同成本
	zchtml=0;//主材合同毛利

	zczxje=0;//主材最新销售额
	zczxcb=0;//主材最新成本
	zczxml=0;//主材最新毛利


	ls_sql=" SELECT  ";
	ls_sql+="  htjz,sgcbj,mle,mll";//工程
	ls_sql+=" ,zxhtjz,zxsgcbj,zxmle,zxmll";

	ls_sql+=" ,zchtje,zchtcb,zchtml";//主材
	ls_sql+=" ,zczxje,zczxcb,zczxml";
	
	ls_sql+=" FROM crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		htjz=rs.getDouble("htjz");
		sgcbj=rs.getDouble("sgcbj");
		mle=rs.getDouble("mle");
		mll=rs.getDouble("mll");

		zxhtjz=rs.getDouble("zxhtjz");
		zxsgcbj=rs.getDouble("zxsgcbj");
		zxmle=rs.getDouble("zxmle");
		zxmll=rs.getDouble("zxmll");

//		zchtje=rs.getDouble("zchtje");
//		zchtcb=rs.getDouble("zchtcb");
		zchtml=rs.getDouble("zchtml");

		zczxje=rs.getDouble("zczxje");
		zczxcb=rs.getDouble("zczxcb");
		zczxml=rs.getDouble("zczxml");
	}
	rs.close();
	ps.close();


	//主材
	double allzcje=0;
	double allzccb=0;
	ls_sql="SELECT  sum(je+ycf+qtfyje),sum(cbj*sl)";
	ls_sql+=" FROM bj_khzcmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allzcje=rs.getDouble(1);
		allzccb=rs.getDouble(2);
	}
	rs.close();
	ps.close();


	//主材其它费金额
	double zcqtfje=0;
	ls_sql="SELECT sum(sfje)";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmlx in('4','7','8')";//8：公司购主材税金
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcqtfje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//主材其它费成本
	double zcqtfcb=0;
	ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmlx in('4','7','8')";//8：公司购主材税金
	ls_sql+=" and sfcysgdjs='Y' ";
	ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后;3:不记入
	//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcqtfcb+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmlx in('4','7','8')";//8：公司购主材税金
	ls_sql+=" and sfcysgdjs='Y' ";
	ls_sql+=" and cbjjsfs='2' ";//1:折前;2:折后;3:不记入
	//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcqtfcb+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	zchtje=cf.round(allzcje+zcqtfje,2);
	zchtcb=cf.round(allzccb+zcqtfcb,2);

	//人辅销售占比
	if (qye+zchtje!=0)
	{
		rfxszb=cf.round(qye*100/(qye+zchtje),2);
	}
	else {
		rfxszb=0;
	}

	//主材销售占比
	if (qye+zchtje!=0)
	{
		zcxszb=cf.round(zchtje*100/(qye+zchtje),2);
	}
	else {
		zcxszb=0;
	}

	//人辅成本占比
	if (sgcbj+zchtcb!=0)
	{
		rfcbzb=cf.round(sgcbj*100/(sgcbj+zchtcb),2);
	}
	else {
		rfcbzb=0;
	}

	//主材成本占比
	if (sgcbj+zchtcb!=0)
	{
		zccbzb=cf.round(zchtcb*100/(sgcbj+zchtcb),2);
	}
	else {
		zccbzb=0;
	}

	//人辅利润占比
	if (((qye+zchtje)-(sgcbj+zchtcb))!=0)
	{
		rflrzb=cf.round((qye-sgcbj)*100/((qye+zchtje)-(sgcbj+zchtcb)),2);
	}
	else {
		rflrzb=0;
	}

	//主材利润占比
	if (((qye+zchtje)-(sgcbj+zchtcb))!=0)
	{
		zclrzb=cf.round((zchtje-zchtcb)*100/((qye+zchtje)-(sgcbj+zchtcb)),2);
	}
	else {
		zclrzb=0;
	}

	//水电部分
	
	sdxse=0;//水电部分销售额
	sdcbe=0;//水电部分成本额
	ls_sql="SELECT sum(sfje),sum(ROUND(zqsfje*sgcbjbfb/100,2))";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
	ls_sql+=" and sfxmlx in('D','E')";//D：水电路；E：水电路预收
	ls_sql+=" and sfjrqye='1'";//1：记入；2：不记入
	ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后;3:不记入
	ls_sql+=" and sfcysgdjs='Y' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sdxse=rs.getDouble(1);
		sdcbe=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(sfje),sum(ROUND(sfje*sgcbjbfb/100,2))";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfjrqye='1'";//1：记入；2：不记入
	ls_sql+=" and cbjjsfs='2' ";//1:折前;2:折后;3:不记入
	ls_sql+=" and sfcysgdjs='Y' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sdxse+=rs.getDouble(1);
		sdcbe+=rs.getDouble(2);
	}
	rs.close();
	ps.close();


	ls_sql="SELECT sum(round(bj_gclmx.sl*bj_bjxmmx.dj,2)),sum(round(bj_gclmx.sl*bj_bjxmmx.sgcbj,2))";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" and xmflbm='01'";//01：水电部分
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sdxse+=rs.getDouble(1);
		sdcbe+=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	sdxse=cf.round(sdxse,2);
	sdcbe=cf.round(sdcbe,2);

	sdxszb=0;//水电部分销售占比
	if (qye+zchtje!=0)
	{
		sdxszb=cf.round(sdxse*100/(qye+zchtje),2);
	}
	else {
		sdxszb=0;
	}

	sdcbzb=0;//水电部分成本占比
	if (sgcbj+zchtcb!=0)
	{
		sdcbzb=cf.round(sdcbe*100/(sgcbj+zchtcb),2);
	}
	else {
		sdcbzb=0;
	}

	sdlrzb=0;//水电部分利润占比
	if (((qye+zchtje)-(sgcbj+zchtcb))!=0)
	{
		sdlrzb=cf.round((sdxse-sdcbe)*100/((qye+zchtje)-(sgcbj+zchtcb)),2);
	}
	else {
		sdlrzb=0;
	}


	//松下主材
	sxzcxse=0;//松下主材销售额
	sxzccbe=0;//松下主材成本额
	ls_sql="SELECT  sum(je+ycf+qtfyje),sum(cbj*sl)";
	ls_sql+=" FROM bj_khzcmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and zcdlbm='松下产品'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sxzcxse=rs.getDouble(1);
		sxzccbe=rs.getDouble(2);
	}
	rs.close();
	ps.close();


	//松下主材其它费
	double sxzcqtf=0;
	double sxzcqtcb=0;
	if (allzcje!=0)
	{
		sxzcqtf=zcqtfje*(sxzcxse/allzcje);
		sxzcqtcb=zcqtfcb*(sxzcxse/allzcje);
	}

	sxzcxse=cf.round(sxzcxse+sxzcqtf,2);
	sxzccbe=cf.round(sxzccbe+sxzcqtcb,2);



	sxzcxszb=0;//松下主材销售占比
	if (qye+zchtje!=0)
	{
		sxzcxszb=cf.round(sxzcxse*100/(qye+zchtje),2);
	}
	else {
		sxzcxszb=0;
	}

	sxzccbzb=0;//松下主材成本占比
	if (sgcbj+zchtcb!=0)
	{
		sxzccbzb=cf.round(sxzccbe*100/(sgcbj+zchtcb),2);
	}
	else {
		sxzccbzb=0;
	}

	sxzclrzb=0;//松下主材利润占比
	if (((qye+zchtje)-(sgcbj+zchtcb))!=0)
	{
		sxzclrzb=cf.round((sxzcxse-sxzccbe)*100/((qye+zchtje)-(sgcbj+zchtcb)),2);
	}
	else {
		sxzclrzb=0;
	}

	//集采主材
	jczcxse=0;//集采主材销售额
	jczcxse=cf.round(zchtje-sxzcxse,2);

	jczccbe=0;//集采主材成本额
	jczccbe=cf.round(zchtcb-sxzccbe,2);

	jczcxszb=0;//集采主材销售占比
	if (qye+zchtje!=0)
	{
		jczcxszb=cf.round(jczcxse*100/(qye+zchtje),2);
	}
	else {
		jczcxszb=0;
	}

	jczccbzb=0;//集采主材成本占比
	if (sgcbj+zchtcb!=0)
	{
		jczccbzb=cf.round(jczccbe*100/(sgcbj+zchtcb),2);
	}
	else {
		jczccbzb=0;
	}

	jczclrzb=0;//集采主材利润占比
	if (((qye+zchtje)-(sgcbj+zchtcb))!=0)
	{
		jczclrzb=cf.round((jczcxse-jczccbe)*100/((qye+zchtje)-(sgcbj+zchtcb)),2);
	}
	else {
		jczclrzb=0;
	}


	//松下核减
	sdhjxse=0;//松下核减销售额
	ls_sql="SELECT sum(-1*sfje) ";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmmc like '%松下产品免安装费%'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sdhjxse=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	sdhjxszb=0;//松下核减销售占比
	if (qye+zchtje!=0)
	{
		sdhjxszb=cf.round(sdhjxse*100/(qye+zchtje),2);
	}
	else {
		sdhjxszb=0;
	}


	ls_sql="SELECT sum(sfje)";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmlx in('6','8')";//8：公司购主材税金
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allsuijin=rs.getDouble(1);
	}
	rs.close();
	ps.close();



	double zcyh=0;//主材优惠
	ls_sql="SELECT sum(zqje-je)";
	ls_sql+=" FROM bj_khzcmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcyh=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(zqsfje-sfje)";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmlx in('4','7','8')";//4：公司购主材间接费;7：公司购主材管理费;8：公司购主材税金
	ls_sql+=" and sfxmmc not like '%主材优惠%'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcyh+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(-1*sfje) ";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmmc like '%主材优惠%'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcyh+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//公司优惠金额=人辅折扣额+人辅减免+主材优惠+松下减免
	gsyhje=(wdzgce-qye)+zcyh;
	gsyhje=cf.round(gsyhje,2);

	//工程利润率=（合同总额-合同成本）/合同总额
	if ((qye+zchtje)!=0)
	{
		gclrv=((qye+zchtje)-(sgcbj+zchtcb))*100/(qye+zchtje);
	}
	else{
		gclrv=0;
	}
	gclrv=cf.round(gclrv,2);

	//毛利率=（合同总额-合同成本）/合同总额-3.477%
	if ((qye+zchtje)!=0)
	{
		gcmll=((qye+zchtje)-(sgcbj+zchtcb))*100/(qye+zchtje)-3.477;
	}
	else{
		gcmll=0;
	}
	gcmll=cf.round(gcmll,2);

	//实际毛利率=（合同总额-合同总额*3.477%)-合同成本）/合同总额-10%
	if ((qye+zchtje)!=0)
	{
		gcsjmll=((qye+zchtje)-(qye+zchtje)*0.03477-(sgcbj+zchtcb))*100/(qye+zchtje)-10;
	}
	else{
		gcsjmll=0;
	}

	gcsjmll=cf.round(gcsjmll,2);

	


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


<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		<tr bgcolor="#FFFFFF" >
		  <td width="36%">项目名称：<%=fwdz%></td>
		  <td width="37%">建筑面积（㎡）：<%=fwmj%></td>
		  <td width="27%">工期：<%=sjgq%>天</td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="19%" rowspan="2">预算指标</td>

	<td colspan="2">销售</td>
	<td colspan="2">成本</td>
	<td colspan="3">利润</td>
	<td>&nbsp;</td>
  </tr>



<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">总金额（元）</td>
	<td  width="7%">占销售合同总额比%</td>
	<td  width="10%">总金额（元）</td>
	<td  width="7%">占成本总额比%</td>
	<td  width="10%">单位指标   （元/㎡）</td>
	<td  width="10%">总金额（元）</td>
	<td  width="7%">占利润百分比</td>
	<td  width="20%">备注</td>
  </tr>




		<tr bgcolor="#FFFFFF"  align="center" >
          <td>合计</td>
		  <td><%=cf.round(qye+zchtje,2)%></td>
		  <td>100%</td>
		  <td><%=cf.round(sgcbj+zchtcb,2)%></td>
		  <td>100%</td>
		  <td><%=cf.round(((qye+zchtje)-(sgcbj+zchtcb))/fwmj,2)%></td>
		  <td><%=cf.round((qye+zchtje)-(sgcbj+zchtcb),2)%></td>
		  <td>100%</td>
		  <td>&nbsp;</td>
  </tr>
		<tr bgcolor="#FFFFFF"  align="center" >
          <td>人工辅料小计</td>
		  <td><%=qye%></td>
		  <td><%=rfxszb%>%</td>
		  <td><%=sgcbj%></td>
		  <td><%=rfcbzb%>%</td>
		  <td><%=cf.round((qye-sgcbj)/fwmj,2)%></td>
		  <td><%=cf.round(qye-sgcbj,2)%></td>
		  <td><%=rflrzb%>%</td>
		  <td>&nbsp;</td>
  </tr>
		<tr bgcolor="#FFFFFF"  align="center" >
          <td> 其中：水电部分</td>
		  <td><%=sdxse%></td>
		  <td><%=sdxszb%>%</td>
		  <td><%=sdcbe%></td>
		  <td><%=sdcbzb%>%</td>
		  <td><%=cf.round((sdxse-sdcbe)/fwmj,2)%></td>
		  <td><%=cf.round(sdxse-sdcbe,2)%></td>
		  <td><%=sdlrzb%>%</td>
		  <td>&nbsp;</td>
  </tr>
		<tr bgcolor="#FFFFFF"  align="center" >
		  <td>主材费小计</td>
		  <td><%=zchtje%></td>
		  <td><%=zcxszb%>%</td>
		  <td><%=zchtcb%></td>
		  <td><%=zccbzb%>%</td>
		  <td><%=cf.round((zchtje-zchtcb)/fwmj,2)%></td>
		  <td><%=cf.round(zchtje-zchtcb,2)%></td>
		  <td><%=zclrzb%>%</td>
		  <td>&nbsp;</td>
  </tr>
		<tr bgcolor="#FFFFFF"  align="center" >
		  <td>集中采购材料</td>
		  <td><%=jczcxse%></td>
		  <td><%=jczcxszb%>%</td>
		  <td><%=jczccbe%></td>
		  <td><%=jczccbzb%>%</td>
		  <td><%=cf.round((jczcxse-jczccbe)/fwmj,2)%></td>
		  <td><%=cf.round(jczcxse-jczccbe,2)%></td>
		  <td><%=jczclrzb%>%</td>
		  <td>&nbsp;</td>
  </tr>
		<tr bgcolor="#FFFFFF"  align="center" >
		  <td>松下主材</td>
		  <td><%=sxzcxse%></td>
		  <td><%=sxzcxszb%>%</td>
		  <td><%=sxzccbe%></td>
		  <td><%=sxzccbzb%>%</td>
		  <td><%=cf.round((sxzcxse-sxzccbe)/fwmj,2)%></td>
		  <td><%=cf.round(sxzcxse-sxzccbe,2)%></td>
		  <td><%=sxzclrzb%>%</td>
		  <td>&nbsp;</td>
  </tr>
		<tr bgcolor="#FFFFFF"  align="center" >
		  <td>税金（人辅+主材）*3.477%</td>
		  <td><%=allsuijin%></td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
  </tr>
		<tr bgcolor="#FFFFFF"  align="center" >
		  <td>核减松下产品（税后）</td>
		  <td><%=sdhjxse%></td>
		  <td><%=sdhjxszb%>%</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF"  >
  <td height="24" colspan="9">预算指标分析说明</td>
  </tr>
<tr bgcolor="#FFFFFF"  align="center" >
  <td align="center">公司优惠金额</td>
  <td colspan="8" align="left"><%=gsyhje%></td>
  </tr>
<tr bgcolor="#FFFFFF"  align="center" >
  <td align="center">工程利润率（≥31%）</td>
  <td colspan="8" align="left"><%=gclrv%>%</td>
</tr>
<tr bgcolor="#FFFFFF"  align="center" >
  <td align="center">毛利率（减税金3.477%）</td>
  <td colspan="8" align="left"><%=gcmll%>%</td>
</tr>
<tr bgcolor="#FFFFFF"  align="center" >
  <td align="center">实际毛利率（减绩效10%）</td>
  <td colspan="8" align="left"><%=gcsjmll%>%</td>
</tr>
<tr bgcolor="#FFFFFF"  align="center" >
  <td>&nbsp;</td>
  <td colspan="8">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF"  align="center" >
  <td>&nbsp;</td>
  <td colspan="8">&nbsp;</td>
</tr>
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#FFFFFF"  align="center" >
  <td width="20%" height="30">预算员：</td>
  <td width="20%"> 店长：</td>
  <td width="20%"> 分管会计：</td>
  <td width="20%"> 财务副总：</td>
  <td width="20%">总经理：</td>
  </tr>
</table>
</body>
</html>
