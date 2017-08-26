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
PreparedStatement ps4=null;
ResultSet rs4=null;
int dwflsl=0;
int qxflsl=0;
try {
	conn=cf.getConnection();

	//单位统计分类编码
	/*ls_sql=" SELECT count(*)";
	ls_sql+=" FROM dm_dwtjflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwflsl=rs.getInt(1);
	}
	rs.close();
	ps.close();*/

	//改动过的编码
	String dwtjflbm=null;
	String dwtjflmc=null;
	int count=0;
	ls_sql=" SELECT dwtjflbm,dwtjflmc";
	ls_sql+=" FROM dm_dwtjflbm";
	ls_sql+=" order by dwtjflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dwtjflbm=rs.getString("dwtjflbm");
		//dwtjflmc=rs.getString("dwtjflmc");

		count=count+1;
		ls_sql="select count(distinct xzzwbm) from rs_yhxxqmjz where dwbh in (select dwbh from sq_dwxx where dwflbm in (select dwflbm from dm_dwflbm where dwtjflbm='"+dwtjflbm+"'))";
		ls_sql+=" and rs_yhxxqmjz.jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
		ls_sql+=" and rs_yhxxqmjz.sfzszg in('Y','N')";
		ls_sql+=" and rs_yhxxqmjz.ssfgs='99999'  ";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		if (rs2.next())
		{
			count=count+rs2.getInt(1);
		}
		rs2.close();
		ps2.close();
	}
	rs.close();
	ps.close();

	dwflsl=count;

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

.STYLE_TD {
	align:center;
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

  <table width="<%=(dwflsl+qxflsl)*50+800%>" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr align="center" bgcolor="#CCCCCC"> 
      <td  width="90"  rowspan="3">公司名称</td>
      <td  width="60"  rowspan="3">月初人数</td>
      <td  colspan="10" >本期人员变动统计</td>
      <td  width=<%=dwflsl*50%> colspan="<%=dwflsl%>">部门人员统计</td>
      <td  width="60" rowspan="3">月末人数</td>
      <td  colspan="4">性别分类</td>
      <td  colspan="8">学历分类</td>
      <td  width=<%=qxflsl*50%> colspan="<%=qxflsl%>" align=center>在司期限分类</td>
      <td  width="50" rowspan="3">离职率</td>
</tr>
<tr align="center" bgcolor="#CCCCCC">
      <td width="40" rowspan="2">入职</td>
      <td  width="40" rowspan="2">离职</td>
      <td  width="40" rowspan="2">转正</td>
      <td  width="40" rowspan="2">升级</td>
      <td  width="40" rowspan="2">升职</td>
      <td  width="40" rowspan="2">降级</td>
      <td  width="40" rowspan="2">降职</td>
      <td  width="40" rowspan="2">内部异动</td>
      <td  width="40" rowspan="2">调入</td>
      <td  width="40" rowspan="2">调出</td>
  <%
	/*String dwtjflbm=null;
	String dwtjflmc=null;*/
	int count2=0;
	ls_sql=" SELECT dwtjflbm,dwtjflmc";
	ls_sql+=" FROM dm_dwtjflbm";
	ls_sql+=" order by dwtjflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dwtjflbm=rs.getString("dwtjflbm");
		dwtjflmc=rs.getString("dwtjflmc");
		
		ls_sql="select count(distinct(xzzwbm)) ";
		ls_sql+=" from rs_yhxxqmjz ";
		ls_sql+=" where dwbh in (select dwbh from sq_dwxx where dwflbm in (select dwflbm from dm_dwflbm where dwtjflbm='"+dwtjflbm+"'))";
		ls_sql+=" and rs_yhxxqmjz.jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
		ls_sql+=" and rs_yhxxqmjz.sfzszg in('Y','N')";
		ls_sql+=" and rs_yhxxqmjz.ssfgs='99999'  ";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		if (rs2.next())
		{
			count2=rs2.getInt(1)+1;
			if(rs2.getInt(1)==0)count2=1;
		}
		rs2.close();
		ps2.close();

		%>
		  <td align=center colspan="<%=count2%>"><%=dwtjflmc%></td>
		<%
			
	}
	rs.close();
	ps.close();
%>
      <td width="40" rowspan="2">男士人数</td>
      <td width="40" rowspan="2">占比</td>
      <td width="40" rowspan="2">女士人数</td>
      <td width="40" rowspan="2">占比</td>

      <td width="40" rowspan="2">中专及以下</td>
      <td width="40" rowspan="2">占比</td>
      <td width="40" rowspan="2">专科人数</td>
      <td width="40" rowspan="2">占比</td>
      <td width="40" rowspan="2">本科人数</td>
      <td width="40" rowspan="2">占比</td>
      <td width="40" rowspan="2">硕士及以上</td>
      <td width="40" rowspan="2">占比</td>
  
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
		  <td width="50" rowspan="2"><%=zsqxflmc%></td>
		<%
	}
	rs.close();
	ps.close();
%>
</tr>
<tr align="center" bgcolor="#CCCCCC">

<%	//列出职务
	String xzzwmc=null;

	ls_sql=" SELECT dwtjflbm,dwtjflmc";
	ls_sql+=" FROM dm_dwtjflbm";
	ls_sql+=" order by dwtjflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dwtjflbm=rs.getString("dwtjflbm");
		//dwtjflmc=rs.getString("dwtjflmc");

		ls_sql=" select distinct xzzwbm from rs_yhxxqmjz where dwbh in (select dwbh from sq_dwxx where dwflbm in (select dwflbm from dm_dwflbm where dwtjflbm='"+dwtjflbm+"')) ";
		ls_sql+=" and rs_yhxxqmjz.jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
		ls_sql+=" and rs_yhxxqmjz.sfzszg in('Y','N')";
		ls_sql+=" and rs_yhxxqmjz.ssfgs='99999' and xzzwbm is not null ";
		ls_sql+=" order by xzzwbm";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			xzzwmc=rs2.getString("xzzwbm");

			%>
			<td width="40"><%=xzzwmc%></td>
			<%
		}
		ps2.close();
		rs2.close();
		%>
			<td width="40">部门小计</td>
		<%	
	}
	ps.close();
	rs.close();


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
		String fgsmc="总部";
		String fgsbh="99999";
		

			//入职
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM rs_yhxxqmjz";
//			ls_sql+=" where ssfgs='"+fgsbh+"' and sfzszg in('N','Y')";
			ls_sql+=" where ssfgs='"+fgsbh+"' ";
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
			    String xzzwbm=null;
				ls_sql="SELECT dwtjflbm,dwtjflmc";
				ls_sql+=" FROM dm_dwtjflbm";
				ls_sql+=" order by dwtjflbm";
				ps2= conn.prepareStatement(ls_sql);
				rs2 =ps2.executeQuery();
				while (rs2.next())
				{
					dwtjflbm=rs2.getString("dwtjflbm");
					dwtjflmc=rs2.getString("dwtjflmc");

					ls_sql=" select distinct xzzwbm from rs_yhxxqmjz where dwbh in (select dwbh from sq_dwxx where dwflbm in (select dwflbm from dm_dwflbm where dwtjflbm='"+dwtjflbm+"'))";
					ls_sql+=" and rs_yhxxqmjz.jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
					ls_sql+=" and rs_yhxxqmjz.sfzszg in('Y','N')";
					ls_sql+=" and rs_yhxxqmjz.ssfgs='99999' and  xzzwbm is not null";
					ls_sql+=" order by xzzwbm";
					ps3= conn.prepareStatement(ls_sql);
					rs3 =ps3.executeQuery();
					while(rs3.next())
					{
						xzzwbm=rs3.getString("xzzwbm");

						ls_sql="select count(ygbh)";
						ls_sql+=" FROM rs_yhxxqmjz,sq_dwxx";
						ls_sql+=" where rs_yhxxqmjz.ssfgs='"+fgsbh+"' and rs_yhxxqmjz.sfzszg in('Y','N')";
						ls_sql+=" and rs_yhxxqmjz.dwbh=sq_dwxx.dwbh";
						ls_sql+=" and sq_dwxx.dwflbm in(select dwflbm from dm_dwflbm where dwtjflbm='"+dwtjflbm+"')";
						ls_sql+=" and rs_yhxxqmjz.jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
						ls_sql+=" and rs_yhxxqmjz.xzzwbm='"+xzzwbm+"'";
	//					out.println("<P>"+ls_sql);
						ps4= conn.prepareStatement(ls_sql);
						rs4 =ps4.executeQuery();
						if (rs4.next())
						{
							bmrs=rs4.getInt(1);
							%>
							  <td ><%=bmrs%></td>
							<%
						}
						rs4.close();
						ps4.close();
					}
					rs3.close();
					ps3.close();

					ls_sql="select count(ygbh)";
					ls_sql+=" FROM rs_yhxxqmjz,sq_dwxx";
					ls_sql+=" where rs_yhxxqmjz.ssfgs='"+fgsbh+"' and rs_yhxxqmjz.sfzszg in('Y','N')";
					ls_sql+=" and rs_yhxxqmjz.dwbh=sq_dwxx.dwbh";
					ls_sql+=" and sq_dwxx.dwflbm in(select dwflbm from dm_dwflbm where dwtjflbm='"+dwtjflbm+"')";
					ls_sql+=" and rs_yhxxqmjz.jzrq=TO_DATE('"+bqjzrq+"','YYYY-MM-DD')";
					ps4= conn.prepareStatement(ls_sql);
					rs4 =ps4.executeQuery();
					if (rs4.next())
					{
						bmrs=rs4.getInt(1);

						%>
						  <td ><%=bmrs%></td>
						<%
					}
					rs4.close();
					ps4.close();
				}
				rs2.close();
				ps2.close();

			  %>

			  <td ><a href="Sq_yhxxList.jsp?ssfgs=<%=fgsbh%>&sflz=1" title="点击查看明细" target="_back"><%=ymrs%></a></td>
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
		if (rs4!= null) rs4.close(); 
		if (ps4!= null) ps4.close();
		if (conn != null) cf.close(conn); 
 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 

	}
}
%>


