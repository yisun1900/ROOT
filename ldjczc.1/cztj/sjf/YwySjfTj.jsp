<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030406'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[业务员设计费统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[业务员设计费统计]："+xtrzyhmc+"') ";
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
String ywy=cf.GB2Uni(request.getParameter("ywy"));


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
  <B>业务员设计费统计</B><BR>
  <b>(时间范围：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="6%" >序号</td>
  <td  width="11%" >业务员</td>

  <td  width="9%" ><font color="#FF0000">客户数</font></td>
  <td  width="12%" ><font color="#FF0000">实收设计费金额</font></td>
  <td  width="12%" >设计合同金额</td>



  <td  width="10%" >房屋面积</td>
  <td  width="11%" >平米收设计费</td>
  <td  width="11%" >户均收设计费</td>

  <td  width="9%" ><font color="#0000FF">入店客户数</font></td>
  <td  width="9%" ><font color="#0000FF">入店客户收设计费比例</font></td>
  </tr>
<%
	//实收设计费
	int xjkhsl=0;
	double xjsjf=0;
	double xjsjhtje=0;
	long xjfwmj=0;

	//入店客户数
	int xjrdkhs=0;


	int row=0;

	String getywy="";
	int khsl=0;
	double sjf=0;
	double sjhtje=0;
	long fwmj=0;
	ls_sql =" SELECT crm_zxkhxx.ywy,count(distinct cw_khfkjl.khbh) khsl,sum(cw_khfkjl.fkje) sjf,sum(sjhtje) sjhtje,sum(fwmj) fwmj";
	ls_sql+=" FROM cw_khfkjl,crm_zxkhxx";
	ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh";

	ls_sql+=" and cw_khfkjl.scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('53')";//53：设计费
	ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";

	ls_sql+=" and crm_zxkhxx.ssfgs='"+fgs+"'";
	ls_sql+=" and crm_zxkhxx.ywy is not null";
	if (!(dwbh.equals("")))
	{
		ls_sql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
	}
	if (!(ywy.equals("")))
	{
		ls_sql+=" and crm_zxkhxx.ywy='"+ywy+"'";
	}

	ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" group by crm_zxkhxx.ywy ";
	ls_sql+=" order by crm_zxkhxx.ywy ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		getywy=rs1.getString("ywy");
		khsl=rs1.getInt("khsl");
		sjf=rs1.getDouble("sjf");
		sjhtje=rs1.getDouble("sjhtje");
		fwmj=rs1.getLong("fwmj");

		
		String sfzszg="";
		String rzsj="";
		String lzrq="";
		ls_sql =" SELECT sfzszg,rzsj,lzrq";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where zwbm in('19')";
		ls_sql+=" and ssfgs='"+fgs+"'";
		ls_sql+=" and yhmc='"+getywy+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfzszg=rs.getString("sfzszg");
			rzsj=cf.fillNull(rs.getDate("rzsj"));
			lzrq=cf.fillNull(rs.getDate("lzrq"));

		}
		rs.close();
		ps.close();
			

		xjkhsl+=khsl;
		xjsjf+=sjf;
		xjsjhtje+=sjhtje;
		xjfwmj+=fwmj;


		int pmjj=0;
		int pjde=0;

		if (fwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(int)(sjf/fwmj);
		}

		if (khsl==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(sjf/khsl);
		}

		
		//入店客户数
		int rdkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgs+"' and crm_zxkhxx.ywy='"+getywy+"'";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			rdkhs=rs.getInt(1);
		}
		rs.close();
		ps.close();
		
		xjrdkhs+=rdkhs;

		//入店客户收设计费比例
		double rdsjfbl=0;
		if (rdkhs==0)
		{
			rdsjfbl=0;
		}
		else{
			rdsjfbl=cf.round(khsl*100.0/rdkhs,2);
		}

		
		row++;

		%>
		<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td align="center"><%=row%></td>
			<td align="center"><%=getywy%></td>

			<td>
				<A HREF="ViewYwysjfMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&ssfgs=<%=fgs%>&ywy=<%=getywy%>" target="_blank"><%=khsl%></A>			
			</td>
			<td><%=cf.formatDouble(sjf)%></td>
			<td><%=cf.formatDouble(sjhtje)%></td>
			

			<td><%=fwmj%></td>
			<td><%=pmjj%></td>

			<td><%=pjde%></td>
			
			<td>
				<A HREF="ViewYwyRdkhMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&ssfgs=<%=fgs%>&ywy=<%=getywy%>" target="_blank"><%=rdkhs%></A>			
			</td>
			<td><%=rdsjfbl%>%</td>
		</tr>
		<%	
	}
	rs1.close();
	ps1.close();



	int pmjj=0;
	int pjde=0;

	if (xjfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(xjsjhtje/xjfwmj);
	}
	if (xjkhsl==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(xjsjf/xjkhsl);
	}

	//入店客户收设计费比例
	double rdsjfbl=0;
	if (xjrdkhs==0)
	{
		rdsjfbl=0;
	}
	else{
		rdsjfbl=cf.round(xjkhsl*100.0/xjrdkhs,2);
	}

	%>
	<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		<td align="center" colspan="2"><font color="#ff0000"小计</td>

		<td><B><%=xjkhsl%></B></td>
		<td><B><%=cf.formatDouble(xjsjf)%></B></td>
		<td><B><%=cf.formatDouble(xjsjhtje)%></B></td>
		

		<td><B><%=xjfwmj%></B></td>
		<td><B><%=pmjj%></B></td>
		<td><B><%=pjde%></B></td>
		
		<td><B><%=xjrdkhs%></B></td>
		<td><B><%=rdsjfbl%>%</B></td>
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