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
double glf=0;
double sfke=0;
double zjxssk=0;

double yfgckze=0;
double gckzc=0;
double zjxje=0;
double zhzjxje=0;
double kglf=0;
double kqtk=0;


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

	ls_sql="select cxhdbmxq,cxhdbmzh,xxshyj,zqguanlif,zqzjxguanlif,DECODE(zt,'2','家装客户','3','退单客户','4','非家装客户','5','设计客户') ztmc,zjxssk,guanlif,zjxguanlif,suijin,suijinbfb,zjxsuijin,cxhdbm,sffj,fjje,gsfje,sfyrz,rzsc,sfyyh,yhyy,fkcsmc,kqtk,kglf,gckkspbz,gcjdmc,zjxwcbz,gckk,sjfkzc,fgsbh,sjsbh,khxm,fwdz,lxfs,xb,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,sjf,glf,sfke,zjxje,zhzjxje,sgbz,jgrq";
	ls_sql+=" ,cdzwjmje,glfjmje,sjjmje,zhwjrqyexm,wjrqyexmsm ";
	ls_sql+=" from  crm_khxx,dm_gcjdbm,cw_fkcs";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and khbh='"+khbh+"' and crm_khxx.jzkfkcs=cw_fkcs.fkcs(+)";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
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

	//工程担当电话
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


%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
<div align="center">查看付款记录 
</div>


<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">收款序号</td>
	<td  width="5%">收款类型</td>
	<td  width="4%">收款期数</td>
	<td  width="10%" bgcolor="#CCCCCC">收款品牌</td>
	<td  width="4%" bgcolor="#CCCCCC">收款订单号</td>
	<td  width="5%">实收款金额</td>
	<td  width="3%">是否财务收款</td>
	<td  width="3%">已上缴</td>
	<td  width="4%">支付方式</td>
	<td  width="5%">转帐款项</td>
	<td  width="10%">转帐品牌</td>
	<td  width="4%">转帐订单号</td>
	<td  width="5%">收据编号</td>
	<td  width="4%">应收款率</td>
	<td  width="5%">应收款金额</td>
	<td  width="4%">收款人</td>
	<td  width="5%">收款时间</td>
	<td  width="13%">备注</td>
</tr>

<%

	String getfkxh=null;
	String fklxmc=null;
	String getfkcsmc=null;
	String getgysbh=null;
	String getddbh=null;
	double fkje=0;
	double xjfkje=0;
	double zjfkje=0;
	String skdd=null;
	String dsksjbz=null;
	String zffsmc=null;
	String zckx=null;
	String zcgysbh=null;
	String zcddbh=null;
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

	ls_sql="SELECT fkxh,a.fklxmc,fkcsmc,gysbh,cw_khfkjl.ddbh,cw_khfkjl.fkje,DECODE(skdd,'1','财务','2','非财务') skdd";
	ls_sql+=" ,DECODE(dsksjbz,'N','未审核','Y','审核通过','M','审核未通过') dsksjbz,zffsmc,b.fklxmc zckx,zcgysbh,zcddbh,cw_khfkjl.sjbh,cw_khfkjl.yfkbl";
	ls_sql+=" ,cw_khfkjl.yfkje,cw_khfkjl.skr,cw_khfkjl.sksj,cw_khfkjl.bz";
	ls_sql+=" FROM cw_khfkjl,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,cw_fkcs  ";
	ls_sql+=" where cw_khfkjl.skdw=sq_dwxx.dwbh ";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.fklxbm=a.fklxbm(+) and cw_khfkjl.zckx=b.fklxbm(+)";
	ls_sql+=" and cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fkcs=cw_fkcs.fkcs(+) ";
	ls_sql+=" and cw_khfkjl.zffs!='31' ";
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
		fkje=rs.getDouble("fkje");
		skdd=cf.fillHtml(rs.getString("skdd"));
		dsksjbz=cf.fillHtml(rs.getString("dsksjbz"));
		zffsmc=cf.fillHtml(rs.getString("zffsmc"));
		zckx=cf.fillHtml(rs.getString("zckx"));
		zcgysbh=cf.fillHtml(rs.getString("zcgysbh"));
		zcddbh=cf.fillHtml(rs.getString("zcddbh"));
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
			<td align="right"><%=cf.formatDouble(fkje)%></td>
			<td><%=skdd%></td>
			<td><%=dsksjbz%></td>
			<td><%=zffsmc%></td>
			<td><%=zckx%></td>
			<td><%=zcgysbh%></td>
			<td><%=zcddbh%></td>
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
	</tr>
	<tr bgcolor="#FFFFCC"  align="center">
		<td colspan='5'><B>总 计</B></td>
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
