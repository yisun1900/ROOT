<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030202'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[分公司业绩统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[分公司业绩统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>


<%

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=cf.fillNull(request.getParameter("dwbh"));
String dwbh="";

String wheresql="";
String wheresql1="";

if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
{
	wheresql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	wheresql1+=" and a.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	wheresql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	wheresql1+=" and a.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
}


if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (a.ssfgs='"+fgs+"')";
}

wheresql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


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
  <B>店面签单统计</B><BR>
  <b>(记入业绩时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="310%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="2%" >排名</td>
  <td  width="4%" >分公司</td>
  <td  width="6%" >店面</td>

  <td  width="4%" ><font color="#FF0000">业绩<BR>(签单－退单)</font></td>
  <td  width="3%" >签约数</td>
  <td  width="4%" >折前－合同额</td>
  <td  width="3%" >综合折扣</td>
  <td  width="4%" >折后－合同额</td>

  <td  width="2%" ><font color="#0000FF">退单客户数</font></td>
  <td  width="4%" ><font color="#0000FF">退单金额</font></td>

  <td  width="4%" ><font color="#0000FF">增减项</font></td>
  <td  width="4%" ><font color="#FF0000">合计<BR>(签单－退单+增减项)</font></td>

  <td  width="4%" >单额平均</td>
  <td  width="4%" >平米均价</td>
  
  <td  width="4%" >折前－工程费</td>
  <td  width="4%" >折后－工程费</td>

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
	String getfgs=null;
	String oldfgs="";
	String dm=null;
	String getdwbh=null;
	String getdwmc=null;

	int tds=0;
	double tde=0;
	double yj=0;
	double zjx=0;
	double hj=0;

	
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


	int ALLtds=0;
	double ALLtde=0;
	double ALLzjx=0;
	double ALLyj=0;
	double ALLhj=0;

	int row=0;
	//家装总客户总签约数
	ls_sql="SELECT count(*) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(zhljzjx) zhljzjx,sum(zqgczjf) zqgczjf,sum(zhgczjf) zhgczjf,sum(NVL(zqsuijin,0)) zqsuijin,sum(NVL(suijin,0)) suijin,sum(NVL(zqguanlif,0)) zqguanlif,sum(NVL(guanlif,0)) guanlif  ,sum(NVL(zqqtsf,0)) zqqtsf,sum(NVL(zhqtsf,0)) zhqtsf ,sum(NVL(zqwjrqyexm,0)) zqwjrqyexm,sum(NVL(zhwjrqyexm,0)) zhwjrqyexm ,sum(NVL(zqsjf,0)+NVL(sjhtsjf,0)) zqsjf,sum(NVL(sjf,0)+NVL(sjhtsjf,0)) sjf    ,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh and crm_khxx.zt in('2','3','5') ";//N：否；Y：是
	ls_sql+=wheresql;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ALLqys=rs.getInt("qys");
		ALLwdzgce=rs.getDouble("wdzgce");
		ALLqye=rs.getDouble("qye");
		ALLzjx=rs.getDouble("zhljzjx");

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


	ls_sql=" SELECT fgs,dwbh,dm,sum(qys) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(zhljzjx) zhljzjx,sum(zqgczjf) zqgczjf,sum(zhgczjf) zhgczjf,sum(NVL(zqsuijin,0)) zqsuijin,sum(NVL(suijin,0)) suijin,sum(NVL(zqguanlif,0)) zqguanlif,sum(NVL(guanlif,0)) guanlif  ,sum(NVL(zqqtsf,0)) zqqtsf,sum(NVL(zhqtsf,0)) zhqtsf ,sum(NVL(zqwjrqyexm,0)) zqwjrqyexm,sum(NVL(zhwjrqyexm,0)) zhwjrqyexm ,sum(NVL(zqsjf,0)) zqsjf,sum(NVL(sjf,0)) sjf    ,sum(fwmj) fwmj";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT b.dwmc fgs,crm_khxx.dwbh dwbh,a.dwmc dm,count(*) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(zhljzjx) zhljzjx,sum(zqgczjf) zqgczjf,sum(zhgczjf) zhgczjf,sum(NVL(zqsuijin,0)) zqsuijin,sum(NVL(suijin,0)) suijin,sum(NVL(zqguanlif,0)) zqguanlif,sum(NVL(guanlif,0)) guanlif  ,sum(NVL(zqqtsf,0)) zqqtsf,sum(NVL(zhqtsf,0)) zhqtsf ,sum(NVL(zqwjrqyexm,0)) zqwjrqyexm,sum(NVL(zhwjrqyexm,0)) zhwjrqyexm ,sum(NVL(zqsjf,0)+NVL(sjhtsjf,0)) zqsjf,sum(NVL(sjf,0)+NVL(sjhtsjf,0)) sjf    ,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.fgsbh=b.dwbh(+)";
	ls_sql+=" and crm_khxx.zt in('2','3','5')";
	ls_sql+=wheresql;
	ls_sql+=" group by b.dwmc,crm_khxx.dwbh,a.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT b.dwmc fgs,a.dwbh dwbh,a.dwmc dm,0 qys,0 wdzgce,0 qye,0 zhljzjx,0 zqgczjf,0 zhgczjf,0 zqsuijin,0 suijin,0 zqguanlif,0 guanlif  ,0 zqqtsf,0 zhqtsf ,0 zqwjrqyexm,0 zhwjrqyexm ,0 zqsjf,0 sjf    ,0 fwmj";
	ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
	ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N'";
	ls_sql+=wheresql1;
	ls_sql+=" group by b.dwmc,a.dwbh,a.dwmc ";
	
	ls_sql+=" )";
	ls_sql+=" group by fgs,dwbh,dm";
	ls_sql+=" order by qye desc,fgs,dwbh";

//	out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgs=rs.getString("fgs");
		getdwbh=rs.getString("dwbh");
		dm=rs.getString("dm");

		qys=rs.getInt("qys");
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zjx=rs.getDouble("zhljzjx");

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

		String cxbz="";
		String kdsj="";
		String gdsj="";
		ls_sql="SELECT dwmc,kdsj,gdsj,cxbz";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where dwbh='"+getdwbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			getdwmc=rs1.getString("dwmc");
			cxbz=rs1.getString("cxbz");
			kdsj=cf.fillNull(rs1.getDate("kdsj"));
			gdsj=cf.fillNull(rs1.getDate("gdsj"));
		}
		rs1.close();
		ps1.close();
		if (cxbz.equals("Y"))//Y：已撤销；N：未撤销
		{
			getdwmc="<font color=\"#FF0033\">"+getdwmc+"<BR>("+kdsj+"至"+gdsj+")</font>";
		}
		else{
			if (!kdsj.equals(""))
			{
				getdwmc=getdwmc+"<BR>(开店:"+kdsj+")";
			}
		}
	
		
		ls_sql=" SELECT count(*),sum(qye)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='3'";//3：退单客户
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and yjjzsj is not null ";//首次付家装款时间
		ls_sql+=" and crm_khxx.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tds=rs1.getInt(1);
			tde=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		ALLtds+=tds;
		ALLtde+=tde;
	
	
		yj=cf.round(qye-tde,2);

		ALLyj+=yj;
		
		hj=cf.round(qye-tde+zjx,2);

		ALLhj+=hj;
	
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

		if (getfgs.equals(oldfgs))
		{
			getfgs="同上";;
		}
		else{
			oldfgs=getfgs;
		}



		%>
		<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td ><%=row%></td>
			<td ><%=getfgs%></td>
			<td >
			<A HREF="ViewDmYjMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
			<%=getdwmc%>			</A>			</td>

			<td><%=cf.formatDouble((long)yj)%></td>
			<td><%=qys%></td>
			<td><%=cf.formatDouble((long)wdzgce)%></td>
			<td><%=cf.round(zkl,1)%></td>
			<td><%=cf.formatDouble((long)qye)%></td>

			
			<td><%=-1*tds%></td>
			<td><%=cf.formatDouble((long)-1*tde)%></td>
			<td><%=cf.formatDouble((long)zjx)%></td>
			<td><%=cf.formatDouble((long)hj)%></td>

			<td><%=cf.formatDouble(pjde)%></td>
			<td><%=cf.formatDouble(pmjj)%></td>


			<td><%=cf.formatDouble((long)zqgczjf)%></td>
			<td><%=cf.formatDouble((long)zhgczjf)%></td>
			
			<td><%=cf.formatDouble(zqsuijin)%></td>
			<td><%=cf.formatDouble(suijin)%></td>
			
			<td><%=cf.formatDouble(zqguanlif)%></td>
			<td><%=cf.formatDouble(guanlif)%></td>

			<td><%=cf.formatDouble(zqqtsf)%></td>
			<td><%=cf.formatDouble(zhqtsf)%></td>

			<td><%=cf.formatDouble(zqwjrqyexm)%></td>
			<td><%=cf.formatDouble(zhwjrqyexm)%></td>

			<td><%=cf.formatDouble(zqsjf)%></td>
			<td><%=cf.formatDouble(sjf)%></td>
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
	<td >&nbsp;</td>
	
	<td><%=cf.formatDouble((long)ALLyj)%></td>
	<td><%=ALLqys%></td>
	<td><%=cf.formatDouble((long)ALLwdzgce)%></td>
	<td><%=cf.round(zkl,1)%></td>
	<td><%=cf.formatDouble((long)ALLqye)%></td>

	
	<td><%=-1*ALLtds%></td>
	<td><%=cf.formatDouble((long)-1*ALLtde)%></td>
	<td><%=cf.formatDouble((long)ALLzjx)%></td>
	<td><%=cf.formatDouble((long)ALLhj)%></td>

	<td><%=cf.formatDouble(pjde)%></td>
	<td><%=cf.formatDouble(pmjj)%></td>


	<td><%=cf.formatDouble((long)ALLzqgczjf)%></td>
	<td><%=cf.formatDouble((long)ALLzhgczjf)%></td>
	
	<td><%=cf.formatDouble(ALLzqsuijin)%></td>
	<td><%=cf.formatDouble(ALLsuijin)%></td>
	
	<td><%=cf.formatDouble(ALLzqguanlif)%></td>
	<td><%=cf.formatDouble(ALLguanlif)%></td>

	<td><%=cf.formatDouble(ALLzqqtsf)%></td>
	<td><%=cf.formatDouble(ALLzhqtsf)%></td>

	<td><%=cf.formatDouble(ALLzqwjrqyexm)%></td>
	<td><%=cf.formatDouble(ALLzhwjrqyexm)%></td>

	<td><%=cf.formatDouble(ALLzqsjf)%></td>
	<td><%=cf.formatDouble(ALLsjf)%></td>
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