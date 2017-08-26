<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String fgs=request.getParameter("fgs");

	String wheresql="";
	String ls_sql=null;
	if (!(fgs.equals("")))
	{
		wheresql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}

	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>工期统计表
  <BR>(统计时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
      <table border="1" width="210%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="4%" rowspan="3">分公司</td>
          <td  width="3%" rowspan="3">签约数</td>
          <td  width="5%" rowspan="3">签约额</td>
          <td colspan="9">未开工工地</td>
          <td colspan="12" bgcolor="#FFFFCC">在施工工地（11+12+13+14之和）(登记不及时)</td>
          <td colspan="4">本期竣工工地</td>
        </tr>
        <tr bgcolor="#CCCCCC"  align="center">
          <td colspan="2" bgcolor="#FFFFCC">本期之前未开</td>
          <td colspan="2">本期签单未开</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">5:一周内开工</td>
          <td colspan="4">延期开工工地</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">10：本期新开工地</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">11：正常</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">12：隐蔽工程延期</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">13：中期验收延期</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">14：完工延期</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">15：完工延期一周</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">16：完工延期一月</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">17：一周内预计完工</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">17：异常</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">17：投诉</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">17：报修</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">17：未交中期款</td>
          <td colspan="2">未结算</td>
          <td colspan="2">已结算</td>
        </tr>
        <tr bgcolor="#CCCCCC"  align="center">
          <td width="3%" bgcolor="#FFFFCC">1:未交首款</td>
          <td width="3%" bgcolor="#FFFFCC">2:已交首款</td>
          <td width="3%">3:未交首款</td>
          <td width="3%">4:已交首款</td>
          <td width="3%">6:未交首款</td>
          <td width="3%">7:已交首款</td>
          <td width="3%">8:延期一周以上</td>
          <td width="3%">9:延期一月以上</td>
          <td width="3%">18:正常竣工</td>
          <td width="3%">19:延期竣工</td>
          <td width="3%">20:正常竣工</td>
          <td width="3%">21:延期竣工</td>
        </tr>
<%
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String fgsbh=null;
String fgsmc=null;

int qys=0;
double qye=0;

int wkg_bqzq_wjk=0;//未开工工地－本期之前未开－未交首款
int wkg_bqzq_yjk=0;//未开工工地－本期之前未开－已交首款
int wkg_bqqd_wjk=0;//未开工工地－本期签单未开－未交首款
int wkg_bqqd_yjk=0;//未开工工地－本期签单未开－已交首款

int wkg_yznkg=0;//未开工工地－一周内开工
int wkg_yqkg_wjk=0;//未开工工地－延期开工工地－未交首款
int wkg_yqkg_yjk=0;//未开工工地－延期开工工地－已交首款
int wkg_yqkg_yqyz=0;//未开工工地－延期开工工地－延期一周以上
int wkg_yqkg_yqyy=0;//未开工工地－延期开工工地－延期一月以上

int zsgd_bqxk=0;//在施工工地－本期新开工工地
int zsgd_zszc=0;//在施工工地－正常
int zsgd_ybgcyq=0;//在施工工地－隐蔽工程延期
int zsgd_zqysyq=0;//在施工工地－中期验收延期
int zsgd_zsyq=0;//在施工工地－完工延期
int zsgd_yqyz=0;//在施工工地－延期1周以上
int zsgd_yqyy=0;//在施工工地－延期1月以上
int zsgd_yznwg=0;//在施工工地－一周内完工
int zsgd_yc=0;//在施工工地－异常
int zsgd_ts=0;//在施工工地－投诉
int zsgd_bx=0;//在施工工地－报修
int zsgd_wjzqk=0;//在施工工地－未交中期款

int bqjg_wjs_zc=0;//本期竣工工地－未完结－正常竣工
int bqjg_wjs_yq=0;//本期竣工工地－未完结－延期竣工
int bqjg_wj_zc=0;//本期竣工工地－完结－正常竣工
int bqjg_wj_yq=0;//本期竣工工地－完结－延期竣工


int allqys=0;//总签约数
double allqye=0;//总签约额

int allwkg_bqzq_wjk=0;//未开工工地－本期之前未开－未交首款
int allwkg_bqzq_yjk=0;//未开工工地－本期之前未开－已交首款
int allwkg_bqqd_wjk=0;//未开工工地－本期签单未开－未交首款
int allwkg_bqqd_yjk=0;//未开工工地－本期签单未开－已交首款

int allwkg_yznkg=0;//未开工工地－一周内开工
int allwkg_yqkg_wjk=0;//未开工工地－延期开工工地－未交首款
int allwkg_yqkg_yjk=0;//未开工工地－延期开工工地－已交首款
int allwkg_yqkg_yqyz=0;//未开工工地－延期开工工地－延期一周以上
int allwkg_yqkg_yqyy=0;//未开工工地－延期开工工地－延期一月以上

int allzsgd_bqxk=0;//在施工工地－本期新开工工地
int allzsgd_zszc=0;//在施工工地－正常
int allzsgd_ybgcyq=0;//在施工工地－隐蔽工程延期
int allzsgd_zqysyq=0;//在施工工地－中期验收延期
int allzsgd_zsyq=0;//在施工工地－完工延期
int allzsgd_yqyz=0;//在施工工地－延期1周以上
int allzsgd_yqyy=0;//在施工工地－延期1月以上
int allzsgd_yznwg=0;//在施工工地－一周内完工
int allzsgd_yc=0;//在施工工地－异常
int allzsgd_ts=0;//在施工工地－投诉
int allzsgd_bx=0;//在施工工地－报修
int allzsgd_wjzqk=0;//在施工工地－未交中期款

int allbqjg_wjs_zc=0;//本期竣工工地－未完结－正常竣工
int allbqjg_wjs_yq=0;//本期竣工工地－未完结－延期竣工
int allbqjg_wj_zc=0;//本期竣工工地－完结－正常竣工
int allbqjg_wj_yq=0;//本期竣工工地－完结－延期竣工

try {
	conn=cf.getConnection();

	ls_sql="SELECT sq_dwxx.dwmc fgs,sq_dwxx.dwbh fgsbh ";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		fgsmc=rs.getString("fgs");

		//签约数 签约额 
		ls_sql="select count(*) qye,sum(qye) qye";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' ";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			qys=rs1.getInt(1);
			qye=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();
		
		allqys+=qys;
		allqye+=qye;

		//未开工工地－本期之前未开－未交首款
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and qyrq<TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and (cwsfke<=100 OR cwsfke is null)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_bqzq_wjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_bqzq_wjk+=wkg_bqzq_wjk;

		//未开工工地－本期之前未开－已交首款
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and qyrq<TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and cwsfke>100 ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_bqzq_yjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_bqzq_yjk+=wkg_bqzq_yjk;

		//未开工工地－本期签单未开－未交首款
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and (cwsfke<=100 OR cwsfke is null)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_bqqd_wjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_bqqd_wjk+=wkg_bqqd_wjk;

		//未开工工地－本期签单未开－已交首款
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cwsfke>100 ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_bqqd_yjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_bqqd_yjk+=wkg_bqqd_yjk;

		//未开工工地－一周内开工
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and kgrq<=TRUNC(SYSDATE)+7";
		ls_sql+=" and kgrq>=TRUNC(SYSDATE)";
		ls_sql+=" and cwsfke>100 ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_yznkg=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_yznkg+=wkg_yznkg;

		
		//未开工工地－延期开工工地－未交首款
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and TRUNC(SYSDATE)>kgrq";
		ls_sql+=" and (cwsfke<=100 OR cwsfke is null)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_yqkg_wjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_yqkg_wjk+=wkg_yqkg_wjk;

		//未开工工地－延期开工工地－已交首款
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and TRUNC(SYSDATE)>kgrq";
		ls_sql+=" and cwsfke>100 ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_yqkg_yjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_yqkg_yjk+=wkg_yqkg_yjk;

		//未开工工地－延期开工工地－延期一周以上
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and (TRUNC(SYSDATE)-kgrq)>7";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_yqkg_yqyz=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_yqkg_yqyz+=wkg_yqkg_yqyz;

		//未开工工地－延期开工工地－延期一月以上
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and (TRUNC(SYSDATE)-kgrq)>30";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_yqkg_yqyy=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_yqkg_yqyy+=wkg_yqkg_yqyy;





		//在施工工地－本期新开工工地
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' ";
		ls_sql+=" and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and sjkgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and sjkgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_bqxk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allzsgd_bqxk+=zsgd_bqxk;

		//在施工工地－正常
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2'";
		ls_sql+=" and TRUNC(SYSDATE) <= jgrq+NVL(hzts,0) ";//未完工延期
		//1：未开工；2：已开工；3：中期验收；4：完工；5：客户完结；6：隐蔽工程完成;7: 合同异常终止
		ls_sql+=" and ( ";
		ls_sql+="    (crm_khxx.gcjdbm in('2') and (TRUNC(SYSDATE) <= jhybgcrq  or jhybgcrq is null) ) ";
		ls_sql+=" OR (crm_khxx.gcjdbm in('6') and (TRUNC(SYSDATE) <= jhzqsj    or jhzqsj   is null) ) ";
		ls_sql+=" OR crm_khxx.gcjdbm in('3')";
		ls_sql+="     ) ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_zszc=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_zszc+=zsgd_zszc;

		//在施工工地－隐蔽工程延期
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm in('2')";
		//1：未开工；2：已开工；3：中期验收；4：完工；5：客户完结；6：隐蔽工程完成;7: 合同异常终止
		ls_sql+=" and TRUNC(SYSDATE) <= jgrq+NVL(hzts,0) ";//未完工延期
		ls_sql+=" and TRUNC(SYSDATE) > jhybgcrq ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_ybgcyq=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_ybgcyq+=zsgd_ybgcyq;

		//在施工工地－中期验收延期
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm in('6')";
		//1：未开工；2：已开工；3：中期验收；4：完工；5：客户完结；6：隐蔽工程完成;7: 合同异常终止
		ls_sql+=" and TRUNC(SYSDATE) <= jgrq+NVL(hzts,0) ";//未完工延期
		ls_sql+=" and TRUNC(SYSDATE) > jhzqsj ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_zqysyq=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_zqysyq+=zsgd_zqysyq;

		//在施工工地－完工延期
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and TRUNC(SYSDATE) > jgrq+NVL(hzts,0) ";//目前已延期
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_zsyq=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_zsyq+=zsgd_zsyq;

		//在施工工地－延期1周以上
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and TRUNC(SYSDATE) > jgrq+NVL(hzts,0)+7 ";//目前已延期
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_yqyz=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_yqyz+=zsgd_yqyz;

		//在施工工地－延期1月以上
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and TRUNC(SYSDATE) > jgrq+NVL(hzts,0)+30 ";//目前已延期
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_yqyy=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_yqyy+=zsgd_yqyy;

		//在施工工地－一周内完工
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and jgrq+NVL(hzts,0)>=TRUNC(SYSDATE)";
		ls_sql+=" and jgrq+NVL(hzts,0)<=TRUNC(SYSDATE)+7";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_yznwg=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_yznwg+=zsgd_yznwg;

		//在施工工地－异常
		ls_sql="select count(distinct crm_khxx.khbh)";
		ls_sql+=" from crm_khxx,crm_xmycgl";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and crm_khxx.khbh=crm_xmycgl.khbh";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_yc=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_yc+=zsgd_yc;

		//在施工工地－投诉
		ls_sql="select count(distinct crm_khxx.khbh)";
		ls_sql+=" from crm_khxx,crm_tsjl";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and crm_khxx.khbh=crm_tsjl.khbh";
		ls_sql+=" and crm_tsjl.lx='1'";//1：投诉；2：报修
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_ts=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_ts+=zsgd_ts;

		//在施工工地－报修
		ls_sql="select count(distinct crm_khxx.khbh)";
		ls_sql+=" from crm_khxx,crm_tsjl";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and crm_khxx.khbh=crm_tsjl.khbh";
		ls_sql+=" and crm_tsjl.lx='2'";//1：投诉；2：报修
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_bx=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_bx+=zsgd_bx;

		//在施工工地－未交中期款
		ls_sql="select count(distinct crm_khxx.khbh)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm='3'";
		//1：未开工；2：已开工；3：中期验收；4：完工；5：客户完结；6：隐蔽工程完成;7: 合同异常终止
		ls_sql+=" and cwsfke>100 and cwjzkfkcs=1";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_wjzqk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_wjzqk+=zsgd_wjzqk;

		//本期竣工工地－未完结－正常竣工
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='4'";
		ls_sql+=" and sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq-kgrq <= jgrq-kgrq+NVL(hzts,0)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			bqjg_wjs_zc=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allbqjg_wjs_zc+=bqjg_wjs_zc;

		//本期竣工工地－未完结－延期竣工
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='4'";
		ls_sql+=" and sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq-kgrq > jgrq-kgrq+NVL(hzts,0)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			bqjg_wjs_yq=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allbqjg_wjs_yq+=bqjg_wjs_yq;

		//本期竣工工地－完结－正常竣工
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='5'";
		ls_sql+=" and sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq-kgrq <= jgrq-kgrq+NVL(hzts,0)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			bqjg_wj_zc=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allbqjg_wj_zc+=bqjg_wj_zc;

		//本期竣工工地－完结－延期竣工
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='5'";
		ls_sql+=" and sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq-kgrq > jgrq-kgrq+NVL(hzts,0)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			bqjg_wj_yq=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allbqjg_wj_yq+=bqjg_wj_yq;
%>
		<tr align="center">
          <td><%=fgsmc%></td>
          <td ><A HREF="Crm_khxxxQd.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=qys%></A></td>
          <td><%=cf.formatDouble((int)qye)%></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxwkg_bqzq_wjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_bqzq_wjk%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxwkg_bqzq_yjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_bqzq_yjk%></A></td>
          <td align="right"><A HREF="Crm_khxxxwkg_bqqd_wjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_bqqd_wjk%></A></td>
          <td align="right"><A HREF="Crm_khxxxwkg_bqqd_yjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_bqqd_yjk%></A></td>
 
		  <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxwkg_yznkg.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_yznkg%></A></td>
		  <td align="right"><A HREF="Crm_khxxxwkg_yqkg_wjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_yqkg_wjk%></A></td>
          <td align="right"><A HREF="Crm_khxxxwkg_yqkg_yjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_yqkg_yjk%></A></td>
          <td align="right"><A HREF="Crm_khxxxwkg_yqkg_yqyz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_yqkg_yqyz%></A></td>
          <td align="right"><A HREF="Crm_khxxxwkg_yqkg_yqyy.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_yqkg_yqyy%></A></td>

          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_bqxk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_bqxk%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_zszc.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_zszc%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_ybgcyq.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_ybgcyq%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_zqysyq.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_zqysyq%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_zsyq.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_zsyq%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_yqyz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_yqyz%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_yqyy.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_yqyy%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_yznwg.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_yznwg%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_yc.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_yc%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_ts.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_ts%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_bx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_bx%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_wjzqk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_wjzqk%></A></td>

          <td align="right"><A HREF="Crm_khxxxbqjg_wjs_zc.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=bqjg_wjs_zc%></A></td>
          <td align="right"><A HREF="Crm_khxxxbqjg_wjs_yq.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=bqjg_wjs_yq%></A></td>
          <td align="right"><A HREF="Crm_khxxxbqjg_wj_zc.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=bqjg_wj_zc%></A></td>
          <td align="right"><A HREF="Crm_khxxxbqjg_wj_yq.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=bqjg_wj_yq%></A></td>
        </tr>
<%
	}
	ps.close();
	rs.close();
%>

        <tr align="center" >
          <td><font color=red><B>总计</B></font></td>
          <td><B><%=allqys%></B></td>
          <td><B><%=cf.formatDouble((int)allqye)%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allwkg_bqzq_wjk%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allwkg_bqzq_yjk%></B></td>
          <td><B><%=allwkg_bqqd_wjk%></B></td>
          <td><B><%=allwkg_bqqd_yjk%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allwkg_yznkg%></B></td>
          <td><B><%=allwkg_yqkg_wjk%></B></td>
          <td><B><%=allwkg_yqkg_yjk%></B></td>
          <td><B><%=allwkg_yqkg_yqyz%></B></td>
          <td><B><%=allwkg_yqkg_yqyy%></B></td>

          <td bgcolor="#FFFFCC"><B><%=allzsgd_bqxk%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_zszc%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_ybgcyq%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_zqysyq%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_zsyq%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_yqyz%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_yqyy%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_yznwg%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_yc%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_ts%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_bx%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_wjzqk%></B></td>

          <td><B><%=allbqjg_wjs_zc%></B></td>
          <td><B><%=allbqjg_wjs_yq%></B></td>
          <td><B><%=allbqjg_wj_zc%></B></td>
          <td><B><%=allbqjg_wj_yq%></B></td>
        </tr>
        <tr align="center" >
          <td colspan="3"><font color=red><B>分 类 总 计</B></font></td>
          <td colspan="9"><B><%=(allwkg_bqzq_wjk+allwkg_bqzq_yjk+allwkg_bqqd_wjk+allwkg_bqqd_yjk)%></B></td>

          <td colspan="12" bgcolor="#FFFFCC"><B><%=(allzsgd_zszc+allzsgd_ybgcyq+allzsgd_zqysyq+allzsgd_zsyq)%></B></td>

          <td colspan="4"><B><%=(allbqjg_wjs_zc+allbqjg_wjs_yq+allbqjg_wj_zc+allbqjg_wj_yq)%></B></td>
        </tr>

<%}
catch (Exception e) {
	out.print("发生意外: " + e);
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
</table>

&nbsp;<br>
说明：

<BR>本期是指：[<%=sjfw%>]--[<%=sjfw2%>]之间。												
<BR>本期之前是指：[<%=sjfw%>]之前。												
<BR>合同工期：合同竣工－合同开工。												
<BR>实际工期：实际竣工－实际开工（完工） 或 [<%=sjfw2%>]－实际开工（未完工）。												
<BR>合法工期：合同工期＋延期单天数。												
<BR>
1、在[<%=sjfw%>]之前签单，且未交首期款。												
<BR>
2、在[<%=sjfw%>]之前签单，且已交首期款。												
<BR>
3、在[<%=sjfw%>]--[<%=sjfw2%>]之间签单，且未交首期款。 
<BR>
4、在[<%=sjfw%>]--[<%=sjfw2%>]之间签单，且已交首期款。 <BR>
5、开工时间未到，将在一周内开工。
<BR>
6、目前已超过合同开工时间，但未交首期款。
<BR>
7、目前已超过合同开工时间，但已交首期款。
<BR>
8、已交首期款，合同开工时间已过一周。
<BR>
9、已交首期款，合同开工时间已过一月。
<BR>
10、在[<%=sjfw%>]--[<%=sjfw2%>]之间实际开工工地 <BR>
11、未延期的在施工地 <BR>
12、完工未延期，但隐蔽工程延期<BR>
13、完工未延期，但中期验收延期<BR>
14、已完工延期的在施工地 <BR>
15、延期超过一周的在施工地 <BR>
16、延期超过一月的在施工地 <BR>
17、没有延期，按合同完工时间，将在一周内完工工地 <BR>
18、在[<%=sjfw%>]--[<%=sjfw2%>]之间竣工，目前未完结，正常竣工 <BR>
19、在[<%=sjfw%>]--[<%=sjfw2%>]之间竣工，目前未完结，竣工延期  <BR>
20、[<%=sjfw%>]--[<%=sjfw2%>]之间竣工，目前完结，正常竣工 <BR>
21、在[<%=sjfw%>]--[<%=sjfw2%>]之间竣工，目前完结，竣工延期 <BR>
</body>
</html>
