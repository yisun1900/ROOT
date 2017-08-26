<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030344'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[设计师主材统计(综合)]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[设计师主材统计(综合)]："+xtrzyhmc+"') ";
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

String fgs=cf.fillNull(request.getParameter("fgs"));
String dwbh=cf.fillNull(request.getParameter("dwbh"));
String sjs=cf.GB2Uni(request.getParameter("sjs"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
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
  <B>设计师主材统计</B><BR>
  <b>(订单确认时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="210%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<TR bgcolor="#CCCCCC"  align="center"  >
  <td  width="2%" rowspan="2" >序号</td>
  <td  width="8%" rowspan="2" >店面</td>
  <td  width="4%" rowspan="2" >设计师</td>
  <td colspan="7" >套餐</td>
  <td colspan="11" >非套餐</td>
  </tr>
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="6%" ><strong>合计成本额</strong></td>
  <td  width="4%" >客户数</td>
  <td  width="4%" >订单数</td>
  <td  width="6%" >合同成本</td>
  <td  width="4%" >平均成本单值</td>
  <td  width="4%" >退单</td>
  <td  width="4%" >增减项</td>

  <td  width="6%" ><strong>合计销售额</strong></td>
  <td  width="4%" >客户数</td>
  <td  width="4%" >订单数</td>
  <td  width="6%" >合同销售额</td>
  <td  width="6%" >正常品材料费</td>
  <td  width="6%" >特价品材料费</td>
  <td  width="4%" >平均成本单值</td>
  <td  width="5%" >退单</td>
  <td  width="5%" >退单(正常品材料费)</td>
  <td  width="5%" >退单(特价品材料费)</td>
  <td  width="5%" >增减项</td>
  </tr>
<%
	//获取最大数
	int zjtckhsl=0;
	int zjtcddsl=0;
	double zjtccbze=0;
	double zjtctdcbe=0;
	double zjzjxcbe=0;
	double zjtcje=0;
	
	int zjkhsl=0;
	int zjddsl=0;
	double zjqye=0;
	double zjzcpclf=0;
	double zjtjpclf=0;
	double zjtde=0;
	double zjtdzcpclf=0;
	double zjtdtjpclf=0;
	double zjzjxje=0;
	double zjje=0;

	int row=0;


	
	String getfgsbh=null;
	String fgsmc=null;
	String getdwbh=null;
	String dmmc=null;
	String cxbz="";
	String kdsj="";
	String gdsj="";

	ls_sql =" SELECT sq_dwxx.ssfgs,b.dwmc fgsmc,sq_dwxx.dwbh,sq_dwxx.dwmc,sq_dwxx.kdsj,sq_dwxx.gdsj,sq_dwxx.cxbz ";
	ls_sql+=" FROM sq_dwxx,sq_dwxx b";
	ls_sql+=" where  sq_dwxx.ssfgs=b.dwbh(+) and sq_dwxx.dwlx='F2'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}

	if (!(dwbh.equals("")))
	{
		ls_sql+=" and  sq_dwxx.dwbh='"+dwbh+"'";
	}
	if (!(sjs.equals("")))
	{
		ls_sql+=" and  sq_dwxx.dwbh in(select dwbh from sq_yhxx where ssfgs='"+fgs+"' and yhmc='"+sjs+"' and zwbm in('23','04'))";
	}
	ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>TO_DATE('"+sjfw+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	ls_sql+=" order by sq_dwxx.ssfgs,sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("ssfgs");
		fgsmc=rs.getString("fgsmc");
		getdwbh=rs.getString("dwbh");
		dmmc=rs.getString("dwmc");
		cxbz=rs.getString("cxbz");
		kdsj=cf.fillNull(rs.getDate("kdsj"));
		gdsj=cf.fillNull(rs.getDate("gdsj"));

		if (cxbz.equals("Y"))//Y：已撤销；N：未撤销
		{
			dmmc="<font color=\"#FF0033\">"+dmmc+"<BR>("+kdsj+"至"+gdsj+")</font>";
		}
		else{
			if (!kdsj.equals(""))
			{
				dmmc=dmmc+"<BR>(开店:"+kdsj+")";
			}
		}

		int xjtckhsl=0;
		int xjtcddsl=0;
		double xjtccbze=0;
		double xjtctdcbe=0;
		double xjzjxcbe=0;
		double xjtcje=0;

		int xjkhsl=0;
		int xjddsl=0;
		double xjqye=0;
		double xjzcpclf=0;
		double xjtjpclf=0;
		double xjje=0;
		double xjtde=0;
		double xjtdzcpclf=0;
		double xjtdtjpclf=0;
		double xjzjxje=0;

		String sqlsjs="";

		String getsjs="";
		String sfzszg="";
		String rzsj="";
		String lzrq="";
		ls_sql =" SELECT yhmc,sfzszg,rzsj,lzrq";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where zwbm in('04','23')";
		ls_sql+=" and dwbh='"+getdwbh+"'";
		if (!(sjs.equals("")))
		{
			ls_sql+=" and yhmc='"+sjs+"'";
		}

		ls_sql+=" and (sfzszg in('Y','N') or lzrq+62>TO_DATE('"+sjfw+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
		ls_sql+=" order by yhmc";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			getsjs=rs2.getString("yhmc");
			sfzszg=rs2.getString("sfzszg");
			rzsj=cf.fillNull(rs2.getDate("rzsj"));
			lzrq=cf.fillNull(rs2.getDate("lzrq"));

			sqlsjs+=",'"+getsjs+"'";

			//套餐＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋

			//签单
			int tckhsl=0;
			int tcddsl=0;
			double tccbze=0;

			ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(cbze) cbze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt!='98'";
			ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
			ls_sql+=" and jc_zcdd.ppbm!='主材变更'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tckhsl=rs1.getInt("khsl");
				tcddsl=rs1.getInt("ddsl");
				tccbze=rs1.getDouble("cbze");
			}
			rs1.close();
			ps1.close();

			xjtckhsl+=tckhsl;
			xjtcddsl+=tcddsl;
			xjtccbze+=tccbze;

			zjtckhsl+=tckhsl;
			zjtcddsl+=tcddsl;
			zjtccbze+=tccbze;


			int tcpjde=0;
			if (tcddsl!=0)
			{
				tcpjde=(int)tccbze/tcddsl;
			}
			else{
				tcpjde=0;
			}

			//退单
			double tctdcbe=0;
			ls_sql =" SELECT -1*sum(cbze) je";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.ddqrsj is not null";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
			ls_sql+=" and jc_zcdd.ppbm!='主材变更'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tctdcbe=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			ls_sql =" SELECT -1*sum(jc_zczjx.zjxcbze) je";
			ls_sql+=" FROM jc_zczjx,jc_zcdd";
			ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
			ls_sql+=" and jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zczjx.clzt='99'";
			ls_sql+=" and jc_zczjx.qrsj is not null";
			ls_sql+=" and jc_zczjx.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.qddm='"+getdwbh+"' and jc_zczjx.jzsjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
			ls_sql+=" and jc_zcdd.ppbm!='主材变更'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tctdcbe+=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjtctdcbe+=tctdcbe;
			zjtctdcbe+=tctdcbe;

			//增减项
			double zjxcbe=0;
			ls_sql =" SELECT sum(jc_zczjx.zjxcbze) je";
			ls_sql+=" FROM jc_zczjx,jc_zcdd";
			ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
			ls_sql+=" and jc_zczjx.clzt not in('00','01')";
			ls_sql+=" and jc_zczjx.qrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.qrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
			ls_sql+=" and jc_zcdd.ppbm!='主材变更'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zjxcbe=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjzjxcbe+=zjxcbe;
			zjzjxcbe+=zjxcbe;


			double tcje=0;
			tcje=tccbze+tctdcbe+zjxcbe;

			xjtcje+=tcje;
			zjtcje+=tcje;



			//非套餐＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
			int khsl=0;
			int ddsl=0;
			double qye=0;
			double zcpclf=0;
			double tjpclf=0;

			ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(hkze) hkze,sum(zcpclf) zcpclf,sum(tjpclf) tjpclf";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt!='98'";
			ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				khsl=rs1.getInt("khsl");
				ddsl=rs1.getInt("ddsl");
				qye=rs1.getDouble("hkze");
				zcpclf=rs1.getDouble("zcpclf");
				tjpclf=rs1.getDouble("tjpclf");
			}
			rs1.close();
			ps1.close();

			xjkhsl+=khsl;
			xjddsl+=ddsl;
			xjqye+=qye;
			xjzcpclf+=zcpclf;
			xjtjpclf+=tjpclf;


			zjkhsl+=khsl;
			zjddsl+=ddsl;
			zjqye+=qye;
			zjzcpclf+=zcpclf;
			zjtjpclf+=tjpclf;


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
			double tdzcpclf=0;
			double tdtjpclf=0;
			ls_sql =" SELECT -1*sum(hkze) je,-1*sum(zcpclf) tdzcpclf,-1*sum(tjpclf) tdtjpclf";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.ddqrsj is not null";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tde=rs1.getDouble("je");
				tdzcpclf=rs1.getDouble("tdzcpclf");
				tdtjpclf=rs1.getDouble("tdtjpclf");
			}
			rs1.close();
			ps1.close();

			ls_sql =" SELECT -1*sum(jc_zczjx.zjxze) je";
			ls_sql+=" FROM jc_zczjx,jc_zcdd";
			ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
			ls_sql+=" and jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zczjx.clzt='99'";
			ls_sql+=" and jc_zczjx.qrsj is not null";
			ls_sql+=" and jc_zczjx.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.qddm='"+getdwbh+"' and jc_zczjx.jzsjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tde+=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjtde+=tde;
			xjtdzcpclf+=tdzcpclf;
			xjtdtjpclf+=tdtjpclf;
			zjtde+=tde;
			zjtdzcpclf+=tdzcpclf;
			zjtdtjpclf+=tdtjpclf;

			//增减项
			double zjxje=0;
			ls_sql =" SELECT sum(jc_zczjx.zjxze) je";
			ls_sql+=" FROM jc_zczjx,jc_zcdd";
			ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
			ls_sql+=" and jc_zczjx.clzt not in('00','01')";
			ls_sql+=" and jc_zczjx.qrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.qrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zjxje=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjzjxje+=zjxje;
			zjzjxje+=zjxje;


			double je=0;
			je=qye+tde+zjxje;

			xjje+=je;
			zjje+=je;

			if (!sfzszg.equals("Y") && !sfzszg.equals("N"))
			{
				getsjs=getsjs+"<BR>入职:"+rzsj+"<BR>离职:"+lzrq;
			}

			//撤店无数据不显示
			if (   (cxbz.equals("N") && sfzszg.equals("Y")) || (cxbz.equals("N") && sfzszg.equals("N")) || (je!=0) || (ddsl!=0)  )
			{
				row++;

				%>
				<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					<td ><%=row%></td>
					<td ><%=dmmc%></td>
					<td ><%=getsjs%></td>

				<td><%=cf.formatDouble(tcje)%></td>

				<td><%=tckhsl%></td>
				<td><%=tcddsl%></td>
				<td>
					<A HREF="ViewSjsZcCbQdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
					<%=cf.formatDouble(tccbze)%>				</td>
				<td><%=cf.formatDouble(tcpjde)%></td>
				<td>
					<A HREF="ViewSjsZcCbTdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
					<%=cf.formatDouble(tctdcbe)%>				</td>
				<td>
					<A HREF="ViewSjsZcCbZjxMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
					<%=cf.formatDouble(zjxcbe)%>				</td>

				

				<td><%=cf.formatDouble(je)%></td>

				<td><%=khsl%></td>
				<td><%=ddsl%></td>
				<td>
					<A HREF="ViewSjsZcQdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
					<%=cf.formatDouble(qye)%>				</td>
				<td><%=cf.formatDouble(zcpclf)%></td>
				<td><%=cf.formatDouble(tjpclf)%></td>
				<td><%=cf.formatDouble(pjde)%></td>
				<td>
					<A HREF="ViewSjsZcTdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
					<%=cf.formatDouble(tde)%>				</td>
				<td><%=cf.formatDouble(tdzcpclf)%></td>
				<td><%=cf.formatDouble(tdtjpclf)%></td>
				<td>
					<A HREF="ViewSjsZcZjxMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
					<%=cf.formatDouble(zjxje)%>				</td>


				</tr>
				<%	
			}

		}
		rs2.close();
		ps2.close();


		ls_sql =" SELECT distinct jc_zcdd.jzsjs";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt!='98'";
		ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
		if (!sqlsjs.equals(""))
		{
			ls_sql+=" and jc_zcdd.jzsjs not in("+sqlsjs.substring(1)+")";
		}
		ls_sql+=" order by jzsjs";
//		out.println(ls_sql);
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			getsjs=rs2.getString("jzsjs");

			//套餐＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋

			//签单
			int tckhsl=0;
			int tcddsl=0;
			double tccbze=0;

			ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(cbze) cbze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt!='98'";
			ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
			ls_sql+=" and jc_zcdd.ppbm!='主材变更'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tckhsl=rs1.getInt("khsl");
				tcddsl=rs1.getInt("ddsl");
				tccbze=rs1.getDouble("cbze");
			}
			rs1.close();
			ps1.close();

			xjtckhsl+=tckhsl;
			xjtcddsl+=tcddsl;
			xjtccbze+=tccbze;

			zjtckhsl+=tckhsl;
			zjtcddsl+=tcddsl;
			zjtccbze+=tccbze;


			int tcpjde=0;
			if (tcddsl!=0)
			{
				tcpjde=(int)tccbze/tcddsl;
			}
			else{
				tcpjde=0;
			}

			//退单
			double tctdcbe=0;
			ls_sql =" SELECT -1*sum(cbze) je";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.ddqrsj is not null";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
			ls_sql+=" and jc_zcdd.ppbm!='主材变更'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tctdcbe=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			ls_sql =" SELECT -1*sum(jc_zczjx.zjxcbze) je";
			ls_sql+=" FROM jc_zczjx,jc_zcdd";
			ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
			ls_sql+=" and jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zczjx.clzt='99'";
			ls_sql+=" and jc_zczjx.qrsj is not null";
			ls_sql+=" and jc_zczjx.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.qddm='"+getdwbh+"' and jc_zczjx.jzsjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
			ls_sql+=" and jc_zcdd.ppbm!='主材变更'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tctdcbe+=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjtctdcbe+=tctdcbe;
			zjtctdcbe+=tctdcbe;

			//增减项
			double zjxcbe=0;
			ls_sql =" SELECT sum(jc_zczjx.zjxcbze) je";
			ls_sql+=" FROM jc_zczjx,jc_zcdd";
			ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
			ls_sql+=" and jc_zczjx.clzt not in('00','01')";
			ls_sql+=" and jc_zczjx.qrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.qrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
			ls_sql+=" and jc_zcdd.ppbm!='主材变更'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zjxcbe=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjzjxcbe+=zjxcbe;
			zjzjxcbe+=zjxcbe;


			double tcje=0;
			tcje=tccbze+tctdcbe+zjxcbe;

			xjtcje+=tcje;
			zjtcje+=tcje;



			//非套餐＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
			int khsl=0;
			int ddsl=0;
			double qye=0;
			double zcpclf=0;
			double tjpclf=0;

			ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(hkze) hkze,sum(zcpclf) zcpclf,sum(tjpclf) tjpclf";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt!='98'";
			ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				khsl=rs1.getInt("khsl");
				ddsl=rs1.getInt("ddsl");
				qye=rs1.getDouble("hkze");
				zcpclf=rs1.getDouble("zcpclf");
				tjpclf=rs1.getDouble("tjpclf");
			}
			rs1.close();
			ps1.close();

			xjkhsl+=khsl;
			xjddsl+=ddsl;
			xjqye+=qye;
			xjzcpclf+=zcpclf;
			xjtjpclf+=tjpclf;


			zjkhsl+=khsl;
			zjddsl+=ddsl;
			zjqye+=qye;
			zjzcpclf+=zcpclf;
			zjtjpclf+=tjpclf;


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
			double tdzcpclf=0;
			double tdtjpclf=0;
			ls_sql =" SELECT -1*sum(hkze) je,-1*sum(zcpclf) tdzcpclf,-1*sum(tjpclf) tdtjpclf";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.ddqrsj is not null";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tde=rs1.getDouble("je");
				tdzcpclf=rs1.getDouble("tdzcpclf");
				tdtjpclf=rs1.getDouble("tdtjpclf");
			}
			rs1.close();
			ps1.close();

			ls_sql =" SELECT -1*sum(jc_zczjx.zjxze) je";
			ls_sql+=" FROM jc_zczjx,jc_zcdd";
			ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
			ls_sql+=" and jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zczjx.clzt='99'";
			ls_sql+=" and jc_zczjx.qrsj is not null";
			ls_sql+=" and jc_zczjx.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.qddm='"+getdwbh+"' and jc_zczjx.jzsjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tde+=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjtde+=tde;
			xjtdzcpclf+=tdzcpclf;
			xjtdtjpclf+=tdtjpclf;
			zjtde+=tde;
			zjtdzcpclf+=tdzcpclf;
			zjtdtjpclf+=tdtjpclf;

			//增减项
			double zjxje=0;
			ls_sql =" SELECT sum(jc_zczjx.zjxze) je";
			ls_sql+=" FROM jc_zczjx,jc_zcdd";
			ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
			ls_sql+=" and jc_zczjx.clzt not in('00','01')";
			ls_sql+=" and jc_zczjx.qrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.qrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zjxje=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjzjxje+=zjxje;
			zjzjxje+=zjxje;


			double je=0;
			je=qye+tde+zjxje;

			xjje+=je;
			zjje+=je;

			if (!sfzszg.equals("Y") && !sfzszg.equals("N"))
			{
				getsjs=getsjs+"<BR>入职:"+rzsj+"<BR>离职:"+lzrq;
			}

			//撤店无数据不显示
			if (   (cxbz.equals("N") && sfzszg.equals("Y")) || (cxbz.equals("N") && sfzszg.equals("N")) || (je!=0) || (ddsl!=0)  )
			{
				row++;

				%>
				<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					<td ><%=row%></td>
					<td ><%=dmmc%></td>
					<td ><%=getsjs%></td>

				<td><%=cf.formatDouble(tcje)%></td>

				<td><%=tckhsl%></td>
				<td><%=tcddsl%></td>
				<td>
					<A HREF="ViewSjsZcCbQdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
					<%=cf.formatDouble(tccbze)%>				</td>
				<td><%=cf.formatDouble(tcpjde)%></td>
				<td>
					<A HREF="ViewSjsZcCbTdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
					<%=cf.formatDouble(tctdcbe)%>				</td>
				<td>
					<A HREF="ViewSjsZcCbZjxMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
					<%=cf.formatDouble(zjxcbe)%>				</td>

				

				<td><%=cf.formatDouble(je)%></td>

				<td><%=khsl%></td>
				<td><%=ddsl%></td>
				<td>
					<A HREF="ViewSjsZcQdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
					<%=cf.formatDouble(qye)%>				</td>
				<td><%=cf.formatDouble(zcpclf)%></td>
				<td><%=cf.formatDouble(tjpclf)%></td>
				<td><%=cf.formatDouble(pjde)%></td>
				<td>
					<A HREF="ViewSjsZcTdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
					<%=cf.formatDouble(tde)%>				</td>
				<td><%=cf.formatDouble(tdzcpclf)%></td>
				<td><%=cf.formatDouble(tdtjpclf)%></td>
				<td>
					<A HREF="ViewSjsZcZjxMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
					<%=cf.formatDouble(zjxje)%>				</td>


				</tr>
				<%	
			}

		}
		rs2.close();
		ps2.close();

//无设计师		
		//套餐＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋

		//签单
		int tckhsl=0;
		int tcddsl=0;
		double tccbze=0;

		ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(cbze) cbze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt!='98'";
		ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs is null";
		ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
		ls_sql+=" and jc_zcdd.ppbm!='主材变更'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tckhsl=rs1.getInt("khsl");
			tcddsl=rs1.getInt("ddsl");
			tccbze=rs1.getDouble("cbze");
		}
		rs1.close();
		ps1.close();

		xjtckhsl+=tckhsl;
		xjtcddsl+=tcddsl;
		xjtccbze+=tccbze;

		zjtckhsl+=tckhsl;
		zjtcddsl+=tcddsl;
		zjtccbze+=tccbze;


		int tcpjde=0;
		if (tcddsl!=0)
		{
			tcpjde=(int)tccbze/tcddsl;
		}
		else{
			tcpjde=0;
		}

		//退单
		double tctdcbe=0;
		ls_sql =" SELECT -1*sum(cbze) je";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt='99'";
		ls_sql+=" and jc_zcdd.ddqrsj is not null";
		ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs is null";
		ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
		ls_sql+=" and jc_zcdd.ppbm!='主材变更'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tctdcbe=rs1.getDouble("je");
		}
		rs1.close();
		ps1.close();

		ls_sql =" SELECT -1*sum(jc_zczjx.zjxcbze) je";
		ls_sql+=" FROM jc_zczjx,jc_zcdd";
		ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
		ls_sql+=" and jc_zcdd.clzt='99'";
		ls_sql+=" and jc_zczjx.clzt='99'";
		ls_sql+=" and jc_zczjx.qrsj is not null";
		ls_sql+=" and jc_zczjx.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zczjx.qddm='"+getdwbh+"' and jc_zczjx.jzsjs is null";
		ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
		ls_sql+=" and jc_zcdd.ppbm!='主材变更'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tctdcbe+=rs1.getDouble("je");
		}
		rs1.close();
		ps1.close();

		xjtctdcbe+=tctdcbe;
		zjtctdcbe+=tctdcbe;

		//增减项
		double zjxcbe=0;
		ls_sql =" SELECT sum(jc_zczjx.zjxcbze) je";
		ls_sql+=" FROM jc_zczjx,jc_zcdd";
		ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
		ls_sql+=" and jc_zczjx.clzt not in('00','01')";
		ls_sql+=" and jc_zczjx.qrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.qrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs is null";
		ls_sql+=" and jc_zcdd.ddlx='5'";//5：标准套餐
		ls_sql+=" and jc_zcdd.ppbm!='主材变更'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zjxcbe=rs1.getDouble("je");
		}
		rs1.close();
		ps1.close();

		xjzjxcbe+=zjxcbe;
		zjzjxcbe+=zjxcbe;


		double tcje=0;
		tcje=tccbze+tctdcbe+zjxcbe;

		xjtcje+=tcje;
		zjtcje+=tcje;



		//非套餐＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
		int khsl=0;
		int ddsl=0;
		double qye=0;
		double zcpclf=0;
		double tjpclf=0;

		ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(hkze) hkze,sum(zcpclf) zcpclf,sum(tjpclf) tjpclf";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt!='98'";
		ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs is null";
		ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khsl=rs1.getInt("khsl");
			ddsl=rs1.getInt("ddsl");
			qye=rs1.getDouble("hkze");
			zcpclf=rs1.getDouble("zcpclf");
			tjpclf=rs1.getDouble("tjpclf");
		}
		rs1.close();
		ps1.close();

		xjkhsl+=khsl;
		xjddsl+=ddsl;
		xjqye+=qye;
		xjzcpclf+=zcpclf;
		xjtjpclf+=tjpclf;


		zjkhsl+=khsl;
		zjddsl+=ddsl;
		zjqye+=qye;
		zjzcpclf+=zcpclf;
		zjtjpclf+=tjpclf;


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
		double tdzcpclf=0;
		double tdtjpclf=0;
		ls_sql =" SELECT -1*sum(hkze) je,-1*sum(zcpclf) tdzcpclf,-1*sum(tjpclf) tdtjpclf";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt='99'";
		ls_sql+=" and jc_zcdd.ddqrsj is not null";
		ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs is null";
		ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tde=rs1.getDouble("je");
			tdzcpclf=rs1.getDouble("tdzcpclf");
			tdtjpclf=rs1.getDouble("tdtjpclf");
		}
		rs1.close();
		ps1.close();

		ls_sql =" SELECT -1*sum(jc_zczjx.zjxze) je";
		ls_sql+=" FROM jc_zczjx,jc_zcdd";
		ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
		ls_sql+=" and jc_zcdd.clzt='99'";
		ls_sql+=" and jc_zczjx.clzt='99'";
		ls_sql+=" and jc_zczjx.qrsj is not null";
		ls_sql+=" and jc_zczjx.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zczjx.qddm='"+getdwbh+"' and jc_zczjx.jzsjs is null";
		ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tde+=rs1.getDouble("je");
		}
		rs1.close();
		ps1.close();

		xjtde+=tde;
		xjtdzcpclf+=tdzcpclf;
		xjtdtjpclf+=tdtjpclf;
		zjtde+=tde;
		zjtdzcpclf+=tdzcpclf;
		zjtdtjpclf+=tdtjpclf;

		//增减项
		double zjxje=0;
		ls_sql =" SELECT sum(jc_zczjx.zjxze) je";
		ls_sql+=" FROM jc_zczjx,jc_zcdd";
		ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
		ls_sql+=" and jc_zczjx.clzt not in('00','01')";
		ls_sql+=" and jc_zczjx.qrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.qrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.jzsjs is null";
		ls_sql+=" and jc_zcdd.ddlx!='5'";//5：标准套餐
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zjxje=rs1.getDouble("je");
		}
		rs1.close();
		ps1.close();

		xjzjxje+=zjxje;
		zjzjxje+=zjxje;


		double je=0;
		je=qye+tde+zjxje;

		xjje+=je;
		zjje+=je;

		if (tcje!=0 || je!=0)
		{
			row++;

			%>
			<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				<td ><%=row%></td>
				<td ><%=dmmc%></td>
				<td >无</td>

			<td><%=cf.formatDouble(tcje)%></td>

			<td><%=tckhsl%></td>
			<td><%=tcddsl%></td>
			<td>
				<A HREF="ViewSjsZcCbQdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
				<%=cf.formatDouble(tccbze)%>				</td>
			<td><%=cf.formatDouble(tcpjde)%></td>
			<td>
				<A HREF="ViewSjsZcCbTdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
				<%=cf.formatDouble(tctdcbe)%>				</td>
			<td>
				<A HREF="ViewSjsZcCbZjxMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
				<%=cf.formatDouble(zjxcbe)%>				</td>

			

			<td><%=cf.formatDouble(je)%></td>

			<td><%=khsl%></td>
			<td><%=ddsl%></td>
			<td>
				<A HREF="ViewSjsZcQdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
				<%=cf.formatDouble(qye)%>				</td>
				<td><%=cf.formatDouble(zcpclf)%></td>
				<td><%=cf.formatDouble(tjpclf)%></td>
			<td><%=cf.formatDouble(pjde)%></td>
			<td>
				<A HREF="ViewSjsZcTdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
				<%=cf.formatDouble(tde)%>				</td>
				<td><%=cf.formatDouble(tdzcpclf)%></td>
				<td><%=cf.formatDouble(tdtjpclf)%></td>
			<td>
				<A HREF="ViewSjsZcZjxMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&sjs=<%=getsjs%>" target="_blank">
				<%=cf.formatDouble(zjxje)%>				</td>


			</tr>
			<%	
		}



		
		tcpjde=0;
		if (xjtcddsl!=0)
		{
			tcpjde=(int)xjtccbze/xjtcddsl;
		}
		else{
			tcpjde=0;
		}


		pjde=0;
		if (xjddsl!=0)
		{
			pjde=(int)xjqye/xjddsl;
		}
		else{
			pjde=0;
		}

		%>
		<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td colspan="3"><strong><font color="#ff0000">[<%=dmmc%>]小计</strong></td>

			<td><strong><%=cf.formatDouble(xjtcje)%></strong></td>
			<td><strong><%=xjtckhsl%></strong></td>
			<td><strong><%=xjtcddsl%></strong></td>
			<td><strong><%=cf.formatDouble(xjtccbze)%></strong></td>
			<td><strong><%=cf.formatDouble(tcpjde)%></strong></td>
			<td><strong><%=cf.formatDouble(xjtctdcbe)%></strong></td>
			<td><strong><%=cf.formatDouble(xjzjxcbe)%></strong></td>
			<td><strong><%=cf.formatDouble(xjje)%></strong></td>

			<td><strong><%=xjkhsl%></strong></td>
			<td><strong><%=xjddsl%></strong></td>
			<td><strong><%=cf.formatDouble(xjqye)%></strong></td>
			<td><strong><%=cf.formatDouble(xjzcpclf)%></strong></td>
			<td><strong><%=cf.formatDouble(xjtjpclf)%></strong></td>
			<td><strong><%=cf.formatDouble(pjde)%></strong></td>
			<td><strong><%=cf.formatDouble(xjtde)%></strong></td>
			<td><strong><%=cf.formatDouble(xjtdzcpclf)%></strong></td>
			<td><strong><%=cf.formatDouble(xjtdtjpclf)%></strong></td>
			<td><strong><%=cf.formatDouble(xjzjxje)%></strong></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	int tcpjde=0;
	if (zjtcddsl!=0)
	{
		tcpjde=(int)zjtccbze/zjtcddsl;
	}
	else{
		tcpjde=0;
	}


	int pjde=0;
	if (zjddsl!=0)
	{
		pjde=(int)zjqye/zjddsl;
	}
	else{
		pjde=0;
	}
%>

<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="3"><strong><font color="#ff0000">总计</strong></td>
	
	<td><strong><%=cf.formatDouble(zjtcje)%></strong></td>
	<td><strong><%=zjtckhsl%></strong></td>
	<td><strong><%=zjtcddsl%></strong></td>
	<td><strong><%=cf.formatDouble(zjtccbze)%></strong></td>
	<td><strong><%=cf.formatDouble(tcpjde)%></strong></td>
	<td><strong><%=cf.formatDouble(zjtctdcbe)%></strong></td>
	<td><strong><%=cf.formatDouble(zjzjxcbe)%></strong></td>
	<td><strong><%=cf.formatDouble(zjje)%></strong></td>

	<td><strong><%=zjkhsl%></strong></td>
	<td><strong><%=zjddsl%></strong></td>
	<td><strong><%=cf.formatDouble(zjqye)%></strong></td>
	<td><strong><%=cf.formatDouble(zjzcpclf)%></strong></td>
	<td><strong><%=cf.formatDouble(zjtjpclf)%></strong></td>
	<td><strong><%=cf.formatDouble(pjde)%></strong></td>
	<td><strong><%=cf.formatDouble(zjtde)%></strong></td>
	<td><strong><%=cf.formatDouble(zjtdzcpclf)%></strong></td>
	<td><strong><%=cf.formatDouble(zjtdtjpclf)%></strong></td>
	<td><strong><%=cf.formatDouble(zjzjxje)%></strong></td>
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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
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