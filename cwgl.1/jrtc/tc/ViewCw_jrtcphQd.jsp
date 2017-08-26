<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>批量提成</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<table border="1" width="660%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>

<tr bgcolor="#CCCCCC"  align="center">
	<td  width="60px" rowspan="3" >序号</td>
	<td  width="140px" rowspan="3">结算进度</td>
	<td  width="160px" rowspan="3">记入业绩时间</td>
	<td  width="160px" rowspan="3">合同审核时间</td>
	<td  width="120px" rowspan="3">合同号</td>
	<td  width="140px" rowspan="3">客户姓名</td>
	<td  width="3%" rowspan="3">房屋地址</td>
	<td  width="140px" rowspan="3">建筑面积</td>
	<td  width="140px" rowspan="3">报价级别</td>

	<td  width="140px" rowspan="3">回单标志</td>
	<td  width="140px" rowspan="3">店长</td>
	<td  width="140px" rowspan="3">文员</td>
	<td  width="140px" rowspan="3">店面业务</td>
	<td  width="140px" rowspan="3">设计师</td>
	<td  width="140px" rowspan="3">材料员</td>
	<td  width="140px" rowspan="3">客户经理</td>
	<td  width="140px" rowspan="3">小区主管</td>
	<td  width="140px" rowspan="3">小区组长</td>
	<td  width="140px" rowspan="3">小区专员</td>
	<td  width="140px" rowspan="3">网络营销主管</td>
	<td  width="140px" rowspan="3">营销专员</td>
	<td  width="140px" rowspan="3">网站策划</td>
	<td  width="140px" rowspan="3">网页设计</td>
	<td  width="140px" rowspan="3">网站程序员</td>
	<td  width="140px" rowspan="3">电话专员</td>
	<td  width="140px" rowspan="3">网站推广员</td>
	<td  width="140px" rowspan="3">司机</td>


	<td  width="140px" rowspan="3">设计费</td>
	<td  width="140px" rowspan="3">远程费</td>
	<td  width="140px" rowspan="3">折前金额</td>
	<td  width="140px" rowspan="3">折扣</td>
	<td  width="140px" rowspan="3">税金</td>
	<td  width="140px" rowspan="3">折后计提基数</td>
	<td  width="140px" rowspan="3">增减项金额</td>
	<td  width="140px" rowspan="3">增减项比例</td>
	<td  width="140px" rowspan="3">套餐外主材增项</td>

	<td colspan="7">店长</td>
	<td colspan="2">文员</td>
	<td colspan="7">店面业务</td>
	<td colspan="5">设计师</td>
	<td colspan="5">客户经理</td>
	<td colspan="4">材料员</td>
	<td colspan="4">小区主管</td>
	<td colspan="4">小区组长</td>
	<td colspan="4">小区专员</td>
	<td colspan="4">网络营销主管</td>
	<td colspan="2">营销专员</td>
	<td colspan="2">网站策划</td>
	<td colspan="2">网页设计</td>
	<td colspan="2">网站程序员</td>
	<td colspan="2">电话专员</td>
	<td colspan="4">网站推广员</td>
	<td colspan="2">司机</td>
	<td  width="140px" rowspan="3">奖金总额</td>

</tr>

<tr bgcolor="#CCCCCC"  align="center">
	<td colspan="2">设计费</td>
	<td colspan="2">装修费</td>
	<td colspan="3">提成小计</td>

	<td colspan="2">文员提成</td>

	<td colspan="2">设计费</td>
	<td colspan="2">装修费</td>
	<td colspan="3">提成小计</td>

	<td colspan="2">设计费</td>
	<td colspan="2">装修费</td>
	<td >提成合计</td>

	<td colspan="2">装修费</td>
	<td colspan="3">提成小计</td>

	<td colspan="2">装修费</td>
	<td colspan="2">提成小计</td>

	<td colspan="2">装修费</td>
	<td colspan="2">提成小计</td>

	<td colspan="2">装修费</td>
	<td colspan="2">提成小计</td>

	<td colspan="2">装修费</td>
	<td colspan="2">提成小计</td>

	<td colspan="2">装修费</td>
	<td colspan="2">提成小计</td>

	<td colspan="2">提成小计</td>

	<td colspan="2">提成小计</td>

	<td colspan="2">提成小计</td>

	<td colspan="2">提成小计</td>

	<td colspan="2">提成小计</td>

	<td colspan="2">装修费</td>
	<td colspan="2">提成小计</td>

	<td colspan="2">提成小计</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">提成小计</td>
	<td  width="140px">考核比例</td>
	<td  width="140px">提成总额</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">提成小计</td>
	<td  width="140px">考核比例</td>
	<td  width="140px">提成总额</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">提成合计</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">提成小计</td>
	<td  width="140px">考核分数</td>
	<td  width="140px">提成总额</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">考核比例</td>
	<td  width="140px">提成</td>








	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">考核比例</td>
	<td  width="140px">提成</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">考核比例</td>
	<td  width="140px">提成</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">考核比例</td>
	<td  width="140px">提成</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">考核比例</td>
	<td  width="140px">提成</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">考核比例</td>
	<td  width="140px">提成</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
</tr>
<%
String fgsbh=request.getParameter("ssfgs");
String khzq=request.getParameter("khzq");

String tcqssj=null;
String tcjzsj=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String yjjzsj=null;
String htshsj=null;
String hth=null;
String khxm=null;
String fwdz=null;
String sjsjsbz=null;
String sjsjsbzmc=null;
String hdlxmc=null;

String khbh=null;
String hdbz=null;
String tckh=null;

String dianz=null;
String weny=null;
String khjl=null;
String sjs=null;
String cly=null;
String zjxm=null;
String xqzg=null;
String xqzz=null;
String xqzy=null;
String wlyxzg=null;
String yxzy=null;
String wzch=null;
String wysj=null;
String wzcxy=null;
String dhzy=null;
String wztgy=null;
String siji=null;

int fwmj=0;
double sjf=0;
double ycf=0;
double zqje=0;
double zk=0;
double suijin=0;
double zhjtjs=0;
double zjxje=0;
double zjxbl=0;
double tcwzczx=0;

double dzsjftcbl=0;
double dzqysjftc=0;
double dzjssjftc=0;
double dzzxftcbl=0;
double dzqyzxtc=0;
double dzjszxtc=0;
double dztcxj=0;
double dzkhbl=0;
double dztcze=0;
double wyzxftcbl=0;
double wyqyzxtc=0;
double wyjszxtc=0;
double khjlsjftcbl=0;
double khjlqysjftc=0;
double khjljssjftc=0;
double khjlzxftcbl=0;
double khjlqyzxtc=0;
double khjljszxtc=0;
double khjltcxj=0;
double khjlkhbl=0;
double khjltcze=0;
double sjssjftcbl=0;
double sjsqysjftc=0;
double sjsjssjftc=0;
double sjszxftcbl=0;
double sjsqyzxtc=0;
double sjsjszxtc=0;
double sjsycftcbl=0;
double sjsycftc=0;
double sjstchj=0;
double zjzxftcbl=0;
double zjqyzxtc=0;
double zjjszxtc=0;
double zjycftcbl=0;
double zjycftc=0;
double zjtcxj=0;
double zjkhbl=0;
double zjtchj=0;
double clyzxftcbl=0;
double clyqyzxtc=0;
double clyjszxtc=0;
double clykhbl=0;
double clytc=0;
double xqzgzxftcbl=0;
double xqzgqyzxtc=0;
double xqzgjszxtc=0;
double xqzgkhbl=0;
double xqzgtc=0;
double xqzzzxftcbl=0;
double xqzzqyzxtc=0;
double xqzzjszxtc=0;
double xqzzkhbl=0;
double xqzztc=0;
double xqzyzxftcbl=0;
double xqzyqyzxtc=0;
double xqzyjszxtc=0;
double xqzykhbl=0;
double xqzytc=0;
double wlyxzgzxftcbl=0;
double wlyxzgqyzxtc=0;
double wlyxzgjszxtc=0;
double wlyxzgkhbl=0;
double wlyxzgtc=0;
double yxzyzxftcbl=0;
double yxzyqyzxtc=0;
double wzchzxftcbl=0;
double wzchqyzxtc=0;
double wysjzxftcbl=0;
double wysjqyzxtc=0;
double wzcxyzxftcbl=0;
double wzcxyqyzxtc=0;
double dhzyzxftcbl=0;
double dhzyqyzxtc=0;
double wztgyzxftcbl=0;
double wztgyqyzxtc=0;
double wztgyjszxtc=0;
double wztgykhbl=0;
double wztgytc=0;
double sjzxftcbl=0;
double sjqyzxtc=0;
double jjze=0;

String lx=null;
String lrr=null;
String lrsj=null;
String bz=null;

String bgcolor="";
try {
	conn=cf.getConnection();

	ls_sql="select TO_CHAR(tcqssj,'YYYY-MM-DD'),TO_CHAR(tcjzsj,'YYYY-MM-DD') ";
	ls_sql+=" from  cw_jrtcph";
	ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcqssj=rs.getString(1);
		tcjzsj=rs.getString(2);
	}
	rs.close();
	ps.close();



	int row=0;


	ls_sql =" select crm_khxx.yjjzsj,crm_khxx.htshsj,cw_jrtcmx.khbh,cw_jrtcmx.hdbz,DECODE(cw_jrtcmx.tckh,'1','个性','2','套餐') tckh,cw_jrtcmx.dianz,cw_jrtcmx.weny,cw_jrtcmx.khjl,cw_jrtcmx.sjs,cw_jrtcmx.cly,cw_jrtcmx.zjxm,cw_jrtcmx.xqzg,cw_jrtcmx.xqzz,cw_jrtcmx.xqzy,cw_jrtcmx.wlyxzg,cw_jrtcmx.yxzy,cw_jrtcmx.wzch,cw_jrtcmx.wysj,cw_jrtcmx.wzcxy,cw_jrtcmx.dhzy,cw_jrtcmx.wztgy,cw_jrtcmx.siji ";
	ls_sql+=" ,cw_jrtcmx.fwmj,cw_jrtcmx.sjf,cw_jrtcmx.ycf,cw_jrtcmx.zqje,cw_jrtcmx.zk,cw_jrtcmx.suijin,cw_jrtcmx.zhjtjs,cw_jrtcmx.zjxje,cw_jrtcmx.zjxbl,cw_jrtcmx.tcwzczx ";
	ls_sql+=" ,dzsjftcbl,dzqysjftc,dzjssjftc,dzzxftcbl,dzqyzxtc,dzjszxtc,dztcxj,dzkhbl,dztcze,wyzxftcbl,wyqyzxtc,wyjszxtc,khjlsjftcbl,khjlqysjftc,khjljssjftc,khjlzxftcbl,khjlqyzxtc,khjljszxtc,khjltcxj,khjlkhbl,khjltcze,sjssjftcbl,sjsqysjftc,sjsjssjftc,sjszxftcbl,sjsqyzxtc,sjsjszxtc,sjsycftcbl,sjsycftc,sjstchj,zjzxftcbl,zjqyzxtc,zjjszxtc,zjycftcbl,zjycftc,zjtcxj,zjkhbl,zjtchj,clyzxftcbl,clyqyzxtc,clyjszxtc,clykhbl,clytc,xqzgzxftcbl,xqzgqyzxtc,xqzgjszxtc,xqzgkhbl,xqzgtc,xqzzzxftcbl,xqzzqyzxtc,xqzzjszxtc,xqzzkhbl,xqzztc,xqzyzxftcbl,xqzyqyzxtc,xqzyjszxtc,xqzykhbl,xqzytc,wlyxzgzxftcbl,wlyxzgqyzxtc,wlyxzgjszxtc,wlyxzgkhbl,wlyxzgtc,yxzyzxftcbl,yxzyqyzxtc,wzchzxftcbl,wzchqyzxtc,wysjzxftcbl,wysjqyzxtc,wzcxyzxftcbl,wzcxyqyzxtc,dhzyzxftcbl,dhzyqyzxtc,wztgyzxftcbl,wztgyqyzxtc,wztgyjszxtc,wztgykhbl,wztgytc,sjzxftcbl,sjqyzxtc,jjze,DECODE(cw_jrtcmx.lx,'1','签单提成','2','结算提成') lx,cw_jrtcmx.lrr,cw_jrtcmx.lrsj,cw_jrtcmx.bz ";
	ls_sql+=" ,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,hdlxmc ";
	ls_sql+=" from  crm_khxx,cw_jrtcmx,dm_hdlxbm";
	ls_sql+=" where cw_jrtcmx.khbh=crm_khxx.khbh(+) ";
	ls_sql+=" and  cw_jrtcmx.hdbz=dm_hdlxbm.hdlxbm(+)";
	ls_sql+=" and cw_jrtcmx.khzq='"+khzq+"' and crm_khxx.fgsbh='"+fgsbh+"'";
    ls_sql+=" order by cw_jrtcmx.xuhao";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		hdlxmc=cf.fillNull(rs.getString("hdlxmc"));
		tckh=cf.fillNull(rs.getString("tckh"));

		dianz=cf.fillHtml(rs.getString("dianz"));
		weny=cf.fillHtml(rs.getString("weny"));
		khjl=cf.fillHtml(rs.getString("khjl"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		cly=cf.fillHtml(rs.getString("cly"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		xqzg=cf.fillHtml(rs.getString("xqzg"));
		xqzz=cf.fillHtml(rs.getString("xqzz"));
		xqzy=cf.fillHtml(rs.getString("xqzy"));
		wlyxzg=cf.fillHtml(rs.getString("wlyxzg"));
		yxzy=cf.fillHtml(rs.getString("yxzy"));
		wzch=cf.fillHtml(rs.getString("wzch"));
		wysj=cf.fillHtml(rs.getString("wysj"));
		wzcxy=cf.fillHtml(rs.getString("wzcxy"));
		dhzy=cf.fillHtml(rs.getString("dhzy"));
		wztgy=cf.fillHtml(rs.getString("wztgy"));
		siji=cf.fillHtml(rs.getString("siji"));

		fwmj=rs.getInt("fwmj");
		sjf=rs.getDouble("sjf");
		ycf=rs.getDouble("ycf");
		zqje=rs.getDouble("zqje");
		zk=rs.getDouble("zk");
		suijin=rs.getDouble("suijin");
		zhjtjs=rs.getDouble("zhjtjs");
		zjxje=rs.getDouble("zjxje");
		zjxbl=rs.getDouble("zjxbl");
		tcwzczx=rs.getDouble("tcwzczx");
		dzsjftcbl=rs.getDouble("dzsjftcbl");
		dzqysjftc=rs.getDouble("dzqysjftc");
		dzjssjftc=rs.getDouble("dzjssjftc");
		dzzxftcbl=rs.getDouble("dzzxftcbl");
		dzqyzxtc=rs.getDouble("dzqyzxtc");
		dzjszxtc=rs.getDouble("dzjszxtc");
		dztcxj=rs.getDouble("dztcxj");
		dzkhbl=rs.getDouble("dzkhbl");
		dztcze=rs.getDouble("dztcze");
		wyzxftcbl=rs.getDouble("wyzxftcbl");
		wyqyzxtc=rs.getDouble("wyqyzxtc");
		wyjszxtc=rs.getDouble("wyjszxtc");
		khjlsjftcbl=rs.getDouble("khjlsjftcbl");
		khjlqysjftc=rs.getDouble("khjlqysjftc");
		khjljssjftc=rs.getDouble("khjljssjftc");
		khjlzxftcbl=rs.getDouble("khjlzxftcbl");
		khjlqyzxtc=rs.getDouble("khjlqyzxtc");
		khjljszxtc=rs.getDouble("khjljszxtc");
		khjltcxj=rs.getDouble("khjltcxj");
		khjlkhbl=rs.getDouble("khjlkhbl");
		khjltcze=rs.getDouble("khjltcze");
		sjssjftcbl=rs.getDouble("sjssjftcbl");
		sjsqysjftc=rs.getDouble("sjsqysjftc");
		sjsjssjftc=rs.getDouble("sjsjssjftc");
		sjszxftcbl=rs.getDouble("sjszxftcbl");
		sjsqyzxtc=rs.getDouble("sjsqyzxtc");
		sjsjszxtc=rs.getDouble("sjsjszxtc");
		sjsycftcbl=rs.getDouble("sjsycftcbl");
		sjsycftc=rs.getDouble("sjsycftc");
		sjstchj=rs.getDouble("sjstchj");
		zjzxftcbl=rs.getDouble("zjzxftcbl");
		zjqyzxtc=rs.getDouble("zjqyzxtc");
		zjjszxtc=rs.getDouble("zjjszxtc");
		zjycftcbl=rs.getDouble("zjycftcbl");
		zjycftc=rs.getDouble("zjycftc");
		zjtcxj=rs.getDouble("zjtcxj");
		zjkhbl=rs.getDouble("zjkhbl");
		zjtchj=rs.getDouble("zjtchj");
		clyzxftcbl=rs.getDouble("clyzxftcbl");
		clyqyzxtc=rs.getDouble("clyqyzxtc");
		clyjszxtc=rs.getDouble("clyjszxtc");
		clykhbl=rs.getDouble("clykhbl");
		clytc=rs.getDouble("clytc");
		xqzgzxftcbl=rs.getDouble("xqzgzxftcbl");
		xqzgqyzxtc=rs.getDouble("xqzgqyzxtc");
		xqzgjszxtc=rs.getDouble("xqzgjszxtc");
		xqzgkhbl=rs.getDouble("xqzgkhbl");
		xqzgtc=rs.getDouble("xqzgtc");
		xqzzzxftcbl=rs.getDouble("xqzzzxftcbl");
		xqzzqyzxtc=rs.getDouble("xqzzqyzxtc");
		xqzzjszxtc=rs.getDouble("xqzzjszxtc");
		xqzzkhbl=rs.getDouble("xqzzkhbl");
		xqzztc=rs.getDouble("xqzztc");
		xqzyzxftcbl=rs.getDouble("xqzyzxftcbl");
		xqzyqyzxtc=rs.getDouble("xqzyqyzxtc");
		xqzyjszxtc=rs.getDouble("xqzyjszxtc");
		xqzykhbl=rs.getDouble("xqzykhbl");
		xqzytc=rs.getDouble("xqzytc");
		wlyxzgzxftcbl=rs.getDouble("wlyxzgzxftcbl");
		wlyxzgqyzxtc=rs.getDouble("wlyxzgqyzxtc");
		wlyxzgjszxtc=rs.getDouble("wlyxzgjszxtc");
		wlyxzgkhbl=rs.getDouble("wlyxzgkhbl");
		wlyxzgtc=rs.getDouble("wlyxzgtc");
		yxzyzxftcbl=rs.getDouble("yxzyzxftcbl");
		yxzyqyzxtc=rs.getDouble("yxzyqyzxtc");
		wzchzxftcbl=rs.getDouble("wzchzxftcbl");
		wzchqyzxtc=rs.getDouble("wzchqyzxtc");
		wysjzxftcbl=rs.getDouble("wysjzxftcbl");
		wysjqyzxtc=rs.getDouble("wysjqyzxtc");
		wzcxyzxftcbl=rs.getDouble("wzcxyzxftcbl");
		wzcxyqyzxtc=rs.getDouble("wzcxyqyzxtc");
		dhzyzxftcbl=rs.getDouble("dhzyzxftcbl");
		dhzyqyzxtc=rs.getDouble("dhzyqyzxtc");
		wztgyzxftcbl=rs.getDouble("wztgyzxftcbl");
		wztgyqyzxtc=rs.getDouble("wztgyqyzxtc");
		wztgyjszxtc=rs.getDouble("wztgyjszxtc");
		wztgykhbl=rs.getDouble("wztgykhbl");
		wztgytc=rs.getDouble("wztgytc");
		sjzxftcbl=rs.getDouble("sjzxftcbl");
		sjqyzxtc=rs.getDouble("sjqyzxtc");
		jjze=rs.getDouble("jjze");

		lx=cf.fillNull(rs.getString("lx"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		
		
		
		
		row++;

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td ><%=row%></td>
			<td ><%=lx%>
				<input name="khbh" type="hidden" value="<%=khbh%>">
			</td>
			<td ><%=yjjzsj%></td>
			<td ><%=htshsj%></td>
			<td ><%=hth%></td>
			<td ><A target='_blank' HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>"><%=khxm%></A></td>
			<td ><%=fwdz%></td>
			<td ><%=fwmj%></td>
			<td ><%=tckh%></td>
			<td ><%=hdlxmc%>
				<input name="hdbz" type="hidden" value="<%=hdbz%>">
				<input name="tckh" type="hidden" value="<%=tckh%>">
			</td>
			<td ><%=dianz%></td>
			<td ><%=weny%></td>
			<td ><%=khjl%></td>
			<td ><%=sjs%></td>
			<td ><%=cly%></td>
			<td ><%=zjxm%></td>
			<td ><%=xqzg%></td>
			<td ><%=xqzz%></td>
			<td ><%=xqzy%></td>
			<td ><%=wlyxzg%></td>
			<td ><%=yxzy%></td>
			<td ><%=wzch%></td>
			<td ><%=wysj%></td>
			<td ><%=wzcxy%></td>
			<td ><%=dhzy%></td>
			<td ><%=wztgy%></td>
			<td ><%=siji%></td>

			<td ><%=sjf%></td>
			<td ><%=ycf%></td>
			<td ><%=zqje%></td>
			<td ><%=cf.round(zqje-zhjtjs,2)%></td>
			<td ><%=suijin%></td>
			<td ><%=zhjtjs%></td>
			<td ><%=zjxje%></td>
			<td ><%=zjxbl%>%</td>
			<td ><%=tcwzczx%></td>
		
			<td ><%=dzsjftcbl%>%</td>
			<td ><%=dzqysjftc%></td>
			<td ><%=dzzxftcbl%>%</td>
			<td ><%=dzqyzxtc%></td>
			<td ><%=dztcxj%></td>
			<td ><%=dzkhbl%>%</td>
			<td ><%=dztcze%></td>
		
			<td ><%=wyzxftcbl%>%</td>
			<td ><%=wyqyzxtc%></td>
		
			<td ><%=khjlsjftcbl%>%</td>
			<td ><%=khjlqysjftc%></td>
			<td ><%=khjlzxftcbl%>%</td>
			<td ><%=khjlqyzxtc%></td>
			<td ><%=khjltcxj%></td>
			<td ><%=khjlkhbl%>%</td>
			<td ><%=khjltcze%></td>
		
			<td ><%=sjssjftcbl%>%</td>
			<td ><%=sjsqysjftc%></td>
			<td ><%=sjszxftcbl%>%</td>
			<td ><%=sjsqyzxtc%></td>
			<td ><%=sjstchj%></td>
		
			<td ><%=zjzxftcbl%>%</td>
			<td ><%=zjqyzxtc%></td>
			<td ><%=zjtcxj%></td>
			<td ><%=zjkhbl%>%</td>
			<td ><%=zjtchj%></td>
		
			<td ><%=clyzxftcbl%>%</td>
			<td ><%=clyqyzxtc%></td>
			<td ><%=clykhbl%></td>
			<td ><%=clytc%>%</td>
		
			<td ><%=xqzgzxftcbl%>%</td>
			<td ><%=xqzgqyzxtc%></td>
			<td ><%=xqzgkhbl%></td>
			<td ><%=xqzgtc%>%</td>
		
			<td ><%=xqzzzxftcbl%>%</td>
			<td ><%=xqzzqyzxtc%></td>
			<td ><%=xqzzkhbl%></td>
			<td ><%=xqzztc%>%</td>
		
			<td ><%=xqzyzxftcbl%>%</td>
			<td ><%=xqzyqyzxtc%></td>
			<td ><%=xqzykhbl%></td>
			<td ><%=xqzytc%>%</td>
		
			<td ><%=wlyxzgzxftcbl%>%</td>
			<td ><%=wlyxzgqyzxtc%></td>
			<td ><%=wlyxzgkhbl%></td>
			<td ><%=wlyxzgtc%>%</td>
		
			<td ><%=yxzyzxftcbl%>%</td>
			<td ><%=yxzyqyzxtc%></td>
		
			<td ><%=wzchzxftcbl%>%</td>
			<td ><%=wzchqyzxtc%></td>
		
			<td ><%=wysjzxftcbl%>%</td>
			<td ><%=wysjqyzxtc%></td>
		
			<td ><%=wzcxyzxftcbl%>%</td>
			<td ><%=wzcxyqyzxtc%></td>
		
			<td ><%=dhzyzxftcbl%>%</td>
			<td ><%=dhzyqyzxtc%></td>
		
			<td ><%=wztgyzxftcbl%>%</td>
			<td ><%=wztgyqyzxtc%></td>
			<td ><%=wztgykhbl%></td>
			<td ><%=wztgytc%>%</td>
		
			<td ><%=sjzxftcbl%>%</td>
			<td ><%=sjqyzxtc%></td>
		
			<td ><%=jjze%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

	</table>


<script>
function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

//-->
</script>

</body>
</html>