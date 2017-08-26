<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='170804'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[供应商销售报表（个性化）]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[供应商销售报表（个性化）]："+xtrzyhmc+"') ";
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
String ppbm=cf.GB2Uni(request.getParameter("ppbm"));


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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>供应商销售报表（集成家居）</B><BR>
  <b>(签合同时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="110%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="3%" >排名</td>
  <td  width="7%" >主材大类</td>
  <td  width="7%" >品牌</td>

  <td  width="8%" >销售小计<BR>(签单-退单+增减项)</td>
  <td  width="4%" >客户数</td>
  <td  width="4%" >订单数</td>
  <td  width="7%" >折前－合同额</td>
  <td  width="7%" >折后－合同额</td>
  <td  width="5%" >平均单值</td>
  <td  width="6%" >退单额</td>
  <td  width="6%" >增减项</td>

  <td  width="7%" bgcolor="#66FFFF" ><strong>成本额小计<BR>(签单-退单+增减项)</strong></td>
  <td  width="5%" bgcolor="#66FFFF" ><strong>平均单值</strong></td>
  <td  width="5%" bgcolor="#66FFFF" ><strong>平均结算比例</strong></td>
  <td  width="7%" bgcolor="#66FFFF" ><strong>签单成本</strong></td>
  <td  width="6%" bgcolor="#66FFFF" ><strong>退单成本</strong></td>
  <td  width="6%" bgcolor="#66FFFF" ><strong>增减项成本</strong></td>

  </tr>
<%
	//获取最大数
	String getfgsbh=null;
	String getppbm=null;
	String getzcdlbm=null;
	double xsje=0;
	double cbje=0;

	
	int xjkhsl=0;
	int xjddsl=0;
	double xjwdzgce=0;
	double xjqye=0;
	double xjxsje=0;
	double xjtde=0;
	double xjzjxze=0;

	double xjcbje=0;
	double xjcbze=0;
	double xjtdcbze=0;
	double xjzjxcbze=0;

	int row=0;


	
	ls_sql =" SELECT fgsbh,ppbm,zcdlbm,sum(cbje) cbje,sum(xsje) xsje";
	ls_sql+=" FROM (";

	//签单
	ls_sql+=" SELECT jc_zcdd.fgsbh,jc_zcdd.ppbm,jc_zcdd.zcdlbm,sum(jc_zcdd.cbze) cbje,sum(jc_zcdd.hkze) xsje";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.ddlx not in('5','A')";//1：代销品；3：补录合同；4：有库存订单；5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材；D：套餐外主材
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";
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

	if (!(ppbm.equals("")))
	{
		ls_sql+=" and  jc_zcdd.ppbm='"+ppbm+"'";
	}
	ls_sql+=" group by jc_zcdd.fgsbh,ppbm,zcdlbm";


	ls_sql+=" UNION ALL ";
	
	//退单
	ls_sql+=" SELECT jc_zcdd.fgsbh,jc_zcdd.ppbm,jc_zcdd.zcdlbm,-1*sum(jc_zcdd.cbze+jc_zcdd.zjxcbze) cbje,-1*sum(jc_zcdd.hkze+jc_zcdd.zjhze) xsje";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.ddlx not in('5','A')";//1：代销品；3：补录合同；4：有库存订单；5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材；D：套餐外主材
	ls_sql+=" and jc_zcdd.clzt='99'";
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

	if (!(ppbm.equals("")))
	{
		ls_sql+=" and  jc_zcdd.ppbm='"+ppbm+"'";
	}
	ls_sql+=" group by jc_zcdd.fgsbh,ppbm,zcdlbm";

	ls_sql+=" UNION ALL ";

	//增减项
	ls_sql+=" SELECT jc_zczjx.fgsbh,jc_zczjx.ppbm,jc_zczjx.zcdlbm,sum(jc_zczjx.zjxcbze) cbje,sum(jc_zczjx.zjxze) xsje";
	ls_sql+=" FROM jc_zczjx,jc_zcdd ";
	ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh ";
	ls_sql+=" and jc_zcdd.ddlx not in('5','A')";//1：代销品；3：补录合同；4：有库存订单；5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材；D：套餐外主材
	ls_sql+=" and jc_zczjx.clzt not in('00')";
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

	if (!(ppbm.equals("")))
	{
		ls_sql+=" and  jc_zczjx.ppbm='"+ppbm+"'";
	}
	ls_sql+=" group by jc_zczjx.fgsbh,jc_zczjx.ppbm,jc_zczjx.zcdlbm";


	ls_sql+=" )";

	ls_sql+=" group by fgsbh,ppbm,zcdlbm";
	ls_sql+=" order by xsje desc";

//	out.println(ls_sql);
	
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("fgsbh");
		getppbm=rs.getString("ppbm");
		getzcdlbm=rs.getString("zcdlbm");
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
		ls_sql =" SELECT count(distinct jc_zcdd.khbh) khsl,count(jc_zcdd.ddbh) ddsl,sum(jc_zcdd.wdzje) wdzje,sum(jc_zcdd.hkze) qye,sum(jc_zcdd.cbze) cbze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.ddlx not in('5','A')";//1：代销品；3：补录合同；4：有库存订单；5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材；D：套餐外主材
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
		ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
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
		ls_sql =" SELECT -1*sum(jc_zcdd.hkze+jc_zcdd.zjhze) tde,-1*sum(jc_zcdd.cbze+jc_zcdd.zjxcbze) tdcbze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.ddlx not in('5','A')";//1：代销品；3：补录合同；4：有库存订单；5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材；D：套餐外主材
		ls_sql+=" and jc_zcdd.clzt='99'";
		ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
		ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
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
		ls_sql =" SELECT sum(jc_zczjx.zjxze) xsje,sum(jc_zczjx.zjxcbze) zjxcbze";
		ls_sql+=" FROM jc_zczjx,jc_zcdd ";
		ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh ";
		ls_sql+=" and jc_zcdd.ddlx not in('5','A')";//1：代销品；3：补录合同；4：有库存订单；5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材；D：套餐外主材
		ls_sql+=" and jc_zczjx.clzt not in('00')";
		ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zczjx.ppbm='"+getppbm+"'";
		ls_sql+=" and jc_zczjx.zcdlbm='"+getzcdlbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zjxze=rs1.getDouble("xsje");
			zjxcbze=rs1.getDouble("zjxcbze");
		}
		rs1.close();
		ps1.close();

		xjzjxze+=zjxze;
		xjzjxcbze+=zjxcbze;

		double zkl=0;
		int xspjde=0;
		if (ddsl!=0)
		{
			xspjde=(int)qye/ddsl;
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
		<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td ><%=row%></td>
			<td ><%=getzcdlbm%></td>
			<td ><%=getppbm%></td>



			<td><%=cf.formatDouble((long)xsje)%></td>

			<td><%=khsl%></td>
			<td><%=ddsl%></td>
			<td><%=cf.formatDouble((long)wdzgce)%></td>
			<td>
				<A HREF="ViewPpQdMxJsGxh.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&ppbm=<%=getppbm%>&zcdlbm=<%=getzcdlbm%>&fgsbh=<%=getfgsbh%>" target="_blank">
				<%=cf.formatDouble((long)qye)%></A>
			</td>
			<td><%=cf.formatDouble(xspjde)%></td>
			<td>
				<A HREF="ViewPpTdMxJsGxh.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&ppbm=<%=getppbm%>&zcdlbm=<%=getzcdlbm%>&fgsbh=<%=getfgsbh%>" target="_blank">
				<%=cf.formatDouble((long)tde)%></A>
			</td>
			<td>
				<A HREF="ViewPpZjxMxJsGxh.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&ppbm=<%=getppbm%>&zcdlbm=<%=getzcdlbm%>&fgsbh=<%=getfgsbh%>" target="_blank">
				<%=cf.formatDouble((long)zjxze)%></A>
			</td>


			<td><%=cf.formatDouble((long)cbje)%></td>
			<td><%=cf.formatDouble(jspjde)%></td>
			<td><%=cf.formatDouble(pjjsbl)%>%</td>
			<td>
				<%=cf.formatDouble((long)cbze)%></td>
			<td>
				<%=cf.formatDouble((long)tdcbze)%></td>
			<td>
				<%=cf.formatDouble((long)zjxcbze)%></td>

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
	<td colspan="3"><font color="#ff0000">总计</td>
	
	<td><%=cf.formatDouble((long)xjxsje)%></td>
	<td><%=xjkhsl%></td>
	<td><%=xjddsl%></td>
	<td><%=cf.formatDouble((long)xjwdzgce)%></td>
	<td><%=cf.formatDouble((long)xjqye)%></td>
	<td><%=xspjde%></td>
	<td><%=cf.formatDouble((long)xjtde)%></td>
	<td><%=cf.formatDouble((long)xjzjxze)%></td>

	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)xjcbze)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=jspjde%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=pjjsbl%>%</strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)xjcbze)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)xjtdcbze)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble((long)xjzjxcbze)%></strong></td>

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