<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030303'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[店面主材统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[店面主材统计]："+xtrzyhmc+"') ";
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
  <B>店面主材统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="110%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="4%" >序号</td>
  <td  width="15%" >分公司</td>
  <td  width="7%" >客户数</td>
  <td  width="7%" >订单数</td>
  <td  width="12%" >实收款</td>
  <td  width="9%" >平均单值</td>
  <td  width="12%" >折后－合同额</td>
  <td  width="11%" >退单额</td>
  <td  width="12%" >增减项</td>
  <td  width="810%" >销售总额</td>
  </tr>
<%
	//获取最大数
	int zjkhsl=0;
	int zjddsl=0;
	double zjyjje=0;
	double zjwdzgce=0;
	double zjqye=0;
	double zjtde=0;
	double zjzjxze=0;
	double zjxsje=0;

	int row=0;


	
	String getfgsbh=null;
	String fgsmc=null;
	String getdwbh=null;
	String dmmc=null;
	String cxbz="";
	String kdsj="";
	String gdsj="";


	ls_sql =" SELECT dwbh,dwmc ";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where sq_dwxx.dwlx='F0'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}

	ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>TO_DATE('"+sjfw+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	ls_sql+=" order by sq_dwxx.dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		getfgsbh=rs2.getString("dwbh");
		fgsmc=rs2.getString("dwmc");
	
		int xjkhsl=0;
		int xjddsl=0;
		double xjyjje=0;
		double xjwdzgce=0;
		double xjqye=0;
		double xjtde=0;
		double xjzjxze=0;
		double xjxsje=0;

		
		ls_sql =" SELECT dwbh,dwmc,kdsj,gdsj,cxbz ";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where sq_dwxx.dwlx='F2'";
		ls_sql+=" and sq_dwxx.ssfgs='"+getfgsbh+"'";

		if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and sq_dwxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}

		if (!(dwbh.equals("")))
		{
			ls_sql+=" and  sq_dwxx.dwbh='"+dwbh+"'";
		}
		ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>TO_DATE('"+sjfw+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
		ls_sql+=" order by sq_dwxx.dwbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
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

			//实收款
			int khsl=0;
			int ddsl=0;
			double yjje=0;
			ls_sql =" SELECT count(distinct cw_khfkjl.khbh) khsl,count(cw_khfkjl.ddbh) ddsl,sum(cw_khfkjl.fkje) yjje";
			ls_sql+=" FROM cw_khfkjl";

			ls_sql+=" where cw_khfkjl.scbz='N' ";
			ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:主材
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and cw_khfkjl.dwbh='"+getdwbh+"'";

			ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				khsl=rs1.getInt("khsl");
				ddsl=rs1.getInt("ddsl");
				yjje=rs1.getDouble("yjje");
			}
			rs1.close();
			ps1.close();

			xjkhsl+=khsl;
			xjddsl+=ddsl;
			xjyjje+=yjje;

			zjkhsl+=khsl;
			zjddsl+=ddsl;
			zjyjje+=yjje;


			int pjde=0;
			if (ddsl!=0)
			{
				pjde=(int)yjje/ddsl;
			}
			else{
				pjde=0;
			}

			//签单
			double wdzgce=0;
			double qye=0;
			ls_sql =" SELECT sum(wdzje) wdzje,sum(hkze) qye";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				wdzgce=rs1.getDouble("wdzje");
				qye=rs1.getDouble("qye");
			}
			rs1.close();
			ps1.close();

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
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
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
			ls_sql+=" and jc_zczjx.qddm='"+getdwbh+"'";
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
				<td ><%=dmmc%></td>

			
				<td><%=khsl%></td>
				<td><%=ddsl%></td>
				<td>
						<A HREF="ViewDmYjMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=cf.formatDouble(yjje)%>
					</A>
					
				</td>
				<td><%=cf.formatDouble(pjde)%></td>
				<td>
						<A HREF="ViewDmZcQdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=cf.formatDouble(qye)%>
					</A>
				</td>
				<td>
						<A HREF="ViewDmZcTdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=cf.formatDouble(tde)%>
					</A>
				</td>
				<td>
						<A HREF="ViewDmZcZjxMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=cf.formatDouble(zjxze)%>
					</A>
				</td>
				<td><%=cf.formatDouble(xsje)%></td>

			</tr>
			<%	
		}
		rs.close();
		ps.close();

		int pjde=0;
		if (xjddsl!=0)
		{
			pjde=(int)xjyjje/xjddsl;
		}
		else{
			pjde=0;
		}

		%>
		<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td colspan="2"><strong><font color="#ff0000">[<%=fgsmc%>]小计</strong></td>
			<td><%=cf.formatDouble(xjkhsl)%></td>
			<td><%=xjddsl%></td>
			<td><%=cf.formatDouble(xjyjje)%></td>
			<td><%=pjde%></td>
			<td><%=cf.formatDouble(xjqye)%></td>
			<td><%=cf.formatDouble(xjtde)%></td>
			<td><%=cf.formatDouble(xjzjxze)%></td>
			<td><%=cf.formatDouble(xjxsje)%></td>
		  </tr>
		<%
	}
	rs2.close();
	ps2.close();


	int pjde=0;
	if (zjddsl!=0)
	{
		pjde=(int)zjyjje/zjddsl;
	}
	else{
		pjde=0;
	}
%>

<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="2"><strong><font color="#ff0000">总计</strong></td>
	
	<td><%=cf.formatDouble(zjkhsl)%></td>
	<td><%=zjddsl%></td>
	<td><%=cf.formatDouble(zjyjje)%></td>
	<td><%=pjde%></td>
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