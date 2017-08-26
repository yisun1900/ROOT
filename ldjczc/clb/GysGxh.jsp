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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>供应商销售报表（集成家居）</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="3%" >排名</td>
  <td  width="7%" >主材大类</td>
  <td  width="7%" >品牌</td>

  <td  width="8%" >销售额</td>
  <td  width="4%" >客户数</td>
  <td  width="4%" >订单数</td>
  <td  width="5%" >平均单值</td>

  <td  width="7%" bgcolor="#66FFFF" ><strong>合同额</strong></td>
  <td  width="7%" bgcolor="#66FFFF" ><strong>成本额</strong></td>
  <td  width="5%" bgcolor="#66FFFF" ><strong>平均单值</strong></td>
  <td  width="5%" bgcolor="#66FFFF" ><strong>平均结算比例</strong></td>

  </tr>
<%
	//获取最大数
	String getfgsbh=null;
	String getppbm=null;
	String getzcdlbm=null;
	double yjje=0;
	double xsje=0;
	double cbje=0;

	
	int xjkhsl=0;
	int xjddsl=0;
	double xjyjje=0;
	double xjxsje=0;

	double xjcbje=0;

	int row=0;

	int khsl=0;
	int ddsl=0;

	
	//签单
	ls_sql =" SELECT jc_zcdd.fgsbh,jc_zcdd.ppbm,jc_zcdd.zcdlbm,count(distinct cw_khfkjl.khbh) khsl,count(distinct cw_khfkjl.ddbh) ddsl,sum(cw_khfkjl.fkje) yjje";
	ls_sql+=" FROM jc_zcdd,cw_khfkjl";
	ls_sql+=" where cw_khfkjl.ddbh=jc_zcdd.ddbh(+)";

	ls_sql+=" and cw_khfkjl.scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:主材
	ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";

	ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐


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

	ls_sql+=" order by yjje desc";

//	out.println(ls_sql);
	
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("fgsbh");
		getppbm=rs.getString("ppbm");
		getzcdlbm=rs.getString("zcdlbm");
		khsl=rs.getInt("khsl");
		ddsl=rs.getInt("ddsl");
		yjje=rs.getDouble("yjje");

		xjyjje+=yjje;
		xjkhsl+=khsl;
		xjddsl+=ddsl;
		
		//合同签单
		ls_sql =" select sum(cbze),sum(jc_zcdd.hkze)";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where ddbh in(";
		ls_sql+=" select jc_zcdd.ddbh";
		ls_sql+=" FROM jc_zcdd,cw_khfkjl";
		ls_sql+=" where cw_khfkjl.ddbh=jc_zcdd.ddbh(+)";

		ls_sql+=" and cw_khfkjl.scbz='N' ";
		ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:主材
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";

		ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		ls_sql+=" and cw_khfkjl.zjxbh is null";

		ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐

		ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
		ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
		ls_sql+=" and jc_zcdd.clzt!='99'";
		ls_sql+=" )";
		ls_sql+=" and jc_zcdd.clzt!='99'";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cbje=rs1.getDouble(1);
			xsje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		
		//合同退单
		ls_sql =" select sum(cbze),sum(jc_zcdd.hkze)";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where ddbh in(";
		ls_sql+=" select jc_zcdd.ddbh";
		ls_sql+=" FROM jc_zcdd,cw_khfkjl";
		ls_sql+=" where cw_khfkjl.ddbh=jc_zcdd.ddbh(+)";

		ls_sql+=" and cw_khfkjl.scbz='N' ";
		ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:主材
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";

		ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		ls_sql+=" and cw_khfkjl.zjxbh is null";

		ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐

		ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
		ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
		ls_sql+=" and jc_zcdd.clzt='99'";
		ls_sql+=" )";
		ls_sql+=" and jc_zcdd.clzt='99'";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cbje-=rs1.getDouble(1);
			xsje-=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();
		
		//增减项签单
		ls_sql =" select sum(zjxcbze),sum(zjxze)";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where zjxbh in(";
		ls_sql+=" select jc_zczjx.zjxbh";
		ls_sql+=" FROM jc_zczjx,cw_khfkjl";
		ls_sql+=" where cw_khfkjl.zjxbh=jc_zczjx.zjxbh(+)";

		ls_sql+=" and cw_khfkjl.scbz='N' ";
		ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:主材
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";

		ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		ls_sql+=" and cw_khfkjl.zjxbh is not null";


		ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zczjx.ppbm='"+getppbm+"'";
		ls_sql+=" and jc_zczjx.zcdlbm='"+getzcdlbm+"'";
		ls_sql+=" and jc_zczjx.clzt!='99'";
		ls_sql+=" )";
		ls_sql+=" and jc_zczjx.clzt!='99'";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cbje+=rs1.getDouble(1);
			xsje+=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();
		
		//增减项退单
		ls_sql =" select sum(zjxcbze),sum(zjxze)";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where zjxbh in(";
		ls_sql+=" select jc_zczjx.zjxbh";
		ls_sql+=" FROM jc_zczjx,cw_khfkjl";
		ls_sql+=" where cw_khfkjl.zjxbh=jc_zczjx.zjxbh(+)";

		ls_sql+=" and cw_khfkjl.scbz='N' ";
		ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:主材
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";

		ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		ls_sql+=" and cw_khfkjl.zjxbh is not null";


		ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zczjx.ppbm='"+getppbm+"'";
		ls_sql+=" and jc_zczjx.zcdlbm='"+getzcdlbm+"'";
		ls_sql+=" and jc_zczjx.clzt='99'";
		ls_sql+=" )";
		ls_sql+=" and jc_zczjx.clzt='99'";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cbje-=rs1.getDouble(1);
			xsje-=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();



		xjcbje+=cbje;
		xjxsje+=xsje;


		double zkl=0;
		int xspjde=0;
		if (ddsl!=0)
		{
			xspjde=(int)yjje/ddsl;
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
			pjjsbl=cf.round(cbje*100/yjje,2);
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



			<td>
				<A HREF="ViewPpQdMxJsGxh.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&ppbm=<%=getppbm%>&zcdlbm=<%=getzcdlbm%>&fgsbh=<%=getfgsbh%>" target="_blank">
				<%=cf.formatDouble(yjje)%></A>
			</td>
			<td><%=khsl%></td>
			<td><%=ddsl%></td>
			<td><%=cf.formatDouble(xspjde)%></td>


			<td><%=cf.formatDouble(xsje)%></td>
			<td><%=cf.formatDouble(cbje)%></td>
			<td><%=cf.formatDouble(jspjde)%></td>
			<td><%=cf.formatDouble(pjjsbl)%>%</td>

		</tr>
		<%	
	}
	rs.close();
	ps.close();
	


	int xspjde=0;
	if (xjddsl!=0)
	{
		xspjde=(int)xjyjje/xjddsl;
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
		pjjsbl=cf.round(xjcbje*100/xjyjje,2);
	}
	else{
		pjjsbl=0;
	}
%>

<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="3"><font color="#ff0000">总计</td>
	
	<td><%=cf.formatDouble(xjyjje)%></td>
	<td><%=xjkhsl%></td>
	<td><%=xjddsl%></td>
	<td><%=xspjde%></td>

	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble(xjxsje)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble(xjcbje)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=jspjde%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=pjjsbl%>%</strong></td>

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