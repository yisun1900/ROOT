<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>批量提成</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="" name="insertform" target="_blank">
<table border="1" width="900%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
 <tr bgcolor="#FFFFFF" >
      <td colspan="194"> 
		<input type="button"  value="存盘" onClick="f_do(insertform)">
		</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="90px" rowspan="3" >序号</td>
	<td  width="140px" rowspan="3">结算进度</td>
	<td  width="140px" rowspan="3">合同号</td>
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
	<td colspan="9">店长</td>
	<td colspan="3">文员</td>
	<td colspan="9">店面业务</td>
	<td colspan="9">设计师</td>
	<td colspan="8">客户经理</td>
	<td colspan="5">材料员</td>
	<td colspan="5">小区主管</td>
	<td colspan="5">小区组长</td>
	<td colspan="5">小区专员</td>
	<td colspan="5">网络营销主管</td>
	<td colspan="2">营销专员</td>
	<td colspan="2">网站策划</td>
	<td colspan="2">网页设计</td>
	<td colspan="2">网站程序员</td>
	<td colspan="2">电话专员</td>
	<td colspan="5">网站推广员</td>
	<td colspan="2">司机</td>
	<td  width="140px" rowspan="3">奖金总额</td>

</tr>

<tr bgcolor="#CCCCCC"  align="center">
	<td colspan="3">设计费</td>
	<td colspan="3">装修费</td>
	<td colspan="3">提成小计</td>

	<td colspan="3">文员提成</td>

	<td colspan="3">设计费</td>
	<td colspan="3">装修费</td>
	<td colspan="3">提成小计</td>

	<td colspan="3">设计费</td>
	<td colspan="3">装修费</td>
	<td colspan="2">远程费</td>
	<td >提成合计</td>

	<td colspan="3">装修费</td>
	<td colspan="2">远程费</td>
	<td colspan="3">提成小计</td>

	<td colspan="3">装修费</td>
	<td colspan="2">提成小计</td>

	<td colspan="3">装修费</td>
	<td colspan="2">提成小计</td>

	<td colspan="3">装修费</td>
	<td colspan="2">提成小计</td>

	<td colspan="3">装修费</td>
	<td colspan="2">提成小计</td>

	<td colspan="3">装修费</td>
	<td colspan="2">提成小计</td>

	<td colspan="2">提成小计</td>

	<td colspan="2">提成小计</td>

	<td colspan="2">提成小计</td>

	<td colspan="2">提成小计</td>

	<td colspan="2">提成小计</td>

	<td colspan="3">装修费</td>
	<td colspan="2">提成小计</td>

	<td colspan="2">提成小计</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">结算提成</td>
	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">结算提成</td>
	<td  width="140px">提成小计</td>
	<td  width="140px">考核比例</td>
	<td  width="140px">提成总额</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">结算提成</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">结算提成</td>
	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">结算提成</td>
	<td  width="140px">提成小计</td>
	<td  width="140px">考核比例</td>
	<td  width="140px">提成总额</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">结算提成</td>
	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">结算提成</td>
	<td  width="140px">提成比例</td>
	<td  width="140px">结算提成</td>
	<td  width="140px">提成合计</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">结算提成</td>
	<td  width="140px">提成比例</td>
	<td  width="140px">结算提成</td>
	<td  width="140px">提成小计</td>
	<td  width="140px">考核分数</td>
	<td  width="140px">提成总额</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">结算提成</td>
	<td  width="140px">考核比例</td>
	<td  width="140px">提成</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">结算提成</td>
	<td  width="140px">考核比例</td>
	<td  width="140px">提成</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">结算提成</td>
	<td  width="140px">考核比例</td>
	<td  width="140px">提成</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">结算提成</td>
	<td  width="140px">考核比例</td>
	<td  width="140px">提成</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
	<td  width="140px">结算提成</td>
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
	<td  width="140px">结算提成</td>
	<td  width="140px">考核比例</td>
	<td  width="140px">提成</td>

	<td  width="140px">提成比例</td>
	<td  width="140px">签约提成</td>
</tr>
<%
String fgsbh=request.getParameter("fgsbh");
String khzq=request.getParameter("khzq");

String tcqssj=null;
String tcjzsj=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String khbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String sjsjsbz=null;
String sjsjsbzmc=null;
String dwbh=null;
String khjsbz=null;
String gcjdbm=null;
String hdbz=null;
String hdlxmc=null;
String sjs=null;
String khjl=null;
String clgw=null;
String zjxm=null;
int fwmj=0;
String bjjbbm="";
String bjjbmc="";
String tckh="";//1：非套餐；2：套餐
String lx="";

String dianz=null;//店长
String weny=null;//文员
String xqzg=null;//小区主管
String xqzz=null;//小区组长
String xqzy=null;//小区专员
String wlyxzg=null;//网络营销主管
String yxzy=null;//营销专员
String wzch=null;//网站策划
String wysj=null;//网页设计
String wzcxy=null;//网站程序员
String dhzy=null;//电话专员
String wztgy=null;//网站推广员
String siji=null;//司机

double wdzgce=0;
double qye=0;
double suijin=0;
double sjf=0;
double sjhtsjf=0;
double zhljzjx=0;

double ycf=0;//远程费
double zjxbl=0;//增减项比例
double dgzcje=0;//代购主材金额
double tcwzczx=0;//套餐外主材增项

String bgcolor="";

//提成比例
double dzsjftcbl=0;
double dzzxftcbl=0;
double wyzxftcbl=0;
double khjlsjftcbl=0;
double khjlzxftcbl=0;
double sjssjftcbl=0;
double sjszxftcbl=0;
double sjsycftcbl=0;
double zjzxftcbl=0;
double zjycftcbl=0;

double clyzxftcbl=0;
double xqzgzxftcbl=0;
double xqzzzxftcbl=0;
double xqzyzxftcbl=0;
double wlyxzgzxftcbl=0;
double yxzyzxftcbl=0;
double wzchzxftcbl=0;
double wysjzxftcbl=0;
double wzcxyzxftcbl=0;
double dhzyzxftcbl=0;
double wztgyzxftcbl=0;
double sjzxftcbl=0;
//提成比例

try {
	conn=cf.getConnection();

	ls_sql="select TO_CHAR(khqssj,'YYYY-MM-DD'),TO_CHAR(khjzsj,'YYYY-MM-DD') ";
	ls_sql+=" from  cw_jrkhzq";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcqssj=rs.getString(1);
		tcjzsj=rs.getString(2);
	}
	rs.close();
	ps.close();

	//提成比例
	ls_sql="select clyzxftcbl,dzsjftcbl,dzzxftcbl,wyzxftcbl,khjlsjftcbl,khjlzxftcbl,sjssjftcbl,sjszxftcbl,sjsycftcbl,zjzxftcbl,zjycftcbl,xqzgzxftcbl,xqzzzxftcbl,xqzyzxftcbl,wlyxzgzxftcbl,yxzyzxftcbl,wzchzxftcbl,wysjzxftcbl,wzcxyzxftcbl,dhzyzxftcbl,wztgyzxftcbl,sjzxftcbl ";
	ls_sql+=" from  cw_jrtcbl";
	ls_sql+=" where fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clyzxftcbl=rs.getDouble("clyzxftcbl");
		dzsjftcbl=rs.getDouble("dzsjftcbl");
		dzzxftcbl=rs.getDouble("dzzxftcbl");
		wyzxftcbl=rs.getDouble("wyzxftcbl");
		khjlsjftcbl=rs.getDouble("khjlsjftcbl");
		khjlzxftcbl=rs.getDouble("khjlzxftcbl");
		sjssjftcbl=rs.getDouble("sjssjftcbl");
		sjszxftcbl=rs.getDouble("sjszxftcbl");
		sjsycftcbl=rs.getDouble("sjsycftcbl");
		zjzxftcbl=rs.getDouble("zjzxftcbl");
		zjycftcbl=rs.getDouble("zjycftcbl");
		xqzgzxftcbl=rs.getDouble("xqzgzxftcbl");
		xqzzzxftcbl=rs.getDouble("xqzzzxftcbl");
		xqzyzxftcbl=rs.getDouble("xqzyzxftcbl");
		wlyxzgzxftcbl=rs.getDouble("wlyxzgzxftcbl");
		yxzyzxftcbl=rs.getDouble("yxzyzxftcbl");
		wzchzxftcbl=rs.getDouble("wzchzxftcbl");
		wysjzxftcbl=rs.getDouble("wysjzxftcbl");
		wzcxyzxftcbl=rs.getDouble("wzcxyzxftcbl");
		dhzyzxftcbl=rs.getDouble("dhzyzxftcbl");
		wztgyzxftcbl=rs.getDouble("wztgyzxftcbl");
		sjzxftcbl=rs.getDouble("sjzxftcbl");
	}
	rs.close();
	ps.close();


	int row=0;

	ls_sql="select khbh,hth,khxm,fwdz,crm_khxx.sjsjsbz,DECODE(crm_khxx.sjsjsbz,'0','未提成','1','签单提成','2','结算提成') sjsjsbzmc,fgsbh,crm_khxx.dwbh,sjs,zjxm,khjl,clgw,hdbz,hdlxmc,fwmj,crm_khxx.bjjb,bjjbmc,khjsbz,gcjdbm";
	ls_sql+=" ,dianz,weny,xqzg,xqzz,xqzy,wlyxzg,yxzy,wzch,wysj,wzcxy,dhzy,wztgy,siji ";
	ls_sql+=" ,wdzgce,qye,suijin,sjf,sjhtsjf,zhljzjx ";

	ls_sql+=" from  crm_khxx,sq_dwxx,bdm_bjjbbm,dm_hdlxbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and  crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and  crm_khxx.hdbz=dm_hdlxbm.hdlxbm(+)";
	
	ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";

	ls_sql+=" and ";
	ls_sql+=" ( ";

	ls_sql+=" ( ";//签单客户
	ls_sql+=" crm_khxx.zt in('2','3')";//2：家装客户；3：退单客户；4：集成客户；5：设计客户
	ls_sql+=" and crm_khxx.sjsjsbz='0'";//0：未提成；1：签单提成；2：结算提成
//	ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD') ";
//	ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+"','YYYY-MM-DD') ";
	ls_sql+=" ) ";

	ls_sql+=" OR ";
	ls_sql+=" ( ";//退单客户
	ls_sql+=" crm_khxx.zt='3'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户
	ls_sql+=" and crm_khxx.sjsjsbz='1'";//0：未提成；1：签单提成；2：结算提成
	ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+"','YYYY-MM-DD') ";
	ls_sql+=" ) ";

	ls_sql+=" OR ";
	ls_sql+=" ( ";//结算客户
	ls_sql+=" crm_khxx.zt='2'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户
	ls_sql+=" and crm_khxx.sjsjsbz='1'";//0：未提成；1：签单提成；2：结算提成
	ls_sql+=" and crm_khxx.gdjsjd='8'";//8：完工结算
	ls_sql+=" and crm_khxx.khjsbz='Y'";//'N','未结算','Y','已结算','S','已审核'
	ls_sql+=" ) ";

	ls_sql+=" ) ";
    ls_sql+=" order by crm_khxx.dwbh,sjs,khxm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		khbh=cf.fillNull(rs1.getString("khbh"));
		hth=cf.fillNull(rs1.getString("hth"));
		khxm=cf.fillNull(rs1.getString("khxm"));
		fwdz=cf.fillNull(rs1.getString("fwdz"));
		sjsjsbz=cf.fillNull(rs1.getString("sjsjsbz"));
		sjsjsbzmc=cf.fillNull(rs1.getString("sjsjsbzmc"));
		fgsbh=cf.fillNull(rs1.getString("fgsbh"));
		dwbh=cf.fillNull(rs1.getString("dwbh"));
		sjs=cf.fillNull(rs1.getString("sjs"));
		zjxm=cf.fillNull(rs1.getString("zjxm"));
		khjl=cf.fillNull(rs1.getString("khjl"));
		clgw=cf.fillNull(rs1.getString("clgw"));
		hdbz=cf.fillNull(rs1.getString("hdbz"));
		hdlxmc=cf.fillNull(rs1.getString("hdlxmc"));
		fwmj=rs1.getInt("fwmj");
		bjjbbm=cf.fillNull(rs1.getString("bjjb"));
		bjjbmc=cf.fillNull(rs1.getString("bjjbmc"));
		khjsbz=cf.fillNull(rs1.getString("khjsbz"));
		gcjdbm=cf.fillNull(rs1.getString("gcjdbm"));

		dianz=cf.fillNull(rs1.getString("dianz"));
		weny=cf.fillNull(rs1.getString("weny"));
		xqzg=cf.fillNull(rs1.getString("xqzg"));
		xqzz=cf.fillNull(rs1.getString("xqzz"));
		xqzy=cf.fillNull(rs1.getString("xqzy"));
		wlyxzg=cf.fillNull(rs1.getString("wlyxzg"));
		yxzy=cf.fillNull(rs1.getString("yxzy"));
		wzch=cf.fillNull(rs1.getString("wzch"));
		wysj=cf.fillNull(rs1.getString("wysj"));
		wzcxy=cf.fillNull(rs1.getString("wzcxy"));
		dhzy=cf.fillNull(rs1.getString("dhzy"));
		wztgy=cf.fillNull(rs1.getString("wztgy"));
		siji=cf.fillNull(rs1.getString("siji"));
		
		wdzgce=rs1.getDouble("wdzgce");
		qye=rs1.getDouble("qye");
		suijin=rs1.getDouble("suijin");
		sjf=rs1.getDouble("sjf");
		sjhtsjf=rs1.getDouble("sjhtsjf");
		zhljzjx=rs1.getDouble("zhljzjx");

		sjf=cf.round(sjf+sjhtsjf,2);


		//远程费
		ls_sql="select sum(sfje)";
		ls_sql+=" from  bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and sfxmbm in('02','03','04','05','08','09','10','11','12','14')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ycf=rs.getDouble(1);
		}
		rs.close();
		ps.close();


		//增减项比例
		if (qye!=0)
		{
			zjxbl=cf.round(zhljzjx*100/qye,2);
		}
		else{
			zjxbl=0;
		}

		if (sjsjsbz.equals("2"))//0：未提成；1：签单提成；2：结算提成
		{
			out.println("错误！已结算提成");
			return;
		}

		if (sjsjsbz.equals("0"))
		{
			lx="1";//1：签单提成；2：结算提成
		}
		else if (sjsjsbz.equals("1"))
		{
			lx="2";//1：签单提成；2：结算提成
		}

		ls_sql="select lx";
		ls_sql+=" from  bdm_bjjbbm";
		ls_sql+=" where bjjbbm='"+bjjbbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tckh=rs.getString("lx");
		}
		rs.close();
		ps.close();

		//套餐外主材增项
		if (tckh.equals("2"))
		{
			suijin=cf.round(wdzgce*0.033,2); //套餐：折前金额×0.033

			//增减项金额 套餐只含工程
			ls_sql="select tcwsgzjzjx+tcwgccljjzjx";
			ls_sql+=" from  crm_tckhqye";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				zhljzjx=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			ls_sql="SELECT sum(hkze+zjhze)";
			ls_sql+=" FROM jc_zcdd  ";
			ls_sql+=" where khbh='"+khbh+"'";//1：系统存在品牌订单；2：系统不存在品牌订单；3：补录合同；4：有库存订单；5：套餐分解订单
			ls_sql+=" and clzt>='09' and clzt not in('98','99')";//09：合同已完成
			ls_sql+=" and sfjrht='Y'";//是否计入合同  Y：计入；N：不计入
			ls_sql+=" and ddlx not in('1','3','4','9')";//1：代销品；3：补录合同；4：有库存订单；5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				tcwzczx=rs.getDouble(1);
			}
			rs.close();
			ps.close();
		}
		
		qye=cf.round(qye-suijin,2);



		double dzkhbl=0;//店长考核比例
		double khjlkhbl=0;//店面业务考核比例
		double zjkhbl=0;//客户经理考核分数
		double clykhbl=0;//材料员考核比例
		double xqzgkhbl=0;//小区主管考核比例
		double xqzzkhbl=0;//小区组长考核比例
		double xqzykhbl=0;//小区专员考核比例
		double wlyxzgkhbl=0;//网络营销主管考核比例
		double wztgykhbl=0;//网站推广员考核比例


		//店长考核比例
		ls_sql="select dzkhbl";
		ls_sql+=" from  cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+dianz+"' and zw='41'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dzkhbl=rs.getDouble("dzkhbl");
		}
		rs.close();
		ps.close();

		//店面业务考核比例
		ls_sql="select dzkhbl";
		ls_sql+=" from  cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+khjl+"' and zw='03'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khjlkhbl=rs.getDouble("dzkhbl");
		}
		rs.close();
		ps.close();

		//客户经理考核分数
		ls_sql="select khfs";
		ls_sql+=" from  cw_jrzjyjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+zjxm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zjkhbl=rs.getDouble("khfs");
		}
		rs.close();
		ps.close();

		//材料员考核比例
		ls_sql="select dzkhbl";
		ls_sql+=" from  cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+clgw+"' and zw='08'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clykhbl=rs.getDouble("dzkhbl");
		}
		rs.close();
		ps.close();

		//小区主管考核比例
		ls_sql="select dzkhbl";
		ls_sql+=" from  cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+xqzg+"' and zw='42'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xqzgkhbl=rs.getDouble("dzkhbl");
		}
		rs.close();
		ps.close();

		//小区组长考核比例
		ls_sql="select dzkhbl";
		ls_sql+=" from  cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+xqzz+"' and zw='43'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xqzzkhbl=rs.getDouble("dzkhbl");
		}
		rs.close();
		ps.close();

		//小区专员考核比例
		ls_sql="select dzkhbl";
		ls_sql+=" from  cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+xqzy+"' and zw='44'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xqzykhbl=rs.getDouble("dzkhbl");
		}
		rs.close();
		ps.close();

		//网络营销主管考核比例
		ls_sql="select dzkhbl";
		ls_sql+=" from  cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+wlyxzg+"' and zw='45'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			wlyxzgkhbl=rs.getDouble("dzkhbl");
		}
		rs.close();
		ps.close();

		//网站推广员考核比例
		ls_sql="select dzkhbl";
		ls_sql+=" from  cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+wztgy+"' and zw='46'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			wztgykhbl=rs.getDouble("dzkhbl");
		}
		rs.close();
		ps.close();


		if (zjxbl>=2)//>2％，客户经理扣0.2%
		{
//			zjzxftcbl=cf.round(zjzxftcbl-0.2,2);
		}

		//提成
		double dzqysjftc=0;//店长签约设计费提成
		double dzjssjftc=0;//店长结算设计费提成
		double dzqyzxtc=0;//店长签约装修提成
		double dzjszxtc=0;//店长结算装修提成
		double dztcxj=0;//店长提成小计
		double dztcze=0;//店长提成总额

		double wytcje=0;//文员提成
		double wyqyzxtc=0;//文员签约装修提成
		double wyjszxtc=0;//文员结算装修提成


		double khjlqysjftc=0;  //店面业务签约设计费提成	
		double khjljssjftc=0;  //店面业务结算设计费提成	
		double khjlqyzxtc=0;   //店面业务签约装修提成	    
		double khjljszxtc=0;   //店面业务结算装修提成	    
		double khjltcxj=0;     //店面业务提成小计	        
		double khjltcze=0;     //店面业务提成总额	      

		double sjsqysjftc=0;    //设计师签约设计费提成	
		double sjsjssjftc=0;    //设计师结算设计费提成	
		double sjsqyzxtc=0; //设计师签约装修提成	
		double sjsjszxtc=0; //设计师结算装修提成	
		double sjsycftc=0;      //设计师远程费提成	  
		double sjstchj=0;   //设计师提成合计	    

		double zjqyzxtc=0;  //客户经理签约装修提成		
		double zjjszxtc=0;  //客户经理结算装修提成		
		double zjycftc=0;   //客户经理远程费提成		
		double zjtcxj=0;    //客户经理提成小计			
		double zjtchj=0;    //客户经理提成合计			

		double clyqyzxtc=0;  //材料员签约装修提成		
		double clyjszxtc=0;  //材料员结算装修提成		
		double clytc=0;   //材料员提成		

		double xqzgqyzxtc=0;    //小区主管签约装修提成	
		double xqzgjszxtc=0;    //小区主管结算装修提成	
		double xqzgtc=0;    //小区主管提成			
					   
		double xqzzqyzxtc=0;    //小区组长签约装修提成	
		double xqzzjszxtc=0;    //小区组长结算装修提成	
		double xqzztc=0;    //小区组长提成			
					   
		double xqzyqyzxtc=0;    //小区专员签约装修提成	
		double xqzyjszxtc=0;    //小区专员结算装修提成	
		double xqzytc=0;    //小区专员提成			

		double wlyxzgqyzxtc=0;    //网络营销主管签约装修提成	
		double wlyxzgjszxtc=0;    //网络营销主管结算装修提成	
		double wlyxzgtc=0;		  //网络营销主管提成			


		double yxzyqyzxtc=0;    //     营销专员签约装修提成	
					   
		double wzchqyzxtc=0;    //     网站策划签约装修提成	
					   
		double wysjqyzxtc=0;    //     网页设计签约装修提成	
					   
		double wzcxyqyzxtc=0;    //    网站程序员签约装修提成	
					   
		double dhzyqyzxtc=0;    //     电话专员签约装修提成	
					   
		double wztgyqyzxtc=0;    //    网站推广员签约装修提成	
		double wztgyjszxtc=0;    //    网站推广员结算装修提成	
		double wztgytc=0;    //        网站推广员提成			
					   
		double sjqyzxtc=0;    //       司机签约装修提成	

		double jjze=0;//奖金总数

		if (sjsjsbz.equals("0"))//0：未提成；1：签单提成；2：结算提成
		{
			if (!dianz.equals(""))
			{
				dzqysjftc=cf.round(sjf*dzsjftcbl/200,2);//店长签约设计费提成
				dzjssjftc=0;//店长结算设计费提成
				dzqyzxtc=cf.round(qye*dzzxftcbl/200,2);//店长签约装修提成
				dzjszxtc=0;//店长结算装修提成
				dztcxj=cf.round(dzqysjftc+dzqyzxtc,2);//店长提成小计
				dztcze=cf.round(dztcxj*dzkhbl/100,2);//店长提成总额
			}

			if (!weny.equals(""))
			{
				wyqyzxtc=cf.round(qye*wyzxftcbl/200,2);//文员签约装修提成
				wyjszxtc=0;//文员结算装修提成

				wytcje=wyqyzxtc;
			}


			if (!khjl.equals(""))
			{
				khjlqysjftc=cf.round(sjf*khjlsjftcbl/200,2);  //店面业务签约设计费提成	
				khjljssjftc=0;  //店面业务结算设计费提成
				khjlqyzxtc=cf.round(qye*khjlzxftcbl/200,2);   //店面业务签约装修提成	    
				khjljszxtc=0;   //店面业务结算装修提成	 
				khjltcxj=cf.round(khjlqysjftc+khjlqyzxtc,2);     //店面业务提成小计	        
				khjltcze=cf.round(dztcxj*khjlkhbl/100,2);     //店面业务提成总额	    
			}
			
			if (!sjs.equals(""))
			{
				sjsqysjftc=cf.round(sjf*sjssjftcbl/200,2);    //设计师签约设计费提成	
				sjsjssjftc=0;    //设计师结算设计费提成	
				sjsqyzxtc=cf.round(qye*sjszxftcbl/200,2); //设计师签约装修提成	
				sjsjszxtc=0; //设计师结算装修提成	
				sjsycftc=cf.round(ycf*sjsycftcbl/100,2);      //设计师远程费提成	 
				sjstchj=cf.round(sjsqysjftc+sjsqyzxtc+sjsycftc,2);   //设计师提成合计	    
			}

			if (!zjxm.equals(""))
			{
				zjqyzxtc=cf.round(qye*zjzxftcbl/200,2);  //客户经理签约装修提成		
				zjjszxtc=0;  //客户经理结算装修提成		
				zjycftc=cf.round(ycf*zjycftcbl/100,2);   //客户经理远程费提成		
				zjtcxj=cf.round(zjqyzxtc+zjycftc,2);    //客户经理提成小计			
				zjtchj=cf.round(zjtcxj*zjkhbl/100,2);    //客户经理提成合计			
			}

			if (!clgw.equals(""))
			{
				clyqyzxtc=cf.round(qye*clyzxftcbl/200,2);  //材料员签约装修提成		
				clyjszxtc=0;  //材料员结算装修提成		
				clytc=cf.round(clyqyzxtc*clykhbl/100,2);    //材料员提成			
			}

			if (!xqzg.equals(""))
			{
				xqzgqyzxtc=cf.round(qye*xqzgzxftcbl/200,2);    //小区主管签约装修提成	
				xqzgjszxtc=0;    //小区主管结算装修提成	
				xqzgtc=cf.round(xqzgqyzxtc*xqzgkhbl/100,2);    //小区主管提成			
			}
						   
			if (!xqzz.equals(""))
			{
				xqzzqyzxtc=cf.round(qye*xqzzzxftcbl/200,2);    //小区组长签约装修提成	
				xqzzjszxtc=0;    //小区组长结算装修提成	
				xqzztc=cf.round(xqzzqyzxtc*xqzzkhbl/100,2);    //小区组长提成			
			}
						   
			if (!xqzy.equals(""))
			{
				xqzyqyzxtc=cf.round(qye*xqzyzxftcbl/200,2);    //小区专员签约装修提成	
				xqzyjszxtc=0;    //小区专员结算装修提成	
				xqzytc=cf.round(xqzyqyzxtc*xqzykhbl/100,2);    //小区专员提成			
			}

			if (!wlyxzg.equals(""))
			{
				wlyxzgqyzxtc=cf.round(qye*wlyxzgzxftcbl/200,2);  //网络营销主管签约装修提成	
				wlyxzgjszxtc=0;  //网络营销主管结算装修提成	
				wlyxzgtc=cf.round(wlyxzgqyzxtc*wlyxzgkhbl/100,2);      //网络营销主管提成			
			}

			if (!yxzy.equals(""))
			{
				yxzyqyzxtc=cf.round(qye*yxzyzxftcbl/100,2);     //营销专员签约装修提成	
			}
						   
			if (!wzch.equals(""))
			{
				wzchqyzxtc=cf.round(qye*wzchzxftcbl/100,2);     //网站策划签约装修提成	
			}
						   
			if (!wysj.equals(""))
			{
				wysjqyzxtc=cf.round(qye*wysjzxftcbl/100,2);     //网页设计签约装修提成	
			}
						   
			if (!wzcxy.equals(""))
			{
				wzcxyqyzxtc=cf.round(qye*wzcxyzxftcbl/100,2);    //网站程序员签约装修提成	
			}
						   
			if (!dhzy.equals(""))
			{
				dhzyqyzxtc=cf.round(qye*dhzyzxftcbl/100,2);     //电话专员签约装修提成	
			}
						   
			if (!wztgy.equals(""))
			{
				wztgyqyzxtc=cf.round(qye*wztgyzxftcbl/200,2);    //网站推广员签约装修提成	
				wztgyjszxtc=0;    //网站推广员结算装修提成	
				wztgytc=cf.round(wztgyqyzxtc*wztgykhbl/100,2);         //网站推广员提成			
			}
						   
			if (!siji.equals(""))
			{
				sjqyzxtc=cf.round(qye*sjzxftcbl/200,2);       //司机签约装修提成		
			}
		}
		else if (sjsjsbz.equals("1"))//0：未提成；1：签单提成；2：结算提成
		{
			ls_sql="select dzqysjftc,dzqyzxtc,wyqyzxtc,khjlqysjftc,khjlqyzxtc,sjsqysjftc,sjsqyzxtc,zjqyzxtc,xqzgqyzxtc,xqzzqyzxtc,xqzyqyzxtc ";
			ls_sql+=" ,wlyxzgqyzxtc,wztgyqyzxtc,sjqyzxtc";
			ls_sql+=" from  cw_jrtcmx";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				dzqysjftc=rs.getDouble("dzqysjftc");//店长签约设计费提成
				dzqyzxtc=rs.getDouble("dzqyzxtc");//店长签约装修提成
				wyqyzxtc=rs.getDouble("wyqyzxtc");//文员签约装修提成
				khjlqysjftc=rs.getDouble("khjlqysjftc");//店面业务签约设计费提成
				khjlqyzxtc=rs.getDouble("khjlqyzxtc");//店面业务签约装修提成
				sjsqysjftc=rs.getDouble("sjsqysjftc");//设计师签约设计费提成
				sjsqyzxtc=rs.getDouble("sjsqyzxtc");//设计师签约装修提成
				zjqyzxtc=rs.getDouble("zjqyzxtc");//客户经理签约装修提成
				xqzgqyzxtc=rs.getDouble("xqzgqyzxtc");//小区主管签约装修提成
				xqzzqyzxtc=rs.getDouble("xqzzqyzxtc");//小区组长签约装修提成
				xqzyqyzxtc=rs.getDouble("xqzyqyzxtc");//小区专员签约装修提成
				wlyxzgqyzxtc=rs.getDouble("wlyxzgqyzxtc");//网络营销主管签约装修提成
				wztgyqyzxtc=rs.getDouble("wztgyqyzxtc");//网站推广员签约装修提成
				sjqyzxtc=rs.getDouble("sjqyzxtc");//司机签约装修提成
			}
			rs.close();
			ps.close();

			if (!dianz.equals(""))
			{
				dzjssjftc=cf.round(sjf*dzsjftcbl/100-dzqysjftc,2);//店长结算设计费提成
				dzjszxtc=cf.round((qye+zhljzjx)*dzzxftcbl/100-dzqyzxtc,2);//店长结算装修提成
				dztcxj=cf.round(dzjssjftc+dzjszxtc,2);//店长提成小计
				dztcze=cf.round(dztcxj*dzkhbl/100,2);//店长提成总额
			}

			if (!weny.equals(""))
			{
				wyjszxtc=cf.round((qye+zhljzjx)*wyzxftcbl/100-wyqyzxtc,2);//文员结算装修提成
				wytcje=wyjszxtc;
			}

			if (!khjl.equals(""))
			{
				khjljssjftc=cf.round(sjf*khjlsjftcbl/100-khjlqysjftc,2);  //店面业务结算设计费提成
				khjljszxtc=cf.round((qye+zhljzjx)*khjlzxftcbl/100-khjlqyzxtc,2);   //店面业务结算装修提成	 
				khjltcxj=cf.round(khjljssjftc+khjljszxtc,2);     //店面业务提成小计	        
				khjltcze=cf.round(khjltcxj*khjlkhbl/100,2);     //店面业务提成总额	        
			}
			
			if (!sjs.equals(""))
			{
				sjsjssjftc=cf.round(sjf*sjssjftcbl/100-sjsqysjftc,2);    //设计师结算设计费提成	
				sjsjszxtc=cf.round((qye+zhljzjx)*sjszxftcbl/100-sjsqyzxtc,2); //设计师结算装修提成	
				sjsycftc=0;      //设计师远程费提成	    
				sjstchj=cf.round(sjsjssjftc+sjsjszxtc+sjsycftc,2);   //设计师提成合计	    
			}

			if (!zjxm.equals(""))
			{
				zjjszxtc=cf.round((qye+zhljzjx)*zjzxftcbl/100-zjqyzxtc,2);  //客户经理结算装修提成		
				zjycftc=0;   //客户经理远程费提成		
				zjtcxj=cf.round(zjjszxtc+zjycftc,2);    //客户经理提成小计			
				zjtchj=cf.round(zjtcxj*zjkhbl/100,2);    //客户经理提成合计			
			}

			if (!clgw.equals(""))
			{
				clyjszxtc=cf.round(qye*clyzxftcbl/100,2)-clyqyzxtc;  //材料员结算装修提成
				clytc=cf.round(clyjszxtc*clykhbl/100,2);    //材料员提成			
			}

			if (!xqzg.equals(""))
			{
				xqzgjszxtc=cf.round((qye+zhljzjx)*xqzgzxftcbl/100-xqzgqyzxtc,2);    //小区主管结算装修提成	
				xqzgtc=cf.round(xqzgjszxtc*xqzgkhbl/100,2);    //小区主管提成			
			}
						   
			if (!xqzz.equals(""))
			{
				xqzzjszxtc=cf.round((qye+zhljzjx)*xqzzzxftcbl/100-xqzzqyzxtc,2);    //小区组长结算装修提成	
				xqzztc=cf.round(xqzzjszxtc*xqzzkhbl/100,2);    //小区组长提成			
			}
						   
			if (!xqzy.equals(""))
			{
				xqzyjszxtc=cf.round((qye+zhljzjx)*xqzyzxftcbl/100-xqzyqyzxtc,2);    //小区专员结算装修提成	
				xqzytc=cf.round(xqzyjszxtc*xqzykhbl/100,2);    //小区专员提成			
			}

			if (!wlyxzg.equals(""))
			{
				wlyxzgjszxtc=cf.round((qye+zhljzjx)*wlyxzgzxftcbl/100-wlyxzgqyzxtc,2);  //网络营销主管结算装修提成	
				wlyxzgtc=cf.round(wlyxzgjszxtc*wlyxzgkhbl/100,2);      //网络营销主管提成		
			}
			

			
			yxzyzxftcbl=0;
			yxzyqyzxtc=0;     //营销专员签约装修提成	
						   
			wzchzxftcbl=0;
			wzchqyzxtc=0;     //网站策划签约装修提成	
						   
			wysjzxftcbl=0;
			wysjqyzxtc=0;     //网页设计签约装修提成	
						   
			wzcxyzxftcbl=0;
			wzcxyqyzxtc=0;    //网站程序员签约装修提成	
						   
			dhzyzxftcbl=0;
			dhzyqyzxtc=0;     //电话专员签约装修提成	
						   
			if (!wztgy.equals(""))
			{
				wztgyjszxtc=cf.round((qye+zhljzjx)*wztgyzxftcbl/100-wztgyqyzxtc,2);    //网站推广员结算装修提成	
				wztgytc=cf.round(wztgyjszxtc*wztgykhbl/100,2);         //网站推广员提成		
			}
			
			sjzxftcbl=0;
			sjqyzxtc=0;//司机签约装修提成
						   
		}


		jjze=dztcze+wytcje+khjltcze+sjstchj+zjtchj+clytc+xqzgtc+xqzztc+xqzytc+wlyxzgtc+yxzyqyzxtc+wzchqyzxtc+wysjqyzxtc+wzcxyqyzxtc+dhzyqyzxtc+wztgytc+sjqyzxtc;
		jjze=cf.round(jjze,2);

		
		
		
		
		
		
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
			<td ><%=sjsjsbzmc%>
				<input name="khbh" type="hidden" value="<%=khbh%>">
			</td>
			<td ><%=hth%></td>
			<td ><A target='_blank' HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>"><%=khxm%></A></td>
			<td ><%=fwdz%></td>
			<td ><%=fwmj%></td>
			<td ><%=bjjbmc%></td>
			<td ><%=hdlxmc%>
				<input name="hdbz" type="hidden" value="<%=hdbz%>">
				<input name="tckh" type="hidden" value="<%=tckh%>">
				<input name="lx" type="hidden" value="<%=lx%>">
				<input name="fwmj" type="hidden" value="<%=fwmj%>">
			</td>
			<td >
				<%=dianz%>
				<input name="dianz" type="hidden" value="<%=dianz%>">
			</td>
			<td >
				<%=weny%>
				<input name="weny" type="hidden" value="<%=weny%>">
			</td>
			<td >
				<%=khjl%>
				<input name="khjl" type="hidden" value="<%=khjl%>">
			</td>
			<td >
				<%=sjs%>
				<input name="sjs" type="hidden" value="<%=sjs%>">
			</td>
			<td >
				<%=clgw%>
				<input name="cly" type="hidden" value="<%=clgw%>">
			</td>
			<td >
				<%=zjxm%>
				<input name="zjxm" type="hidden" value="<%=zjxm%>">
			</td>
			<td >
				<%=xqzg%>
				<input name="xqzg" type="hidden" value="<%=xqzg%>">
			</td>
			<td >
				<%=xqzz%>
				<input name="xqzz" type="hidden" value="<%=xqzz%>">
			</td>
			<td >
				<%=xqzy%>
				<input name="xqzy" type="hidden" value="<%=xqzy%>">
			</td>
			<td >
				<%=wlyxzg%>
				<input name="wlyxzg" type="hidden" value="<%=wlyxzg%>">
			</td>
			<td >
				<%=yxzy%>
				<input name="yxzy" type="hidden" value="<%=yxzy%>">
			</td>
			<td >
				<%=wzch%>
				<input name="wzch" type="hidden" value="<%=wzch%>">
			</td>
			<td >
				<%=wysj%>
				<input name="wysj" type="hidden" value="<%=wysj%>">
			</td>
			<td >
				<%=wzcxy%>
				<input name="wzcxy" type="hidden" value="<%=wzcxy%>">
			</td>
			<td >
				<%=dhzy%>
				<input name="dhzy" type="hidden" value="<%=dhzy%>">
			</td>
			<td >
				<%=wztgy%>
				<input name="wztgy" type="hidden" value="<%=wztgy%>">
			</td>
			<td >
				<%=siji%>
				<input name="siji" type="hidden" value="<%=siji%>">
			</td>

			<td >
				<%=sjf%>
				<input name="sjf" type="hidden" value="<%=sjf%>">
			</td>
			<td >
				<%=ycf%>
				<input name="ycf" type="hidden" value="<%=ycf%>">
			</td>
			<td >
				<%=wdzgce%>
				<input name="zqje" type="hidden" value="<%=wdzgce%>">
			</td>
			<td >
				<%=cf.round(wdzgce-qye,2)%>
				<input name="zk" type="hidden" value="<%=cf.round(wdzgce-qye,2)%>">
			</td>
			<td >
				<%=suijin%>
				<input name="suijin" type="hidden" value="<%=suijin%>">
			</td>
			<td >
				<%=qye%>
				<input name="zhjtjs" type="hidden" value="<%=qye%>">
			</td>
			<td >
				<%=zhljzjx%>
				<input name="zjxje" type="hidden" value="<%=zhljzjx%>">
			</td>
			<td >
				<%=zjxbl%>%
				<input name="zjxbl" type="hidden" value="<%=zjxbl%>">
			</td>
			<td >
				<%=tcwzczx%>
				<input name="tcwzczx" type="hidden" value="<%=tcwzczx%>">
			</td>

			

			<td >
				<%=dzsjftcbl%>%
				<input name="dzsjftcbl" type="hidden" value="<%=dzsjftcbl%>">
			</td>
			<td >
				<%=dzqysjftc%>
				<input name="dzqysjftc" type="hidden" value="<%=dzqysjftc%>">
			</td>
			<td >
				<%=dzjssjftc%>
				<input name="dzjssjftc" type="hidden" value="<%=dzjssjftc%>">
			</td>
			<td >
				<%=dzzxftcbl%>%
				<input name="dzzxftcbl" type="hidden" value="<%=dzzxftcbl%>">
			</td>
			<td >
				<%=dzqyzxtc%>
				<input name="dzqyzxtc" type="hidden" value="<%=dzqyzxtc%>">
			</td>
			<td >
				<%=dzjszxtc%>
				<input name="dzjszxtc" type="hidden" value="<%=dzjszxtc%>">
			</td>
			<td >
				<%=dztcxj%>
				<input name="dztcxj" type="hidden" value="<%=dztcxj%>">
			</td>
			<td >
				<%=dzkhbl%>%
				<input name="dzkhbl" type="hidden" value="<%=dzkhbl%>">
			</td>
			<td >
				<%=dztcze%>
				<input name="dztcze" type="hidden" value="<%=dztcze%>">
			</td>



			<td >
				<%=wyzxftcbl%>%
				<input name="wyzxftcbl" type="hidden" value="<%=wyzxftcbl%>">
			</td>
			<td >
				<%=wyqyzxtc%>
				<input name="wyqyzxtc" type="hidden" value="<%=wyqyzxtc%>">
			</td>
			<td >
				<%=wyjszxtc%>
				<input name="wyjszxtc" type="hidden" value="<%=wyjszxtc%>">
			</td>
		

			
			<td >
				<%=khjlsjftcbl%>%
				<input name="khjlsjftcbl" type="hidden" value="<%=khjlsjftcbl%>">
			</td>
			<td >
				<%=khjlqysjftc%>
				<input name="khjlqysjftc" type="hidden" value="<%=khjlqysjftc%>">
			</td>
			<td >
				<%=khjljssjftc%>
				<input name="khjljssjftc" type="hidden" value="<%=khjljssjftc%>">
			</td>
			<td >
				<%=khjlzxftcbl%>%
				<input name="khjlzxftcbl" type="hidden" value="<%=khjlzxftcbl%>">
			</td>
			<td >
				<%=khjlqyzxtc%>
				<input name="khjlqyzxtc" type="hidden" value="<%=khjlqyzxtc%>">
			</td>
			<td >
				<%=khjljszxtc%>
				<input name="khjljszxtc" type="hidden" value="<%=khjljszxtc%>">
			</td>
			<td >
				<%=khjltcxj%>
				<input name="khjltcxj" type="hidden" value="<%=khjltcxj%>">
			</td>
			<td >
				<%=khjlkhbl%>%
				<input name="khjlkhbl" type="hidden" value="<%=khjlkhbl%>">
			</td>
			<td >
				<%=khjltcze%>
				<input name="khjltcze" type="hidden" value="<%=khjltcze%>">
			</td>
		

			<td >
				<%=sjssjftcbl%>%
				<input name="sjssjftcbl" type="hidden" value="<%=sjssjftcbl%>">
			</td>
			<td >
				<%=sjsqysjftc%>
				<input name="sjsqysjftc" type="hidden" value="<%=sjsqysjftc%>">
			</td>
			<td >
				<%=sjsjssjftc%>
				<input name="sjsjssjftc" type="hidden" value="<%=sjsjssjftc%>">
			</td>
			<td >
				<%=sjszxftcbl%>%
				<input name="sjszxftcbl" type="hidden" value="<%=sjszxftcbl%>">
			</td>
			<td >
				<%=sjsqyzxtc%>
				<input name="sjsqyzxtc" type="hidden" value="<%=sjsqyzxtc%>">
			</td>
			<td >
				<%=sjsjszxtc%>
				<input name="sjsjszxtc" type="hidden" value="<%=sjsjszxtc%>">
			</td>
			<td >
				<%=sjsycftcbl%>
				<input name="sjsycftcbl" type="hidden" value="<%=sjsycftcbl%>">
			</td>
			<td >
				<%=sjsycftc%>%
				<input name="sjsycftc" type="hidden" value="<%=sjsycftc%>">
			</td>
			<td >
				<%=sjstchj%>
				<input name="sjstchj" type="hidden" value="<%=sjstchj%>">
			</td>

		

			<td >
				<%=zjzxftcbl%>%
				<input name="zjzxftcbl" type="hidden" value="<%=zjzxftcbl%>">
			</td>
			<td >
				<%=zjqyzxtc%>
				<input name="zjqyzxtc" type="hidden" value="<%=zjqyzxtc%>">
			</td>
			<td >
				<%=zjjszxtc%>
				<input name="zjjszxtc" type="hidden" value="<%=zjjszxtc%>">
			</td>
			<td >
				<%=zjycftcbl%>%
				<input name="zjycftcbl" type="hidden" value="<%=zjycftcbl%>">
			</td>
			<td >
				<%=zjycftc%>
				<input name="zjycftc" type="hidden" value="<%=zjycftc%>">
			</td>
			<td >
				<%=zjtcxj%>
				<input name="zjtcxj" type="hidden" value="<%=zjtcxj%>">
			</td>
			<td >
				<%=zjkhbl%>
				<input name="zjkhbl" type="hidden" value="<%=zjkhbl%>">
			</td>
			<td >
				<%=zjtchj%>%
				<input name="zjtchj" type="hidden" value="<%=zjtchj%>">
			</td>

		
			<td >
				<%=clyzxftcbl%>%
				<input name="clyzxftcbl" type="hidden" value="<%=clyzxftcbl%>">
			</td>
			<td >
				<%=clyqyzxtc%>
				<input name="clyqyzxtc" type="hidden" value="<%=clyqyzxtc%>">
			</td>
			<td >
				<%=clyjszxtc%>
				<input name="clyjszxtc" type="hidden" value="<%=clyjszxtc%>">
			</td>
			<td >
				<%=clykhbl%>
				<input name="clykhbl" type="hidden" value="<%=clykhbl%>">
			</td>
			<td >
				<%=clytc%>%
				<input name="clytc" type="hidden" value="<%=clytc%>">
			</td>

		
			<td >
				<%=xqzgzxftcbl%>%
				<input name="xqzgzxftcbl" type="hidden" value="<%=xqzgzxftcbl%>">
			</td>
			<td >
				<%=xqzgqyzxtc%>
				<input name="xqzgqyzxtc" type="hidden" value="<%=xqzgqyzxtc%>">
			</td>
			<td >
				<%=xqzgjszxtc%>
				<input name="xqzgjszxtc" type="hidden" value="<%=xqzgjszxtc%>">
			</td>
			<td >
				<%=xqzgkhbl%>
				<input name="xqzgkhbl" type="hidden" value="<%=xqzgkhbl%>">
			</td>
			<td >
				<%=xqzgtc%>%
				<input name="xqzgtc" type="hidden" value="<%=xqzgtc%>">
			</td>

		
			<td >
				<%=xqzzzxftcbl%>%
				<input name="xqzzzxftcbl" type="hidden" value="<%=xqzzzxftcbl%>">
			</td>
			<td >
				<%=xqzzqyzxtc%>
				<input name="xqzzqyzxtc" type="hidden" value="<%=xqzzqyzxtc%>">
			</td>
			<td >
				<%=xqzzjszxtc%>
				<input name="xqzzjszxtc" type="hidden" value="<%=xqzzjszxtc%>">
			</td>
			<td >
				<%=xqzzkhbl%>
				<input name="xqzzkhbl" type="hidden" value="<%=xqzzkhbl%>">
			</td>
			<td >
				<%=xqzztc%>%
				<input name="xqzztc" type="hidden" value="<%=xqzztc%>">
			</td>

		
			<td >
				<%=xqzyzxftcbl%>%
				<input name="xqzyzxftcbl" type="hidden" value="<%=xqzyzxftcbl%>">
			</td>
			<td >
				<%=xqzyqyzxtc%>
				<input name="xqzyqyzxtc" type="hidden" value="<%=xqzyqyzxtc%>">
			</td>
			<td >
				<%=xqzyjszxtc%>
				<input name="xqzyjszxtc" type="hidden" value="<%=xqzyjszxtc%>">
			</td>
			<td >
				<%=xqzykhbl%>
				<input name="xqzykhbl" type="hidden" value="<%=xqzykhbl%>">
			</td>
			<td >
				<%=xqzytc%>%
				<input name="xqzytc" type="hidden" value="<%=xqzytc%>">
			</td>

		
			<td >
				<%=wlyxzgzxftcbl%>%
				<input name="wlyxzgzxftcbl" type="hidden" value="<%=wlyxzgzxftcbl%>">
			</td>
			<td >
				<%=wlyxzgqyzxtc%>
				<input name="wlyxzgqyzxtc" type="hidden" value="<%=wlyxzgqyzxtc%>">
			</td>
			<td >
				<%=wlyxzgjszxtc%>
				<input name="wlyxzgjszxtc" type="hidden" value="<%=wlyxzgjszxtc%>">
			</td>
			<td >
				<%=wlyxzgkhbl%>
				<input name="wlyxzgkhbl" type="hidden" value="<%=wlyxzgkhbl%>">
			</td>
			<td >
				<%=wlyxzgtc%>%
				<input name="wlyxzgtc" type="hidden" value="<%=wlyxzgtc%>">
			</td>

		


			<td >
				<%=yxzyzxftcbl%>%
				<input name="yxzyzxftcbl" type="hidden" value="<%=yxzyzxftcbl%>">
			</td>
			<td >
				<%=yxzyqyzxtc%>
				<input name="yxzyqyzxtc" type="hidden" value="<%=yxzyqyzxtc%>">
			</td>
		


			<td >
				<%=wzchzxftcbl%>%
				<input name="wzchzxftcbl" type="hidden" value="<%=wzchzxftcbl%>">
			</td>
			<td >
				<%=wzchqyzxtc%>
				<input name="wzchqyzxtc" type="hidden" value="<%=wzchqyzxtc%>">
			</td>
		


			<td >
				<%=wysjzxftcbl%>%
				<input name="wysjzxftcbl" type="hidden" value="<%=wysjzxftcbl%>">
			</td>
			<td >
				<%=wysjqyzxtc%>
				<input name="wysjqyzxtc" type="hidden" value="<%=wysjqyzxtc%>">
			</td>


		
			<td >
				<%=wzcxyzxftcbl%>%
				<input name="wzcxyzxftcbl" type="hidden" value="<%=wzcxyzxftcbl%>">
			</td>
			<td >
				<%=wzcxyqyzxtc%>
				<input name="wzcxyqyzxtc" type="hidden" value="<%=wzcxyqyzxtc%>">
			</td>
		


			<td >
				<%=dhzyzxftcbl%>%
				<input name="dhzyzxftcbl" type="hidden" value="<%=dhzyzxftcbl%>">
			</td>
			<td >
				<%=dhzyqyzxtc%>
				<input name="dhzyqyzxtc" type="hidden" value="<%=dhzyqyzxtc%>">
			</td>
		
			<td >
				<%=wztgyzxftcbl%>%
				<input name="wztgyzxftcbl" type="hidden" value="<%=wztgyzxftcbl%>">
			</td>
			<td >
				<%=wztgyqyzxtc%>
				<input name="wztgyqyzxtc" type="hidden" value="<%=wztgyqyzxtc%>">
			</td>
			<td >
				<%=wztgyjszxtc%>
				<input name="wztgyjszxtc" type="hidden" value="<%=wztgyjszxtc%>">
			</td>
			<td >
				<%=wztgykhbl%>
				<input name="wztgykhbl" type="hidden" value="<%=wztgykhbl%>">
			</td>
			<td >
				<%=wztgytc%>%
				<input name="wztgytc" type="hidden" value="<%=wztgytc%>">
			</td>
		


			<td >
				<%=sjzxftcbl%>%
				<input name="sjzxftcbl" type="hidden" value="<%=sjzxftcbl%>">
			</td>
			<td >
				<%=sjqyzxtc%>
				<input name="sjqyzxtc" type="hidden" value="<%=sjqyzxtc%>">
			</td>


			<td >
				<%=jjze%>
				<input name="jjze" type="hidden" value="<%=jjze%>">
			</td>
		
		</tr>
		<%
	}
	rs1.close();
	ps1.close();
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
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
 <tr bgcolor="#FFFFFF" >
      <td colspan="194"> 
		<input name="khzq" type="hidden" value="<%=khzq%>">
		<input name="tcqssj" type="hidden" value="<%=tcqssj%>">
		<input name="tcjzsj" type="hidden" value="<%=tcjzsj%>">
		<input name="fgsbh" type="hidden" value="<%=fgsbh%>">
		<input type="button"  value="存盘" onClick="f_do(insertform)">
	</td>
</tr>
</table>

</form>


</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
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

function f_do(FormName)//参数FormName:Form的名称
{

	FormName.action="SavePltc.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
