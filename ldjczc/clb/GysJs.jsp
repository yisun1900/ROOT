<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='170805'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[供应商结算]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[供应商结算]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String gys=cf.GB2Uni(request.getParameter("gys"));


Connection conn  = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
PreparedStatement ps4=null;
ResultSet rs4=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>供应商结算额统计</B><BR>
  <b>(结算时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td width="2%" ><strong>序号</strong></td>
  <td width="10%" ><strong>供应商</strong></td>
  <td width="5%" ><strong>主材大类</strong></td>
  <td width="5%" ><strong>品牌</strong></td>
  <td width="5%" bgcolor="#CCFFFF" ><strong>目前累计完结未结算</strong></td>
  <td  width="3%" ><strong>结算月份</strong></td>
  <td  width="5%"  ><strong>订单类型</strong></td>
  <td width="3%" bgcolor="#CCFFFF" ><strong>结算客户数</strong></td>
  <td width="3%" bgcolor="#CCFFFF" ><strong>结算订单数</strong></td>
  <td width="4%" bgcolor="#CCFFFF" ><strong>平均单额</strong></td>
  <td width="5%" bgcolor="#CCFFFF" ><strong>已结算金额</strong></td>
  <td width="5%" bgcolor="#CCFFFF" ><strong>结算已付款金额</strong></td>
  <td width="5%" bgcolor="#CCFFFF" ><strong>合同金额</strong></td>
  <td width="5%" bgcolor="#CCFFFF" ><strong>返利金额</strong></td>

</tr>

<%
	//获取年、月份数组	
	int[] ret=cf.getMon(sjfw,sjfw2);

	
	//获取最大数
	String getfgsbh=null;
	String getgys=null;
	String getzcdlbm=null;
	String getppbm=null;

	

	int zjkhsl=0;
	int zjddsl=0;

	double zjcbze=0;
	double zjhkze=0;
	double zjzjxcbze=0;
	double zjzjxze=0;
	double zjjsfl=0;

	double zjhtjsfkje=0;
	double zjzjxjsfkje=0;

	double zjhtwjwjsje=0;
	double zjzjxwjwjsje=0;

	int row=0;
	int num=0;

	//放行数据
	String[][] trData=new String[5000][14];
	
	//签单
	ls_sql =" SELECT distinct fgsbh,gys";
	ls_sql+=" FROM (";

	ls_sql+=" SELECT distinct fgsbh,gys";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.sfjs in('Y','M','F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
	ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and jc_zcdd.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jc_zcdd.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (jc_zcdd.fgsbh='"+fgs+"')";
	}

	if (!(gys.equals("")))
	{
		ls_sql+=" and  jc_zcdd.gys='"+gys+"'";
	}


	ls_sql+=" UNION ALL ";
	
	//增减项
	ls_sql+=" SELECT distinct fgsbh,gys";
	ls_sql+=" FROM jc_zczjx";
	ls_sql+=" where jc_zczjx.sfjs in('Y','M','F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
	ls_sql+=" and jc_zczjx.jissj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zczjx.jissj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and jc_zczjx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jc_zczjx.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (jc_zczjx.fgsbh='"+fgs+"')";
	}

	if (!(gys.equals("")))
	{
		ls_sql+=" and  jc_zczjx.gys='"+gys+"'";
	}


	ls_sql+=" )";

	ls_sql+=" order by fgsbh,gys";

//	out.println(ls_sql);
	
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		getfgsbh=rs2.getString("fgsbh");
		getgys=rs2.getString("gys");

		num++;

		int xjkhsl=0;
		int xjddsl=0;

		double xjcbze=0;
		double xjhkze=0;
		double xjzjxcbze=0;
		double xjzjxze=0;
		double xjjsfl=0;

		double xjhtjsfkje=0;
		double xjzjxjsfkje=0;

		double xjhtwjwjsje=0;
		double xjzjxwjwjsje=0;
	
		ls_sql =" SELECT distinct zcdlbm,ppbm";
		ls_sql+=" FROM (";

		//签单
		ls_sql+=" SELECT distinct zcdlbm,ppbm";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.sfjs in('Y','M','F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
		ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zcdd.gys='"+getgys+"'";

		ls_sql+=" UNION ALL ";

		//增减项
		ls_sql+=" SELECT distinct zcdlbm,ppbm";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where jc_zczjx.sfjs in('Y','M','F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
		ls_sql+=" and jc_zczjx.jissj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.jissj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zczjx.gys='"+getgys+"'";


		ls_sql+=" )";

		ls_sql+=" order by zcdlbm,ppbm ";

	//	out.println(ls_sql);
		
		ps3= conn.prepareStatement(ls_sql);
		rs3 =ps3.executeQuery();
		while (rs3.next())
		{
			getzcdlbm=rs3.getString("zcdlbm");
			getppbm=rs3.getString("ppbm");


			//合同完结未结算额
			double htwjwjsje=0;
			ls_sql =" SELECT sum(jc_zcdd.cbze+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2)) jsje";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt in('30')";
			ls_sql+=" and jc_zcdd.sfjs in('N','C')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
			ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
			ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
			ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
			ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
			ls_sql+=" and jc_zcdd.ddlx not in('9','E')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				htwjwjsje=rs1.getDouble("jsje");
			}
			rs1.close();
			ps1.close();

			ls_sql =" SELECT sum(jc_zcdd.cbze+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2)) jsje";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt in('30')";
			ls_sql+=" and jc_zcdd.sfjs in('N','C')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
			ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
			ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
			ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
			ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
			ls_sql+=" and jc_zcdd.ddlx in('9','E')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				htwjwjsje+=rs1.getDouble("jsje");
			}
			rs1.close();
			ps1.close();

			xjhtwjwjsje+=htwjwjsje;
			zjhtwjwjsje+=htwjwjsje;

			//增减项完结未结算额
			double zjxwjwjsje=0;
			ls_sql =" SELECT sum(zjxcbze+zjxycf+zjxqtf) jsje";
			ls_sql+=" FROM jc_zczjx";
			ls_sql+=" where jc_zczjx.clzt in('30')";
			ls_sql+=" and jc_zczjx.sfjs in('N','C')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
			ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
			ls_sql+=" and jc_zczjx.gys='"+getgys+"'";
			ls_sql+=" and jc_zczjx.zcdlbm='"+getzcdlbm+"'";
			ls_sql+=" and jc_zczjx.ppbm='"+getppbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zjxwjwjsje=rs1.getDouble("jsje");
			}
			rs1.close();
			ps1.close();

			xjzjxwjwjsje+=zjxwjwjsje;
			zjzjxwjwjsje+=zjxwjwjsje;


			//按月显示
			for (int i=0;i<ret.length ;i=i+2 )
			{
				String start=cf.firstDay(ret[i],ret[i+1]);//月开始
				String end=cf.lastDay(ret[i],ret[i+1]);//月结束
				String getddlx="";

				//订单类型
				//签单
				ls_sql =" SELECT distinct ddlx";
				ls_sql+=" FROM (";

				ls_sql+=" SELECT distinct jc_zcdd.ddlx";
				ls_sql+=" FROM jc_zcdd";
				ls_sql+=" where jc_zcdd.sfjs in('Y','M','F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
				ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+start+"','YYYY-MM-DD')";
				ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+end+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
				ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
				ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
				ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";

				ls_sql+=" UNION ALL ";

				//增减项
				ls_sql+=" SELECT distinct jc_zcdd.ddlx";
				ls_sql+=" FROM jc_zczjx,jc_zcdd";
				ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
				ls_sql+=" and jc_zczjx.sfjs in('Y','M','F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
				ls_sql+=" and jc_zczjx.jissj>=TO_DATE('"+start+"','YYYY-MM-DD')";
				ls_sql+=" and jc_zczjx.jissj<=TO_DATE('"+end+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
				ls_sql+=" and jc_zczjx.gys='"+getgys+"'";
				ls_sql+=" and jc_zczjx.zcdlbm='"+getzcdlbm+"'";
				ls_sql+=" and jc_zczjx.ppbm='"+getppbm+"'";


				ls_sql+=" )";

				ls_sql+=" order by ddlx";

			//	out.println(ls_sql);
				
				ps4= conn.prepareStatement(ls_sql);
				rs4 =ps4.executeQuery();
				while (rs4.next())
				{
					getddlx=rs4.getString("ddlx");

					//签单结算
					int khsl=0;
					int ddsl=0;
					double cbze=0;
					double hkze=0;
					double jsfl=0;

					if (getddlx.equals("9") || getddlx.equals("E"))
					{
						ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(jc_zcdd.cbze+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2)) cbze,sum(hkze) hkze";
						ls_sql+=" FROM jc_zcdd";
						ls_sql+=" where jc_zcdd.sfjs in('Y','M','F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
						ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+start+"','YYYY-MM-DD')";
						ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+end+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
						ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
						ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
						ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
						ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
						ls_sql+=" and jc_zcdd.ddlx='"+getddlx+"'";
						ps1= conn.prepareStatement(ls_sql);
						rs1 =ps1.executeQuery();
						if (rs1.next())
						{
							khsl=rs1.getInt("khsl");
							ddsl=rs1.getInt("ddsl");
							cbze=rs1.getDouble("cbze");
							hkze=rs1.getDouble("hkze");
						}
						rs1.close();
						ps1.close();
					}
					else {
						ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(jc_zcdd.cbze+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2)) cbze,sum(hkze) hkze";
						ls_sql+=" FROM jc_zcdd";
						ls_sql+=" where jc_zcdd.sfjs in('Y','M','F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
						ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+start+"','YYYY-MM-DD')";
						ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+end+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
						ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
						ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
						ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
						ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
						ls_sql+=" and jc_zcdd.ddlx='"+getddlx+"'";
						ps1= conn.prepareStatement(ls_sql);
						rs1 =ps1.executeQuery();
						if (rs1.next())
						{
							khsl=rs1.getInt("khsl");
							ddsl=rs1.getInt("ddsl");
							cbze=rs1.getDouble("cbze");
							hkze=rs1.getDouble("hkze");
						}
						rs1.close();
						ps1.close();
					}




					xjkhsl+=khsl;
					xjddsl+=ddsl;
					xjcbze+=cbze;
					xjhkze+=hkze;

					zjkhsl+=khsl;
					zjddsl+=ddsl;
					zjcbze+=cbze;
					zjhkze+=hkze;

					//增减项结算
					double zjxcbze=0;
					double zjxze=0;
					ls_sql =" SELECT sum(jc_zczjx.zjxcbze+jc_zczjx.zjxycf+jc_zczjx.zjxqtf) zjxcbze,sum(jc_zczjx.zjxze) zjxze";
					ls_sql+=" FROM jc_zczjx,jc_zcdd";
					ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
					ls_sql+=" and jc_zczjx.sfjs in('Y','M','F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
					ls_sql+=" and jc_zczjx.jissj>=TO_DATE('"+start+"','YYYY-MM-DD')";
					ls_sql+=" and jc_zczjx.jissj<=TO_DATE('"+end+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
					ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
					ls_sql+=" and jc_zczjx.gys='"+getgys+"'";
					ls_sql+=" and jc_zczjx.zcdlbm='"+getzcdlbm+"'";
					ls_sql+=" and jc_zczjx.ppbm='"+getppbm+"'";
					ls_sql+=" and jc_zcdd.ddlx='"+getddlx+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						zjxcbze=rs1.getDouble("zjxcbze");
						zjxze=rs1.getDouble("zjxze");
					}
					rs1.close();
					ps1.close();


					xjzjxcbze+=zjxcbze;
					xjzjxze+=zjxze;
					zjzjxcbze+=zjxcbze;
					zjzjxze+=zjxze;

					jsfl=(hkze+zjxze)-(cbze+zjxcbze);
					if (getddlx.equals("5") || getddlx.equals("D") )//标准套餐,D：套餐外主材
					{
						jsfl=0;
					}
					xjjsfl+=jsfl;
					zjjsfl+=jsfl;

					//合同结算付款额
					double htjsfkje=0;
					if (getddlx.equals("9") || getddlx.equals("E"))
					{
						ls_sql =" SELECT sum(jc_zcdd.cbze+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2)) jsje";
						ls_sql+=" FROM jc_zcdd";
						ls_sql+=" where jc_zcdd.sfjs in('F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
						ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+start+"','YYYY-MM-DD')";
						ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+end+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
						ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
						ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
						ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
						ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
						ls_sql+=" and jc_zcdd.ddlx='"+getddlx+"'";
						ps1= conn.prepareStatement(ls_sql);
						rs1 =ps1.executeQuery();
						if (rs1.next())
						{
							htjsfkje=rs1.getDouble("jsje");
						}
						rs1.close();
						ps1.close();
					}
					else{
						ls_sql =" SELECT sum(jc_zcdd.cbze+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2)) jsje";
						ls_sql+=" FROM jc_zcdd";
						ls_sql+=" where jc_zcdd.sfjs in('F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
						ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+start+"','YYYY-MM-DD')";
						ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+end+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
						ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
						ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
						ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
						ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
						ls_sql+=" and jc_zcdd.ddlx='"+getddlx+"'";
						ps1= conn.prepareStatement(ls_sql);
						rs1 =ps1.executeQuery();
						if (rs1.next())
						{
							htjsfkje=rs1.getDouble("jsje");
						}
						rs1.close();
						ps1.close();
					}

					xjhtjsfkje+=htjsfkje;
					zjhtjsfkje+=htjsfkje;

					//增减项结算付款额
					double zjxjsfkje=0;
					ls_sql =" SELECT sum(jc_zczjx.zjxcbze+jc_zczjx.zjxycf+jc_zczjx.zjxqtf) jsje";
					ls_sql+=" FROM jc_zczjx,jc_zcdd";
					ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
					ls_sql+=" and jc_zczjx.sfjs in('F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
					ls_sql+=" and jc_zczjx.jissj>=TO_DATE('"+start+"','YYYY-MM-DD')";
					ls_sql+=" and jc_zczjx.jissj<=TO_DATE('"+end+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
					ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
					ls_sql+=" and jc_zczjx.gys='"+getgys+"'";
					ls_sql+=" and jc_zczjx.zcdlbm='"+getzcdlbm+"'";
					ls_sql+=" and jc_zczjx.ppbm='"+getppbm+"'";
					ls_sql+=" and jc_zcdd.ddlx='"+getddlx+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						zjxjsfkje=rs1.getDouble("jsje");
					}
					rs1.close();
					ps1.close();

					xjzjxjsfkje+=zjxjsfkje;
					zjzjxjsfkje+=zjxjsfkje;

					//1：代销品；4：有库存订单；5：标准套餐；6：家具健康套餐；7：温暖静音套餐；
					//8：窗帘套餐；9：集成家居；A:顶配升级、B:顶配独立收费、C:选配主材；D：套餐外主材；E：散客
					String ddlxmc="";
					if (getddlx.equals("1"))
					{
						ddlxmc="代销品";
					}
					else if (getddlx.equals("3"))
					{
						ddlxmc="补录合同";
					}
					else if (getddlx.equals("4"))
					{
						ddlxmc="有库存订单";
					}
					else if (getddlx.equals("5"))
					{
						ddlxmc="标准套餐";
					}
					else if (getddlx.equals("6"))
					{
						ddlxmc="家具健康套餐";
					}
					else if (getddlx.equals("7"))
					{
						ddlxmc="温暖静音套餐";
					}
					else if (getddlx.equals("8"))
					{
						ddlxmc="窗帘套餐";
					}
					else if (getddlx.equals("9"))
					{
						ddlxmc="集成家居";
					}
					else if (getddlx.equals("A"))
					{
						ddlxmc="顶配升级";
					}
					else if (getddlx.equals("B"))
					{
						ddlxmc="顶配独立收费";
					}
					else if (getddlx.equals("C"))
					{
						ddlxmc="选配主材";
					}
					else if (getddlx.equals("D"))
					{
						ddlxmc="套餐外主材";
					}
					else if (getddlx.equals("E"))
					{
						ddlxmc="散客";
					}


					//平均单额
					int jspjde=0;
					if (ddsl!=0)
					{
						jspjde=(int)(cbze+zjxcbze)/ddsl;
					}
					else{
						jspjde=0;
					}

					//设置显示数据

					trData[row][0]=num+"";
					trData[row][1]=getgys;
					trData[row][2]=getzcdlbm;
					trData[row][3]=getppbm;
					trData[row][4]="<A HREF=\"ViewGysWjWjsMx.jsp?sjfw="+sjfw+"&sjfw2="+sjfw2+"&gys="+getgys+"&zcdlbm="+getzcdlbm+"&ppbm="+getppbm+"&fgsbh="+getfgsbh+"\" target=\"_blank\">"+cf.formatDouble((htwjwjsje+zjxwjwjsje))+"</A>";
					trData[row][5]=ret[i+1]+"月";
					trData[row][6]=ddlxmc;
					trData[row][7]=khsl+"";
					trData[row][8]=ddsl+"";
					trData[row][9]=jspjde+"";
					trData[row][10]="<A HREF=\"ViewGysJsMx.jsp?sjfw="+start+"&sjfw2="+end+"&gys="+getgys+"&zcdlbm="+getzcdlbm+"&ppbm="+getppbm+"&ddlx="+getddlx+"&fgsbh="+getfgsbh+"\" target=\"_blank\">"+cf.formatDouble((cbze+zjxcbze))+"</A>";
					trData[row][11]="<A HREF=\"ViewGysJsYfkMx.jsp?sjfw="+start+"&sjfw2="+end+"&gys="+getgys+"&zcdlbm="+getzcdlbm+"&ppbm="+getppbm+"&ddlx="+getddlx+"&fgsbh="+getfgsbh+"\" target=\"_blank\">"+cf.formatDouble((htjsfkje+zjxjsfkje))+"</A>";
					trData[row][12]=cf.formatDouble((hkze+zjxze))+"";

					trData[row][13]=cf.formatDouble(jsfl)+"";


					row++;


				}
				rs4.close();
				ps4.close();
			}

			
			
			
		}
		rs3.close();
		ps3.close();

		//输出供应商小计
		int jspjde=0;
		if (xjddsl!=0)
		{
			jspjde=(int)(xjcbze+xjzjxcbze)/xjddsl;
		}
		else{
			jspjde=0;
		}
		trData[row][0]=num+"";
		trData[row][1]=getgys;
		trData[row][2]="<B>小 计</B>";
		trData[row][3]="";
		trData[row][4]="<B>"+cf.formatDouble((xjhtwjwjsje+xjzjxwjwjsje))+"</B>";
		trData[row][5]="&nbsp;";
		trData[row][6]="&nbsp;";
		trData[row][7]="<B>"+xjkhsl+"</B>";
		trData[row][8]="<B>"+xjddsl+"</B>";
		trData[row][9]="<B>"+jspjde+"</B>";
		trData[row][10]="<B>"+cf.formatDouble((xjcbze+xjzjxcbze))+"</B>";
		trData[row][11]="<B>"+cf.formatDouble((xjhtjsfkje+xjzjxjsfkje))+"</B>";
		trData[row][12]=cf.formatDouble((xjhkze+xjzjxze))+"";

		trData[row][13]=cf.formatDouble(xjjsfl)+"";

		row++;
	}
	rs2.close();
	ps2.close();


	
	//设置是否合并
	int[] isHb=new int[trData[0].length];
	isHb[0]=1;
	isHb[1]=1;
	isHb[2]=1;
	isHb[3]=1;
	isHb[4]=1;
	isHb[5]=1;

	//输入字符数组，输出行，相同行合并
	cf.outTr(out,trData,isHb);
	
	

	int jspjde=0;
	if (zjddsl!=0)
	{
		jspjde=(int)(zjcbze+zjzjxcbze)/zjddsl;
	}
	else{
		jspjde=0;
	}

%>
<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="4" bgcolor="#E8E8FF"><strong><font color="#ff0000">总计</strong></td>
	
	<td bgcolor="#E8E8FF"><strong><%=cf.formatDouble((zjhtwjwjsje+zjzjxwjwjsje))%></strong></td>
	<td bgcolor="#E8E8FF">&nbsp;</td>
	<td bgcolor="#E8E8FF">&nbsp;</td>

	<td  bgcolor="#E8E8FF"><strong><%=zjkhsl%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=zjddsl%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=jspjde%></strong></td>

	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble((zjcbze+zjzjxcbze))%></strong></td>
	<td bgcolor="#E8E8FF"><strong><%=cf.formatDouble((zjhtjsfkje+zjzjxjsfkje))%></strong></td>
	<td bgcolor="#E8E8FF"><strong><%=cf.formatDouble((zjhkze+zjzjxze))%></strong></td>
	<td bgcolor="#E8E8FF"><strong><%=cf.formatDouble(zjjsfl)%></strong></td>
  </tr>
</table>


</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	try{
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

</script> 