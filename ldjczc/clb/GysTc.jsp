<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='170803'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[供应商销售报表（套餐）]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[供应商销售报表（套餐）]："+xtrzyhmc+"') ";
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
  <B>供应商销售报表（套餐）</B><BR>
  <b>(记入业绩时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="120%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="9%" >主材大类</td>
  <td  width="3%" >排名</td>
  <td  width="9%" >品牌</td>
  <td  width="9%" bgcolor="#66FFFF"><strong>合计成本额</strong></td>
  <td  width="5%" bgcolor="#66FFFF"><B>客户数</B></td>
  <td  width="5%" bgcolor="#66FFFF"><B>订单数</B></td>
  <td  width="9%" bgcolor="#66FFFF" ><B>签单成本</B></td>
  <td  width="6%" bgcolor="#66FFFF" ><B>平均单值</B></td>
  <td  width="8%" bgcolor="#66FFFF">退单</td>
  <td  width="8%" bgcolor="#66FFFF">增减项</td>


  <td  width="5%" >材料级别</td>
  <td  width="5%" >客户数</td>
  <td  width="5%" >订单数</td>
  <td  width="8%"  >成本额</td>
  <td  width="6%"  >平均单值</td>

  </tr>
<%
	//获取最大数
	String getppbm=null;
	String gettccpdlbm=null;
	String cldlmc=null;
	String oldcldlmc="";
	String getbjjbbm=null;
	String bjjbmc=null;

	double ppcbje=0;
	int ppkhsl=0;
	int ppddsl=0;

	
	int xjkhsl=0;
	int xjddsl=0;
	double xjcbje=0;

	int xjppkhsl=0;
	int xjppddsl=0;
	double xjppcbje=0;

	double xjtctdcbe=0;
	double xjzjxcbe=0;
	double xjtcje=0;

	int row=0;


	int paixu=0;

	//放行数据
	String[][] trData=new String[1000][15];
	
	ls_sql =" SELECT ppmc,tccpdlbm,cldlmc,sum(khsl) khsl,sum(ddsl) ddsl,sum(cbje) cbje ";
	ls_sql+=" from (";
	
	
	ls_sql+=" SELECT bj_khzcxm.ppmc,bj_khzcxm.tccpdlbm,cldlmc,count(distinct bj_khzcxm.khbh) khsl,count(bj_khzcxm.fjddbh) ddsl,sum(ROUND(bj_khzcxm.jsj*bj_khzcxm.xdsl,2)) cbje ";
	ls_sql+=" FROM bj_khzcxm,crm_khxx,jxc_cldlbm";
	ls_sql+=" where bj_khzcxm.khbh=crm_khxx.khbh and bj_khzcxm.tccpdlbm=jxc_cldlbm.cldlbm(+)";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	if (!(ppbm.equals("")))
	{
		ls_sql+=" and  bj_khzcxm.ppmc='"+ppbm+"'";
	}
	ls_sql+=" group by bj_khzcxm.ppmc,bj_khzcxm.tccpdlbm,cldlmc";


	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT jc_zcdd.ppbm ppmc,jxc_cldlbm.cldlbm tccpdlbm,jc_zcdd.zcdlbm,0 khsl,0 ddsl,0 cbje ";
	ls_sql+=" FROM jc_zcdd,jxc_cldlbm";
	ls_sql+=" where jc_zcdd.zcdlbm=jxc_cldlbm.cldlmc(+)";
	ls_sql+=" and jc_zcdd.clzt='99'";
	ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐

	ls_sql+=" and jc_zcdd.fgsbh='"+fgs+"'";
	if (!(ppbm.equals("")))
	{
		ls_sql+=" and  jc_zcdd.ppbm='"+ppbm+"'";
	}

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT jc_zcdd.ppmc ppmc,jxc_cldlbm.cldlbm tccpdlbm,jc_zcdd.zcdlbm,0 khsl,0 ddsl,0 cbje ";
	ls_sql+=" FROM jc_zcdd,jxc_cldlbm";
	ls_sql+=" where jc_zcdd.zcdlbm=jxc_cldlbm.cldlmc(+)";
	ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
	ls_sql+=" and jc_zcdd.zjxxh is not null";//套餐退补货序号
	ls_sql+=" and  jc_zcdd.ppbm!='主材变更'";

	ls_sql+=" and jc_zcdd.fgsbh='"+fgs+"'";
	if (!(ppbm.equals("")))
	{
		ls_sql+=" and  jc_zcdd.ppbm='"+ppbm+"'";
	}

	ls_sql+=" )";
	ls_sql+=" group by ppmc,tccpdlbm,cldlmc";

	ls_sql+=" order by tccpdlbm,cbje desc ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getppbm=rs.getString("ppmc");
		gettccpdlbm=rs.getString("tccpdlbm");
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		ppkhsl=rs.getInt("khsl");
		ppddsl=rs.getInt("ddsl");
		ppcbje=rs.getDouble("cbje");

		if (!oldcldlmc.equals(cldlmc))
		{
			paixu=1;
			oldcldlmc=cldlmc;
		}
		else{
			paixu++;
		}


		xjppcbje+=ppcbje;
		xjppkhsl+=ppkhsl;
		xjppddsl+=ppddsl;

		int ppjspjde=0;
		if (ppddsl!=0)
		{
			ppjspjde=(int)ppcbje/ppddsl;
		}
		else{
			ppjspjde=0;
		}


		//退单
		double tctdcbe=0;
		ls_sql =" SELECT -1*sum(cbze) je";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt='99'";
		ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐

		ls_sql+=" and jc_zcdd.fgsbh='"+fgs+"'";
		ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
		ls_sql+=" and jc_zcdd.zcdlbm='"+cldlmc+"'";
//		out.println(ls_sql);

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tctdcbe=rs1.getDouble("je");
		}
		rs1.close();
		ps1.close();


		xjtctdcbe+=tctdcbe;

		//增减项
		double zjxcbe=0;
		ls_sql =" SELECT sum(cbze)";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
		ls_sql+=" and jc_zcdd.zjxxh is not null";//套餐退补货序号

		ls_sql+=" and jc_zcdd.fgsbh='"+fgs+"'";
		ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
		ls_sql+=" and jc_zcdd.zcdlbm='"+cldlmc+"'";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zjxcbe=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		xjzjxcbe+=zjxcbe;


		double tcje=0;
		tcje=ppcbje+tctdcbe+zjxcbe;
		tcje=cf.round(tcje,2);

		xjtcje+=tcje;
		xjtcje=cf.round(xjtcje,2);
		
		

		double cbje=0;
		int khsl=0;
		int ddsl=0;

		ls_sql =" SELECT bj_khzcxm.bjjbbm,bjjbmc,count(distinct bj_khzcxm.khbh) khsl,count(bj_khzcxm.fjddbh) ddsl,sum(ROUND(bj_khzcxm.jsj*bj_khzcxm.xdsl,2)) cbje ";
		ls_sql+=" FROM bj_khzcxm,crm_khxx,bdm_bjjbbm,jxc_cldlbm";
		ls_sql+=" where bj_khzcxm.khbh=crm_khxx.khbh and bj_khzcxm.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_khzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+) ";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.fgsbh='"+fgs+"'";
		ls_sql+=" and bj_khzcxm.ppmc='"+getppbm+"'";
		ls_sql+=" and bj_khzcxm.tccpdlbm='"+gettccpdlbm+"'";
		ls_sql+=" group by bj_khzcxm.bjjbbm,bjjbmc";
		ls_sql+=" order by ddsl desc,khsl desc";
	//	out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			getbjjbbm=rs1.getString("bjjbbm");
			bjjbmc=rs1.getString("bjjbmc");
			khsl=rs1.getInt("khsl");
			ddsl=rs1.getInt("ddsl");
			cbje=rs1.getDouble("cbje");

			xjcbje+=cbje;
			xjkhsl+=khsl;
			xjddsl+=ddsl;
			



			int jspjde=0;
			if (ddsl!=0)
			{
				jspjde=(int)cbje/ddsl;
			}
			else{
				jspjde=0;
			}


			//设置显示数据

			trData[row][0]=cldlmc;
			trData[row][1]=paixu+"";
			trData[row][2]=getppbm;
			trData[row][3]=tcje+"";
			trData[row][4]=ppkhsl+"";
			trData[row][5]=ppddsl+"";
			trData[row][6]="<A HREF=\"ViewBj_khzcxm.jsp?sjfw="+sjfw+"&sjfw2="+sjfw2+"&ppbm="+getppbm+"&zcdlbm="+gettccpdlbm+"&fgsbh="+fgs+"\" target=\"_blank\">"+cf.formatDouble(ppcbje)+"</A>";
			trData[row][7]=cf.formatDouble(ppjspjde);
			trData[row][8]="<A HREF=\"ViewPpTdmx.jsp?sjfw="+sjfw+"&sjfw2="+sjfw2+"&ppbm="+getppbm+"&zcdlbm="+cldlmc+"&fgsbh="+fgs+"\" target=\"_blank\">"+cf.formatDouble(tctdcbe)+"</A>";
			trData[row][9]="<A HREF=\"ViewPpZjxmx.jsp?sjfw="+sjfw+"&sjfw2="+sjfw2+"&ppbm="+getppbm+"&zcdlbm="+cldlmc+"&fgsbh="+fgs+"\" target=\"_blank\">"+cf.formatDouble(zjxcbe)+"</A>";
			trData[row][10]=bjjbmc;
			trData[row][11]=khsl+"";
			trData[row][12]=ddsl+"";
			trData[row][13]=cf.formatDouble(cbje);
			trData[row][14]=cf.formatDouble(jspjde);

			row++;

		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();


	//设置是否合并
	int[] isHb=new int[trData[0].length];
	isHb[0]=1;
	isHb[1]=1;
	isHb[2]=1;
	isHb[3]=1;
	isHb[4]=1;
	isHb[5]=1;
	isHb[6]=1;
	isHb[7]=1;
	isHb[8]=1;
	isHb[9]=1;

	//输入字符数组，输出行，相同行合并
	cf.outTr(out,trData,isHb);

	int ppjspjde=0;
	if (xjppddsl!=0)
	{
		ppjspjde=(int)xjppcbje/xjppddsl;
	}
	else{
		ppjspjde=0;
	}
%>

<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="3"><font color="#ff0000">总计</td>
	
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble(xjtcje)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=xjppkhsl%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=xjppddsl%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble(xjppcbje)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=ppjspjde%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble(xjtctdcbe)%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble(xjzjxcbe)%></strong></td>
	
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
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