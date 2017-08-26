<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030403'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[店面设计费统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[店面设计费统计]："+xtrzyhmc+"') ";
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
  <B>店面设计费统计</B><BR>
  <b>(时间范围：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="4%" >序号 </td>
  <td  width="16%" >店面</td>

  <td  width="8%" ><font color="#FF0000">实收设计费客户数</font></td>
  <td  width="13%" ><font color="#FF0000">实收设计费金额</font></td>
  <td  width="13%" >设计合同金额</td>



  <td  width="10%" >房屋面积</td>
  <td  width="10%" >平米收设计费</td>
  <td  width="10%" >户均收设计费</td>

  <td  width="8%" ><font color="#0000FF">入店客户数</font></td>
  <td  width="8%" ><font color="#0000FF">入店客户收设计费比例</font></td>
  </tr>
<%
	//实收设计费
	int zjkhsl=0;
	double zjsjf=0;
	double zjsjhtje=0;
	long zjfwmj=0;

	int zjrdkhs=0;
	//入店客户数


	int row=0;

	String getfgsbh=null;
	String fgsmc=null;

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

		
		//实收设计费
		int xjkhsl=0;
		double xjsjf=0;
		double xjsjhtje=0;
		long xjfwmj=0;

		//入店客户数
		int xjrdkhs=0;
		
		String getdwbh=null;
		String dmmc=null;
		String cxbz="";
		String kdsj="";
		String gdsj="";

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
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			getdwbh=rs1.getString("dwbh");
			dmmc=rs1.getString("dwmc");
			cxbz=rs1.getString("cxbz");
			kdsj=cf.fillNull(rs1.getDate("kdsj"));
			gdsj=cf.fillNull(rs1.getDate("gdsj"));

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
			double sjf=0;
			double sjhtje=0;
			long fwmj=0;
			ls_sql =" SELECT count(distinct cw_khfkjl.khbh) khsl,sum(cw_khfkjl.fkje) sjf,sum(sjhtje) sjhtje,sum(fwmj) fwmj";
			ls_sql+=" FROM cw_khfkjl,crm_zxkhxx";
			ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh";

			ls_sql+=" and cw_khfkjl.scbz='N' ";
			ls_sql+=" and cw_khfkjl.fklxbm in('53')";//53：设计费
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";

			ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				khsl=rs.getInt("khsl");
				sjf=rs.getDouble("sjf");
				sjhtje=rs.getDouble("sjhtje");
				fwmj=rs.getLong("fwmj");
			}
			rs.close();
			ps.close();
			

			xjkhsl+=khsl;
			xjsjf+=sjf;
			xjsjhtje+=sjhtje;
			xjfwmj+=fwmj;

			zjkhsl+=khsl;
			zjsjf+=sjf;
			zjsjhtje+=sjhtje;
			zjfwmj+=fwmj;

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
			ls_sql+=" where crm_zxkhxx.zxdm='"+getdwbh+"'";
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
			zjrdkhs+=rdkhs;

			//入店客户收设计费比例
			double rdsjfbl=0;
			if (rdkhs==0)
			{
				rdsjfbl=0;
			}
			else{
				rdsjfbl=cf.round(khsl*100.0/rdkhs,2);
			}
			

			
			//撤店无数据不显示
			if (   cxbz.equals("N") || (khsl+rdkhs!=0)   )
			{
				row++;

				%>
				<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					<td align="center"><%=row%></td>
					<td align="center"><%=dmmc%></td>

					<td>
						<A HREF="ViewDmsjfMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank"><%=khsl%></A>			
					</td>
					<td><%=cf.formatDouble(sjf)%></td>
					<td><%=cf.formatDouble(sjhtje)%></td>
					

					<td><%=fwmj%></td>
					<td><%=pmjj%></td>

					<td><%=pjde%></td>
					
					<td>
						<A HREF="ViewDmRdkhMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank"><%=rdkhs%></A>			
					</td>
					<td><%=rdsjfbl%>%</td>
				</tr>
				<%	
			}
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
			<td align="center" colspan="2"><B>[<%=fgsmc%>]小计</B></td>

			<td><B><%=xjkhsl%></B></td>
			<td><B><%=cf.formatDouble(xjsjf)%></B></td>
			<td><B><%=cf.formatDouble(xjsjhtje)%></B></td>
			

			<td><B><%=xjfwmj%></B></td>
			<td><B><%=pmjj%></B></td>
			<td><B><%=pjde%></B></td>
			
			<td><B><%=xjrdkhs%></B></td>
			<td><B><%=rdsjfbl%>%</B></td>
		</tr>
		<%
	}
	rs2.close();
	ps2.close();

	int pmjj=0;
	int pjde=0;

	if (zjfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(zjsjhtje/zjfwmj);
	}
	if (zjkhsl==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(zjsjf/zjkhsl);
	}

	//入店客户收设计费比例
	double rdsjfbl=0;
	if (zjrdkhs==0)
	{
		rdsjfbl=0;
	}
	else{
		rdsjfbl=cf.round(zjkhsl*100.0/zjrdkhs,2);
	}
%>
<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td align="center" colspan="2"><B>总 计</B></td>

	<td><B><%=zjkhsl%></B></td>
	<td><B><%=cf.formatDouble(zjsjf)%></B></td>
	<td><B><%=cf.formatDouble(zjsjhtje)%></B></td>
	

	<td><B><%=zjfwmj%></B></td>
	<td><B><%=pmjj%></B></td>
	<td><B><%=pjde%></B></td>
	
	<td><B><%=zjrdkhs%></B></td>
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