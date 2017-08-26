<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='170203'");
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
  <B>店面业绩统计</B><BR>
  <b>(时间范围：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="220%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="2%" rowspan="2" >&nbsp;</td>
  <td  width="6%" rowspan="2" >分公司</td>
  <td  width="6%" rowspan="2" >店面</td>

  <td  width="3%" rowspan="2" ><font color="#FF0000">客流</font></td>

  <td colspan="5" >设计费</td>
  <td colspan="5" >个性化</td>
  <td colspan="5" >套餐</td>
  <td colspan="3" >合计</td>
  </tr>
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="3%" >数量</td>
  <td  width="6%" >实际完成</td>
  <td  width="6%" >公司计划</td>
  <td  width="3%" >完成比率</td>
  <td  width="4%" >客单价</td>

  <td  width="3%" >数量</td>
  <td  width="6%" >实际完成</td>
  <td  width="6%" >公司计划</td>
  <td  width="3%" >完成比率</td>
  <td  width="4%" >客单价</td>

  <td  width="3%" >数量</td>
  <td  width="6%" >实际完成</td>
  <td  width="6%" >公司计划</td>
  <td  width="4%" >完成比率</td>
  <td  width="4%" >客单价</td>


  <td  width="6%" >合计</td>
  <td  width="6%" >总任务</td>
  <td  width="4%" >总完成比率</td>
  </tr>
<%
	int xjrdkhs=0;
	int xjsssjfkhs=0;
	double xjsssjf=0;

	double xjdjsjh=0;
	double xjsjfjh=0;
	double xjgxhjh=0;
	double xjtcjh=0;
	double xjzcjh=0;
	double xjzjh=0;

	int xjgxhkhs=0;
	double xjgxhje=0;

	int xjtckhs=0;
	double xjtcje=0;


	int row=0;

	String fgsmc=null;
	String getdwbh=null;
	String dmmc=null;
	String cxbz="";
	String kdsj="";
	String gdsj="";

	ls_sql =" SELECT b.dwmc fgsmc,sq_dwxx.dwbh,sq_dwxx.dwmc,sq_dwxx.kdsj,sq_dwxx.gdsj,sq_dwxx.cxbz ";
	ls_sql+=" FROM sq_dwxx,sq_dwxx b";
	ls_sql+=" where  sq_dwxx.ssfgs=b.dwbh(+) and sq_dwxx.dwlx='F2' and sq_dwxx.cxbz='N'";
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
	ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>SYSDATE)";
	ls_sql+=" order by sq_dwxx.ssfgs,sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
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



		//客流
		int rdkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxdm='"+getdwbh+"'";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rdkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		
		xjrdkhs+=rdkhs;


		//部门业绩考核
		int djsjh=0;
		double sjfjh=0;
		double gxhjh=0;
		double tcjh=0;
		double zcjh=0;
		double zjh=0;
		ls_sql =" SELECT djsjh,sjfjh,gxhjh,tcjh,zcjh,zjh ";
		ls_sql+=" FROM cw_jrbmyjkh ";
		ls_sql+=" where dwbh='"+getdwbh+"'";
		ls_sql+=" order by khzq desc";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			djsjh=rs1.getInt("djsjh");
			sjfjh=rs1.getDouble("sjfjh");
			gxhjh=rs1.getDouble("gxhjh");
			tcjh=rs1.getDouble("tcjh");
			zcjh=rs1.getDouble("zcjh");
			zjh=rs1.getDouble("zjh");
		}
		rs1.close();
		ps1.close();

		xjdjsjh+=djsjh;
		xjsjfjh+=sjfjh;
		xjgxhjh+=gxhjh;
		xjtcjh+=tcjh;
		xjzcjh+=zcjh;
		xjzjh+=zjh;
		
		
		//实收设计费
		int sssjfkhs=0;
		double sssjf=0;
		ls_sql =" SELECT count(distinct cw_khfkjl.khbh) sssjfkhs,sum(fkje) sssjf ";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where dwbh='"+getdwbh+"' and fklxbm='53' and scbz='N'";
		ls_sql+=" and fkje>0 and zffs!='31'";//11:现金；12：支票；13：存折；14：银行卡；15：银行转帐；16：现金券；31：转出；99：其它
		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sssjfkhs=rs1.getInt("sssjfkhs");
			sssjf=rs1.getDouble("sssjf");
		}
		rs1.close();
		ps1.close();
		
		//退设计费
		int tsjfkhs=0;
		double tsjf=0;
		ls_sql =" SELECT count(*) tsjfkhs,sum(fkje) tsjf ";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where dwbh='"+getdwbh+"' and fklxbm='53' and scbz='N'";
		ls_sql+=" and fkje<0 and zffs!='31'";//11:现金；12：支票；13：存折；14：银行卡；15：银行转帐；16：现金券；31：转出；99：其它
		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tsjfkhs=rs1.getInt("tsjfkhs");
			tsjf=rs1.getDouble("tsjf");
		}
		rs1.close();
		ps1.close();

		sssjfkhs=sssjfkhs-tsjfkhs;
		sssjf=sssjf-tsjf;

		xjsssjfkhs+=sssjfkhs;
		xjsssjf+=sssjf;

		
		//设计-客单价
		int sjpjde=0;
		if (sssjfkhs==0)
		{
			sjpjde=0;
		}
		else{
			sjpjde=(int)(sssjf/sssjfkhs);
		}
		
		//设计-完成比率
		double sjfwcbl=0;
		if (sjfjh==0)
		{
			sjfwcbl=0;
		}
		else{
			sjfwcbl=(int)(sssjf*100.0/sjfjh);
		}

		//个性化
		int gxhkhs=0;
		double gxhje=0;
		ls_sql =" SELECT count(*),sum(qye)";
		ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
		ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
		ls_sql+=" and bdm_bjjbbm.lx='1' ";
		ls_sql+=" and crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			gxhkhs=rs1.getInt(1);
			gxhje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();
		
		//个性化退单
		int tdgxhkhs=0;
		double tdgxhje=0;
		ls_sql=" SELECT count(*),sum(qye)";
		ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
		ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
		ls_sql+=" and bdm_bjjbbm.lx='1' ";
		ls_sql+=" and crm_khxx.zt='3'";//3：退单客户
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and yjjzsj is not null ";//首次付家装款时间
		ls_sql+=" and crm_khxx.yjjzsj is not null ";//首次付家装款时间
		ls_sql+=" and crm_khxx.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tdgxhkhs=rs1.getInt(1);
			tdgxhje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		gxhkhs=gxhkhs-tdgxhkhs;
		gxhje=gxhje-tdgxhje;

		xjgxhkhs+=gxhkhs;
		xjgxhje+=gxhje;

		
		//个性化-客单价
		int gxhpjde=0;
		if (gxhkhs==0)
		{
			gxhpjde=0;
		}
		else{
			gxhpjde=(int)(gxhje/gxhkhs);
		}
		
		//个性化-完成比率
		double gxhwcbl=0;
		if (gxhjh==0)
		{
			gxhwcbl=0;
		}
		else{
			gxhwcbl=(int)(gxhje*100.0/gxhjh);
		}



		//套餐
		int tckhs=0;
		double tcje=0;
		ls_sql =" SELECT count(*),sum(qye)";
		ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
		ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
		ls_sql+=" and bdm_bjjbbm.lx='2' ";
		ls_sql+=" and crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tckhs=rs1.getInt(1);
			tcje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();
		
		//套餐退单
		int tdtckhs=0;
		double tdtcje=0;
		ls_sql=" SELECT count(*),sum(qye)";
		ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
		ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";
		ls_sql+=" and bdm_bjjbbm.lx='2' ";
		ls_sql+=" and crm_khxx.zt='3'";//3：退单客户
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and yjjzsj is not null ";//首次付家装款时间
		ls_sql+=" and crm_khxx.yjjzsj is not null ";//首次付家装款时间
		ls_sql+=" and crm_khxx.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tdtckhs=rs1.getInt(1);
			tdtcje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		tckhs=tckhs-tdtckhs;
		tcje=tcje-tdtcje;

		xjtckhs+=tckhs;
		xjtcje+=tcje;
		
		//套餐-客单价
		int tcpjde=0;
		if (tckhs==0)
		{
			tcpjde=0;
		}
		else{
			tcpjde=(int)(tcje/tckhs);
		}
		
		//个性化-完成比率
		double tcwcbl=0;
		if (tcjh==0)
		{
			tcwcbl=0;
		}
		else{
			tcwcbl=(int)(tcje*100.0/tcjh);
		}
		
		//总完成比率
		double zwcbl=0;
		if (zjh==0)
		{
			zwcbl=0;
		}
		else{
			zwcbl=(int)((sssjf+gxhje+tcje)*100.0/zjh);
		}


//		if (   cxbz.equals("N") || (qys+sssjfkhs+tsjfkhs+rdkhs+bjkhs!=0)   )
		{
			row++;

			%>
			<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				<td align="center"><%=row%></td>
				<td align="center"><%=fgsmc%></td>
				<td align="center"><%=dmmc%></td>

				<td>
					<A HREF="ViewDmRdkhMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank"><%=rdkhs%></A>				
				</td>
				<td>
					<A HREF="ViewDmSssjfMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank"><%=sssjfkhs%></A>				
				</td>
				<td><%=cf.formatDouble((int)sssjf)%></td>
				<td><%=cf.formatDouble(sjfjh)%></td>
				<td><%=sjfwcbl%>%</td>
				<td><%=cf.formatDouble(sjpjde)%></td>

				<td>
					<A HREF="ViewDmGxhMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank"><%=gxhkhs%></A>				
				</td>
				<td><%=cf.formatDouble((int)gxhje)%></td>
				<td><%=cf.formatDouble(gxhjh)%></td>
				<td><%=gxhwcbl%>%</td>
				<td><%=cf.formatDouble(gxhpjde)%></td>

				<td>
					<A HREF="ViewDmTcMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank"><%=tckhs%></A>				
				</td>
				<td><%=cf.formatDouble((int)tcje)%></td>
				<td><%=cf.formatDouble(tcjh)%></td>
				<td><%=tcwcbl%>%</td>
				<td><%=cf.formatDouble(tcpjde)%></td>

				<td><%=cf.formatDouble((int)(sssjf+gxhje+tcje))%></td>
				<td><%=cf.formatDouble(zjh)%></td>
				<td><%=zwcbl%>%</td>
			</tr>
			<%	
		}
	}
	rs.close();
	ps.close();


	//设计-客单价
	int sjpjde=0;
	if (xjsssjfkhs==0)
	{
		sjpjde=0;
	}
	else{
		sjpjde=(int)(xjsssjf/xjsssjfkhs);
	}
	
	//设计-完成比率
	double sjfwcbl=0;
	if (xjsjfjh==0)
	{
		sjfwcbl=0;
	}
	else{
		sjfwcbl=(int)(xjsssjf*100.0/xjsjfjh);
	}
		
	//个性化-客单价
	int gxhpjde=0;
	if (xjgxhkhs==0)
	{
		gxhpjde=0;
	}
	else{
		gxhpjde=(int)(xjgxhje/xjgxhkhs);
	}
	
	//个性化-完成比率
	double gxhwcbl=0;
	if (xjgxhjh==0)
	{
		gxhwcbl=0;
	}
	else{
		gxhwcbl=(int)(xjgxhje*100.0/xjgxhjh);
	}
	
	//套餐-客单价
	int tcpjde=0;
	if (xjtckhs==0)
	{
		tcpjde=0;
	}
	else{
		tcpjde=(int)(xjtcje/xjtckhs);
	}
	
	//个性化-完成比率
	double tcwcbl=0;
	if (xjtcjh==0)
	{
		tcwcbl=0;
	}
	else{
		tcwcbl=(int)(xjtcje*100.0/xjtcjh);
	}
	
	//总完成比率
	double zwcbl=0;
	if (xjzjh==0)
	{
		zwcbl=0;
	}
	else{
		zwcbl=(int)((xjsssjf+xjgxhje+xjtcje)*100.0/xjzjh);
	}

%>
<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td align="center" colspan="3"><B>小 计</B></td>

	<td><B><%=xjrdkhs%></B></td>
	<td><B><%=xjsssjfkhs%></B></td>
	<td><B><%=cf.formatDouble(xjsssjf)%></B></td>
	<td><B><%=cf.formatDouble(xjsjfjh)%></B></td>
				<td><%=sjfwcbl%>%</td>
				<td><%=cf.formatDouble(sjpjde)%></td>
	<td><B><%=xjgxhkhs%></B></td>
	<td><B><%=cf.formatDouble(xjgxhje)%></B></td>
	<td><B><%=cf.formatDouble(xjgxhjh)%></B></td>
				<td><%=gxhwcbl%>%</td>
				<td><%=cf.formatDouble(gxhpjde)%></td>

				<td><%=xjtckhs%></td>
				<td><%=cf.formatDouble((int)xjtcje)%></td>
				<td><%=xjtcjh%></td>
				<td><%=tcwcbl%>%</td>
				<td><%=cf.formatDouble(tcpjde)%></td>

				<td><%=cf.formatDouble((int)(xjsssjf+xjgxhje+xjtcje))%></td>
				<td><%=xjzjh%></td>
				<td><%=zwcbl%>%</td>
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