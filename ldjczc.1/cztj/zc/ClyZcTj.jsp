<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030305'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[材料员主材统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[材料员主材统计]："+xtrzyhmc+"') ";
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>材料员主材统计</B><BR>
  <b>(签合同时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="120%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="4%" >排名</td>
  <td  width="13%" >店面</td>
  <td  width="13%" >材料员</td>
  <td  width="11%" >小计</td>

  <td  width="6%" >客户数</td>
  <td  width="7%" >订单数</td>
  <td  width="10%" >折前－合同额</td>
  <td  width="10%" >折后－合同额</td>
  <td  width="9%" >平均单值</td>
  <td  width="8%" >退单额</td>
  <td  width="9%" >增减项</td>
  </tr>
<%
	//获取最大数
	double je=0;

	
	int xjkhsl=0;
	int xjddsl=0;
	double xjwdzgce=0;
	double xjqye=0;
	double xjje=0;
	double xjtde=0;
	double xjzjxze=0;

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
	if (!(clgw.equals("")))
	{
		ls_sql+=" and  sq_dwxx.dwbh in(select dwbh from sq_yhxx where ssfgs='"+fgs+"' and yhmc='"+clgw+"' and zwbm in('08'))";
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

		int xjkhsldm=0;
		int xjddsldm=0;
		double xjwdzgcedm=0;
		double xjqyedm=0;
		double xjjedm=0;
		double xjtdedm=0;
		double xjzjxzedm=0;

		String sqlclgw="";

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
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.clgw='"+getclgw+"'";
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
			xjwdzgce+=wdzgce;
			xjqye+=qye;


			xjkhsldm+=khsl;
			xjddsldm+=ddsl;
			xjwdzgcedm+=wdzgce;
			xjqyedm+=qye;



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
			ls_sql =" SELECT -1*sum(hkze+zjhze) je";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.clgw='"+getclgw+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tde=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjtde+=tde;
			xjtdedm+=tde;

			//增减项
			double zjxze=0;
			ls_sql =" SELECT sum(zjxze) je";
			ls_sql+=" FROM jc_zczjx";
			ls_sql+=" where jc_zczjx.clzt not in('00')";
			ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.qddm='"+getdwbh+"' and jc_zczjx.clgw='"+getclgw+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zjxze=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjzjxze+=zjxze;
			xjzjxzedm+=zjxze;

			je=qye+tde+zjxze;

			xjje+=je;
			xjjedm+=je;

			if (!sfzszg.equals("Y") && !sfzszg.equals("N"))
			{
				getclgw=getclgw+"<BR>入职:"+rzsj+"<BR>离职:"+lzrq;
			}

			//撤店无数据不显示
			if (   (cxbz.equals("N") && sfzszg.equals("Y")) || (cxbz.equals("N") && sfzszg.equals("N")) || (je!=0) || (ddsl!=0)  )
			{
				row++;

				%>
				<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					<td ><%=row%></td>
					<td ><%=dmmc%></td>
					<td ><%=getclgw%></td>
					<td><%=cf.formatDouble((long)je)%></td>

					<td><%=khsl%></td>
					<td><%=ddsl%></td>
					<td><%=cf.formatDouble((long)wdzgce)%></td>
					<td>
						<A HREF="ViewClyZcQdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&clgw=<%=getclgw%>" target="_blank">
						<%=cf.formatDouble((long)qye)%>					</td>
					<td><%=cf.formatDouble(pjde)%></td>
					<td>
						<A HREF="ViewClyZcTdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&clgw=<%=getclgw%>" target="_blank">
						<%=cf.formatDouble((long)tde)%>					</td>
					<td>
						<A HREF="ViewClyZcZjxMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&clgw=<%=getclgw%>" target="_blank">
						<%=cf.formatDouble((long)zjxze)%>					</td>
				</tr>
				<%	
			}

		}
		rs2.close();
		ps2.close();


		ls_sql =" SELECT distinct jc_zcdd.clgw";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
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
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.clgw='"+getclgw+"'";
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
			xjwdzgce+=wdzgce;
			xjqye+=qye;


			xjkhsldm+=khsl;
			xjddsldm+=ddsl;
			xjwdzgcedm+=wdzgce;
			xjqyedm+=qye;



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
			ls_sql =" SELECT -1*sum(hkze+zjhze) je";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"' and jc_zcdd.clgw='"+getclgw+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tde=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjtde+=tde;
			xjtdedm+=tde;

			//增减项
			double zjxze=0;
			ls_sql =" SELECT sum(zjxze) je";
			ls_sql+=" FROM jc_zczjx";
			ls_sql+=" where jc_zczjx.clzt not in('00')";
			ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.qddm='"+getdwbh+"' and jc_zczjx.clgw='"+getclgw+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zjxze=rs1.getDouble("je");
			}
			rs1.close();
			ps1.close();

			xjzjxze+=zjxze;
			xjzjxzedm+=zjxze;

			je=qye+tde+zjxze;

			xjje+=je;
			xjjedm+=je;

			String zhdwmc="(不存在)";
			ls_sql =" SELECT dwmc";
			ls_sql+=" FROM sq_yhxx,sq_dwxx";
			ls_sql+=" where zwbm in('08')";
			ls_sql+=" and sq_yhxx.ssfgs='"+getfgsbh+"'";
			ls_sql+=" and yhmc='"+getclgw+"'";
			ls_sql+=" and sq_yhxx.dwbh=sq_dwxx.dwbh";
//			out.println(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zhdwmc=rs1.getString("dwmc");
				zhdwmc="转店:"+zhdwmc;
			}
			rs1.close();
			ps1.close();

			row++;

			%>
			<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				<td ><%=row%></td>
				<td ><%=dmmc%></td>
				<td ><%=getclgw%><BR><%=zhdwmc%></td>
				<td><%=cf.formatDouble((long)je)%></td>

				<td><%=khsl%></td>
				<td><%=ddsl%></td>
				<td><%=cf.formatDouble((long)wdzgce)%></td>
				<td>
					<A HREF="ViewClyZcQdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&clgw=<%=getclgw%>" target="_blank">
					<%=cf.formatDouble((long)qye)%>				</td>
				<td><%=cf.formatDouble(pjde)%></td>
				<td>
					<A HREF="ViewClyZcTdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&clgw=<%=getclgw%>" target="_blank">
					<%=cf.formatDouble((long)tde)%>				</td>
				<td>
					<A HREF="ViewClyZcZjxMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&clgw=<%=getclgw%>" target="_blank">
					<%=cf.formatDouble((long)zjxze)%>				</td>
			</tr>
			<%	


		}
		rs2.close();
		ps2.close();

		
		
		
		int pjde=0;
		if (xjddsldm!=0)
		{
			pjde=(int)xjqyedm/xjddsldm;
		}
		else{
			pjde=0;
		}

		%>
		<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td colspan="3"><strong><font color="#ff0000">[<%=dmmc%>]小计</strong></td>
			
			<td><strong><%=cf.formatDouble((long)xjjedm)%></strong></td>
			<td><strong><%=cf.formatDouble((long)xjkhsldm)%></strong></td>
			<td><strong><%=xjddsldm%></strong></td>
			<td><strong><%=cf.formatDouble((long)xjwdzgcedm)%></strong></td>
			<td><strong><%=cf.formatDouble((long)xjqyedm)%></strong></td>
			<td><strong><%=pjde%></strong></td>
			<td><strong><%=cf.formatDouble((long)xjtdedm)%></strong></td>
			<td><strong><%=cf.formatDouble((long)xjzjxzedm)%></strong></td>
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
	<td colspan="3"><strong><font color="#ff0000">总计</strong></td>
	
	<td><strong><%=cf.formatDouble((long)xjje)%></strong></td>
	<td><strong><%=cf.formatDouble((long)xjkhsl)%></strong></td>
	<td><strong><%=xjddsl%></strong></td>
	<td><strong><%=cf.formatDouble((long)xjwdzgce)%></strong></td>
	<td><strong><%=cf.formatDouble((long)xjqye)%></strong></td>
	<td><strong><%=pjde%></strong></td>
	<td><strong><%=cf.formatDouble((long)xjtde)%></strong></td>
	<td><strong><%=cf.formatDouble((long)xjzjxze)%></strong></td>
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