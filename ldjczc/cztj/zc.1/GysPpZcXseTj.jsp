<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030306'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[品牌销售统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[品牌销售统计]："+xtrzyhmc+"') ";
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>品牌结算额统计</B><BR>
  <b>(签合同时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="140%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="2%" >排名</td>
  <td  width="12%" >品牌</td>
  <td  width="7%" >结算额小计</td>
  <td  width="7%" >签单结算额</td>
  <td  width="7%" >退单结算金额</td>
  <td  width="7%" >增减项结算额</td>

  <td  width="5%" >客户数</td>
  <td  width="5%" >订单数</td>
  <td  width="7%" >销售额小计</td>
  <td  width="7%" >折前－合同额</td>
  <td  width="7%" >折后－合同额</td>
  <td  width="6%" >平均单值</td>
  <td  width="7%" >退单额</td>
  <td  width="7%" >增减项</td>
  <td  width="11%" >分公司</td>

  </tr>
<%
	//获取最大数
	String getfgsbh=null;
	String getppbm=null;
	double je=0;

	
	int xjkhsl=0;
	int xjddsl=0;
	double xjwdzgce=0;
	double xjqye=0;
	double xjcbze=0;
	double xjje=0;
	double xjtde=0;
	double xjzjxze=0;

	int row=0;


	
	//签单
	ls_sql =" SELECT fgsbh,ppbm,sum(je) je";
	ls_sql+=" FROM (";

	ls_sql+=" SELECT fgsbh,ppbm,sum(hkze) je";
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

	if (!(ppbm.equals("")))
	{
		ls_sql+=" and  jc_zcdd.ppbm='"+ppbm+"'";
	}
	ls_sql+=" group by fgsbh,ppbm";


	ls_sql+=" UNION ALL ";
	
	//退单
	ls_sql+=" SELECT fgsbh,ppbm,-1*sum(hkze+zjhze) je";
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

	if (!(ppbm.equals("")))
	{
		ls_sql+=" and  jc_zcdd.ppbm='"+ppbm+"'";
	}
	ls_sql+=" group by fgsbh,ppbm";

	ls_sql+=" UNION ALL ";

	//增减项
	ls_sql+=" SELECT fgsbh,ppbm,sum(zjxze) je";
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

	if (!(ppbm.equals("")))
	{
		ls_sql+=" and  jc_zczjx.ppbm='"+ppbm+"'";
	}
	ls_sql+=" group by fgsbh,ppbm";


	ls_sql+=" )";

	ls_sql+=" group by fgsbh,ppbm";
	ls_sql+=" order by je desc";

//	out.println(ls_sql);
	
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("fgsbh");
		getppbm=rs.getString("ppbm");
		je=rs.getDouble("je");

		xjje+=je;
		
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



		double zkl=0;
		int pjde=0;
		if (ddsl!=0)
		{
			pjde=(int)qye/ddsl;
		}
		else{
			pjde=0;
		}

		//退单
		double tde=0;
		double tdcbze=0;
		ls_sql =" SELECT -1*sum(hkze+zjhze) tde,-1*sum(cbze+zjxcbze) tdcbze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt='99'";
		ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
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

		//增减项
		double zjxze=0;
		double zjxcbze=0;
		ls_sql =" SELECT sum(zjxze) zjxze,sum(zjxcbze) zjxcbze";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where jc_zczjx.clzt not in('00')";
		ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
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

		row++;

		%>
		<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td ><%=row%></td>
			<td ><%=getppbm%></td>
			<td><%=cf.formatDouble(cbze+tdcbze+zjxcbze)%></td>
			<td>
				<A HREF="ViewPpQdMxJs.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&ppbm=<%=getppbm%>&fgsbh=<%=getfgsbh%>" target="_blank">
				<%=cf.formatDouble(cbze)%>
				</A>
			</td>
			<td>
				<A HREF="ViewPpTdMxJs.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&ppbm=<%=getppbm%>&fgsbh=<%=getfgsbh%>" target="_blank">
				<%=cf.formatDouble(tdcbze)%>
				</A>
			</td>
			<td>
				<A HREF="ViewPpZjxMxJs.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&ppbm=<%=getppbm%>&fgsbh=<%=getfgsbh%>" target="_blank">
				<%=cf.formatDouble(zjxcbze)%>
				</A>
			</td>

			<td><%=khsl%></td>
			<td><%=ddsl%></td>
			<td><%=cf.formatDouble((long)je)%></td>
			<td><%=cf.formatDouble((long)wdzgce)%></td>
			<td>
				<%=cf.formatDouble((long)qye)%>
			</td>
			<td><%=cf.formatDouble(pjde)%></td>
			<td>
				<%=cf.formatDouble((long)tde)%>
			</td>
			<td>
				<%=cf.formatDouble((long)zjxze)%>
			</td>
			<td ><%=fgsmc%></td>

		</tr>
		<%	
	}
	rs.close();
	ps.close();
	

	int pjde=0;
	if (xjddsl!=0)
	{
		pjde=(int)xjqye/xjddsl;
	}
	else{
		pjde=0;
	}
%>
<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="2"><font color="#ff0000">总计</td>
	
	<td><%=cf.formatDouble((long)xjje)%></td>
	<td><%=cf.formatDouble((long)xjkhsl)%></td>
	<td><%=xjddsl%></td>
	<td><%=cf.formatDouble((long)xjcbze)%></td>
	<td><%=cf.formatDouble((long)xjwdzgce)%></td>
	<td><%=cf.formatDouble((long)xjqye)%></td>
	<td><%=pjde%></td>
	<td><%=cf.formatDouble((long)xjtde)%></td>
	<td><%=cf.formatDouble((long)xjzjxze)%></td>
	<td>&nbsp;</td>

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