<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030101'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[大区签单统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[大区签单统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>


<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String ssdqbm=cf.fillNull(request.getParameter("ssdqbm"));

String wheresql="";
String wheresql1="";

if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
{
	wheresql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	wheresql1+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	wheresql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	wheresql1+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
}


if (!(ssdqbm.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
	wheresql1+=" and  (sq_dwxx.ssdqbm='"+ssdqbm+"')";
}


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
  <B>分公司签单统计</B><BR>
  <b>(签单时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="310%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="2%" >排名</td>
  <td  width="5%" >分公司</td>

  <td  width="3%" >签约数</td>
  <td  width="5%" >折前－合同额</td>
  <td  width="3%" >综合折扣</td>
  <td  width="5%" >折后－合同额</td>

  <td  width="3%" >已收款客户数</td>
  <td  width="3%" >财务已审核数</td>

  <td  width="5%" ><font color="#0000FF">家装实收款</font></td>
  <td  width="5%" ><font color="#0000FF">客户所有交款</font></td>

  <td  width="4%" >单额平均</td>
  <td  width="4%" >平米均价</td>
  
  <td  width="5%" >折前－工程费</td>
  <td  width="5%" >折后－工程费</td>

  <td  width="4%" >折前－税金</td>
  <td  width="4%" >折后－税金</td>

  <td  width="4%" >折前－管理费</td>
  <td  width="4%" >折后－管理费</td>

  <td  width="4%" >折前－记入业绩其它费</td>
  <td  width="4%" >折后－记入业绩其它费</td>

  <td  width="4%" >折前－不记业绩其它费</td>
  <td  width="4%" >折后－不记业绩其它费</td>

  <td  width="4%" >折前－设计费</td>
  <td  width="4%" >折后－设计费</td>
  </tr>
<%
	//获取最大数
	String dwmc=null;
	String dwbh=null;

	int qys=0;
	double wdzgce=0;
	double qye=0;

	double zqgczjf=0;
	double zhgczjf=0;

	double zqguanlif=0;
	double guanlif=0;

	double zqsuijin=0;
	double suijin=0;

	double zqqtsf=0;
	double zhqtsf=0;

	double zqwjrqyexm=0;
	double zhwjrqyexm=0;

	double zqsjf=0;
	double sjf=0;

	long fwmj=0;

	double suijinze=0;


	int ALLqys=0;
	double ALLwdzgce=0;
	double ALLqye=0;

	double ALLzqgczjf=0;
	double ALLzhgczjf=0;

	double ALLzqguanlif=0;
	double ALLguanlif=0;

	double ALLzqsuijin=0;
	double ALLsuijin=0;

	double ALLzqqtsf=0;
	double ALLzhqtsf=0;

	double ALLzqwjrqyexm=0;
	double ALLzhwjrqyexm=0;

	double ALLzqsjf=0;
	double ALLsjf=0;


	long ALLfwmj=0;

	double ALLsuijinze=0;



	double zkl=0;
	int pjde=0;
	int pmjj=0;


	int gsskqys=0;
	int cwskqys=0;
	double jzssk=0;
	double khssk=0;

	int ALLgsskqys=0;
	int ALLcwskqys=0;
	double ALLjzssk=0;
	double ALLkhssk=0;

	int row=0;
	//家装总客户总签约数
	ls_sql="SELECT count(*) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(zqgczjf) zqgczjf,sum(zhgczjf) zhgczjf,sum(NVL(zqsuijin,0)) zqsuijin,sum(NVL(suijin,0)) suijin,sum(NVL(zqguanlif,0)) zqguanlif,sum(NVL(guanlif,0)) guanlif  ,sum(NVL(zqqtsf,0)) zqqtsf,sum(NVL(zhqtsf,0)) zhqtsf ,sum(NVL(zqwjrqyexm,0)) zqwjrqyexm,sum(NVL(zhwjrqyexm,0)) zhwjrqyexm ,sum(NVL(zqsjf,0)+NVL(sjhtsjf,0)) zqsjf,sum(NVL(sjf,0)+NVL(sjhtsjf,0)) sjf    ,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where crm_khxx.zt in('2','5') ";//N：否；Y：是
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ALLqys=rs.getInt("qys");
		ALLwdzgce=rs.getDouble("wdzgce");
		ALLqye=rs.getDouble("qye");

		ALLzqgczjf=rs.getDouble("zqgczjf");
		ALLzhgczjf=rs.getDouble("zhgczjf");

		ALLzqsuijin=rs.getDouble("zqsuijin");
		ALLsuijin=rs.getDouble("suijin");

		ALLzqguanlif=rs.getDouble("zqguanlif");
		ALLguanlif=rs.getDouble("guanlif");

		ALLzqqtsf=rs.getDouble("zqqtsf");
		ALLzhqtsf=rs.getDouble("zhqtsf");

		ALLzqwjrqyexm=rs.getDouble("zqwjrqyexm");
		ALLzhwjrqyexm=rs.getDouble("zhwjrqyexm");

		ALLzqsjf=rs.getDouble("zqsjf");
		ALLsjf=rs.getDouble("sjf");

		ALLfwmj=rs.getLong("fwmj");
	}
	rs.close();
	ps.close();


	ls_sql=" SELECT dwbh,dwmc,sum(qys) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(zqgczjf) zqgczjf,sum(zhgczjf) zhgczjf,sum(NVL(zqsuijin,0)) zqsuijin,sum(NVL(suijin,0)) suijin,sum(NVL(zqguanlif,0)) zqguanlif,sum(NVL(guanlif,0)) guanlif  ,sum(NVL(zqqtsf,0)) zqqtsf,sum(NVL(zhqtsf,0)) zhqtsf ,sum(NVL(zqwjrqyexm,0)) zqwjrqyexm,sum(NVL(zhwjrqyexm,0)) zhwjrqyexm ,sum(NVL(zqsjf,0)) zqsjf,sum(NVL(sjf,0)) sjf    ,sum(fwmj) fwmj";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT crm_khxx.fgsbh dwbh,sq_dwxx.dwmc,count(*) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(zqgczjf) zqgczjf,sum(zhgczjf) zhgczjf,sum(NVL(zqsuijin,0)) zqsuijin,sum(NVL(suijin,0)) suijin,sum(NVL(zqguanlif,0)) zqguanlif,sum(NVL(guanlif,0)) guanlif  ,sum(NVL(zqqtsf,0)) zqqtsf,sum(NVL(zhqtsf,0)) zhqtsf ,sum(NVL(zqwjrqyexm,0)) zqwjrqyexm,sum(NVL(zhwjrqyexm,0)) zhwjrqyexm ,sum(NVL(zqsjf,0)+NVL(sjhtsjf,0)) zqsjf,sum(NVL(sjf,0)+NVL(sjhtsjf,0)) sjf    ,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.zt in('2','5')";
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.fgsbh,sq_dwxx.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwbh,dwmc,0 qys,0 wdzgce,0 qye,0 zqgczjf,0 zhgczjf,0 zqsuijin,0 suijin,0 zqguanlif,0 guanlif  ,0 zqqtsf,0 zhqtsf ,0 zqwjrqyexm,0 zhwjrqyexm ,0 zqsjf,0 sjf    ,0 fwmj";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
	ls_sql+=wheresql1;
	
	ls_sql+=" )";
	ls_sql+=" group by dwbh,dwmc";
	ls_sql+=" order by qye desc,dwbh";

//	out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dwbh=rs.getString("dwbh");
		dwmc=rs.getString("dwmc");

		qys=rs.getInt("qys");
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");

		zqgczjf=rs.getDouble("zqgczjf");
		zhgczjf=rs.getDouble("zhgczjf");

		zqsuijin=rs.getDouble("zqsuijin");
		suijin=rs.getDouble("suijin");

		zqguanlif=rs.getDouble("zqguanlif");
		guanlif=rs.getDouble("guanlif");

		zqqtsf=rs.getDouble("zqqtsf");
		zhqtsf=rs.getDouble("zhqtsf");

		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");

		zqsjf=rs.getDouble("zqsjf");
		sjf=rs.getDouble("sjf");



		fwmj=rs.getLong("fwmj");


		ls_sql=" SELECT count(*) qys";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and jzkscsj is not null and cwjzkscsj is null";//首次付家装款时间
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			gsskqys=rs1.getInt("qys");
		}
		rs1.close();
		ps1.close();

		ALLgsskqys+=gsskqys;
	
		ls_sql=" SELECT count(*) qys";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and cwjzkscsj is not null";//财务首次收家装款时间
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cwskqys=rs1.getInt("qys");
		}
		rs1.close();
		ps1.close();
		
		ALLcwskqys+=cwskqys;
	
		//96：管理费;54：税金;11：家装款
		ls_sql=" SELECT sum(fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh(+) and crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and cw_khfkjl.scbz='N' ";
		ls_sql+=" and cw_khfkjl.fklxbm='11' ";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			jzssk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		ALLjzssk+=jzssk;
	
		//96：管理费;54：税金;11：家装款
		ls_sql=" SELECT sum(fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh(+) and crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and cw_khfkjl.scbz='N' ";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khssk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		ALLkhssk+=khssk;
		
	
		if (qys==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(qye/qys);
		}
		if (fwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(int)(qye/fwmj);
		}

		if (wdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=qye*10/wdzgce;
		}


		row++;


		%>
		<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td ><%=row%></td>
			<td >
			<A HREF="ViewFgsQdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=dwbh%>" target="_blank">
			<%=dwmc%>			</A>			</td>

			<td   ><%=qys%></td>
			<td   ><%=cf.formatDouble((long)wdzgce)%></td>
			<td   ><%=cf.round(zkl,1)%></td>
			<td   ><%=cf.formatDouble((long)qye)%></td>

			
			<td   ><%=gsskqys%></td>
			<td   ><%=cwskqys%></td>
			<td   ><%=cf.formatDouble((long)jzssk)%></td>
			<td   ><%=cf.formatDouble((long)khssk)%></td>

			<td   ><%=cf.formatDouble(pjde)%></td>
			<td   ><%=cf.formatDouble(pmjj)%></td>


			<td   ><%=cf.formatDouble((long)zqgczjf)%></td>
			<td   ><%=cf.formatDouble((long)zhgczjf)%></td>
			
			<td   ><%=cf.formatDouble(zqsuijin)%></td>
			<td   ><%=cf.formatDouble(suijin)%></td>
			
			<td   ><%=cf.formatDouble(zqguanlif)%></td>
			<td   ><%=cf.formatDouble(guanlif)%></td>

			<td   ><%=cf.formatDouble(zqqtsf)%></td>
			<td   ><%=cf.formatDouble(zhqtsf)%></td>

			<td   ><%=cf.formatDouble(zqwjrqyexm)%></td>
			<td   ><%=cf.formatDouble(zhwjrqyexm)%></td>

			<td   ><%=cf.formatDouble(zqsjf)%></td>
			<td   ><%=cf.formatDouble(sjf)%></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();

	if (ALLqys==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(ALLqye/ALLqys);
	}
	if (ALLfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(ALLqye/ALLfwmj);
	}

	if (ALLwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=ALLqye*10/ALLwdzgce;
	}
%>

<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td >&nbsp;</td>
	<td ><font color="#ff0000">总计</td>
	
	<td   ><%=ALLqys%></td>
	<td   ><%=cf.formatDouble((long)ALLwdzgce)%></td>
	<td   ><%=cf.round(zkl,1)%></td>
	<td   ><%=cf.formatDouble((long)ALLqye)%></td>

	
	<td   ><%=ALLgsskqys%></td>
	<td   ><%=ALLcwskqys%></td>
	<td   ><%=cf.formatDouble((long)ALLjzssk)%></td>
	<td   ><%=cf.formatDouble((long)ALLkhssk)%></td>

	<td   ><%=cf.formatDouble(pjde)%></td>
	<td   ><%=cf.formatDouble(pmjj)%></td>


	<td   ><%=cf.formatDouble((long)ALLzqgczjf)%></td>
	<td   ><%=cf.formatDouble((long)ALLzhgczjf)%></td>
	
	<td   ><%=cf.formatDouble(ALLzqsuijin)%></td>
	<td   ><%=cf.formatDouble(ALLsuijin)%></td>
	
	<td   ><%=cf.formatDouble(ALLzqguanlif)%></td>
	<td   ><%=cf.formatDouble(ALLguanlif)%></td>

	<td   ><%=cf.formatDouble(ALLzqqtsf)%></td>
	<td   ><%=cf.formatDouble(ALLzhqtsf)%></td>

	<td   ><%=cf.formatDouble(ALLzqwjrqyexm)%></td>
	<td   ><%=cf.formatDouble(ALLzhwjrqyexm)%></td>

	<td   ><%=cf.formatDouble(ALLzqsjf)%></td>
	<td   ><%=cf.formatDouble(ALLsjf)%></td>
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