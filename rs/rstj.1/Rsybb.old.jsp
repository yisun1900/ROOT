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

sjfw=cf.firstDay(sjfw);
sjfw2=cf.lastDay(sjfw2);

String sqjzrq=cf.lastDay(cf.addMonth(sjfw,-1));
String bqjzrq=sjfw2;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
int dwflsl=0;
int qxflsl=0;
try {
	conn=cf.getConnection();

	//单位统计分类编码
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM dm_dwtjflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwflsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//在司期限分类编码
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM dm_zsqxflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qxflsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

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
  <B>人员统计表</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>

  <table width="2151" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr align="center" bgcolor="#CCCCCC"> 
      <td  width="40"  rowspan="2" >序号</td>
      <td  width="60"  rowspan="2">大区</td>
      <td  width="90"  rowspan="2">分公司</td>
      <td  width="60"  rowspan="2">月初人数</td>
      <td  colspan="10" >本期人员变动统计</td>
      <td  colspan="<%=dwflsl%>">部门人员统计</td>
      <td  width="60" rowspan="2">月末人数</td>
      <td  colspan="4">性别分类</td>
      <td  colspan="8">学历分类</td>
      <td  colspan="<%=qxflsl%>">在司期限分类</td>
      <td  width="40" rowspan="2">离职率</td>
</tr>
<tr align="center" bgcolor="#CCCCCC">
      <td width="40">入职</td>
      <td  width="40">离职</td>
      <td  width="40">转正</td>
      <td  width="40">升级</td>
      <td  width="40">升职</td>
      <td  width="40">降级</td>
      <td  width="40">降职</td>
      <td  width="40">内部异动</td>
      <td  width="40">调入</td>
      <td  width="40">调出</td>
  <%
	String dwtjflbm=null;
	String dwtjflmc=null;
	ls_sql=" SELECT dwtjflbm,dwtjflmc";
	ls_sql+=" FROM dm_dwtjflbm";
	ls_sql+=" order by dwtjflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dwtjflbm=rs.getString("dwtjflbm");
		dwtjflmc=rs.getString("dwtjflmc");

		%>
		  <td width="40"><%=dwtjflmc%></td>
		<%
	}
	rs.close();
	ps.close();
%>
      <td width="40">男士人数</td>
      <td width="40">占比</td>
      <td width="40">女士人数</td>
      <td width="40">占比</td>

      <td width="40">中专及以下</td>
      <td width="40">占比</td>
      <td width="40">专科人数</td>
      <td width="40">占比</td>
      <td width="40">本科人数</td>
      <td width="40">占比</td>
      <td width="40">硕士及以上</td>
      <td width="40">占比</td>
  
  <%
	String zsqxflbm=null;
	String zsqxflmc=null;
	int qsz=0;
	int zzz=0;
	ls_sql=" SELECT zsqxflbm,zsqxflmc,qsz,zzz";
	ls_sql+=" FROM dm_zsqxflbm";
	ls_sql+=" order by zsqxflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zsqxflbm=rs.getString("zsqxflbm");
		zsqxflmc=rs.getString("zsqxflmc");
		qsz=rs.getInt("qsz");
		zzz=rs.getInt("zzz");

		%>
		  <td width="50"><%=zsqxflmc%></td>
		<%
	}
	rs.close();
	ps.close();
%>
</tr>
<%
	int row=0;

	int rzrszj=0;
	int lzrszj=0;
	int zzrszj=0;
	int sjrszj=0;
	int szrszj=0;
	int jjrszj=0;
	int jzrszj=0;
	int tzrszj=0;
	int drrszj=0;
	int dcrszj=0;

	int ycrszj=0;
	int ymrszj=0;
	
	int nanshirszj=0;
	int nvshirszj=0;
	int zhongzhuanrszj=0;
	int dazhuanrszj=0;
	int benkerszj=0;
	int shuoshirszj=0;

	double nanshibfb=0;
	double nvshibfb=0;
	double zhongzhuanbfb=0;
	double dazhuanbfb=0;
	double benkebfb=0;
	double shuoshibfb=0;

	double lzl=0;
	int bmrs=0;//部门人员统计
	int qxrs=0;//在司期限分类

	String ssdqbm=null;
	String ssdqmc=null;
	
	ls_sql=" SELECT ssdqbm,ssdqmc ";
	ls_sql+=" FROM sq_ssdqbm";
	ls_sql+=" order by ssdqbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ssdqbm=rs.getString("ssdqbm");
		ssdqmc=rs.getString("ssdqmc");

		int rzrsxj=0;
		int lzrsxj=0;
		int zzrsxj=0;
		int sjrsxj=0;
		int szrsxj=0;
		int jjrsxj=0;
		int jzrsxj=0;
		int tzrsxj=0;
		int drrsxj=0;
		int dcrsxj=0;

		int ycrsxj=0;
		int ymrsxj=0;
		
		int nanshirsxj=0;
		int nvshirsxj=0;
		int zhongzhuanrsxj=0;
		int dazhuanrsxj=0;
		int benkersxj=0;
		int shuoshirsxj=0;

		int rzrs=0;
		int lzrs=0;
		int zzrs=0;
		int sjrs=0;
		int szrs=0;
		int jjrs=0;
		int jzrs=0;
		int tzrs=0;
		int drrs=0;
		int dcrs=0;

		int ycrs=0;
		int ymrs=0;
		bmrs=0;//部门人员统计
		
		int nanshirs=0;
		int nvshirs=0;
		int zhongzhuanrs=0;
		int dazhuanrs=0;
		int benkers=0;
		int shuoshirs=0;
		
		//分公司
		String fgsmc=null;
		String fgsbh=null;
		ls_sql="SELECT dwbh,dwmc";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where  dwlx='F0' and ssdqbm='"+ssdqbm+"' and cxbz='N'";
		ls_sql+=" order by dwbh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			fgsbh=rs1.getString("dwbh");
			fgsmc=rs1.getString("dwmc");

			row++;

			//入职
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_yhxxqmjz";
			ls_sql+=" where ssfgs='"+fgsbh+"' and sfzszg in('N','Y')";
			ls_sql+=" and rzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and rzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				rzrs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//离职
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_yhxxqmjz";
			ls_sql+=" where ssfgs='"+fgsbh+"' and sfzszg in('S','T')";
			ls_sql+=" and lzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and lzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				lzrs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//转正
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_yhxxqmjz";
			ls_sql+=" where ssfgs='"+fgsbh+"' and sfzszg in('Y')";
			ls_sql+=" and zzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and zzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				zzrs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//升级
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_ygbdsqb";
			ls_sql+=" where fgsbh='"+fgsbh+"' and bdxz='07'";//01:转正；02:调薪；03:升职；04:降职；05:调职；06:调动；07:升级；08:降级；99:其他
			ls_sql+=" and clzt in('00','03')";//00：不需审批；01：等待审批；02：正在审批；03：审批通过；04：审批取消
			ls_sql+=" and bdsxrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and bdsxrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				sjrs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//升职
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_ygbdsqb";
			ls_sql+=" where fgsbh='"+fgsbh+"' and bdxz='03'";//01:转正；02:调薪；03:升职；04:降职；05:调职；06:调动；07:升级；08:降级；99:其他
			ls_sql+=" and clzt in('00','03')";//00：不需审批；01：等待审批；02：正在审批；03：审批通过；04：审批取消
			ls_sql+=" and bdsxrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and bdsxrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				szrs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//降级
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_ygbdsqb";
			ls_sql+=" where fgsbh='"+fgsbh+"' and bdxz='08'";//01:转正；02:调薪；03:升职；04:降职；05:调职；06:调动；07:升级；08:降级；99:其他
			ls_sql+=" and clzt in('00','03')";//00：不需审批；01：等待审批；02：正在审批；03：审批通过；04：审批取消
			ls_sql+=" and bdsxrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and bdsxrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				jjrs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//降职
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_ygbdsqb";
			ls_sql+=" where fgsbh='"+fgsbh+"' and bdxz='04'";//01:转正；02:调薪；03:升职；04:降职；05:调职；06:调动；07:升级；08:降级；99:其他
			ls_sql+=" and clzt in('00','03')";//00：不需审批；01：等待审批；02：正在审批；03：审批通过；04：审批取消
			ls_sql+=" and bdsxrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and bdsxrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				jzrs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//调职
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_ygbdsqb";
			ls_sql+=" where fgsbh='"+fgsbh+"' and bdxz='05'";//01:转正；02:调薪；03:升职；04:降职；05:调职；06:调动；07:升级；08:降级；99:其他
			ls_sql+=" and clzt in('00','03')";//00：不需审批；01：等待审批；02：正在审批；03：审批通过；04：审批取消
			ls_sql+=" and bdsxrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and bdsxrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				tzrs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//调入
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_ygbdsqb";
			ls_sql+=" where fgsbh='"+fgsbh+"' and bdxz='06'";//01:转正；02:调薪；03:升职；04:降职；05:调职；06:调动；07:升级；08:降级；99:其他
			ls_sql+=" and clzt in('00','03')";//00：不需审批；01：等待审批；02：正在审批；03：审批通过；04：审批取消
			ls_sql+=" and dwbh2 not in(select dwbh from sq_dwxx where ssfgs='"+fgsbh+"')";//不是同一分公司
			ls_sql+=" and bdsxrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and bdsxrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				drrs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//调出
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_ygbdsqb";
			ls_sql+=" where fgsbh!='"+fgsbh+"' and bdxz='06'";//01:转正；02:调薪；03:升职；04:降职；05:调职；06:调动；07:升级；08:降级；99:其他
			ls_sql+=" and clzt in('00','03')";//00：不需审批；01：等待审批；02：正在审批；03：审批通过；04：审批取消
			ls_sql+=" and dwbh in(select dwbh from sq_dwxx where ssfgs='"+fgsbh+"')";//不是同一分公司
			ls_sql+=" and bdsxrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and bdsxrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				dcrs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//月初人数
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_yhxxqmjz";
			ls_sql+=" where ssfgs='"+fgsbh+"' and sfzszg in('Y','N')  ";
			ls_sql+=" and jzrq=TO_DATE('"+sqjzrq+"','YYYY-MM-DD')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				ycrs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//月末人数
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_yhxxqmjz";
			ls_sql+=" where ssfgs='"+fgsbh+"' and sfzszg in('Y','N')  ";
			ls_sql+=" and jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				ymrs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//男士
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_yhxxqmjz";
			ls_sql+=" where ssfgs='"+fgsbh+"' and sfzszg in('Y','N') and xb='M' ";
			ls_sql+=" and jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				nanshirs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//女士
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_yhxxqmjz";
			ls_sql+=" where ssfgs='"+fgsbh+"' and sfzszg in('Y','N') and xb='W' ";
			ls_sql+=" and jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				nvshirs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//中专及以下,01：初中；02：高中；03：中专；04：大专；05：大本；06：硕士；07：博士；99：其它
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_yhxxqmjz";
			ls_sql+=" where ssfgs='"+fgsbh+"' and sfzszg in('Y','N') and xlbm in ('01','02','03') ";
			ls_sql+=" and jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				zhongzhuanrs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//大专人数
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_yhxxqmjz";
			ls_sql+=" where ssfgs='"+fgsbh+"' and sfzszg in('Y','N') and xlbm in ('04') ";
			ls_sql+=" and jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				dazhuanrs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//本科人数
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_yhxxqmjz";
			ls_sql+=" where ssfgs='"+fgsbh+"' and sfzszg in('Y','N') and xlbm in ('05') ";
			ls_sql+=" and jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				benkers=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//硕士及以上
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_yhxxqmjz";
			ls_sql+=" where ssfgs='"+fgsbh+"' and sfzszg in('Y','N') and xlbm in ('06','07') ";
			ls_sql+=" and jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				shuoshirs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			//大区小计
			rzrsxj+=rzrs;
			lzrsxj+=lzrs;
			zzrsxj+=zzrs;
			sjrsxj+=sjrs;
			szrsxj+=szrs;
			jjrsxj+=jjrs;
			jzrsxj+=jzrs;
			tzrsxj+=tzrs;
			drrsxj+=drrs;
			dcrsxj+=dcrs;

			ycrsxj+=ycrs;
			ymrsxj+=ymrs;

			nanshirsxj+=nanshirs;
			nvshirsxj+=nvshirs;
			zhongzhuanrsxj+=zhongzhuanrs;
			dazhuanrsxj+=dazhuanrs;
			benkersxj+=benkers;
			shuoshirsxj+=shuoshirs;

			//总计
			rzrszj+=rzrs;
			lzrszj+=lzrs;
			zzrszj+=zzrs;
			sjrszj+=sjrs;
			szrszj+=szrs;
			jjrszj+=jjrs;
			jzrszj+=jzrs;
			tzrszj+=tzrs;
			drrszj+=drrs;
			dcrszj+=dcrs;

			ycrszj+=ycrs;
			ymrszj+=ymrs;

			nanshirszj+=nanshirs;
			nvshirszj+=nvshirs;
			zhongzhuanrszj+=zhongzhuanrs;
			dazhuanrszj+=dazhuanrs;
			benkerszj+=benkers;
			shuoshirszj+=shuoshirs;

			if (ymrs==0)
			{
				nanshibfb=0;//男士人数占比
				nvshibfb=0;//女士人数占比
				zhongzhuanbfb=0;
				dazhuanbfb=0;
				benkebfb=0;
				shuoshibfb=0;
				lzl=0;
			}
			else{
				nanshibfb=nanshirs*100.0/ymrs;
				nvshibfb=nvshirs*100.0/ymrs;
				zhongzhuanbfb=zhongzhuanrs*100.0/ymrs;
				dazhuanbfb=dazhuanrs*100.0/ymrs;
				benkebfb=benkers*100.0/ymrs;
				shuoshibfb=shuoshirs*100.0/ymrs;
				lzl=lzrs*100.0/ycrs;
			}

			%>
			<tr align="center" bgcolor="#FFFFFF"> 
			  <td ><%=row%></td>
			  <td ><%=ssdqmc%></td>
			  <td ><%=fgsmc%></td>
			  <td ><%=ycrs%></td>
			  <td ><%=rzrs%></td>
			  <td ><%=lzrs%></td>
			  <td ><%=zzrs%></td>
			  <td ><%=sjrs%></td>
			  <td ><%=szrs%></td>
			  <td ><%=jjrs%></td>
			  <td ><%=jzrs%></td>
			  <td ><%=tzrs%></td>
			  <td ><%=drrs%></td>
			  <td ><%=dcrs%></td>
				
			  <%
				//部门人员统计
				ls_sql=" SELECT dwtjflbm,dwtjflmc";
				ls_sql+=" FROM dm_dwtjflbm";
				ls_sql+=" order by dwtjflbm";
				ps2= conn.prepareStatement(ls_sql);
				rs2 =ps2.executeQuery();
				while (rs2.next())
				{
					dwtjflbm=rs2.getString("dwtjflbm");
					dwtjflmc=rs2.getString("dwtjflmc");

					ls_sql="select count(ygbh)";
					ls_sql+=" FROM rs_yhxxqmjz,sq_dwxx";
					ls_sql+=" where rs_yhxxqmjz.ssfgs='"+fgsbh+"' and rs_yhxxqmjz.sfzszg in('Y','N')";
					ls_sql+=" and rs_yhxxqmjz.dwbh=sq_dwxx.dwbh";
					ls_sql+=" and sq_dwxx.dwflbm in(select dwflbm from dm_dwflbm where dwtjflbm='"+dwtjflbm+"')";
					ls_sql+=" and rs_yhxxqmjz.jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
//					out.println("<P>"+ls_sql);
					ps3= conn.prepareStatement(ls_sql);
					rs3 =ps3.executeQuery();
					if (rs3.next())
					{
						bmrs=rs3.getInt(1);

						%>
						  <td ><%=bmrs%></td>
						<%
					}
					rs3.close();
					ps3.close();

				}
				rs2.close();
				ps2.close();

			  %>

			  <td ><%=ymrs%></td>
			  <td ><%=nanshirs%></td>
			  <td ><%=cf.round(nanshibfb,1)%>%</td>
			  <td ><%=nvshirs%></td>
			  <td ><%=cf.round(nvshibfb,1)%>%</td>
			  <td ><%=zhongzhuanrs%></td>
			  <td ><%=cf.round(zhongzhuanbfb,1)%>%</td>
			  <td ><%=dazhuanrs%></td>
			  <td ><%=cf.round(dazhuanbfb,1)%>%</td>
			  <td ><%=benkers%></td>
			  <td ><%=cf.round(benkebfb,1)%>%</td>
			  <td ><%=shuoshirs%></td>
			  <td ><%=cf.round(shuoshibfb,1)%>%</td>


			  <%
				zsqxflbm=null;
				zsqxflmc=null;
				qsz=0;
				zzz=0;
				ls_sql=" SELECT zsqxflbm,zsqxflmc,qsz,zzz";
				ls_sql+=" FROM dm_zsqxflbm";
				ls_sql+=" order by zsqxflbm";
				ps2= conn.prepareStatement(ls_sql);
				rs2 =ps2.executeQuery();
				while (rs2.next())
				{
					zsqxflbm=rs2.getString("zsqxflbm");
					zsqxflmc=rs2.getString("zsqxflmc");
					qsz=rs2.getInt("qsz");
					zzz=rs2.getInt("zzz");

					ls_sql="select count(ygbh)";
					ls_sql+=" FROM rs_yhxxqmjz";
					ls_sql+=" where rs_yhxxqmjz.ssfgs='"+fgsbh+"' and rs_yhxxqmjz.sfzszg in('Y','N')";
					ls_sql+=" and MONTHS_BETWEEN(sysdate,rzsj)>="+qsz;
					ls_sql+=" and MONTHS_BETWEEN(sysdate,rzsj)<"+zzz;
					ls_sql+=" and jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
//					out.println("<P>"+ls_sql);
					ps3= conn.prepareStatement(ls_sql);
					rs3 =ps3.executeQuery();
					if (rs3.next())
					{
						qxrs=rs3.getInt(1);

						%>
						  <td ><%=qxrs%></td>
						<%
					}
					rs3.close();
					ps3.close();
				}
				rs2.close();
				ps2.close();
			  %>

			  <td ><%=cf.round(lzl,1)%>%</td>
			</tr>
			<%	
		}
		rs1.close();
		ps1.close();

		if (ymrsxj==0)
		{
			nanshibfb=0;//男士人数占比
			nvshibfb=0;//女士人数占比
			zhongzhuanbfb=0;
			dazhuanbfb=0;
			benkebfb=0;
			shuoshibfb=0;
			lzl=0;
		}
		else{
			nanshibfb=nanshirsxj*100.0/ymrsxj;
			nvshibfb=nvshirsxj*100.0/ymrsxj;
			zhongzhuanbfb=zhongzhuanrsxj*100.0/ymrsxj;
			dazhuanbfb=dazhuanrsxj*100.0/ymrsxj;
			benkebfb=benkersxj*100.0/ymrsxj;
			shuoshibfb=shuoshirsxj*100.0/ymrsxj;
			lzl=lzrsxj*100.0/ycrsxj;
		}
%>
    <tr align="center" bgcolor="#E8E8FF"> 
      <td colspan="3" ><B>『<%=ssdqmc%>』合计</B></td>
			
	  <td ><%=ycrsxj%></td>
	  <td ><%=rzrsxj%></td>
	  <td ><%=lzrsxj%></td>
	  <td ><%=zzrsxj%></td>
	  <td ><%=sjrsxj%></td>
	  <td ><%=szrsxj%></td>
	  <td ><%=jjrsxj%></td>
	  <td ><%=jzrsxj%></td>
	  <td ><%=tzrsxj%></td>
	  <td ><%=drrsxj%></td>
	  <td ><%=dcrsxj%></td>
		  
	  <%
		//部门人员统计
		ls_sql=" SELECT dwtjflbm,dwtjflmc";
		ls_sql+=" FROM dm_dwtjflbm";
		ls_sql+=" order by dwtjflbm";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			dwtjflbm=rs2.getString("dwtjflbm");
			dwtjflmc=rs2.getString("dwtjflmc");

			ls_sql="select count(ygbh)";
			ls_sql+=" FROM rs_yhxxqmjz,sq_dwxx";
			ls_sql+=" where sq_dwxx.ssdqbm='"+ssdqbm+"' and rs_yhxxqmjz.sfzszg in('Y','N')";
			ls_sql+=" and rs_yhxxqmjz.dwbh=sq_dwxx.dwbh";
			ls_sql+=" and sq_dwxx.dwflbm in(select dwflbm from dm_dwflbm where dwtjflbm='"+dwtjflbm+"')";
			ls_sql+=" and rs_yhxxqmjz.jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
//			out.println("<P>"+ls_sql);
			ps3= conn.prepareStatement(ls_sql);
			rs3 =ps3.executeQuery();
			if (rs3.next())
			{
				bmrs=rs3.getInt(1);

				%>
				  <td ><%=bmrs%></td>
				<%
			}
			rs3.close();
			ps3.close();

		}
		rs2.close();
		ps2.close();

	  %>
			
	  <td ><%=ymrsxj%></td>

	  <td ><%=nanshirsxj%></td>
	  <td ><%=cf.round(nanshibfb,1)%>%</td>
	  <td ><%=nvshirsxj%></td>
	  <td ><%=cf.round(nvshibfb,1)%>%</td>

	  <td ><%=zhongzhuanrsxj%></td>
	  <td ><%=cf.round(zhongzhuanbfb,1)%>%</td>
	  <td ><%=dazhuanrsxj%></td>
	  <td ><%=cf.round(dazhuanbfb,1)%>%</td>
	  <td ><%=benkersxj%></td>
	  <td ><%=cf.round(benkebfb,1)%>%</td>
	  <td ><%=shuoshirsxj%></td>
	  <td ><%=cf.round(shuoshibfb,1)%>%</td>

	  <%
		zsqxflbm=null;
		zsqxflmc=null;
		qsz=0;
		zzz=0;
		ls_sql=" SELECT zsqxflbm,zsqxflmc,qsz,zzz";
		ls_sql+=" FROM dm_zsqxflbm";
		ls_sql+=" order by zsqxflbm";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			zsqxflbm=rs2.getString("zsqxflbm");
			zsqxflmc=rs2.getString("zsqxflmc");
			qsz=rs2.getInt("qsz");
			zzz=rs2.getInt("zzz");

			ls_sql="select count(ygbh)";
			ls_sql+=" FROM rs_yhxxqmjz,sq_dwxx";
			ls_sql+=" where sq_dwxx.ssdqbm='"+ssdqbm+"' and rs_yhxxqmjz.sfzszg in('Y','N')";
			ls_sql+=" and rs_yhxxqmjz.dwbh=sq_dwxx.dwbh";
			ls_sql+=" and MONTHS_BETWEEN(sysdate,rzsj)>="+qsz;
			ls_sql+=" and MONTHS_BETWEEN(sysdate,rzsj)<"+zzz;
			ls_sql+=" and rs_yhxxqmjz.jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
//			out.println("<P>"+ls_sql);
			ps3= conn.prepareStatement(ls_sql);
			rs3 =ps3.executeQuery();
			if (rs3.next())
			{
				qxrs=rs3.getInt(1);

				%>
				  <td ><%=qxrs%></td>
				<%
			}
			rs3.close();
			ps3.close();
		}
		rs2.close();
		ps2.close();
	  %>

	  <td ><%=cf.round(lzl,1)%>%</td>
	</tr>
<%

	}
	rs.close();
	ps.close();

	if (ymrszj==0)
	{
		nanshibfb=0;//男士人数占比
		nvshibfb=0;//女士人数占比
		zhongzhuanbfb=0;
		dazhuanbfb=0;
		benkebfb=0;
		shuoshibfb=0;
		lzl=0;
	}
	else{
		nanshibfb=nanshirszj*100.0/ymrszj;
		nvshibfb=nvshirszj*100.0/ymrszj;
		zhongzhuanbfb=zhongzhuanrszj*100.0/ymrszj;
		dazhuanbfb=dazhuanrszj*100.0/ymrszj;
		benkebfb=benkerszj*100.0/ymrszj;
		shuoshibfb=shuoshirszj*100.0/ymrszj;
		lzl=lzrszj*100.0/ycrszj;
	}
%>

    <tr align="center" bgcolor="#CCCCCC"> 
      <td colspan="3" ><B>总 计</B></td>
			
	  <td ><%=ycrszj%></td>
	  <td ><%=rzrszj%></td>
	  <td ><%=lzrszj%></td>
	  <td ><%=zzrszj%></td>
	  <td ><%=sjrszj%></td>
	  <td ><%=szrszj%></td>
	  <td ><%=jjrszj%></td>
	  <td ><%=jzrszj%></td>
	  <td ><%=tzrszj%></td>
	  <td ><%=drrszj%></td>
	  <td ><%=dcrszj%></td>
		  
	  <%
		//部门人员统计
		ls_sql=" SELECT dwtjflbm,dwtjflmc";
		ls_sql+=" FROM dm_dwtjflbm";
		ls_sql+=" order by dwtjflbm";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			dwtjflbm=rs2.getString("dwtjflbm");
			dwtjflmc=rs2.getString("dwtjflmc");

			ls_sql="select count(ygbh)";
			ls_sql+=" FROM rs_yhxxqmjz,sq_dwxx";
			ls_sql+=" where rs_yhxxqmjz.sfzszg in('Y','N')";
			ls_sql+=" and rs_yhxxqmjz.dwbh=sq_dwxx.dwbh";
			ls_sql+=" and sq_dwxx.dwflbm in(select dwflbm from dm_dwflbm where dwtjflbm='"+dwtjflbm+"')";
			ls_sql+=" and rs_yhxxqmjz.jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
//			out.println("<P>"+ls_sql);
			ps3= conn.prepareStatement(ls_sql);
			rs3 =ps3.executeQuery();
			if (rs3.next())
			{
				bmrs=rs3.getInt(1);

				%>
				  <td ><%=bmrs%></td>
				<%
			}
			rs3.close();
			ps3.close();

		}
		rs2.close();
		ps2.close();

	  %>
			
	  <td ><%=ymrszj%></td>

	  <td ><%=nanshirszj%></td>
	  <td ><%=cf.round(nanshibfb,1)%>%</td>
	  <td ><%=nvshirszj%></td>
	  <td ><%=cf.round(nvshibfb,1)%>%</td>

	  <td ><%=zhongzhuanrszj%></td>
	  <td ><%=cf.round(zhongzhuanbfb,1)%>%</td>
	  <td ><%=dazhuanrszj%></td>
	  <td ><%=cf.round(dazhuanbfb,1)%>%</td>
	  <td ><%=benkerszj%></td>
	  <td ><%=cf.round(benkebfb,1)%>%</td>
	  <td ><%=shuoshirszj%></td>
	  <td ><%=cf.round(shuoshibfb,1)%>%</td>

	  <%
		zsqxflbm=null;
		zsqxflmc=null;
		qsz=0;
		zzz=0;
		ls_sql=" SELECT zsqxflbm,zsqxflmc,qsz,zzz";
		ls_sql+=" FROM dm_zsqxflbm";
		ls_sql+=" order by zsqxflbm";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			zsqxflbm=rs2.getString("zsqxflbm");
			zsqxflmc=rs2.getString("zsqxflmc");
			qsz=rs2.getInt("qsz");
			zzz=rs2.getInt("zzz");

			ls_sql="select count(ygbh)";
			ls_sql+=" FROM rs_yhxxqmjz";
			ls_sql+=" where rs_yhxxqmjz.sfzszg in('Y','N')";
			ls_sql+=" and MONTHS_BETWEEN(sysdate,rzsj)>="+qsz;
			ls_sql+=" and MONTHS_BETWEEN(sysdate,rzsj)<"+zzz;
			ls_sql+=" and jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
//			out.println("<P>"+ls_sql);
			ps3= conn.prepareStatement(ls_sql);
			rs3 =ps3.executeQuery();
			if (rs3.next())
			{
				qxrs=rs3.getInt(1);

				%>
				  <td ><%=qxrs%></td>
				<%
			}
			rs3.close();
			ps3.close();
		}
		rs2.close();
		ps2.close();
	  %>

	  <td ><%=cf.round(lzl,1)%>%</td>
	</tr>

</table>

</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e+ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close();
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close();
		if (rs3!= null) rs3.close(); 
		if (ps3!= null) ps3.close();
		if (conn != null) cf.close(conn); 
 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 

	}
}
%>

