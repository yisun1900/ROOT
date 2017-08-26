<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030314'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[供应商结算统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[供应商结算统计]："+xtrzyhmc+"') ";
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
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
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
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="200%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="2%" rowspan="3" ><strong>排名</strong></td>
  <td  width="10%" rowspan="3" ><strong>供应商</strong></td>
  <td  width="5%" rowspan="3" ><strong>主材大类</strong></td>
  <td  width="5%" rowspan="3" ><strong>品牌</strong></td>

  <td colspan="3" bgcolor="#CCFFFF" ><strong>结算情况</strong></td>
  <td colspan="14" ><strong>销售情况</strong></td>
</tr>

<TR bgcolor="#CCCCCC"  align="center"  > 

  <td width="5%" rowspan="2" bgcolor="#CCFFFF" ><strong>已结算金额</strong></td>
  <td width="5%" rowspan="2" bgcolor="#CCFFFF" ><strong>结算已付款金额</strong></td>
  <td width="5%" rowspan="2" bgcolor="#CCFFFF" ><strong>已完结未结算金额</strong></td>

  <td  width="3%"  rowspan="2" bgcolor="#FFFFCC"><strong>客户数</strong></td>
  <td  width="4%"  rowspan="2" bgcolor="#FFFFCC"><strong>订单数</strong></td>
  <td colspan="6" bgcolor="#66FFFF" ><strong>成本额</strong></td>
  <td colspan="6" bgcolor="#FFFFCC" ><strong>销售额</strong></td>
</tr>
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="5%" bgcolor="#66FFFF" ><strong>成本额小计<BR>(签单-退单+增减项)</strong></td>
  <td  width="4%" bgcolor="#66FFFF" ><strong>平均成本</strong></td>
  <td  width="3%" bgcolor="#66FFFF" ><strong>平均结算比例</strong></td>
  <td  width="5%" bgcolor="#66FFFF" ><strong>签单成本额</strong></td>
  <td  width="5%" bgcolor="#66FFFF" ><strong>退单成本额</strong></td>
  <td  width="5%" bgcolor="#66FFFF" ><strong>增减项成本额</strong></td>

  <td  width="5%" bgcolor="#FFFFCC" ><strong>销售额小计<BR>(签单-退单+增减项)</strong></td>
  <td  width="4%" bgcolor="#FFFFCC" ><strong>平均单值</strong></td>
  <td  width="5%" bgcolor="#FFFFCC" ><strong>折前－合同额</strong></td>
  <td  width="5%" bgcolor="#FFFFCC" ><strong>折后－合同额</strong></td>
  <td  width="5%" bgcolor="#FFFFCC" ><strong>退单额</strong></td>
  <td  width="5%" bgcolor="#FFFFCC" ><strong>增减项</strong></td>
  </tr>
<%
	//获取最大数
	String getfgsbh=null;
	String getgys=null;
	String getzcdlbm=null;
	String getppbm=null;
	double xsje=0;
	double cbje=0;

	double xjxsje=0;
	double xjcbje=0;
	
	int xjkhsl=0;
	int xjddsl=0;
	double xjwdzgce=0;
	double xjqye=0;
	double xjcbze=0;
	double xjtde=0;
	double xjzjxze=0;
	double xjtdcbze=0;
	double xjzjxcbze=0;

	double xjhtjsje=0;
	double xjzjxjsje=0;
	double xjhtjsfkje=0;
	double xjzjxjsfkje=0;
	double xjhtwjwjsje=0;
	double xjzjxwjwjsje=0;

	int row=0;


	
	//签单
	ls_sql =" SELECT fgsbh,gys,zcdlbm,ppbm,sum(cbje) cbje,sum(xsje) xsje";
	ls_sql+=" FROM (";

	ls_sql+=" SELECT fgsbh,gys,zcdlbm,ppbm,sum(cbze) cbje,sum(hkze) xsje";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";
	ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
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
	ls_sql+=" group by fgsbh,gys,zcdlbm,ppbm";


	ls_sql+=" UNION ALL ";
	
	//退单
	ls_sql+=" SELECT fgsbh,gys,zcdlbm,ppbm,-1*sum(cbze+zjxcbze) cbje,-1*sum(hkze+zjhze) xsje";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.clzt='99'";
	ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
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
	ls_sql+=" group by fgsbh,gys,zcdlbm,ppbm";

	ls_sql+=" UNION ALL ";

	//增减项
	ls_sql+=" SELECT fgsbh,gys,zcdlbm,ppbm,sum(zjxcbze) cbje,sum(zjxze) xsje";
	ls_sql+=" FROM jc_zczjx";
	ls_sql+=" where jc_zczjx.clzt not in('00')";
	ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
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
	ls_sql+=" group by fgsbh,gys,zcdlbm,ppbm";


	ls_sql+=" )";

	ls_sql+=" group by fgsbh,gys,zcdlbm,ppbm";
	ls_sql+=" order by fgsbh,gys,zcdlbm,ppbm,cbje desc";

//	out.println(ls_sql);
	
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("fgsbh");
		getgys=rs.getString("gys");
		getzcdlbm=rs.getString("zcdlbm");
		getppbm=rs.getString("ppbm");
		cbje=rs.getDouble("cbje");
		xsje=rs.getDouble("xsje");

		xjcbje+=cbje;
		xjxsje+=xsje;
		
		String fgsmc=null;
		ls_sql=" SELECT dwmc";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where dwbh='"+getfgsbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fgsmc=rs1.getString("dwmc");
		}
		rs1.close();
		ps1.close();

		//签单
		int khsl=0;
		int ddsl=0;
		double wdzgce=0;
		double qye=0;
		double cbze=0;
		ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(wdzje) wdzje,sum(hkze) qye,sum(cbze) cbze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
		ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
		ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khsl=rs1.getInt("khsl");
			ddsl=rs1.getInt("ddsl");
			wdzgce=rs1.getDouble("wdzje");
			qye=rs1.getDouble("qye");
			cbze=rs1.getDouble("cbze");
		}
		rs1.close();
		ps1.close();

		xjkhsl+=khsl;
		xjddsl+=ddsl;
		xjwdzgce+=wdzgce;
		xjqye+=qye;
		xjcbze+=cbze;


		//退单
		double tde=0;
		double tdcbze=0;
		ls_sql =" SELECT -1*sum(hkze+zjhze) tde,-1*sum(cbze+zjxcbze) tdcbze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt='99'";
		ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
		ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
		ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tde=rs1.getDouble("tde");
			tdcbze=rs1.getDouble("tdcbze");
		}
		rs1.close();
		ps1.close();

		xjtde+=tde;
		xjtdcbze+=tdcbze;

		//增减项
		double zjxze=0;
		double zjxcbze=0;
		ls_sql =" SELECT sum(zjxze) zjxze,sum(zjxcbze) zjxcbze";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where jc_zczjx.clzt not in('00')";
		ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zczjx.gys='"+getgys+"'";
		ls_sql+=" and jc_zczjx.zcdlbm='"+getzcdlbm+"'";
		ls_sql+=" and jc_zczjx.ppbm='"+getppbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zjxze=rs1.getDouble("zjxze");
			zjxcbze=rs1.getDouble("zjxcbze");
		}
		rs1.close();
		ps1.close();

		xjzjxze+=zjxze;
		xjzjxcbze+=zjxcbze;

		//合同结算额
		double htjsje=0;
		ls_sql =" SELECT sum(cbze) jsje";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.sfjs in('Y','M','F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款
		ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
		ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
		ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			htjsje=rs1.getDouble("jsje");
		}
		rs1.close();
		ps1.close();

		xjhtjsje+=htjsje;

		//增减项结算额
		double zjxjsje=0;
		ls_sql =" SELECT sum(zjxcbze) jsje";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where jc_zczjx.sfjs in('Y','M','F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款
		ls_sql+=" and jc_zczjx.jissj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.jissj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zczjx.gys='"+getgys+"'";
		ls_sql+=" and jc_zczjx.zcdlbm='"+getzcdlbm+"'";
		ls_sql+=" and jc_zczjx.ppbm='"+getppbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zjxjsje=rs1.getDouble("jsje");
		}
		rs1.close();
		ps1.close();

		xjzjxjsje+=zjxjsje;


		//合同结算付款额
		double htjsfkje=0;
		ls_sql =" SELECT sum(cbze) jsje";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.sfjs in('F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款
		ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
		ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
		ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			htjsfkje=rs1.getDouble("jsje");
		}
		rs1.close();
		ps1.close();

		xjhtjsfkje+=htjsfkje;

		//增减项结算付款额
		double zjxjsfkje=0;
		ls_sql =" SELECT sum(zjxcbze) jsje";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where jc_zczjx.sfjs in('F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款
		ls_sql+=" and jc_zczjx.jissj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.jissj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zczjx.gys='"+getgys+"'";
		ls_sql+=" and jc_zczjx.zcdlbm='"+getzcdlbm+"'";
		ls_sql+=" and jc_zczjx.ppbm='"+getppbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zjxjsfkje=rs1.getDouble("jsje");
		}
		rs1.close();
		ps1.close();

		xjzjxjsfkje+=zjxjsfkje;


		//合同完结未结算额
		double htwjwjsje=0;
		ls_sql =" SELECT sum(cbze) jsje";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt in('30')";
		ls_sql+=" and jc_zcdd.sfjs not in('Y','M','F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款
		ls_sql+=" and jc_zcdd.wjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.wjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
		ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
		ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			htwjwjsje=rs1.getDouble("jsje");
		}
		rs1.close();
		ps1.close();

		xjhtwjwjsje+=htwjwjsje;

		//增减项完结未结算额
		double zjxwjwjsje=0;
		ls_sql =" SELECT sum(zjxcbze) jsje";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where jc_zczjx.clzt in('30')";
		ls_sql+=" and jc_zczjx.sfjs not in('Y','M','F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款
		ls_sql+=" and jc_zczjx.wjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.wjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
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


		int xspjde=0;
		if (ddsl!=0)
		{
			xspjde=(int)xsje/ddsl;
		}
		else{
			xspjde=0;
		}

		int jspjde=0;
		if (ddsl!=0)
		{
			jspjde=(int)cbje/ddsl;
		}
		else{
			jspjde=0;
		}

		double pjjsbl=0;
		if (xsje!=0)
		{
			pjjsbl=cf.round(cbje*100/xsje,2);
		}
		else{
			pjjsbl=0;
		}

		row++;

		%>
		<tr align="center"  bgcolor="#FFFFFF"  onclick="onclickTr(this)" onMouseOver="inTr(this)" onMouseOut="outTr(this)">
			<td ><%=row%></td>
			<td ><%=getgys%></td>
			<td ><%=getzcdlbm%></td>
			<td ><%=getppbm%></td>

			<td>
				<A HREF="ViewGysJsMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&gys=<%=getgys%>&zcdlbm=<%=getzcdlbm%>&ppbm=<%=getppbm%>&fgsbh=<%=getfgsbh%>" target="_blank">
				<%=cf.formatDouble((long)(htjsje+zjxjsje))%></A></td>
			<td>
				<A HREF="ViewGysJsYfkMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&gys=<%=getgys%>&zcdlbm=<%=getzcdlbm%>&ppbm=<%=getppbm%>&fgsbh=<%=getfgsbh%>" target="_blank">
				<%=cf.formatDouble((long)(htjsfkje+zjxjsfkje))%></A></td>
			<td>
				<A HREF="ViewGysWjWjsMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&gys=<%=getgys%>&zcdlbm=<%=getzcdlbm%>&ppbm=<%=getppbm%>&fgsbh=<%=getfgsbh%>" target="_blank">
				<%=cf.formatDouble((long)(htwjwjsje+zjxwjwjsje))%></A></td>

			<td><%=khsl%></td>
			<td><%=ddsl%></td>

			<td><%=cf.formatDouble(cbje)%></td>
			<td><%=cf.formatDouble(jspjde)%></td>
			<td><%=cf.formatDouble(pjjsbl)%>%</td>
			<td>
				<A HREF="ViewGysPpQdMxJs.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&gys=<%=getgys%>&zcdlbm=<%=getzcdlbm%>&ppbm=<%=getppbm%>&fgsbh=<%=getfgsbh%>" target="_blank">
				<%=cf.formatDouble(cbze)%>				</A>			</td>
			<td>
				<A HREF="ViewGysPpTdMxJs.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&gys=<%=getgys%>&zcdlbm=<%=getzcdlbm%>&ppbm=<%=getppbm%>&fgsbh=<%=getfgsbh%>" target="_blank">
				<%=cf.formatDouble(tdcbze)%>				</A>			</td>
			<td>
				<A HREF="ViewGysPpZjxMxJs.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&gys=<%=getgys%>&zcdlbm=<%=getzcdlbm%>&ppbm=<%=getppbm%>&fgsbh=<%=getfgsbh%>" target="_blank">
				<%=cf.formatDouble(zjxcbze)%>				</A>			</td>

			<td><%=cf.formatDouble((long)xsje)%></td>
			<td><%=cf.formatDouble(xspjde)%></td>
			<td><%=cf.formatDouble((long)wdzgce)%></td>
			<td>
				<%=cf.formatDouble((long)qye)%>			</td>
			<td>
				<%=cf.formatDouble((long)tde)%>			</td>
			<td>
				<%=cf.formatDouble((long)zjxze)%>			</td>
  </tr>
		<%	
	}
	rs.close();
	ps.close();
	

	int xspjde=0;
	if (xjddsl!=0)
	{
		xspjde=(int)xjxsje/xjddsl;
	}
	else{
		xspjde=0;
	}

	int jspjde=0;
	if (xjddsl!=0)
	{
		jspjde=(int)xjcbje/xjddsl;
	}
	else{
		jspjde=0;
	}

	double pjjsbl=0;
	if (xjxsje!=0)
	{
		pjjsbl=cf.round(xjcbje*100/xjxsje,2);
	}
	else{
		pjjsbl=0;
	}
%>
<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="4" bgcolor="#E8E8FF"><strong><font color="#ff0000">总计</strong></td>
	
	<td bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)(xjhtjsje+xjzjxjsje))%></strong></td>
	<td bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)(xjhtjsfkje+xjzjxjsfkje))%></strong></td>
	<td bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)(xjhtwjwjsje+xjzjxwjwjsje))%></strong></td>

	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)xjkhsl)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=xjddsl%></strong></td>

	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)xjcbze)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=jspjde%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=pjjsbl%>%</strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble(xjcbze)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble(xjtdcbze)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble(xjzjxcbze)%></strong></td>

	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)xjxsje)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=xspjde%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)xjwdzgce)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)xjqye)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)xjtde)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)xjzjxze)%></strong></td>
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