<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>

<%
String zjxxh=request.getParameter("zjxxh");
String khbh=request.getParameter("khbh");
String bjjb=request.getParameter("bjjb");

if (zjxxh.equals(""))
{
	return;
}

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
String bgcolor="";
String slstr=null;

int xmpx=0;
double dj=0;

int fjsl=0;
String[] fjbm=null;
String[] fjmc=null;
double sl=0;

int allw=433;

try {
	conn=cf.getConnection();

	String bjbbh=null;
	String ssfgs=null;
	String hxbm=null;
	ls_sql="select bjbbh,ssfgs,hxbm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
		hxbm=rs.getString("hxbm");
	}
	rs.close();
	ps.close();

	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<form method="POST" name="listform" action="" >
<input type="hidden" name="zjxxh" value="<%=zjxxh%>" >

  <table border="0" cellspacing="1" bgcolor="#999999" cellpadding="1" width="150%" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td width="5%">结构位置</td>
	  <td width="12%">主材升级</td>
	  <td width="3%">&nbsp;</td>
	  <td width="4%">级别</td>
	  <td width="6%">产品类别</td>
	  <td width="3%">类型</td>
	  <td width="3%">退补</td>
	  <td width="5%">品牌</td>
	  <td width="7%">名称</td>
	  <td width="8%">型号</td>
	  <td width="4%">下单数量</td>
	  <td width="3%">必选项</td>
	  <td width="4%">更换主材</td>
	  <td width="4%">实际数量</td>
	  <td width="5%">限制数量</td>
	  <td width="4%">标准数量</td>
	  <td width="4%">升级收费</td>
	<td  width="4%">是否可减免</td>
	<td  width="4%">允许减免数量</td>
	<td  width="4%">实际减免数量</td>
	<td  width="24%">是否可换</td>
	</tr>
<%
	String lx=null;
	String lxmc=null;
	String sxh=null;
	double getsl=0;
	String cpbm=null;
	String cpmc=null;
	String ppmc=null;
	String xh=null;
	String zclx=null;

	int row=0;//同房间内行号

	int rowspan=0;


  
	String jgwzbm=null;
	String tccplbbm=null;
	String tccplbmc=null;
	double sjsl=0;
	double bzsl=0;
	String sfxzsl=null;
	String sfbxx=null;
	String sfyxsj=null;
	String sfyxsjMc=null;
	String bjjbmc=null;
	String khbjjbbm=null;
	String zcbjjbbm=null;
	String tcsjflbm=null;
	String tcsjflmc=null;
	String sjsfycx=null;
	double sjjmsl=0;

	ls_sql="SELECT distinct jgwzbm";
	ls_sql+=" FROM bj_khzcxmxjh";
    ls_sql+=" where bj_khzcxmxjh.zjxxh='"+zjxxh+"'";
    ls_sql+=" order by bj_khzcxmxjh.jgwzbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		jgwzbm=rs1.getString("jgwzbm");

		//同房间【类别数量】
		int fjxlsl=0;//未选产品小类数量
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzcxmxjh";
		ls_sql+=" where bj_khzcxmxjh.zjxxh='"+zjxxh+"' and bj_khzcxmxjh.jgwzbm='"+jgwzbm+"'";
		ls_sql+=" and tccplbbm not in(select tccplbbm";
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"'";
		ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
		ls_sql+=" and (bj_khzcxmh.zclx in('1','2')";//主材类型 1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
		ls_sql+=" OR (bj_khzcxmh.zclx in('3','4')";//主材类型 1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
		ls_sql+=" and bj_khzcxmh.ddcljjfs in('1')))  )";//0：非大店材料；1：套外升级（补差价）；2：套外升级（独立计价）；3：套餐选配
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fjxlsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		int fjcpsl=0;//房间内产品数量
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"'";
		ls_sql+=" and (bj_khzcxmh.zclx in('1','2')";//主材类型 1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
		ls_sql+=" OR (bj_khzcxmh.zclx in('3','4')";//主材类型 1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
		ls_sql+=" and bj_khzcxmh.ddcljjfs in('1')))";//0：非大店材料；1：套外升级（补差价）；2：套外升级（独立计价）；3：套餐选配
		ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fjcpsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		int count=fjcpsl+fjxlsl;

		row=0;//同房间内行号

		ls_sql="SELECT distinct bj_khzcxmxjh.tcsjflbm,tcsjflmc";
		ls_sql+=" FROM bj_khzcxmxjh,bj_tcsjflbm ";
		ls_sql+=" where bj_khzcxmxjh.tcsjflbm=bj_tcsjflbm.tcsjflbm";
		ls_sql+=" and bj_khzcxmxjh.zjxxh='"+zjxxh+"' and bj_khzcxmxjh.jgwzbm='"+jgwzbm+"'";
		ls_sql+=" order by bj_khzcxmxjh.tcsjflbm";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			tcsjflbm=rs2.getString("tcsjflbm");
			tcsjflmc=cf.fillNull(rs2.getString("tcsjflmc"));


			//同升级分类【类别数量】
			int sjflxlsl=0;//升级分类未选产品小类数量
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM bj_khzcxmxjh";
			ls_sql+=" where bj_khzcxmxjh.zjxxh='"+zjxxh+"' and bj_khzcxmxjh.jgwzbm='"+jgwzbm+"' and bj_khzcxmxjh.tcsjflbm='"+tcsjflbm+"'";
			ls_sql+=" and tccplbbm not in(select tccplbbm";
			ls_sql+=" FROM bj_khzcxmh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"'";
			ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
			ls_sql+=" and (bj_khzcxmh.zclx in('1','2')";//主材类型 1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
			ls_sql+=" OR (bj_khzcxmh.zclx in('3','4')";//主材类型 1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
			ls_sql+=" and bj_khzcxmh.ddcljjfs in('1')))  )";//0：非大店材料；1：套外升级（补差价）；2：套外升级（独立计价）；3：套餐选配
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sjflxlsl=rs.getInt(1);
			}
			rs.close();
			ps.close();

			int sjflcpsl=0;//升级分类产品数量
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM bj_khzcxmh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"'";
			ls_sql+=" and (bj_khzcxmh.zclx in('1','2')";//主材类型 1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
			ls_sql+=" OR (bj_khzcxmh.zclx in('3','4')";//主材类型 1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
			ls_sql+=" and bj_khzcxmh.ddcljjfs in('1')))";//0：非大店材料；1：套外升级（补差价）；2：套外升级（独立计价）；3：套餐选配
			ls_sql+=" and tccplbbm in(select tccplbbm from bj_khzcxmxjh where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"')";
			ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sjflcpsl=rs.getInt(1);
			}
			rs.close();
			ps.close();
			
			int count1=sjflxlsl+sjflcpsl;
			
			int row1=0;
			
			//套餐升级分类编码:不为空
			String jldw=null;
			String sfkjm=null;
			String sfkjmStr=null;
			double yxjmzdsl=0;
			String sfkgh=null;
			String sfkghStr=null;
			double khzdsl=0;
			String jmfl=null;
			ls_sql="SELECT bj_khzcxmxjh.jmfl,bj_khzcxmxjh.sjsfycx,bj_khzcxmxjh.khbjjbbm,bj_khzcxmxjh.bjjbbm,bj_khzcxmxjh.tccplbbm,clxlmc,sjsl,bzsl,DECODE(bj_khzcxmxjh.sfxzsl,'1','超量加价','2','不可超量','3','无限制') sfxzsl,DECODE(sfbxx,'Y','必选','N','') sfbxx,sfyxsj,DECODE(sfyxsj,'Y','收费','N','否') sfyxsjMc";
			ls_sql+=" ,sjjmsl,jldw,bj_khzcxmxjh.sfkjm,DECODE(bj_khzcxmxjh.sfkjm,'1','不可','2','可减免') sfkjmStr,bj_khzcxmxjh.yxjmzdsl,sfkgh,DECODE(sfkgh,'1','不可换','2','可换') sfkghStr,khzdsl";
			ls_sql+=" FROM bj_khzcxmxjh,jxc_clxlbm ";
			ls_sql+=" where bj_khzcxmxjh.tccplbbm=jxc_clxlbm.clxlbm(+) ";
			ls_sql+=" and bj_khzcxmxjh.zjxxh='"+zjxxh+"' and bj_khzcxmxjh.jgwzbm='"+jgwzbm+"' and bj_khzcxmxjh.tcsjflbm='"+tcsjflbm+"'";
			ls_sql+=" order by jxc_clxlbm.cldlmc,bj_khzcxmxjh.tccplbbm";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				jmfl=cf.fillNull(rs.getString("jmfl"));
				sjsfycx=cf.fillNull(rs.getString("sjsfycx"));
				tccplbbm=rs.getString("tccplbbm");
				tccplbmc=rs.getString("clxlmc");
				sjsl=rs.getDouble("sjsl");
				bzsl=rs.getDouble("bzsl");
				sfxzsl=rs.getString("sfxzsl");
				sfbxx=cf.fillNull(rs.getString("sfbxx"));
				sfyxsj=rs.getString("sfyxsj");
				sfyxsjMc=rs.getString("sfyxsjMc");
				khbjjbbm=rs.getString("khbjjbbm");
				zcbjjbbm=rs.getString("bjjbbm");

				sjjmsl=rs.getDouble("sjjmsl");
				jldw=cf.fillNull(rs.getString("jldw"));
				sfkjm=cf.fillNull(rs.getString("sfkjm"));
				sfkjmStr=cf.fillNull(rs.getString("sfkjmStr"));
				yxjmzdsl=rs.getDouble("yxjmzdsl");
				sfkgh=cf.fillNull(rs.getString("sfkgh"));
				sfkghStr=cf.fillNull(rs.getString("sfkghStr"));
				khzdsl=rs.getDouble("khzdsl");


				ls_sql="SELECT bjjbmc";
				ls_sql+=" FROM bdm_bjjbbm";
				ls_sql+=" where bjjbbm='"+zcbjjbbm+"'";
				ps3= conn.prepareStatement(ls_sql);
				rs3 =ps3.executeQuery();
				if (rs3.next())
				{
					bjjbmc=rs3.getString(1);
				}
				rs3.close();
				ps3.close();


				sfkjm="1";


				if (sjsfycx.equals("2") || sjsfycx.equals("3"))//1：无促销；2：无数量限制促销；3：有数量限制促销
				{
					bjjbmc=bjjbmc+"(打折)";
				}

				if (!khbjjbbm.equals(zcbjjbbm))
				{
					bjjbmc="<font color=\"#FF0000\"><B>"+bjjbmc+"</B></font>";
				}

				int xlcpsl=0;//小类产品数量
				ls_sql="SELECT count(*)";
				ls_sql+=" FROM bj_khzcxmh  ";
				ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
				ls_sql+=" and ( zclx in('1','2')";//主材类型 1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
				ls_sql+=" OR (zclx in('3','4')";//主材类型 1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
				ls_sql+=" and ddcljjfs in('1')) )";//0：非大店材料；1：套外升级（补差价）；2：套外升级（独立计价）；3：套餐选配
				ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
				ps3= conn.prepareStatement(ls_sql);
				rs3 =ps3.executeQuery();
				if (rs3.next())
				{
					xlcpsl=rs3.getInt(1);
				}
				rs3.close();
				ps3.close();

				if (xlcpsl==0)//小类未选择产品
				{
					row++;//房间行号
					row1++;//升级分类行号

					if (row%2==0)
					{
						bgcolor="#E8E8FF";
					}
					else{
						bgcolor="#FFFFFF";
					}

					if (row==1)//房间内第一行
					{
						//输出每行数据
						%>
						<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td rowspan="<%=count%>"><%=jgwzbm%></td>
						  <td align="right"  rowspan="<%=count1%>"><%=tcsjflmc%>：
							  <a href="zcsj.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">升级</a>
							  <a href="zcjj.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">降级</a>
							  <a href="hyjb.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">还原</a>
						  </td>
							<%

							if (sfkjm.equals("2"))//1：不可减免；2：可减免
							{
								if (sjjmsl>0)//已减免
								{
									%>
									  <td  ><a href="qxzcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">取消减免</a></td>
									<%
								}
								else{
									%>
									  <td  ><a href="zcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">减免</a></td>
									<%
								}
							}
							else{
								%>
								<td  >&nbsp;</td>
								<%
							}
							%>							

						  <td><%=bjjbmc%></td>
						  <td><%=tccplbmc%></td>

							  <td>&nbsp;</td>
							  <td>&nbsp;</td>
							  <td>&nbsp;</td>
							  <td>&nbsp;</td>
							  <td>&nbsp;</td>
							  <td>&nbsp;</td>
						  <td><%=sfbxx%></td>
						  <td><a href="InsertBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">更换</a></td>
						  
						  <td><%=sjsl%></td>
						  <td><%=sfxzsl%></td>
						  <td><%=bzsl%></td>
						  <td><%=sfyxsjMc%></td>

						  <td><%=sfkjmStr%></td>
						  <td><%=yxjmzdsl%></td>
						  <td><%=sjjmsl%></td>
						  <td><%=sfkghStr%></td>
						</tr>
						<%
					}
					else{//房间内 非 第一行
						if (row1==1)//升级分类第一行
						{
							//输出每行数据
							%>
							<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
							  <td align="right"  rowspan="<%=count1%>"><%=tcsjflmc%>：
								  <a href="zcsj.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">升级</a>
								  <a href="zcjj.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">降级</a>
								  <a href="hyjb.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">还原</a>
							  </td>
								<%

								if (sfkjm.equals("2"))//1：不可减免；2：可减免
								{
									if (sjjmsl>0)//已减免
									{
										%>
										  <td ><a href="qxzcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">取消减免</a></td>
										<%
									}
									else{
										%>
										  <td ><a href="zcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">减免</a></td>
										<%
									}
								}
								else{
									%>
									<td >&nbsp;</td>
									<%
								}
								%>							
							
							  <td><%=bjjbmc%></td>
							  <td><%=tccplbmc%></td>
							  <td>&nbsp;</td>
							  <td>&nbsp;</td>
							  <td>&nbsp;</td>
							  <td>&nbsp;</td>
							  <td>&nbsp;</td>
							  <td>&nbsp;</td>
							  <td><%=sfbxx%></td>
							  <td><a href="InsertBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">更换</a></td>
							  <td><%=sjsl%></td>
							  <td><%=sfxzsl%></td>
							  <td><%=bzsl%></td>
							  <td><%=sfyxsjMc%></td>

							  <td><%=sfkjmStr%></td>
							  <td><%=yxjmzdsl%></td>
							  <td><%=sjjmsl%></td>
							  <td><%=sfkghStr%></td>
							</tr>
							<%
						}
						else{//升级分类 非 第一行
							//输出每行数据
							%>
							<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
<%
					if (sfkjm.equals("2"))//1：不可减免；2：可减免
					{
						if (sjjmsl>0)//已减免
						{
							%>
							  <td ><a href="qxzcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">取消减免</a></td>
							<%
						}
						else{
							%>
							  <td ><a href="zcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">减免</a></td>
							<%
						}
					}
					else{
						%>
						<td >&nbsp;</td>
						<%
					}

%>							
							  <td><%=bjjbmc%></td>
							  <td><%=tccplbmc%></td>
							  <td>&nbsp;</td>
							  <td>&nbsp;</td>
							  <td>&nbsp;</td>
							  <td>&nbsp;</td>
							  <td>&nbsp;</td>
							  <td>&nbsp;</td>
							  <td><%=sfbxx%></td>
							  <td><a href="InsertBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">更换</a></td>
							  <td><%=sjsl%></td>
							  <td><%=sfxzsl%></td>
							  <td><%=bzsl%></td>
							  <td><%=sfyxsjMc%></td>

							  <td><%=sfkjmStr%></td>
							  <td><%=yxjmzdsl%></td>
							  <td><%=sjjmsl%></td>
							  <td><%=sfkghStr%></td>
							</tr>
							<%
						}//升级分类若干行
					}//房间内若干行
				}
				else{//本小类已选择产品
					//获取小类产品
/*
					String sxh=null;
					double getsl=0;
					String cpbm=null;
					String cpmc=null;
					String ppmc=null;
					String xh=null;
					String zclx=null;
*/
					int row2=0;//小类产品行数
					ls_sql="SELECT bj_khzcxmh.sxh,bj_khzcxmh.xdsl,bj_khzcxmh.cpbm,bj_khzcxmh.cpmc,bj_khzcxmh.ppmc,bj_khzcxmh.xh,bj_khzcxmh.zclx";
					ls_sql+=" ,bj_khzcxmh.lx,DECODE(bj_khzcxmh.lx,'1','原项','2','增+','3','减-','4','新项') lxmc ";
					ls_sql+=" FROM bj_khzcxmh  ";
					ls_sql+=" where bj_khzcxmh.zjxxh='"+zjxxh+"' and bj_khzcxmh.jgwzbm='"+jgwzbm+"' and bj_khzcxmh.tccplbbm='"+tccplbbm+"'";
					ls_sql+=" and ( bj_khzcxmh.zclx in('1','2')";//主材类型 1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
					ls_sql+=" OR (bj_khzcxmh.zclx in('3','4')";//主材类型 1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
					ls_sql+=" and bj_khzcxmh.ddcljjfs in('1')) )";//0：非大店材料；1：套外升级（补差价）；2：套外升级（独立计价）；3：套餐选配
					ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
					ls_sql+=" order by bj_khzcxmh.cpbm,bj_khzcxmh.sxh";
					ps3= conn.prepareStatement(ls_sql);
					rs3 =ps3.executeQuery();
					while (rs3.next())
					{
						lx=cf.fillNull(rs3.getString("lx"));
						lxmc=cf.fillNull(rs3.getString("lxmc"));
						sxh=cf.fillNull(rs3.getString("sxh"));
						getsl=rs3.getDouble("xdsl");
						cpbm=cf.fillNull(rs3.getString("cpbm"));
						cpmc=cf.fillNull(rs3.getString("cpmc"));
						ppmc=cf.fillNull(rs3.getString("ppmc"));
						xh=cf.fillNull(rs3.getString("xh"));
						zclx=cf.fillNull(rs3.getString("zclx"));

						row++;//房间行号
						row1++;//升级分类行号
						row2++;//小类产品行数

						if (row%2==0)
						{
							bgcolor="#E8E8FF";
						}
						else{
							bgcolor="#FFFFFF";
						}

						if (row==1)//房间内第一行
						{
							//输出每行数据
							%>
							<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
							  <td rowspan="<%=count%>"><%=jgwzbm%></td>
							  <td align="right"  rowspan="<%=count1%>"><%=tcsjflmc%>：
								  <a href="zcsj.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">升级</a>
								  <a href="zcjj.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">降级</a>
								  <a href="hyjb.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">还原</a>
							  </td>
								<%
								if (sfkjm.equals("2"))//1：不可减免；2：可减免
								{
									if (sjjmsl>0)//已减免
									{
										%>
										  <td  rowspan="<%=xlcpsl%>"><a href="qxzcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">取消减免</a></td>
										<%
									}
									else{
										%>
										   <td  rowspan="<%=xlcpsl%>"><a href="zcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">减免</a></td>
										<%
									}
								}
								else{
									%>
									<td  rowspan="<%=xlcpsl%>">&nbsp;</td>
									<%
								}

								%>							

							  <td rowspan="<%=xlcpsl%>"><%=bjjbmc%></td>
							  <td rowspan="<%=xlcpsl%>"><%=tccplbmc%></td>

							<%

									if (zclx.equals("1") || zclx.equals("2"))
									{
										%>
										  <td><%=lxmc%></td>
										  <%
										  if (lx.equals("1"))//1：原项目；2：增项；3：减项；4：更换项
										  {
											  %>
											  <td>退补</td>
											  <%
										  }
										  else
										  {
											  %>
											  <td>&nbsp;</td>
											  <%
										  }
										  %>
										  <td><%=ppmc%></td>
										  <td><%=cpmc%></td>
										  <td><%=xh%></td>
										  <td><%=getsl%></td>
										<%
									}
									else{
										%>
										  <td><%=lxmc%></td>
										  <%
										  if (lx.equals("1"))//1：原项目；2：增项；3：减项；4：更换项
										  {
											  %>
											  <td>退补</td>
											  <%
										  }
										  else
										  {
											  %>
											  <td>&nbsp;</td>
											  <%
										  }
										  %>

										  <td><%=ppmc%></td>
										  <td><%=cpmc%></td>
										  <td><%=xh%></td>
										  <td><%=getsl%></td>
										<%
									}

							%>
							  <td rowspan="<%=xlcpsl%>"><%=sfbxx%></td>
							  <td rowspan="<%=xlcpsl%>"><a href="InsertBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">更换</a></td>
							  
							  <td rowspan="<%=xlcpsl%>"><%=sjsl%></td>
							  <td rowspan="<%=xlcpsl%>"><%=sfxzsl%></td>
							  <td rowspan="<%=xlcpsl%>"><%=bzsl%></td>
							  <td rowspan="<%=xlcpsl%>"><%=sfyxsjMc%></td>

							  <td rowspan="<%=xlcpsl%>"><%=sfkjmStr%></td>
							  <td rowspan="<%=xlcpsl%>"><%=yxjmzdsl%></td>
							  <td rowspan="<%=xlcpsl%>"><%=sjjmsl%></td>
							  <td rowspan="<%=xlcpsl%>"><%=sfkghStr%></td>
							</tr>
							<%
						}
						else{//房间内 非 第一行
							if (row1==1)//升级分类第一行
							{
								//输出每行数据
								%>
								<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
								  <td align="right"  rowspan="<%=count1%>"><%=tcsjflmc%>：
									  <a href="zcsj.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">升级</a>
									  <a href="zcjj.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">降级</a>
									  <a href="hyjb.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">还原</a>
								  </td>
									<%
									if (sfkjm.equals("2"))//1：不可减免；2：可减免
									{
										if (sjjmsl>0)//已减免
										{
											%>
											  <td rowspan="<%=xlcpsl%>"><a href="qxzcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">取消减免</a></td>
											<%
										}
										else{
											%>
											   <td rowspan="<%=xlcpsl%>"><a href="zcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">减免</a></td>
											<%
										}
									}
									else{
										%>
										<td rowspan="<%=xlcpsl%>">&nbsp;</td>
										<%
									}

									%>							
								
								  <td rowspan="<%=xlcpsl%>"><%=bjjbmc%></td>
								  <td rowspan="<%=xlcpsl%>"><%=tccplbmc%></td>
									<%
										if (zclx.equals("1") || zclx.equals("2"))
										{
											%>
											  <td><%=lxmc%></td>
											  <%
											  if (lx.equals("1"))//1：原项目；2：增项；3：减项；4：更换项
											  {
												  %>
												  <td>退补</td>
												  <%
											  }
											  else
											  {
												  %>
												  <td>&nbsp;</td>
												  <%
											  }
											  %>
											  <td><%=ppmc%></td>
											  <td><%=cpmc%></td>
											  <td><%=xh%></td>
											  <td><%=getsl%></td>
											<%
										}
										else{
											%>
											  <td><%=lxmc%></td>
											  <%
											  if (lx.equals("1"))//1：原项目；2：增项；3：减项；4：更换项
											  {
												  %>
												  <td>退补</td>
												  <%
											  }
											  else
											  {
												  %>
												  <td>&nbsp;</td>
												  <%
											  }
											  %>
											  <td><%=ppmc%></td>
											  <td><%=cpmc%></td>
											  <td><%=xh%></td>
											  <td><%=getsl%></td>
											<%
										}
									%>
								  <td rowspan="<%=xlcpsl%>"><%=sfbxx%></td>
								  <td rowspan="<%=xlcpsl%>"><a href="InsertBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">更换</a></td>
								  <td rowspan="<%=xlcpsl%>"><%=sjsl%></td>
								  <td rowspan="<%=xlcpsl%>"><%=sfxzsl%></td>
								  <td rowspan="<%=xlcpsl%>"><%=bzsl%></td>
								  <td rowspan="<%=xlcpsl%>"><%=sfyxsjMc%></td>

								  <td rowspan="<%=xlcpsl%>"><%=sfkjmStr%></td>
								  <td rowspan="<%=xlcpsl%>"><%=yxjmzdsl%></td>
								  <td rowspan="<%=xlcpsl%>"><%=sjjmsl%></td>
								  <td rowspan="<%=xlcpsl%>"><%=sfkghStr%></td>
								</tr>
								<%
							}
							else{//升级分类 非 第一行
								//输出每行数据
								if (row2==1)//小类第一行
								{
									%>
									<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
									<%
									if (sfkjm.equals("2"))//1：不可减免；2：可减免
									{
										if (sjjmsl>0)//已减免
										{
											%>
											  <td rowspan="<%=xlcpsl%>"><a href="qxzcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">取消减免</a></td>
											<%
										}
										else{
											%>
											   <td rowspan="<%=xlcpsl%>"><a href="zcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">减免</a></td>
											<%
										}
									}
									else{
										%>
										<td rowspan="<%=xlcpsl%>">&nbsp;</td>
										<%
									}

									%>							
									  <td rowspan="<%=xlcpsl%>"><%=bjjbmc%></td>
									  <td rowspan="<%=xlcpsl%>"><%=tccplbmc%></td>
									<%
										if (zclx.equals("1") || zclx.equals("2"))
										{
											%>
											  <td><%=lxmc%></td>
											  <%
											  if (lx.equals("1"))//1：原项目；2：增项；3：减项；4：更换项
											  {
												  %>
												  <td>退补</td>
												  <%
											  }
											  else
											  {
												  %>
												  <td>&nbsp;</td>
												  <%
											  }
											  %>
											  <td><%=ppmc%></td>
											  <td><%=cpmc%></td>
											  <td><%=xh%></td>
											  <td><%=getsl%></td>
											<%
										}
										else{
											%>
											  <td><%=lxmc%></td>
											  <%
											  if (lx.equals("1"))//1：原项目；2：增项；3：减项；4：更换项
											  {
												  %>
												  <td>退补</td>
												  <%
											  }
											  else
											  {
												  %>
												  <td>&nbsp;</td>
												  <%
											  }
											  %>
											  <td><%=ppmc%></td>
											  <td><%=cpmc%></td>
											  <td><%=xh%></td>
											  <td><%=getsl%></td>
											<%
										}
									%>
									  <td rowspan="<%=xlcpsl%>"><%=sfbxx%></td>
									  <td rowspan="<%=xlcpsl%>"><a href="InsertBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">更换</a></td>
									  <td rowspan="<%=xlcpsl%>"><%=sjsl%></td>
									  <td rowspan="<%=xlcpsl%>"><%=sfxzsl%></td>
									  <td rowspan="<%=xlcpsl%>"><%=bzsl%></td>
									  <td rowspan="<%=xlcpsl%>"><%=sfyxsjMc%></td>

									  <td rowspan="<%=xlcpsl%>"><%=sfkjmStr%></td>
									  <td rowspan="<%=xlcpsl%>"><%=yxjmzdsl%></td>
									  <td rowspan="<%=xlcpsl%>"><%=sjjmsl%></td>
									  <td rowspan="<%=xlcpsl%>"><%=sfkghStr%></td>
									</tr>
									<%
								}
								else{//非小类第一行
									%>
									<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
									<%
										if (zclx.equals("1") || zclx.equals("2"))
										{
											%>
											  <td><%=lxmc%></td>
											  <%
											  if (lx.equals("1"))//1：原项目；2：增项；3：减项；4：更换项
											  {
												  %>
												  <td>退补</td>
												  <%
											  }
											  else
											  {
												  %>
												  <td>&nbsp;</td>
												  <%
											  }
											  %>
											  <td><%=ppmc%></td>
											  <td><%=cpmc%></td>
											  <td><%=xh%></td>
											  <td><%=getsl%></td>
											<%
										}
										else{
											%>
											  <td><%=lxmc%></td>
											  <%
											  if (lx.equals("1"))//1：原项目；2：增项；3：减项；4：更换项
											  {
												  %>
												  <td>退补</td>
												  <%
											  }
											  else
											  {
												  %>
												  <td>&nbsp;</td>
												  <%
											  }
											  %>
											  <td><%=ppmc%></td>
											  <td><%=cpmc%></td>
											  <td><%=xh%></td>
											  <td><%=getsl%></td>
											<%
										}
									%>
									</tr>
									<%
								}
							}//升级分类若干行
						}//房间内若干行
					}
					rs3.close();
					ps3.close();

				}//小类有产品
			}//小类
			rs.close();
			ps.close();

		}//升级分类
		rs2.close();
		ps2.close();

		//处理【套餐升级分类编码】为空，不允许升级
		int count1=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzcxmxjh";
		ls_sql+=" where bj_khzcxmxjh.zjxxh='"+zjxxh+"' and bj_khzcxmxjh.jgwzbm='"+jgwzbm+"' and bj_khzcxmxjh.tcsjflbm is null";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count1=rs.getInt(1);
		}
		rs.close();
		ps.close();

		int row1=0;
		String jldw=null;
		String sfkjm=null;
		String sfkjmStr=null;
		double yxjmzdsl=0;
		String sfkgh=null;
		String sfkghStr=null;
		double khzdsl=0;
		String jmfl=null;
		ls_sql="SELECT bj_khzcxmxjh.jmfl,bj_khzcxmxjh.khbjjbbm,bj_khzcxmxjh.bjjbbm,bj_khzcxmxjh.tccplbbm,clxlmc,sjsl,bzsl,DECODE(bj_khzcxmxjh.sfxzsl,'1','超量加价','2','不可超量','3','无限制') sfxzsl,DECODE(sfbxx,'Y','必选','N','') sfbxx,sfyxsj,DECODE(sfyxsj,'Y','收费','N','否') sfyxsjMc";
		ls_sql+=" ,sjjmsl,jldw,bj_khzcxmxjh.sfkjm,DECODE(bj_khzcxmxjh.sfkjm,'1','不可','2','可减免') sfkjmStr,bj_khzcxmxjh.yxjmzdsl,sfkgh,DECODE(sfkgh,'1','不可换','2','可换') sfkghStr,khzdsl";
		ls_sql+=" FROM bj_khzcxmxjh,jxc_clxlbm ";
		ls_sql+=" where bj_khzcxmxjh.tccplbbm=jxc_clxlbm.clxlbm(+) ";
		ls_sql+=" and bj_khzcxmxjh.zjxxh='"+zjxxh+"' and bj_khzcxmxjh.jgwzbm='"+jgwzbm+"' and bj_khzcxmxjh.tcsjflbm is null";
		ls_sql+=" order by jxc_clxlbm.cldlmc,bj_khzcxmxjh.tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			jmfl=rs.getString("jmfl");
			tccplbbm=rs.getString("tccplbbm");
			tccplbmc=rs.getString("clxlmc");
			sjsl=rs.getDouble("sjsl");
			bzsl=rs.getDouble("bzsl");
			sfxzsl=rs.getString("sfxzsl");
			sfbxx=cf.fillNull(rs.getString("sfbxx"));
			sfyxsj=rs.getString("sfyxsj");
			sfyxsjMc=rs.getString("sfyxsjMc");
			khbjjbbm=rs.getString("khbjjbbm");
			zcbjjbbm=rs.getString("bjjbbm");

			sjjmsl=rs.getDouble("sjjmsl");
			jldw=cf.fillNull(rs.getString("jldw"));
			sfkjm=cf.fillNull(rs.getString("sfkjm"));
			sfkjmStr=cf.fillNull(rs.getString("sfkjmStr"));
			yxjmzdsl=rs.getDouble("yxjmzdsl");
			sfkgh=cf.fillNull(rs.getString("sfkgh"));
			sfkghStr=cf.fillNull(rs.getString("sfkghStr"));
			khzdsl=rs.getDouble("khzdsl");

			ls_sql="SELECT bjjbmc";
			ls_sql+=" FROM bdm_bjjbbm";
			ls_sql+=" where bjjbbm='"+zcbjjbbm+"'";
			ps3= conn.prepareStatement(ls_sql);
			rs3 =ps3.executeQuery();
			if (rs3.next())
			{
				bjjbmc=rs3.getString(1);
			}
			rs3.close();
			ps3.close();

			sfkjm="1";

			if (!khbjjbbm.equals(zcbjjbbm))
			{
				bjjbmc="<font color=\"#FF0000\"><B>"+bjjbmc+"</B></font>";
			}


			int xlcpsl=0;//小类产品数量
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM bj_khzcxmh  ";
			ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
			ls_sql+=" and ( zclx in('1','2')";//主材类型 1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
			ls_sql+=" OR (zclx in('3','4')";//主材类型 1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
			ls_sql+=" and ddcljjfs in('1')) )";//0：非大店材料；1：套外升级（补差价）；2：套外升级（独立计价）；3：套餐选配
			ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
			ps3= conn.prepareStatement(ls_sql);
			rs3 =ps3.executeQuery();
			if (rs3.next())
			{
				xlcpsl=rs3.getInt(1);
			}
			rs3.close();
			ps3.close();

			if (xlcpsl==0)//小类未选择产品
			{
				row++;
				row1++;

				if (row%2==0)
				{
					bgcolor="#E8E8FF";
				}
				else{
					bgcolor="#FFFFFF";
				}
			  
				if (row==1)//第一行
				{
					//输出每行数据
					%>
					<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="<%=count%>"><%=jgwzbm%></td>
					  <td rowspan="<%=count1%>">&nbsp;</td>
						<%
						if (sfkjm.equals("2"))//1：不可减免；2：可减免
						{
							%>
						  <td ><a href="zcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">减免</a></td>
							<%
						}
						else{
							%>
							<td>&nbsp;</td>
							<%
						}
						%>
					  <td><%=bjjbmc%></td>
					  <td><%=tccplbmc%></td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td><%=sfbxx%></td>
					  <td><a href="InsertBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">更换</a></td>
					  <td><%=sjsl%></td>
					  <td><%=sfxzsl%></td>
					  <td><%=bzsl%></td>
					  <td><%=sfyxsjMc%></td>

					  <td><%=sfkjmStr%></td>
					  <td><%=yxjmzdsl%></td>
					  <td><%=sjjmsl%></td>
					  <td><%=sfkghStr%></td>
					</tr>
					<%
				}
				else{
					if (row1==1)
					{
						//输出每行数据
						%>
						<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td rowspan="<%=count1%>">&nbsp;</td>
						
							<%
							if (sfkjm.equals("2"))//1：不可减免；2：可减免
							{
								if (sjjmsl>0)
								{
									%>
									  <td ><a href="qxzcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">取消减免</a></td>
									<%
								}
								else{
									%>
									   <td  ><a href="zcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">减免</a></td>
									<%
								}
							}
							else{
								%>
								<td>&nbsp;</td>
								<%
							}
							%>
						  <td><%=bjjbmc%></td>
						  <td><%=tccplbmc%></td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td><%=sfbxx%></td>
						  <td><a href="InsertBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">更换</a></td>
						  <td><%=sjsl%></td>
						  <td><%=sfxzsl%></td>
						  <td><%=bzsl%></td>
						  <td><%=sfyxsjMc%></td>

						  <td><%=sfkjmStr%></td>
						  <td><%=yxjmzdsl%></td>
						  <td><%=sjjmsl%></td>
						  <td><%=sfkghStr%></td>
						</tr>
						<%
					}
					else{
						//输出每行数据
						%>
						<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
							<%
							if (sfkjm.equals("2"))//1：不可减免；2：可减免
							{
								if (sjjmsl>0)
								{
									%>
									  <td ><a href="qxzcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">取消减免</a></td>
									<%
								}
								else{
									%>
									   <td ><a href="zcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">减免</a></td>
									<%
								}
							}
							else{
								%>
								<td>&nbsp;</td>
								<%
							}
							%>
						  <td><%=bjjbmc%></td>
						  <td><%=tccplbmc%></td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td><%=sfbxx%></td>
						  <td><a href="InsertBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">更换</a></td>
						  <td><%=sjsl%></td>
						  <td><%=sfxzsl%></td>
						  <td><%=bzsl%></td>
						  <td><%=sfyxsjMc%></td>

						  <td><%=sfkjmStr%></td>
						  <td><%=yxjmzdsl%></td>
						  <td><%=sjjmsl%></td>
						  <td><%=sfkghStr%></td>
						</tr>
						<%
					}
				}
			}
			else{//小类选择产品
/*
				String sxh=null;
				double getsl=0;
				String cpbm=null;
				String cpmc=null;
				String ppmc=null;
				String xh=null;
				String zclx=null;
*/
				int row2=0;//小类产品行数
				ls_sql="SELECT bj_khzcxmh.sxh,bj_khzcxmh.xdsl,bj_khzcxmh.cpbm,bj_khzcxmh.cpmc,bj_khzcxmh.ppmc,bj_khzcxmh.xh,bj_khzcxmh.zclx";
				ls_sql+=" ,bj_khzcxmh.lx,DECODE(bj_khzcxmh.lx,'1','原项','2','增+','3','减-','4','新项') lxmc ";
				ls_sql+=" FROM bj_khzcxmh  ";
				ls_sql+=" where bj_khzcxmh.zjxxh='"+zjxxh+"' and bj_khzcxmh.jgwzbm='"+jgwzbm+"' and bj_khzcxmh.tccplbbm='"+tccplbbm+"'";
				ls_sql+=" and ( bj_khzcxmh.zclx in('1','2')";//主材类型 1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
				ls_sql+=" OR (bj_khzcxmh.zclx in('3','4')";//主材类型 1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
				ls_sql+=" and bj_khzcxmh.ddcljjfs in('1')) )";//0：非大店材料；1：套外升级（补差价）；2：套外升级（独立计价）；3：套餐选配
				ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
				ls_sql+=" order by bj_khzcxmh.cpbm,bj_khzcxmh.sxh";
				ps3= conn.prepareStatement(ls_sql);
				rs3 =ps3.executeQuery();
				while (rs3.next())
				{
					lx=cf.fillNull(rs3.getString("lx"));
					lxmc=cf.fillNull(rs3.getString("lxmc"));
					sxh=cf.fillNull(rs3.getString("sxh"));
					getsl=rs3.getDouble("xdsl");
					cpbm=cf.fillNull(rs3.getString("cpbm"));
					cpmc=cf.fillNull(rs3.getString("cpmc"));
					ppmc=cf.fillNull(rs3.getString("ppmc"));
					xh=cf.fillNull(rs3.getString("xh"));
					zclx=cf.fillNull(rs3.getString("zclx"));

					row++;//房间行号
					row1++;//升级分类行号
					row2++;//小类产品行数

					if (row%2==0)
					{
						bgcolor="#E8E8FF";
					}
					else{
						bgcolor="#FFFFFF";
					}

					if (row==1)//第一行
					{
						//输出每行数据
						%>
						<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td rowspan="<%=count%>"><%=jgwzbm%></td>
						  <td rowspan="<%=count1%>">&nbsp;</td>
							<%
							if (sfkjm.equals("2"))//1：不可减免；2：可减免
							{
								%>
							   <td  rowspan="<%=xlcpsl%>"><a href="zcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">减免</a></td>
								<%
							}
							else{
								%>
								<td rowspan="<%=xlcpsl%>">&nbsp;</td>
								<%
							}
							%>
						  <td rowspan="<%=xlcpsl%>"><%=bjjbmc%></td>
						  <td rowspan="<%=xlcpsl%>"><%=tccplbmc%></td>
							<%
								if (zclx.equals("1") || zclx.equals("2"))
								{
									%>
									  <td><%=lxmc%></td>
									  <%
									  if (lx.equals("1"))//1：原项目；2：增项；3：减项；4：更换项
									  {
										  %>
										  <td>退补</td>
										  <%
									  }
									  else
									  {
										  %>
										  <td>&nbsp;</td>
										  <%
									  }
									  %>
									  <td><%=ppmc%></td>
									  <td><%=cpmc%></td>
									  <td><%=xh%></td>
									  <td><%=getsl%></td>
									<%
								}
								else{
									%>
									  <td><%=lxmc%></td>
									  <%
									  if (lx.equals("1"))//1：原项目；2：增项；3：减项；4：更换项
									  {
										  %>
										  <td>退补</td>
										  <%
									  }
									  else
									  {
										  %>
										  <td>&nbsp;</td>
										  <%
									  }
									  %>
									  <td><%=ppmc%></td>
									  <td><%=cpmc%></td>
									  <td><%=xh%></td>
									  <td><%=getsl%></td>
									<%
								}
							%>
						  <td rowspan="<%=xlcpsl%>"><%=sfbxx%></td>
						  <td rowspan="<%=xlcpsl%>"><a href="InsertBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">更换</a></td>
						  <td rowspan="<%=xlcpsl%>"><%=sjsl%></td>
						  <td rowspan="<%=xlcpsl%>"><%=sfxzsl%></td>
						  <td rowspan="<%=xlcpsl%>"><%=bzsl%></td>
						  <td rowspan="<%=xlcpsl%>"><%=sfyxsjMc%></td>

						  <td rowspan="<%=xlcpsl%>"><%=sfkjmStr%></td>
						  <td rowspan="<%=xlcpsl%>"><%=yxjmzdsl%></td>
						  <td rowspan="<%=xlcpsl%>"><%=sjjmsl%></td>
						  <td rowspan="<%=xlcpsl%>"><%=sfkghStr%></td>
						</tr>
						<%
					}
					else{
						if (row1==1)
						{
							//输出每行数据
							%>
							<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
							  <td rowspan="<%=count1%>">&nbsp;</td>
							
								<%
								if (sfkjm.equals("2"))//1：不可减免；2：可减免
								{
									if (sjjmsl>0)
									{
										%>
										  <td  rowspan="<%=xlcpsl%>"><a href="qxzcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">取消减免</a></td>
										<%
									}
									else{
										%>
										  <td   rowspan="<%=xlcpsl%>"><a href="zcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">减免</a></td>
										<%
									}
								}
								else{
									%>
									<td rowspan="<%=xlcpsl%>">&nbsp;</td>
									<%
								}
								%>
							  <td rowspan="<%=xlcpsl%>"><%=bjjbmc%></td>
							  <td rowspan="<%=xlcpsl%>"><%=tccplbmc%></td>
							<%
								if (zclx.equals("1") || zclx.equals("2"))
								{
									%>
									  <td><%=lxmc%></td>
									  <%
									  if (lx.equals("1"))//1：原项目；2：增项；3：减项；4：更换项
									  {
										  %>
										  <td>退补</td>
										  <%
									  }
									  else
									  {
										  %>
										  <td>&nbsp;</td>
										  <%
									  }
									  %>
									  <td><%=ppmc%></td>
									  <td><%=cpmc%></td>
									  <td><%=xh%></td>
									  <td><%=getsl%></td>
									<%
								}
								else{
									%>
									  <td><%=lxmc%></td>
									  <%
									  if (lx.equals("1"))//1：原项目；2：增项；3：减项；4：更换项
									  {
										  %>
										  <td>退补</td>
										  <%
									  }
									  else
									  {
										  %>
										  <td>&nbsp;</td>
										  <%
									  }
									  %>
									  <td><%=ppmc%></td>
									  <td><%=cpmc%></td>
									  <td><%=xh%></td>
									  <td><%=getsl%></td>
									<%
								}
							%>
							  <td rowspan="<%=xlcpsl%>"><%=sfbxx%></td>
							  <td rowspan="<%=xlcpsl%>"><a href="InsertBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">更换</a></td>
							  <td rowspan="<%=xlcpsl%>"><%=sjsl%></td>
							  <td rowspan="<%=xlcpsl%>"><%=sfxzsl%></td>
							  <td rowspan="<%=xlcpsl%>"><%=bzsl%></td>
							  <td rowspan="<%=xlcpsl%>"><%=sfyxsjMc%></td>

							  <td rowspan="<%=xlcpsl%>"><%=sfkjmStr%></td>
							  <td rowspan="<%=xlcpsl%>"><%=yxjmzdsl%></td>
							  <td rowspan="<%=xlcpsl%>"><%=sjjmsl%></td>
							  <td rowspan="<%=xlcpsl%>"><%=sfkghStr%></td>
							</tr>
							<%
						}
						else{
							//输出每行数据

							if (row2==1)//小类第一行
							{
								%>
								<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
									<%
									if (sfkjm.equals("2"))//1：不可减免；2：可减免
									{
										if (sjjmsl>0)
										{
											%>
											  <td  rowspan="<%=xlcpsl%>"><a href="qxzcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">取消减免</a></td>
											<%
										}
										else{
											%>
											  <td  rowspan="<%=xlcpsl%>"><a href="zcjm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&jmfl=<%=jmfl%>" target="_blank">减免</a></td>
											<%
										}
									}
									else{
										%>
										<td rowspan="<%=xlcpsl%>">&nbsp;</td>
										<%
									}
									%>
								  <td rowspan="<%=xlcpsl%>"><%=bjjbmc%></td>
								  <td rowspan="<%=xlcpsl%>"><%=tccplbmc%></td>
								<%
									if (zclx.equals("1") || zclx.equals("2"))
									{
										%>
										  <td><%=lxmc%></td>
										  <%
										  if (lx.equals("1"))//1：原项目；2：增项；3：减项；4：更换项
										  {
											  %>
											  <td>退补</td>
											  <%
										  }
										  else
										  {
											  %>
											  <td>&nbsp;</td>
											  <%
										  }
										  %>
										  <td><%=ppmc%></td>
										  <td><%=cpmc%></td>
										  <td><%=xh%></td>
										  <td><%=getsl%></td>
										<%
									}
									else{
										%>
										  <td><%=lxmc%></td>
										  <%
										  if (lx.equals("1"))//1：原项目；2：增项；3：减项；4：更换项
										  {
											  %>
											  <td>退补</td>
											  <%
										  }
										  else
										  {
											  %>
											  <td>&nbsp;</td>
											  <%
										  }
										  %>
										  <td><%=ppmc%></td>
										  <td><%=cpmc%></td>
										  <td><%=xh%></td>
										  <td><%=getsl%></td>
										<%
									}
								%>
								  <td rowspan="<%=xlcpsl%>"><%=sfbxx%></td>
								  <td rowspan="<%=xlcpsl%>"><a href="InsertBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">更换</a></td>
								  <td rowspan="<%=xlcpsl%>"><%=sjsl%></td>
								  <td rowspan="<%=xlcpsl%>"><%=sfxzsl%></td>
								  <td rowspan="<%=xlcpsl%>"><%=bzsl%></td>
								  <td rowspan="<%=xlcpsl%>"><%=sfyxsjMc%></td>

								  <td rowspan="<%=xlcpsl%>"><%=sfkjmStr%></td>
								  <td rowspan="<%=xlcpsl%>"><%=yxjmzdsl%></td>
								  <td rowspan="<%=xlcpsl%>"><%=sjjmsl%></td>
								  <td rowspan="<%=xlcpsl%>"><%=sfkghStr%></td>
								</tr>
								<%
							}
							else{//小类 非 第一行
								%>
								<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
								<%
									if (zclx.equals("1") || zclx.equals("2"))
									{
										%>
										  <td><%=lxmc%></td>
										  <%
										  if (lx.equals("1"))//1：原项目；2：增项；3：减项；4：更换项
										  {
											  %>
											  <td>退补</td>
											  <%
										  }
										  else
										  {
											  %>
											  <td>&nbsp;</td>
											  <%
										  }
										  %>
										  <td><%=ppmc%></td>
										  <td><%=cpmc%></td>
										  <td><%=xh%></td>
										  <td><%=getsl%></td>
										<%
									}
									else{
										%>
										  <td><%=lxmc%></td>
										  <%
										  if (lx.equals("1"))//1：原项目；2：增项；3：减项；4：更换项
										  {
											  %>
											  <td>退补</td>
											  <%
										  }
										  else
										  {
											  %>
											  <td>&nbsp;</td>
											  <%
										  }
										  %>
										  <td><%=ppmc%></td>
										  <td><%=cpmc%></td>
										  <td><%=xh%></td>
										  <td><%=getsl%></td>
										<%
									}
								%>
								</tr>
								<%
							}
						}
					}
				}
				rs3.close();
				ps3.close();
			}


		}
		rs.close();
		ps.close();
		  
	}
	rs1.close();
	ps1.close();

}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
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
      </table>

</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
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

function KeyDown()
{ 
	if ((event.ctrlKey))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}

function f_del(act)
{
	if ( confirm("小心不要误删除，确实要继续吗?") )
	{
		window.open(act);
	}

}
//-->
</script>

