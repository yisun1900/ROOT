<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

double mmhtje=0;
double mmzxje=0;
double mmfkje=0;

double cghtje=0;
double cgzxje=0;
double cgfkje=0;

double jjhtje=0;
double jjzxje=0;
double jjfkje=0;


double zchtje=0;
double zczjxje=0;

double jchte=0;//集成合同额
double jczjx=0;//集成增减项
double jcysk=0;//集成应收款
double jcssk=0;//集成已收款
double jcmqqk=0;//集成目前欠款


String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String xb=null;
String sjs=null;
String hth=null;
String qyrq=null;
String jgrq=null;
String dwbh=null;
String sjsbh=null;
String fgsbh=null;
String sgd=null;
String zjxm=null;
double wdzgce=0;
double qye=0;
double sjf=0;
double sssjf=0;
double glf=0;
double sfke=0;
double zjxssk=0;
double zqgczjf=0;
double zhgczjf=0;

double yfgckze=0;
double gckzc=0;
double zjxje=0;
double zhzjxje=0;
double kglf=0;
double kqtk=0;

double zkl=0;
double zjxzkl=0;

String zklx=null;
double zdzk=10;
double gcfqdzk=10;
double glfzk=10;
double sjzk=10;
double sjfzk=10;
double qtsfxmzk=10;
String zjxzklx=null;
String zjxzklxmc="";

double gczjxfzk=10;
double glfzjxzk=10;
double sjzjxzk=10;
double sjfzjxzk=10;
double qtsfxmzjxzk=10;

double gczxzk=10;
double gcjxzk=10;
double zxglfzk=10;
double jxglfzk=10;
double zxsjzk=10;
double jxsjzk=10;

double clfzk=10;//辅材费折扣
double zcfzk=10;//主材费折扣
double rgfzk=10;//人工费折扣
double ysfzk=10;//运输费折扣
double jxfzk=10;//机械费折扣
double shfzk=10;//损耗费折扣
double qtfzk=10;//其它费折扣

double gckk=0;
double suijin=0;
double suijinbfb=0;
double zjxsuijin=0;
double glfbfb=0;
double guanlif=0;
double zjxguanlif=0;
double zhwjrqyexm=0;
String wjrqyexmsm=null;

double cdzwjmje=0;
double glfjmje=0;
double sjjmje=0;

double zqguanlif=0;
double zqzjxguanlif=0;

double zqljzjx=0;
double zhljzjx=0;

String sgbz=null;
String sjsdh=null;
String bzdh=null;
String zjdh=null;
String sjfkzc=null;
String zjxwcbz=null;
String gcjdmc=null;
String gckkspbz=null;
String fkcsmc=null;
String ztmc=null;

String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
String sffj=null;
double fjje=0;
double gsfje=0;
String sfyrz=null;
String rzsc=null;
String sfyyh=null;
String yhyy=null;
double scfjk=0;
double jxglf=0;
double rzf=0;
String xxshyj=null;

try {
	conn=cf.getConnection();

	ls_sql="select cxhdbmxq,cxhdbmzh,xxshyj,zqguanlif,zqzjxguanlif,DECODE(zt,'2','家装客户','3','退单客户','4','非家装客户','5','设计客户') ztmc,zjxssk,guanlif,zjxguanlif,suijin,suijinbfb,zjxsuijin,cxhdbm,sffj,fjje,gsfje,sfyrz,rzsc,sfyyh,yhyy,fkcsmc,kqtk,kglf,gckkspbz,gcjdmc,zjxwcbz,gckk,zkl,sjfkzc,fgsbh,sjsbh,khxm,fwdz,lxfs,xb,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,sjf,glf,sfke,zjxje,zhzjxje,sgbz,jgrq";
	ls_sql+=" ,zjxzkl,cdzwjmje,glfjmje,sjjmje,zhwjrqyexm,wjrqyexmsm,zqljzjx,zhljzjx,zqgczjf,zhgczjf ";
	ls_sql+=" from  crm_khxx,dm_gcjdbm,cw_fkcs";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and khbh='"+khbh+"' and crm_khxx.jzkfkcs=cw_fkcs.fkcs(+)";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqgczjf=rs.getDouble("zqgczjf");
		zhgczjf=rs.getDouble("zhgczjf");
		zqljzjx=rs.getDouble("zqljzjx");
		zhljzjx=rs.getDouble("zhljzjx");
		zjxzkl=rs.getDouble("zjxzkl");
		cdzwjmje=rs.getDouble("cdzwjmje");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));

		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		xxshyj=cf.fillNull(rs.getString("xxshyj"));
		zqguanlif=rs.getDouble("zqguanlif");
		zqzjxguanlif=rs.getDouble("zqzjxguanlif");

		ztmc=cf.fillNull(rs.getString("ztmc"));
		zjxssk=rs.getDouble("zjxssk");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		zjxsuijin=rs.getDouble("zjxsuijin");
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sffj=cf.fillNull(rs.getString("sffj"));
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
		rzsc=cf.fillNull(rs.getString("rzsc"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhyy=cf.fillNull(rs.getString("yhyy"));

		fkcsmc=cf.fillNull(rs.getString("fkcsmc"));
		kglf=rs.getDouble("kglf");
		kqtk=rs.getDouble("kqtk");
		gckkspbz=cf.fillNull(rs.getString("gckkspbz"));
		gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		gckk=rs.getDouble("gckk");
		zkl=rs.getDouble("zkl");
		sjfkzc=cf.fillNull(rs.getString("sjfkzc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		xb=cf.fillNull(rs.getString("xb"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		guanlif=rs.getDouble("guanlif");
		zjxguanlif=rs.getDouble("zjxguanlif");

		sfke=rs.getDouble("sfke");
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");
	}
	else{
		rs.close();
		ps.close();

		ls_sql="select khxm,fwdz,lxfs,xb,sjs,zxdm,ssfgs";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			xb=cf.fillNull(rs.getString("xb"));
			sjs=cf.fillNull(rs.getString("sjs"));
			dwbh=cf.fillNull(rs.getString("zxdm"));
			fgsbh=cf.fillNull(rs.getString("ssfgs"));
		}
		else{
			rs.close();
			ps.close();

			out.println("无此客户记录");
			return;
		}
		rs.close();
		ps.close();
	}
	rs.close();
	ps.close();

	ls_sql="select zklx,zdzk,gcfqdzk,glfzk,sjzk,sjfzk,qtsfxmzk,zjxzklx";
	ls_sql+=" from  crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
		zdzk=rs.getDouble("zdzk");
		gcfqdzk=rs.getDouble("gcfqdzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
		qtsfxmzk=rs.getDouble("qtsfxmzk");
		zjxzklx=cf.fillNull(rs.getString("zjxzklx"));
	}
	rs.close();
	ps.close();

	ls_sql="select gczjxfzk,glfzjxzk,sjzjxzk,sjzjxzk,qtsfxmzjxzk ";
	ls_sql+=" from crm_khzjxzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gczjxfzk=rs.getDouble("gczjxfzk");
		glfzjxzk=rs.getDouble("glfzjxzk");
		sjzjxzk=rs.getDouble("sjzjxzk");
		sjzjxzk=rs.getDouble("sjzjxzk");
		qtsfxmzjxzk=rs.getDouble("qtsfxmzjxzk");
	}
	rs.close();
	ps.close();

	ls_sql="select clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk";
	ls_sql+=" from  crm_khbffyzk";
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

	//设计师电话
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	//班长电话
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//质检电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+fgsbh+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//市场返卷款
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='91' and scbz='N'";//91：市场返卷款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		scfjk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//减项管理费
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='94' and scbz='N'";//94：减项管理费
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jxglf=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//认证费
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='95' and scbz='N'";//95：认证费
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rzf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//实收设计费
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
	ls_sql+=" and fklxbm='53'";//53：设计费
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sssjf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE4 {
	font-family: "楷体_GB2312";
	font-weight: bold;
	font-size: 16px;
}
-->
</style>
</head>

<body bgcolor="#CCCCFF">
<div align="center">客户信息 
  <label>
  <input type="button" value="查看转款记录" onClick="window.open('zkjl.jsp?khbh=<%=khbh%>')">
  <input type="button" value="查看付款记录" onClick="window.open('fkjl.jsp?khbh=<%=khbh%>')">
  </label>
</div>


          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">客户编号</td>
              <td width="34%"><%=khbh%>（<%=ztmc%>）</td>
              <td width="18%" align="right">合同号</td>
              <td width="32%"><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">房屋地址              </td>
              <td width="34%"> <%=fwdz%></td>
              <td width="18%" align="right">客户姓名              </td>
              
    <td width="32%"><%=khxm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">签约店面              </td>
              <td width="34%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
              <td bgcolor="#FFFFFF" align="right" width="18%">设计师</td>
              <td width="32%"> <%=sjs%>（<%=sjsdh%>） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">施工队（班长）</td>
              <td colspan="2"><%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>（<%=sgbz%><%=bzdh%>）</td>
              <td width="32%">质检：<%=zjxm%>（<%=zjdh%>） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">签约－－合同竣工              </td>
              <td width="34%">[<%=qyrq%>]－－[<%=jgrq%>]</td>
              <td width="18%" align="right">工程进度              </td>
              <td width="32%"><%=gcjdmc%> </td>
            </tr>


</table>
<P>    
      
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td colspan="6" align="center" bgcolor="#FFFFFF"><strong>促销活动</strong></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="16%" align="right">参加公司促销活动</td>
    <td colspan="5" ><%=cxhdbm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">参加小区促销活动</td>
    <td colspan="5" ><%=cxhdbmxq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">参加展会促销活动</td>
    <td colspan="5" ><%=cxhdbmzh%></td>
  </tr>
</table>

<P>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr align="center" bgcolor="#FFFFCC">
    <td colspan="11" bgcolor="#FFFFCC"><span class="STYLE4">家装打折情况</span> </td>
  </tr>
  <tr align="center" bgcolor="#FFFFCC">
    <td colspan="2" bgcolor="#FFFFCC">合同折扣</td>
    <td width="2%" rowspan="8" bgcolor="#FFFFCC">&nbsp;</td>
    <td colspan="2" bgcolor="#FFFFCC">增减项折扣</td>
    <td width="2%" rowspan="8" bgcolor="#FFFFCC">&nbsp;</td>
    <td colspan="2">部分折扣</td>
    <td width="2%" rowspan="8">&nbsp;</td>
    <td colspan="2">减免额</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">综合折扣</td>
    <td><%=zkl%></td>
    <td width="14%" align="right" bgcolor="#FFFFFF">增减项折扣类型</td>
    <td width="10%" bgcolor="#FFFFFF"><%=zjxzklxmc%></td>
    <td align="right">辅材费折扣</td>
    <td><%=clfzk%></td>
    <td align="right">工程减免</td>
    <td><%=cdzwjmje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">工程费签单折扣</td>
    <td bgcolor="#FFFFFF"><%=gcfqdzk%></td>
    <td width="14%" align="right" bgcolor="#FFFFFF">工程增项折扣</td>
    <td width="10%" bgcolor="#FFFFFF"><%=gczxzk%></td>
    <td align="right">主材费折扣</td>
    <td><%=zcfzk%></td>
    <td align="right">管理费减免</td>
    <td><%=glfjmje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">管理费折扣</td>
    <td><%=glfzk%></td>
    <td width="14%" align="right" bgcolor="#FFFFFF">工程减项折扣</td>
    <td width="10%" bgcolor="#FFFFFF"><%=gcjxzk%></td>
    <td align="right" >人工费折扣</td>
    <td><%=rgfzk%></td>
    <td align="right">税金减免</td>
    <td><%=sjjmje%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right">税金折扣</td>
    <td><%=sjzk%></td>
    <td width="14%" align="right" bgcolor="#FFFFFF">增项管理费折扣</td>
    <td width="10%" bgcolor="#FFFFFF"><%=zxglfzk%></td>
    <td align="right">运输费折扣</td>
    <td><%=ysfzk%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">设计费折扣</td>
    <td><%=sjfzk%></td>
    <td width="14%" align="right" bgcolor="#FFFFFF">减项管理费折扣</td>
    <td width="10%" bgcolor="#FFFFFF"><%=jxglfzk%></td>
    <td align="right">机械费折扣</td>
    <td><%=jxfzk%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td width="14%" align="right" bgcolor="#FFFFFF">增项税金折扣</td>
    <td width="10%" bgcolor="#FFFFFF"><%=zxsjzk%></td>
    <td align="right">损耗费折扣</td>
    <td><%=shfzk%></td>
    <td align="right">税率</td>
    <td><%=suijinbfb%>%</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="13%" align="right">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="14%" align="right" bgcolor="#FFFFFF">减项税金折扣</td>
    <td width="10%" bgcolor="#FFFFFF"><%=jxsjzk%></td>
    <td width="14%" align="right">其它费折扣</td>
    <td width="10%"><%=qtfzk%></td>
    <td width="13%" align="right">管理费率</td>
    <td width="10%"><%=glfbfb%>%</td>
  </tr>
</table>

<P>          
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr align="center" bgcolor="#FFFFCC">
    <td colspan="8" bgcolor="#CCFFFF"><span class="STYLE4">家装应收应付</span> </td>
  </tr>
 <tr bgcolor="#CCFFFF"> 
    <td colspan="2" align="center" bgcolor="#CCFFFF"><b>家装合同金额</b></td>
    <td width="2%" rowspan="9" bgcolor="#CCFFFF">&nbsp;</td>
    <td colspan="2" align="center" bgcolor="#CCFFFF"><b>家装增减项</b></td>
    <td width="2%" rowspan="9">&nbsp;</td>
    <td colspan="2" align="center"><b>家装实际发生额</b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="16%" align="right" bgcolor="#FFFFFF">合同总额－折前</td>
    <td width="16%" ><%=wdzgce%></td>
    <td width="16%" align="right" >累计增减项－折前</td>
    <td width="16%" ><%=zqljzjx%></td>
    <td width="16%" align="right">折前实际发生额</td>
    <td width="16%" ><%=cf.formatDouble(wdzgce+zqljzjx)%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">合同总额－折后</td>
    <td ><%=qye%></td>
    <td align="right" >累计增减项－折后</td>
    <td ><%=zhljzjx%></td>
    <td align="right">折后实际发生额</td>
    <td ><%=cf.formatDouble(qye+zhljzjx)%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td colspan="2" align="right">&nbsp;</td>
    <td colspan="2" align="right" >&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">工程直接费－折前</td>
    <td ><%=zqgczjf%></td>
    <td align="right" >工程增减项－折前</td>
    <td ><%=zjxje%></td>
    <td align="right">&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">工程直接费－折后</td>
    <td ><%=zhgczjf%></td>
    <td align="right" >工程增减项－折后</td>
    <td ><%=zhzjxje%></td>
    <td align="right">&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">合同税金</td>
    <td ><%=suijin%></td>
    <td align="right" >增减项税金</td>
    <td ><%=zjxsuijin%></td>
    <td align="right">总税金</td>
    <td ><%=cf.formatDouble(suijin+zjxsuijin)%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td align="right">合同管理费</td>
    <td ><%=guanlif%></td>
    <td align="right" >增减项管理费</td>
    <td ><%=zjxguanlif%></td>
    <td align="right">总管理费</td>
    <td ><%=cf.formatDouble(guanlif+zjxguanlif)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" >其它收费</td>
    <td ><%=zhwjrqyexm%></td>
    <td align="right" >&nbsp;</td>
    <td >&nbsp;</td>
    <td align="right">家装收款期数</td>
    <td ><%=fkcsmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" >其它收费项目</td>
    <td colspan="7" ><%=wjrqyexmsm%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td align="right" >应收设计费</td>
    <td ><%=sjf%></td>
    <td rowspan="3" bgcolor="#CCFFFF">&nbsp;</td>
    <td align="right" >增减项完成标志</td>
    <td  ><%
	cf.radioToken(out,"1+未完成&2+已完成",zjxwcbz,true);
%></td>
    <td rowspan="3">&nbsp;</td>
    <td align="right"><font color="#0000FF"><font color="#0000FF">已收工程款</font></font></td>
    <td ><font color="#0000FF"><%=cf.formatDouble(sfke)%></font></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">实收设计费</td>
    <td ><%=sssjf%></td>
    <td align="right" ><font color="#0000FF">增减项实收款</font></td>
    <td ><%=cf.formatDouble(zjxssk)%></td>
    <td align="right" ><font color="#0000FF">欠工程款</font></td>
    <td ><font color="#0000FF"><%=cf.formatDouble((qye+zhljzjx)-sfke)%></font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">服务费</td>
    <td ><%=glf%></td>
    <td align="right" >&nbsp;</td>
    <td >&nbsp;</td>
    <td align="right" >&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
</table>

<P>    
      
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td colspan="6" align="center" bgcolor="#FFFFFF"><strong>！！收 款 特 别 提 醒！！</strong></td>
  </tr>
 <tr bgcolor="#FFFFFF"> 
    <td align="right"><b><font color="#990000">减项扣其它款</font></b></td>
    <td width="17%" ><%=kqtk%></td>
    <td width="17%" align="right"><b><font color="#990000">累计减项管理费</font></b></td>
    <td width="17%"><%=kglf%></td>
    <td width="17%" align="right"><b><font color="#990000">共收到减项管理费</font></b></td>
    <td width="16%" ><%=cf.formatDouble(jxglf)%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">返卷总金额</td>
    <td ><%=fjje%></td>
    <td align="right">公司承担返卷额</td>
    <td><%=gsfje%></td>
    <td align="right"><b><font color="#990000">共收到市场返卷款</font></b></td>
    <td ><%=cf.formatDouble(scfjk)%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">工程扣款</td>
    <td ><%=gckk%></td>
    <td align="right">认证市场</td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc||'（'||dwdh||'）' from sq_dwxx where dwbh='"+rzsc+"'",rzsc,true);
%></td>
    <td align="right"><b><font color="#990000">共收到认证费</font></b></td>
    <td ><%=cf.formatDouble(rzf)%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">优惠内容</td>
    <td colspan="5" ><%=yhyy%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">信息审核备注</td>
    <td colspan="5" ><%=xxshyj%></td>
  </tr>
</table>

<P>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td colspan="18"><b>电子报价综合取费</b></td>
  </tr>
 <tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">收费项目</td>
	<td  width="8%">收费计算方式</td>
	<td  width="4%">百分比</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">数量</td>
	<td  width="5%">单价</td>
	<td  width="6%">折前金额</td>
	<td  width="3%">折扣</td>
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
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT sfxmmc,DECODE(sflx,'1','工程直接费百分比（不可改）','A','工程直接费百分比（可改）','2','固定金额(可改)','3','税金（折后合同额×税率）','8','税金（折前税金×税金折扣）','4','固定金额(不可改)','5','管理费','6','公司购主材百分比','7','自购主材百分比','9','按百分比收设计费','B','精装工程管理费','C','精装主材管理费','D','精装工程费百分比','E','精装主材费百分比') sflx ";
	ls_sql+=" ,bj_sfxmmx.sfbfb||'%' sfbfb,bj_sfxmmx.jldw,TO_CHAR(bj_sfxmmx.sl) sl,TO_CHAR(bj_sfxmmx.dj) dj,bj_sfxmmx.zqsfje,TO_CHAR(bj_sfxmmx.dxzkl) dxzkl,bj_sfxmmx.sfje ";
	ls_sql+=" ,DECODE(bj_sfxmmx.sfjrqye,'2','记入','1','<font color=\"#FF0000\"><B>不记入</B></font>') sfjrqye,DECODE(bj_sfxmmx.jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(bj_sfxmmx.jrglfbz,'1','记入','2','不记入') jrglfbz,DECODE(bj_sfxmmx.sfkdz,'N','不可打','Y','可打') sfkdz,TO_CHAR(zdzk) zdzk,DECODE(bj_sfxmmx.sfxmlx,'1','间接工程费','2','工程相关费','3','设计费','9','其它') sfxmlx,DECODE(bj_sfxmmx.sfcysgdjs,'N','否','Y','是') sfcysgdjs,bj_sfxmmx.bz";
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



<P>


<table width="100%" border="1" style="FONT-SIZE:13" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr> 
    <td colspan="9" align="center" bgcolor="#CCCCCC"><b>集成订单－收款情况</b></td>
  </tr>
  <tr align="center" bgcolor="#E8E8FF"> 
    <td width="15%" align="center" rowspan="2"><b>品牌</b></td>
    <td width="9%" rowspan="2"><strong>订单编号</strong></td>
    <td width="11%" rowspan="2"><b>合同额</b></td>
    <td colspan="3"><b>增减项信息</b></td>
    <td width="13%" rowspan="2"><font color="#0000CC"><b>合同额＋增减项</b></font></td>
    <td width="11%" rowspan="2"><b>已收款</b></td>
    <td width="14%" rowspan="2"><font color="#CC0000"><b>欠款=应收款-实收款</b></font></td>
  </tr>
  <tr align="center" bgcolor="#E8E8FF"> 
    <td width="10%"><b>发生时间</b></td>
    <td width="10%"><b>增减项金额</b></td>
    <td width="10%"><b>付款金额</b></td>
  </tr>
<%
	//主材
	String ppbm=null;
	String clzt=null;
	String ddbh="";

	ls_sql="select distinct ppbm";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'";//1:现金；2：支票；3：预付款冲减
	ls_sql+=" and clzt not in('98')";
	ls_sql+=" and (hkze!=0 OR zjhze!=0)";
	ls_sql+=" order by ppbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		ppbm=rs2.getString(1);

		double zcfkje=0;
		double zjxfkje=0;

		//品牌合同、增减项小计
		double zcyshtk=0;
		double zcyszjx=0;
		ls_sql="select sum(hkze),sum(zjhze)";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"' and ppbm='"+ppbm+"'";
		ls_sql+=" and clzt not in('98')";
		ls_sql+=" and (hkze!=0 OR zjhze!=0)";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zcyshtk=rs1.getDouble(1);
			zcyszjx=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		jchte+=zcyshtk;//订单总计：合同额
		jczjx+=zcyszjx;//订单总计：增减项

		jcysk+=zcyshtk+zcyszjx;//订单总计：合同额＋增减项



		//品牌增减项数、增减项订单数
		int allzczjcs=0;
		int zjxdds=0;
		ls_sql="select count(*),count(distinct ddbh)";
		ls_sql+=" from  jc_zczjx";
		ls_sql+=" where khbh='"+khbh+"' and ppbm='"+ppbm+"'";
		ls_sql+=" and ddbh in(select ddbh from jc_zcdd where khbh='"+khbh+"' and ppbm='"+ppbm+"' and clzt not in('98') and (hkze!=0 OR zjhze!=0) )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			allzczjcs=rs1.getInt(1);
			zjxdds=rs1.getInt(2);
		}
		rs1.close();
		ps1.close();

		//品牌订单数
		int ddsl=0;
		ls_sql="select count(*)";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"' and ppbm='"+ppbm+"'";
		ls_sql+=" and clzt not in('98')";
		ls_sql+=" and (hkze!=0 OR zjhze!=0)";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ddsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (ddsl==1 && allzczjcs==0)//一个订单，无增减项
		{
			ls_sql="select ddbh,hkze,zjhze,clzt";
			ls_sql+=" from  jc_zcdd";
			ls_sql+=" where khbh='"+khbh+"' and ppbm='"+ppbm+"'"; 
			ls_sql+=" and clzt not in('98')";
			ls_sql+=" and (hkze!=0 OR zjhze!=0)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ddbh=rs.getString(1);
				zchtje=rs.getDouble(2);//主材合同额
				zczjxje=rs.getDouble(3);//增减项总额

				clzt=rs.getString(4);

				if (clzt.equals("99"))
				{
					clzt="<font color='#FF0000'><B>（已退单）</B></font>";
				}
				else{
					clzt="";
				}
			}
			rs.close();
			ps.close();

			zcfkje=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh+"' and fklxbm='23' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zcfkje=rs1.getDouble(1);//已收主材款
			}
			rs1.close();
			ps1.close();

			jcssk+=zcfkje;//订单总计：已收款
			jcmqqk+=zcyshtk+zcyszjx-zcfkje;//订单总计：目前欠款

			%>
			<tr bgcolor="#FFFFFF" align="right"> 
				<td align="center" ><%=ppbm%></td>
				<td align="center"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
				<td><%=cf.formatDouble(zchtje)%></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><font color="#0000CC"><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
				<td><%=cf.formatDouble(zcfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
				<td><font color="#CC0000"><%=cf.formatDouble(zcyshtk+zcyszjx-zcfkje)%></font></td>
			</tr>
			<%
		}
		else if (ddsl==1 && allzczjcs==1)//一个订单，一个增减项
		{
			ls_sql="select ddbh,hkze,zjhze,clzt";
			ls_sql+=" from  jc_zcdd";
			ls_sql+=" where khbh='"+khbh+"' and ppbm='"+ppbm+"'"; 
			ls_sql+=" and clzt not in('98')";
			ls_sql+=" and (hkze!=0 OR zjhze!=0)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ddbh=rs.getString(1);
				zchtje=rs.getDouble(2);//主材合同额
				zczjxje=rs.getDouble(3);//增减项总额

				clzt=rs.getString(4);

				if (clzt.equals("99"))
				{
					clzt="<font color='#FF0000'><B>（已退单）</B></font>";
				}
				else{
					clzt="";
				}
			}
			rs.close();
			ps.close();

			zcfkje=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh+"' and fklxbm='23' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zcfkje=rs1.getDouble(1);//已收主材款
			}
			rs1.close();
			ps1.close();

			jcssk+=zcfkje;//订单总计：已收款
			jcmqqk+=zcyshtk+zcyszjx-zcfkje;//订单总计：目前欠款

			double dczjxze=0;
			String lrsj=null;
			String zjxbh=null;
			ls_sql="select zjxze,lrsj,zjxbh";
			ls_sql+=" from  jc_zczjx";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				dczjxze=rs1.getDouble(1);//
				lrsj=cf.fillNull(rs1.getDate(2));
				zjxbh=cf.fillNull(rs1.getString(3));
			}
			rs1.close();
			ps1.close();

			zjxfkje=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and zjxbh='"+zjxbh+"' and fklxbm='23' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zjxfkje=rs1.getDouble(1);//已收主材款
			}
			rs1.close();
			ps1.close();

			%>
			<tr bgcolor="#FFFFFF" align="right"> 
				<td align="center"><%=ppbm%></td>
				<td align="center"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
				<td align="right"><%=cf.formatDouble(zchtje)%></td>
				<td ><%=lrsj%></td>
				<td ><%=cf.formatDouble(dczjxze)%></td>
				<td ><%=cf.formatDouble(zjxfkje)%><A HREF="ViewZjxSk.jsp?zjxbh=<%=zjxbh%>" target="_blank">查看</A></td>
				<td><font color="#0000CC"><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
				<td><%=cf.formatDouble(zcfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
				<td><font color="#CC0000"><%=cf.formatDouble(zcyshtk+zcyszjx-zcfkje)%></font></td>
			</tr>
			<%
		}
		else if (ddsl==1 && allzczjcs>1)//一个订单，多个增减项
		{
			ls_sql="select ddbh,hkze,zjhze,clzt";
			ls_sql+=" from  jc_zcdd";
			ls_sql+=" where khbh='"+khbh+"' and ppbm='"+ppbm+"'"; 
			ls_sql+=" and clzt not in('98')";
			ls_sql+=" and (hkze!=0 OR zjhze!=0)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ddbh=rs.getString(1);
				zchtje=rs.getDouble(2);//主材合同额
				zczjxje=rs.getDouble(3);//增减项总额

				clzt=rs.getString(4);

				if (clzt.equals("99"))
				{
					clzt="<font color='#FF0000'><B>（已退单）</B></font>";
				}
				else{
					clzt="";
				}
			}
			rs.close();
			ps.close();

			zcfkje=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh+"' and fklxbm='23' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zcfkje=rs1.getDouble(1);//已收主材款
			}
			rs1.close();
			ps1.close();

			jcssk+=zcfkje;//订单总计：已收款
			jcmqqk+=zcyshtk+zcyszjx-zcfkje;//订单总计：目前欠款

			double dczjxze=0;
			String lrsj=null;
			String zjxbh=null;
			int row=0;
			ls_sql="select zjxze,lrsj,zjxbh";
			ls_sql+=" from  jc_zczjx";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ls_sql+=" order by zjxbh";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				dczjxze=rs1.getDouble(1);//
				lrsj=cf.fillNull(rs1.getDate(2));
				zjxbh=cf.fillNull(rs1.getString(3));

				zjxfkje=0;
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and zjxbh='"+zjxbh+"' and fklxbm='23' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
				ps3= conn.prepareStatement(ls_sql);
				rs3 =ps3.executeQuery();
				if (rs3.next())
				{
					zjxfkje=rs3.getDouble(1);//已收主材款
				}
				rs3.close();
				ps3.close();

				row++;

				if (row==1)
				{
					%>
					<tr bgcolor="#FFFFFF" align="right"> 
						<td align="center" rowspan="<%=allzczjcs%>"><%=ppbm%></td>
						<td align="center" rowspan="<%=allzczjcs%>"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
						<td rowspan="<%=allzczjcs%>"><%=cf.formatDouble(zchtje)%></td>
						<td ><%=row%>：<%=lrsj%></td>
						<td ><%=cf.formatDouble(dczjxze)%></td>
						<td ><%=cf.formatDouble(zjxfkje)%><A HREF="ViewZjxSk.jsp?zjxbh=<%=zjxbh%>" target="_blank">查看</A></td>
						<td rowspan="<%=allzczjcs%>"><font color="#0000CC" ><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
						<td rowspan="<%=allzczjcs%>"><%=cf.formatDouble(zcfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
						<td rowspan="<%=allzczjcs%>"><font color="#CC0000"><%=cf.formatDouble(zcyshtk+zcyszjx-zcfkje)%></font></td>
					</tr>
					<%
				}
				else{
					%>
					<tr bgcolor="#FFFFFF" align="right"> 
						<td ><%=row%>：<%=lrsj%></td>
						<td ><%=cf.formatDouble(dczjxze)%></td>
						<td ><%=cf.formatDouble(zjxfkje)%><A HREF="ViewZjxSk.jsp?zjxbh=<%=zjxbh%>" target="_blank">查看</A></td>
					</tr>
					<%
				}
			}
			rs1.close();
			ps1.close();
		}
		else{//多个订单
			ddsl=ddsl+allzczjcs-zjxdds+1;

			int ppmark=0;
			double ppskje=0;

			ls_sql="select ddbh,ppbm,hkze,zjhze,clzt";
			ls_sql+=" from  jc_zcdd";
			ls_sql+=" where khbh='"+khbh+"' and ppbm='"+ppbm+"'"; 
			ls_sql+=" and clzt not in('98')";
			ls_sql+=" and (hkze!=0 OR zjhze!=0)";
			ls_sql+=" order by ddbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				ddbh=rs.getString(1);
				ppbm=rs.getString(2);
				zchtje=rs.getDouble(3);//主材合同额
				zczjxje=rs.getDouble(4);//增减项总额

				clzt=rs.getString(5);

				if (clzt.equals("99"))
				{
					clzt="<font color='#FF0000'><B>（已退单）</B></font>";
				}
				else{
					clzt="";
				}

				double ddfkje=0;
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh+"' and fklxbm='23' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					ddfkje=rs1.getDouble(1);//已收主材款
				}
				rs1.close();
				ps1.close();

				ppskje+=ddfkje;
				jcssk+=ddfkje;//订单总计：已收款
				jcmqqk+=zchtje+zczjxje-ddfkje;//订单总计：目前欠款

				int zczjcs=0;
				ls_sql="select count(*)";
				ls_sql+=" from  jc_zczjx";
				ls_sql+=" where ddbh='"+ddbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					zczjcs=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				if (zczjcs==0)//无增减项
				{
					ppmark++;

					if (ppmark==1)
					{
						%>
						<tr bgcolor="#E8E8FF" align="right"> 
							<td align="center" rowspan="<%=ddsl%>"><%=ppbm%></td>
							<td align="center"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
							<td><%=cf.formatDouble(zchtje)%></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td><font color="#0000CC"><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
							<td ><%=cf.formatDouble(ddfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
							<td ><font color="#CC0000"><%=cf.formatDouble(zchtje+zczjxje-ddfkje)%></font></td>
						</tr>
						<%
					}
					else{
						%>
						<tr bgcolor="#E8E8FF" align="right"> 
							<td align="center"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
							<td ><%=cf.formatDouble(zchtje)%></td>
							<td >&nbsp;</td>
							<td >&nbsp;</td>
							<td >&nbsp;</td>
							<td><font color="#0000CC"><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
							<td ><%=cf.formatDouble(ddfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
							<td ><font color="#CC0000"><%=cf.formatDouble(zchtje+zczjxje-ddfkje)%></font></td>
						</tr>
						<%
					}

				}
				else if (zczjcs==1)//1个增减项
				{
					ppmark++;

					double dczjxze=0;
					String lrsj=null;
					String zjxbh=null;
					ls_sql="select zjxze,lrsj,zjxbh";
					ls_sql+=" from  jc_zczjx";
					ls_sql+=" where ddbh='"+ddbh+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						dczjxze=rs1.getDouble(1);//
						lrsj=cf.fillNull(rs1.getDate(2));
						zjxbh=cf.fillNull(rs1.getString(3));
					}
					rs1.close();
					ps1.close();

					zjxfkje=0;
					ls_sql="select sum(fkje)";
					ls_sql+=" from  cw_khfkjl";
					ls_sql+=" where khbh='"+khbh+"' and zjxbh='"+zjxbh+"' and fklxbm='23' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						zjxfkje=rs1.getDouble(1);//已收主材款
					}
					rs1.close();
					ps1.close();

					if (ppmark==1)
					{
						%>
						<tr bgcolor="#E8E8FF" align="right"> 
							<td align="center" rowspan="<%=ddsl%>"><%=ppbm%></td>
							<td align="center"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
							<td align="right"><%=cf.formatDouble(zchtje)%></td>
							<td ><%=lrsj%></td>
							<td ><%=cf.formatDouble(dczjxze)%></td>
							<td ><%=cf.formatDouble(zjxfkje)%><A HREF="ViewZjxSk.jsp?zjxbh=<%=zjxbh%>" target="_blank">查看</A></td>
							<td><font color="#0000CC"><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
							<td ><%=cf.formatDouble(ddfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
							<td ><font color="#CC0000"><%=cf.formatDouble(zchtje+zczjxje-ddfkje)%></font></td>
						</tr>
						<%

					}
					else{
						%>
						<tr bgcolor="#E8E8FF" align="right"> 
							<td align="center"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
							<td align="right"><%=cf.formatDouble(zchtje)%></td>
							<td ><%=lrsj%></td>
							<td ><%=cf.formatDouble(dczjxze)%></td>
							<td ><%=cf.formatDouble(zjxfkje)%><A HREF="ViewZjxSk.jsp?zjxbh=<%=zjxbh%>" target="_blank">查看</A></td>
							<td><font color="#0000CC"><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
							<td ><%=cf.formatDouble(ddfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
							<td ><font color="#CC0000"><%=cf.formatDouble(zchtje+zczjxje-ddfkje)%></font></td>
						</tr>
						<%

					}
				}
				else{//多个增减项
					double dczjxze=0;
					String lrsj=null;
					String zjxbh=null;
					int row=0;
					ls_sql="select zjxze,lrsj,zjxbh";
					ls_sql+=" from  jc_zczjx";
					ls_sql+=" where ddbh='"+ddbh+"'";
					ls_sql+=" order by zjxbh";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					while (rs1.next())
					{
						dczjxze=rs1.getDouble(1);//
						lrsj=cf.fillNull(rs1.getDate(2));
						zjxbh=cf.fillNull(rs1.getString(3));

						zjxfkje=0;
						ls_sql="select sum(fkje)";
						ls_sql+=" from  cw_khfkjl";
						ls_sql+=" where khbh='"+khbh+"' and zjxbh='"+zjxbh+"' and fklxbm='23' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
						ps3= conn.prepareStatement(ls_sql);
						rs3 =ps3.executeQuery();
						if (rs3.next())
						{
							zjxfkje=rs3.getDouble(1);//已收主材款
						}
						rs3.close();
						ps3.close();


						ppmark++;

						row++;

						if (ppmark==1)
						{
							%>
							<tr bgcolor="#E8E8FF" align="right"> 
								<td align="center" rowspan="<%=ddsl%>"><%=ppbm%></td>
								<td rowspan="<%=zczjcs%>" align="center"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
								<td rowspan="<%=zczjcs%>"><%=cf.formatDouble(zchtje)%></td>
								<td><%=row%>：<%=lrsj%></td>
								<td><%=cf.formatDouble(dczjxze)%></td>
								<td ><%=cf.formatDouble(zjxfkje)%><A HREF="ViewZjxSk.jsp?zjxbh=<%=zjxbh%>" target="_blank">查看</A></td>
								<td rowspan="<%=zczjcs%>"><font color="#0000CC"><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
								<td rowspan="<%=zczjcs%>" ><%=cf.formatDouble(ddfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
								<td rowspan="<%=zczjcs%>" ><font color="#CC0000"><%=cf.formatDouble(zchtje+zczjxje-ddfkje)%></font></td>
							</tr>
							<%
						}
						else{
							if (row==1)
							{
								%>
								<tr bgcolor="#E8E8FF" align="right"> 
									<td rowspan="<%=zczjcs%>" align="center"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
									<td rowspan="<%=zczjcs%>" align="right"><%=cf.formatDouble(zchtje)%></td>
									<td><%=row%>：<%=lrsj%></td>
									<td><%=cf.formatDouble(dczjxze)%></td>
									<td ><%=cf.formatDouble(zjxfkje)%><A HREF="ViewZjxSk.jsp?zjxbh=<%=zjxbh%>" target="_blank">查看</A></td>
									<td rowspan="<%=zczjcs%>"><font color="#0000CC"><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
									<td rowspan="<%=zczjcs%>" ><%=cf.formatDouble(ddfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
									<td rowspan="<%=zczjcs%>" ><font color="#CC0000"><%=cf.formatDouble(zchtje+zczjxje-ddfkje)%></font></td>
								</tr>
								<%
							}
							else{
								%>
								<tr bgcolor="#E8E8FF" align="right"> 
									<td ><%=row%>：<%=lrsj%></td>
									<td ><%=cf.formatDouble(dczjxze)%></td>
									<td ><%=cf.formatDouble(zjxfkje)%><A HREF="ViewZjxSk.jsp?zjxbh=<%=zjxbh%>" target="_blank">查看</A></td>
								</tr>
								<%
							}
						}
					}
					rs1.close();
					ps1.close();
				}
			}
			rs.close();
			ps.close();
			
			%>
			<tr bgcolor="#FFFFCC" align="right"> 
				<td align="center" >小计</td>
				<td ><%=cf.formatDouble(zcyshtk)%></td>
				<td>&nbsp;</td>
				<td ><%=cf.formatDouble(zcyszjx)%></td>
				<td>&nbsp;</td>
				<td ><font color="#0000CC"><%=cf.formatDouble(zcyshtk+zcyszjx)%></font></td>
				<td ><%=cf.formatDouble(ppskje)%></td>
				<td ><font color="#CC0000"><%=cf.formatDouble(zcyshtk+zcyszjx-ppskje)%></font></td>
			</tr>
			<%
		
		
		}
	}
	rs2.close();
	ps2.close();


%>
  <tr bgcolor="#FFFFFF" align="right"> 
    <td align="center"><b>订 单 总 计</b></td>
    <td align="center" >&nbsp;</td>
    <td ><%=cf.formatDouble(jchte)%></td>
	<td >&nbsp;</td>
    <td ><%=cf.formatDouble(jczjx)%></td>
	<td >&nbsp;</td>
    <td ><font color="#0000CC"><%=cf.formatDouble(jcysk)%></font></td>
    <td ><%=cf.formatDouble(jcssk)%></td>
    <td ><font color="#CC0000"><%=cf.formatDouble(jcmqqk)%></font></td>
  </tr>
</table>
<P>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr> 
    <td colspan="20" align="center" bgcolor="#CCCCCC"><b>实收款情况 
        <label>
        <input name="button" type="button" onClick="window.open('zkjl.jsp?khbh=<%=khbh%>')" value="查看转款记录">
        <input name="button2" type="button" onClick="window.open('fkjl.jsp?khbh=<%=khbh%>')" value="查看付款记录">
        </label>
</b></td>
  </tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">收款序号</td>
	<td  width="5%">收款类型</td>
	<td  width="4%">收款期数</td>
	<td  width="9%" bgcolor="#CCCCCC">收款品牌</td>
	<td  width="4%" bgcolor="#CCCCCC">收款订单号</td>
	<td  width="5%" bgcolor="#CCCCCC">收款增减项编号</td>
	<td  width="5%">实收款金额</td>
	<td  width="3%">是否财务收款</td>
	<td  width="3%">已上缴</td>
	<td  width="4%">支付方式</td>
	<td  width="5%">转帐款项</td>
	<td  width="9%">转帐品牌</td>
	<td  width="4%">转帐订单号</td>
	<td  width="5%">转帐增减项编号</td>
	<td  width="5%">收据编号</td>
	<td  width="3%">应收款率</td>
	<td  width="5%">应收款金额</td>
	<td  width="3%">收款人</td>
	<td  width="5%">收款时间</td>
	<td  width="10%">备注</td>
</tr>

<%

	String getfkxh=null;
	String fklxmc=null;
	String getfkcsmc=null;
	String getgysbh=null;
	String getddbh=null;
	String getzjxbh=null;
	double fkje=0;
	double xjfkje=0;
	double zjfkje=0;
	String skdd=null;
	String dsksjbz=null;
	String zffsmc=null;
	String zckx=null;
	String zcgysbh=null;
	String zcddbh=null;
	String zczjxbh=null;
	String sksj=null;

	double getyfkbl=0;
	double getyfkje=0;
	String getskr=null;
	String getsjbh=null;
	String getbz=null;

	String oldfklxmc="";
	String	getyfkblstr=null;
	String	getyfkjestr=null;

	int row=1;
	String bgcolor="";

	ls_sql="SELECT fkxh,a.fklxmc,fkcsmc,gysbh,cw_khfkjl.ddbh,cw_khfkjl.zjxbh,cw_khfkjl.fkje,DECODE(skdd,'1','财务','2','非财务') skdd";
	ls_sql+=" ,DECODE(dsksjbz,'N','未审核','Y','审核通过','M','审核未通过') dsksjbz,zffsmc,b.fklxmc zckx,zcgysbh,zcddbh,zczjxbh,cw_khfkjl.sjbh,cw_khfkjl.yfkbl";
	ls_sql+=" ,cw_khfkjl.yfkje,cw_khfkjl.skr,cw_khfkjl.sksj,cw_khfkjl.bz";
	ls_sql+=" FROM cw_khfkjl,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,cw_fkcs  ";
	ls_sql+=" where cw_khfkjl.skdw=sq_dwxx.dwbh ";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.fklxbm=a.fklxbm(+) and cw_khfkjl.zckx=b.fklxbm(+)";
	ls_sql+=" and cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fkcs=cw_fkcs.fkcs(+) ";
	ls_sql+=" order by cw_khfkjl.fklxbm,gysbh,fkxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfkxh=rs.getString("fkxh");
		fklxmc=cf.fillHtml(rs.getString("fklxmc"));
		getfkcsmc=cf.fillHtml(rs.getString("fkcsmc"));
		getgysbh=cf.fillHtml(rs.getString("gysbh"));
		getddbh=cf.fillHtml(rs.getString("ddbh"));
		getzjxbh=cf.fillHtml(rs.getString("zjxbh"));
		fkje=rs.getDouble("fkje");
		skdd=cf.fillHtml(rs.getString("skdd"));
		dsksjbz=cf.fillHtml(rs.getString("dsksjbz"));
		zffsmc=cf.fillHtml(rs.getString("zffsmc"));
		zckx=cf.fillHtml(rs.getString("zckx"));
		zcgysbh=cf.fillHtml(rs.getString("zcgysbh"));
		zcddbh=cf.fillHtml(rs.getString("zcddbh"));
		zczjxbh=cf.fillHtml(rs.getString("zczjxbh"));
		getyfkbl=rs.getDouble("yfkbl");
		getyfkje=rs.getDouble("yfkje");
		sksj=cf.fillHtml(rs.getDate("sksj"));
		getskr=cf.fillHtml(rs.getString("skr"));
		getsjbh=cf.fillHtml(rs.getString("sjbh"));
		getbz=cf.fillHtml(rs.getString("bz"));

		if (getyfkbl>0)
		{
			getyfkblstr=getyfkbl+"%";
			getyfkjestr=getyfkje+"";
		}
		else{
			getyfkblstr="&nbsp;";
			getyfkjestr="&nbsp;";
		}

		row++;

		if (row%2==0)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (!oldfklxmc.equals(fklxmc))
		{
			if (!oldfklxmc.equals(""))
			{
				%>
				<tr bgcolor="#FFFFCC"  align="center">
					<td colspan='3'><B>[<%=oldfklxmc%>]小计</B></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td align="right"><B><%=cf.formatDouble(xjfkje)%></B></td>
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
				</tr>
				<%
			}

			oldfklxmc=fklxmc;
			xjfkje=0;
		}

		xjfkje+=fkje;
		zjfkje+=fkje;

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td><A target='_blank' HREF="/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh=<%=getfkxh%>"><%=getfkxh%></A></td>
			<td><%=fklxmc%></td>
			<td><%=getfkcsmc%></td>
			<td><%=getgysbh%></td>
			<td><%=getddbh%></td>
			<td><%=getzjxbh%></td>
			<td align="right"><%=cf.formatDouble(fkje)%></td>
			<td><%=skdd%></td>
			<td><%=dsksjbz%></td>
			<td><%=zffsmc%></td>
			<td><%=zckx%></td>
			<td><%=zcgysbh%></td>
			<td><%=zcddbh%></td>
			<td><%=zczjxbh%></td>
			<td><%=getsjbh%></td>
			<td><%=getyfkblstr%></td>
			<td><%=getyfkjestr%></td>
			<td><%=getskr%></td>
			<td><%=sksj%></td>
			<td><%=getbz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	%>
	<tr bgcolor="#FFFFCC"  align="center">
		<td colspan='3'><B>[<%=fklxmc%>]小计</B></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td align="right"><B><%=cf.formatDouble(xjfkje)%></B></td>
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
	</tr>
	<tr bgcolor="#FFFFCC"  align="center">
		<td colspan='5'><B>总 计</B></td>
		<td>&nbsp;</td>
		<td align="right"><B><%=cf.formatDouble(zjfkje)%></B></td>
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
	</tr>
	<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
		if (rs3 != null) rs3.close(); 
		if (ps3 != null) ps3.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</table>

  
</body>
</html>
