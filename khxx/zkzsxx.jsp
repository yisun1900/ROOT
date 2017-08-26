<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khxm=null;
String fwdz=null;

String zklx="";
double zdzk=10;
double zjjmje=0;
double gcfqdzk=10;
double glfzk=10;
double sjzk=10;
double sjfzk=10;
double qtsfxmzk=10;

double bzjgzk=10;
double mjzjzk=10;
double zcsjzk=10;
double zcclzk=10;
double zcsfzk=10;
double zcjmzk=10;
double ddzccjzk=10;
double ddzcclzk=10;
double tcwgczk=10;
double tcgcclzk=10;


String zjxzklx="";
String zjxzklxmc="";
double gczjxfzk=10;
double gcjxzk=10;
double glfzjxzk=10;
double jxglfzk=10;
double sjzjxzk=10;
double sjfzjxzk=10;

double clfzk=0;
double zcfzk=0;
double rgfzk=0;
double ysfzk=0;
double jxfzk=0;
double shfzk=0;
double qtfzk=0;

double hdzsjz=0;
double djjbfb=0;
double djjje=0;
double zjxdjjje=0;
double rzfbfb=0;
double htrzf=0;
double zjxrzf=0;

String djjzsfs="";
String zsjs="";
double khfqbfb=0;

String cxhdbm=null;
String ssfgs=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
String bz=null;

String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,ssfgs,cxhdbm,cxhdbmxq,cxhdbmzh,bz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	ls_sql="select DECODE(zklx,'1','整单打折','2','单项打折','3','部分费用打折') zklx,zjxzklx,DECODE(zjxzklx,'1','同合同','2','独立折扣') zjxzklxmc,gcfqdzk,glfzk,sjzk,sjfzk";
	ls_sql+=" ,zjjmje,zdzk,qtsfxmzk,bzjgzk,mjzjzk,zcsjzk,zcclzk,zcsfzk,zcjmzk,ddzccjzk,ddzcclzk,tcwgczk,tcgcclzk ";
	ls_sql+=" from crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjjmje=rs.getDouble("zjjmje");
		zdzk=rs.getDouble("zdzk");
		qtsfxmzk=rs.getDouble("qtsfxmzk");
		bzjgzk=rs.getDouble("bzjgzk");
		mjzjzk=rs.getDouble("mjzjzk");
		zcsjzk=rs.getDouble("zcsjzk");
		zcclzk=rs.getDouble("zcclzk");
		zcsfzk=rs.getDouble("zcsfzk");
		zcjmzk=rs.getDouble("zcjmzk");
		ddzccjzk=rs.getDouble("ddzccjzk");
		ddzcclzk=rs.getDouble("ddzcclzk");
		tcwgczk=rs.getDouble("tcwgczk");
		tcgcclzk=rs.getDouble("tcgcclzk");

		zklx=cf.fillNull(rs.getString("zklx"));
		zjxzklx=cf.fillNull(rs.getString("zjxzklx"));
		zjxzklxmc=cf.fillNull(rs.getString("zjxzklxmc"));
		gcfqdzk=rs.getDouble("gcfqdzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
	}
	rs.close();
	ps.close();

	ls_sql="select clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk";
	ls_sql+=" from crm_khbffyzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clfzk=rs.getDouble("clfzk");
		zcfzk=rs.getDouble("zcfzk");
		rgfzk=rs.getDouble("rgfzk");
		ysfzk=rs.getDouble("ysfzk");
		jxfzk=rs.getDouble("jxfzk");
		shfzk=rs.getDouble("shfzk");
		qtfzk=rs.getDouble("qtfzk");
	}
	rs.close();
	ps.close();

	ls_sql="select  gczjxfzk,glfzjxzk,sjzjxzk,sjfzjxzk ";
	ls_sql+=" from  crm_khzjxzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gczjxfzk=rs.getDouble("gczjxfzk");
		glfzjxzk=rs.getDouble("glfzjxzk");
		sjzjxzk=rs.getDouble("sjzjxzk");
		sjfzjxzk=rs.getDouble("sjfzjxzk");

	}
	rs.close();
	ps.close();


	ls_sql="select DECODE(djjzsfs,'1','固定金额','2','工程费百分比','3','整单百分比') djjzsfs,DECODE(zsjs,'1','折前合同额','2','折后合同额','3','折前工程费','4','折后工程费','5','结算金额') zsjs,khfqbfb ";
	ls_sql+=" from  crm_khdjj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djjzsfs=cf.fillNull(rs.getString("djjzsfs"));
		zsjs=cf.fillNull(rs.getString("zsjs"));
		khfqbfb=rs.getDouble("khfqbfb");
	}
	rs.close();
	ps.close();

	ls_sql="select hdzsjz,djjbfb,djjje,zjxdjjje,rzfbfb,htrzf,zjxrzf ";
	ls_sql+=" from  crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hdzsjz=rs.getDouble("hdzsjz");
		djjbfb=rs.getDouble("djjbfb");
		djjje=rs.getDouble("djjje");
		zjxdjjje=rs.getDouble("zjxdjjje");

		rzfbfb=rs.getDouble("rzfbfb");
		htrzf=rs.getDouble("htrzf");
		zjxrzf=rs.getDouble("zjxrzf");
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>折扣赠送</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">折扣赠送信息</div> 
<div align="center"></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right"><strong>客户编号 </strong></td>
    <td width="29%"><%=khbh%></td>
    <td width="21%" align="right"><b>客户姓名</b></td>
    <td width="29%"><%=khxm%></td>
  </tr>
  
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right" bgcolor="#CCCCFF"><b>房屋地址</b></td>
    <td colspan="3" bgcolor="#CCCCFF"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right" bgcolor="#CCCCFF"><strong>公司促销活动</strong></td>
    <td colspan="3"><%=cxhdbm%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right" bgcolor="#CCCCFF"><strong>小区促销活动</strong></td>
    <td colspan="3"><%=cxhdbmxq%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right" bgcolor="#CCCCFF"><strong>展会促销活动</strong></td>
    <td colspan="3"><%=cxhdbmzh%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right" bgcolor="#CCCCFF"><strong>备注</strong></td>
    <td colspan="3"><%=bz%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td colspan="4" align="center"><strong>合同折扣</strong></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">折扣类型</td>
    <td><%=zklx%></td>
    <td align="right">整单折扣</td>
    <td><%=zdzk%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">工程费签单折扣</td>
    <td><%=gcfqdzk%></td><td align="right">直接减免金额</td>
      <td><%=zjjmje%></td></tr>
  <tr bgcolor="#FFFFFF">
    <td height="21" align="right">管理费折扣</td>
    <td><%=glfzk%></td><td align="right">税金折扣</td>
      <td><%=sjzk%></td></tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">设计费折扣</td>
    <td><%=sjfzk%></td>
    <td align="right">其它收费项目折扣</td>
    <td><%=qtsfxmzk%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center">套餐折扣</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">套餐标准价格折扣</td>
    <td><%=bzjgzk%></td>
    <td align="right">面积增加金额折扣</td>
    <td><%=mjzjzk%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">主材升级差价折扣</td>
    <td><%=zcsjzk%></td>
    <td align="right">主材超量加价折扣</td>
    <td><%=zcclzk%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">需收费主材折扣</td>
    <td><%=zcsfzk%></td>
    <td align="right">主材减免折扣</td>
    <td><%=zcjmzk%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right">套餐外施工项折扣</td>
    <td><%=tcwgczk%></td>
    <td align="right">工程超量加价折扣</td>
    <td><%=tcgcclzk%></td>
  </tr>
  
  <tr bgcolor="#CCCCFF">
    <td colspan="4" align="center"><strong>增减项折扣</strong></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">增减项折扣类型</td>
    <td colspan="3"><%=zjxzklxmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">工程增项折扣</td>
    <td><%=gczjxfzk%></td>
    <td align="right">工程减项折扣</td>
    <td><%=gcjxzk%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="21" align="right">增项管理费折扣</td>
    <td><%=glfzjxzk%></td>
    <td align="right">减项管理费折扣</td>
    <td><%=jxglfzk%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">增项税金折扣</td>
    <td><%=sjzjxzk%></td><td align="right">减项税金折扣</td>
      <td><%=sjfzjxzk%></td></tr>
  <tr bgcolor="#FFFFCC">
    <td colspan="4" align="center" bgcolor="#FFFFCC"><p>工程费部分打折</p></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">工程－辅材费折扣</td>
    <td><%=clfzk%></td><td align="right">工程－主材费折扣</td>
      <td><%=zcfzk%></td></tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">工程－人工费折扣</td>
    <td><%=rgfzk%></td><td align="right">工程－运输费折扣</td>
      <td><%=ysfzk%></td></tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">工程－机械费折扣</td>
    <td><%=jxfzk%></td><td align="right">工程－损耗费折扣</td>
      <td><%=shfzk%></td></tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">工程－其它费折扣</td>
    <td><%=qtfzk%></td><td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#FFFFCC">签单前选择代金券赠送方式</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">代金券赠送方式</td>
    <td><%=djjzsfs%></td>
    <td align="right">赠送基数</td>
    <td><%=zsjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">代金券百分比</td>
    <td><%=khfqbfb%>%</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#FFFFCC">签单后金额</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">代金券百分比</td>
    <td><%=djjbfb%>%</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">合同赠送代金券</td>
    <td><%=djjje%></td>
    <td align="right">增减项代金券</td>
    <td><%=zjxdjjje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">认证费百分比</td>
    <td><%=rzfbfb%>%</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">合同认证费</td>
    <td><%=htrzf%></td>
    <td align="right">增减项认证费</td>
    <td><%=zjxrzf%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">活动赠送净值</span></td>
    <td><%=hdzsjz%></td><td align="right">&nbsp;</td>
    <td>&nbsp;</td></tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
 <tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">类型</td>
	<td  width="20%">赠送项目</td>
	<td  width="6%">计量单位</td>
	<td  width="8%">市场单价</td>
	<td  width="6%">数量上限</td>
	<td  width="6%">数量下限</td>
	<td  width="6%">合同赠送数量</td>
	<td  width="6%">最新赠送数量</td>
	<td  width="35%">备注</td>
</tr>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
ls_sql="select DECODE(lx,'1','多选','2','单选','3','特权'),zsxm,jldw,TO_CHAR(scdj),TO_CHAR(zsslsx),TO_CHAR(zsslxx),sjsl,zxzssl,bz  ";
ls_sql+=" from crm_khzsxx ";
ls_sql+=" where khbh='"+khbh+"'";
ls_sql+=" order by zsxm";

pageObj.sql=ls_sql;
//进行对象初始化
pageObj.initPage("","","","");
pageObj.setPageRow(1000);//设置每页显示记录数

pageObj.out=out;
pageObj.getDate(1);

pageObj.displayDateSum();

%>
</table>



<P>

<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
 <tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">收费项目</td>
	<td  width="8%">收费计算方式</td>
	<td  width="4%">百分比</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">数量</td>
	<td  width="5%">单价</td>
	<td  width="6%">折前金额</td>
	<td  width="3%">单项折扣</td>
	<td  width="6%">折后金额</td>
	<td  width="4%">记入签约额</td>
	<td  width="4%">记入税金</td>
	<td  width="4%">记入管理费</td>
	<td  width="4%">是否可打折</td>
	<td  width="3%">最低折扣</td>
	<td  width="5%">收费项目类型</td>
	<td  width="4%">施工队结算</td>
	<td  width="20%">备注</td>
</tr>

<%

ls_sql="SELECT sfxmmc,DECODE(bj_sfxmmx.sflx,'1','工程直接费百分比','2','固定金额(可改)','3','税金（折后按基数计算）','8','税金（折后按折扣计算）','4','固定金额(不可改)','5','管理费','6','主材费百分比','7','工程加主材费百分比') sflx ";
ls_sql+=" ,bj_sfxmmx.sfbfb||'%' sfbfb,bj_sfxmmx.jldw,TO_CHAR(bj_sfxmmx.sl) sl,TO_CHAR(bj_sfxmmx.dj) dj,bj_sfxmmx.zqsfje,TO_CHAR(bj_sfxmmx.dxzkl) dxzkl,bj_sfxmmx.sfje ";
ls_sql+=" ,DECODE(bj_sfxmmx.sfjrqye,'1','记入','2','<font color=\"#FF0000\"><B>不记入</B></font>') sfjrqye,DECODE(bj_sfxmmx.jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(bj_sfxmmx.jrglfbz,'1','记入','2','不记入') jrglfbz,DECODE(bj_sfxmmx.sfkdz,'N','不可打','Y','可打') sfkdz,TO_CHAR(zdzk) zdzk,DECODE(bj_sfxmmx.sfxmlx,'1','间接工程费','2','工程相关费','3','设计费','4','间接主材费','5','工程管理费','6','工程税金','7','主材管理费','8','主材税金','9','其它') sfxmlx,DECODE(bj_sfxmmx.sfcysgdjs,'N','否','Y','是') sfcysgdjs,bj_sfxmmx.bz";
ls_sql+=" FROM bj_sfxmmx  ";
ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
ls_sql+=" order by bj_sfxmmx.sfxmbm";

pageObj.sql=ls_sql;
//进行对象初始化
pageObj.initPage("","","","");
pageObj.setPageRow(1000);//设置每页显示记录数

pageObj.out=out;
pageObj.getDate(1);

pageObj.displayDateSum();

%>
</table>

 

</body>
</html>
