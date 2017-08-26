<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	cf.ckxxrz(request,session,"17030305",1);
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
String clgw=cf.GB2Uni(request.getParameter("clgw"));


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
  <B>材料员主材统计</B><BR>
  <b>(签合同时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="130%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="3%" >序号</td>
  <td  width="10%" >部门</td>
  <td  width="5%" >材料员</td>
  <td  width="6%" >实收款客户数</td>
  <td  width="6%" >实收款订单数</td>
  <td  width="11%" >实收款</td>
  <td  width="8%" >实收款平均单值</td>

  <td  width="6%" >新订单客户数</td>
  <td  width="6%" >新订单数</td>
  <td  width="11%" >新订单折后合同额</td>
  <td  width="8%" >退单额</td>
  <td  width="10%" >增减项</td>
  <td  width="11%" >销售总额</td>
  </tr>
<%
	//获取最大数
	int zjsskhsl=0;
	int zjssddsl=0;
	double zjsskje=0;

	int zjkhsl=0;
	int zjddsl=0;
	double zjwdzgce=0;
	double zjqye=0;
	double zjtde=0;
	double zjzjxze=0;
	double zjxsje=0;

	int row=0;


	
	String getdwbh=null;
	String dmmc=null;

	String sqlclgw="";

	ls_sql =" select distinct sq_dwxx.dwbh,sq_dwxx.dwmc";
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and sq_yhxx.zwbm in('08') and sq_yhxx.sfzszg in('Y','N') ";
	ls_sql+=" and sq_yhxx.ssfgs='"+fgs+"'";

	if (!(dwbh.equals("")))
	{
		ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
	}

	if (!(clgw.equals("")))
	{
		ls_sql+=" and  sq_yhxx.yhmc='"+clgw+"'";
	}


	ls_sql+=" ORDER BY dwbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getdwbh=rs.getString("dwbh");
		dmmc=rs.getString("dwmc");


		int xjsskhsl=0;
		int xjssddsl=0;
		double xjsskje=0;

		int xjkhsl=0;
		int xjddsl=0;
		double xjwdzgce=0;
		double xjqye=0;
		double xjtde=0;
		double xjzjxze=0;
		double xjxsje=0;

		String getclgw="";
		String sfzszg="";
		String rzsj="";
		String lzrq="";
		ls_sql =" SELECT yhmc,sfzszg,rzsj,lzrq";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where zwbm in('08')";
		ls_sql+=" and dwbh='"+getdwbh+"'";
		if (!(clgw.equals("")))
		{
			ls_sql+=" and yhmc='"+clgw+"'";
		}

		ls_sql+=" and (sfzszg in('Y','N') or lzrq+62>TO_DATE('"+sjfw+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
		ls_sql+=" order by yhmc";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			getclgw=rs2.getString("yhmc");
			sfzszg=rs2.getString("sfzszg");
			rzsj=cf.fillNull(rs2.getDate("rzsj"));
			lzrq=cf.fillNull(rs2.getDate("lzrq"));

			sqlclgw+=",'"+getclgw+"'";

			//实收款
			int sskhsl=0;
			int ssddsl=0;
			double sskje=0;
			ls_sql =" SELECT count(distinct cw_khfkjl.khbh) khsl,count(distinct cw_khfkjl.ddbh) ddsl,sum(cw_khfkjl.fkje) sskje";
			ls_sql+=" FROM cw_khfkjl,jc_zcdd";

			ls_sql+=" where cw_khfkjl.scbz='N' ";
			ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:主材
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and cw_khfkjl.fgsbh='"+fgs+"'";

			ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

			ls_sql+=" and cw_khfkjl.ddbh=jc_zcdd.ddbh";
			ls_sql+=" and jc_zcdd.clgw='"+getclgw+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sskhsl=rs1.getInt("khsl");
				ssddsl=rs1.getInt("ddsl");
				sskje=rs1.getDouble("sskje");
			}
			rs1.close();
			ps1.close();

			xjsskhsl+=sskhsl;
			xjssddsl+=ssddsl;
			xjsskje+=sskje;

			zjsskhsl+=sskhsl;
			zjssddsl+=ssddsl;
			zjsskje+=sskje;


			int pjde=0;
			if (sskhsl!=0)
			{
				pjde=(int)sskje/sskhsl;
			}
			else{
				pjde=0;
			}

			//签单
			int khsl=0;
			int ddsl=0;
			double wdzgce=0;
			double qye=0;
			ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(wdzje) wdzje,sum(hkze) qye";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.fgsbh='"+fgs+"' and jc_zcdd.clgw='"+getclgw+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				khsl=rs1.getInt("khsl");
				ddsl=rs1.getInt("ddsl");
				wdzgce=rs1.getDouble("wdzje");
				qye=rs1.getDouble("qye");
			}
			rs1.close();
			ps1.close();

			xjkhsl+=khsl;
			xjddsl+=ddsl;

			zjkhsl+=khsl;
			zjddsl+=ddsl;

			xjwdzgce+=wdzgce;
			xjqye+=qye;

			zjwdzgce+=wdzgce;
			zjqye+=qye;


			//退单
			double tde=0;
			ls_sql =" SELECT -1*sum(hkze+zjhze) je";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.fgsbh='"+fgs+"' and jc_zcdd.clgw='"+getclgw+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tde=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjtde+=tde;
			zjtde+=tde;

			//增减项
			double zjxze=0;
			ls_sql =" SELECT sum(zjxze) je";
			ls_sql+=" FROM jc_zczjx";
			ls_sql+=" where jc_zczjx.clzt not in('00')";
			ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.fgsbh='"+fgs+"' and jc_zczjx.clgw='"+getclgw+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zjxze=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjzjxze+=zjxze;
			zjzjxze+=zjxze;

			double xsje=qye+tde+zjxze;

			xjxsje+=xsje;
			zjxsje+=xsje;

			if (!sfzszg.equals("Y") && !sfzszg.equals("N"))
			{
				getclgw=getclgw+"<BR>入职:"+rzsj+"<BR>离职:"+lzrq;
			}

			row++;

			%>
			<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				<td ><%=row%></td>
				<td ><%=dmmc%></td>
				<td ><%=getclgw%></td>

				<td><%=sskhsl%></td>
				<td><%=ssddsl%></td>
				<td><%=cf.formatDouble(sskje)%></td>
				<td><%=cf.formatDouble(pjde)%></td>

				<td><%=khsl%></td>
				<td><%=ddsl%></td>
				<td>
					<A HREF="ViewClyZcQdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&clgw=<%=getclgw%>" target="_blank">
					<%=cf.formatDouble(qye)%>					</td>
				<td>
					<A HREF="ViewClyZcTdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&clgw=<%=getclgw%>" target="_blank">
					<%=cf.formatDouble(tde)%>					</td>
				<td>
					<A HREF="ViewClyZcZjxMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&clgw=<%=getclgw%>" target="_blank">
					<%=cf.formatDouble(zjxze)%>					</td>
				<td><%=cf.formatDouble(xsje)%></td>
			</tr>
			<%	

		}
		rs2.close();
		ps2.close();

	
		int pjde=0;
		if (xjssddsl!=0)
		{
			pjde=(int)xjsskje/xjssddsl;
		}
		else{
			pjde=0;
		}

		%>
		<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td colspan="3"><strong><font color="#ff0000">[<%=dmmc%>]小计</strong></td>
			
			<td><%=cf.formatDouble(xjsskhsl)%></td>
			<td><%=xjssddsl%></td>
			<td><%=cf.formatDouble(xjsskje)%></td>
			<td><%=pjde%></td>
			<td><%=cf.formatDouble(xjkhsl)%></td>
			<td><%=xjddsl%></td>
			<td><%=cf.formatDouble(xjqye)%></td>
			<td><%=cf.formatDouble(xjtde)%></td>
			<td><%=cf.formatDouble(xjzjxze)%></td>
			<td><%=cf.formatDouble(xjxsje)%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();
	
	int xjsskhsl=0;
	int xjssddsl=0;
	double xjsskje=0;

	int xjkhsl=0;
	int xjddsl=0;
	double xjwdzgce=0;
	double xjqye=0;
	double xjtde=0;
	double xjzjxze=0;
	double xjxsje=0;

	String getclgw="";
	String sfzszg="";
	String rzsj="";
	String lzrq="";

	int bczsl=0;
	
	ls_sql =" SELECT distinct jc_zcdd.clgw";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";
	ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.fgsbh='"+fgs+"'";
	if (!sqlclgw.equals(""))
	{
		ls_sql+=" and jc_zcdd.clgw not in("+sqlclgw.substring(1)+")";
	}
	ls_sql+=" order by clgw";
//		out.println(ls_sql);
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		getclgw=rs2.getString("clgw");

		bczsl++;

		//实收款
		int sskhsl=0;
		int ssddsl=0;
		double sskje=0;
		ls_sql =" SELECT count(distinct cw_khfkjl.khbh) khsl,count(distinct cw_khfkjl.ddbh) ddsl,sum(cw_khfkjl.fkje) sskje";
		ls_sql+=" FROM cw_khfkjl,jc_zcdd";

		ls_sql+=" where cw_khfkjl.scbz='N' ";
		ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:主材
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
		ls_sql+=" and cw_khfkjl.fgsbh='"+fgs+"'";

		ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		ls_sql+=" and cw_khfkjl.ddbh=jc_zcdd.ddbh";
		ls_sql+=" and jc_zcdd.clgw='"+getclgw+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sskhsl=rs1.getInt("khsl");
			ssddsl=rs1.getInt("ddsl");
			sskje=rs1.getDouble("sskje");
		}
		rs1.close();
		ps1.close();

		xjsskhsl+=sskhsl;
		xjssddsl+=ssddsl;
		xjsskje+=sskje;

		zjsskhsl+=sskhsl;
		zjssddsl+=ssddsl;
		zjsskje+=sskje;


		int pjde=0;
		if (sskhsl!=0)
		{
			pjde=(int)sskje/sskhsl;
		}
		else{
			pjde=0;
		}

		//签单
		int khsl=0;
		int ddsl=0;
		double wdzgce=0;
		double qye=0;
		ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(wdzje) wdzje,sum(hkze) qye";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.fgsbh='"+fgs+"' and jc_zcdd.clgw='"+getclgw+"'";
//			out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khsl=rs1.getInt("khsl");
			ddsl=rs1.getInt("ddsl");
			wdzgce=rs1.getDouble("wdzje");
			qye=rs1.getDouble("qye");
		}
		rs1.close();
		ps1.close();

		xjkhsl+=khsl;
		xjddsl+=ddsl;

		zjkhsl+=khsl;
		zjddsl+=ddsl;

		xjwdzgce+=wdzgce;
		xjqye+=qye;

		zjwdzgce+=wdzgce;
		zjqye+=qye;

		//退单
		double tde=0;
		ls_sql =" SELECT -1*sum(hkze+zjhze) je";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt='99'";
		ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.fgsbh='"+fgs+"' and jc_zcdd.clgw='"+getclgw+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tde=rs1.getDouble("je");
		}
		rs1.close();
		ps1.close();

		xjtde+=tde;
		zjtde+=tde;

		//增减项
		double zjxze=0;
		ls_sql =" SELECT sum(zjxze) je";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where jc_zczjx.clzt not in('00')";
		ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zczjx.fgsbh='"+fgs+"' and jc_zczjx.clgw='"+getclgw+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zjxze=rs1.getDouble("je");
		}
		rs1.close();
		ps1.close();

		xjzjxze+=zjxze;
		zjzjxze+=zjxze;

		double xsje=qye+tde+zjxze;

		xjxsje+=xsje;
		zjxsje+=xsje;

		row++;

		%>
		<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td ><%=row%></td>
			<td >不存在</td>
			<td ><%=getclgw%></td>

			<td><%=sskhsl%></td>
			<td><%=ssddsl%></td>
			<td><%=cf.formatDouble(sskje)%></td>
			<td><%=cf.formatDouble(pjde)%></td>

			<td><%=khsl%></td>
			<td><%=ddsl%></td>
			<td>
				<A HREF="ViewClyZcQdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&clgw=<%=getclgw%>" target="_blank">
				<%=cf.formatDouble(qye)%>				</td>
			<td>
				<A HREF="ViewClyZcTdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&clgw=<%=getclgw%>" target="_blank">
				<%=cf.formatDouble(tde)%>				</td>
			<td>
				<A HREF="ViewClyZcZjxMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&clgw=<%=getclgw%>" target="_blank">
				<%=cf.formatDouble(zjxze)%>				</td>
			<td><%=cf.formatDouble(xsje)%></td>
		</tr>
		<%	


	}
	rs2.close();
	ps2.close();

	if (bczsl>0)
	{
		int pjde=0;
		if (xjssddsl!=0)
		{
			pjde=(int)xjsskje/xjssddsl;
		}
		else{
			pjde=0;
		}

		%>
		<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td colspan="3"><strong><font color="#ff0000">[不存在]小计</strong></td>
			
			<td><%=cf.formatDouble(xjsskhsl)%></td>
			<td><%=xjssddsl%></td>
			<td><%=cf.formatDouble(xjsskje)%></td>
			<td><%=pjde%></td>
			<td><%=cf.formatDouble(xjkhsl)%></td>
			<td><%=xjddsl%></td>
			<td><%=cf.formatDouble(xjqye)%></td>
			<td><%=cf.formatDouble(xjtde)%></td>
			<td><%=cf.formatDouble(xjzjxze)%></td>
			<td><%=cf.formatDouble(xjxsje)%></td>
		  </tr>
		<%
	}



	int pjde=0;
	if (zjssddsl!=0)
	{
		pjde=(int)zjsskje/zjssddsl;
	}
	else{
		pjde=0;
	}
%>

<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="3"><strong><font color="#ff0000">总计</strong></td>
	
	<td><%=cf.formatDouble(zjsskhsl)%></td>
	<td><%=zjssddsl%></td>
	<td><%=cf.formatDouble(zjsskje)%></td>
	<td><%=pjde%></td>
	<td><%=cf.formatDouble(zjkhsl)%></td>
	<td><%=zjddsl%></td>
	<td><%=cf.formatDouble(zjqye)%></td>
	<td><%=cf.formatDouble(zjtde)%></td>
	<td><%=cf.formatDouble(zjzjxze)%></td>
	<td><%=cf.formatDouble(zjxsje)%></td>
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