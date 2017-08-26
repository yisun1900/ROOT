<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String shr=null;
String shsj=null;
String gys=null;
String ppbm=null;
String jssj=null;
String jsr=null;
double cbzj=0;
double ycfzj=0;
double qtfzj=0;
double kcfy=0;
double jsje=0;
String jssm=null;
try {
	conn=cf.getConnection();

	ls_sql="select gys,ppbm,jssj,jsr,cbzj,ycfzj,qtfzj,kcfy,jsje,jssm,shr,shsj ";
	ls_sql+=" from  jc_fcgysjs";
	ls_sql+=" where  (jsjlh="+jsjlh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gys=cf.fillNull(rs.getString("gys"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		jsr=cf.fillNull(rs.getString("jsr"));
		cbzj=rs.getDouble("cbzj");
		ycfzj=rs.getDouble("ycfzj");
		qtfzj=rs.getDouble("qtfzj");
		kcfy=rs.getDouble("kcfy");
		jsje=rs.getDouble("jsje");
		jssm=cf.fillNull(rs.getString("jssm"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
	}
	rs.close();
	ps.close();
%>


<CENTER >
  <B><font size="3">松下亿达套餐产品商户结算单</font></B>
</CENTER>

<div align="center">厂商结算（供应商：<%=gys%>、品牌：<%=ppbm%>）</div> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="5%">客户姓名</td>
    <td  width="6%">地址</td>
    <td  width="7%">订单号</td>
    <td  width="7%">订货时间</td>
    <td  width="7%">送货时间</td>
    <td  width="7%">材料名称</td>
    <td  width="8%">规格</td>
    <td  width="8%">型号</td>
    <td  width="4%">单位</td>
    <td  width="5%">订货数量</td>
    <td  width="5%">单价</td>
    <td  width="7%">材料总价</td>
    <td  width="6%">远程费+其它费</td>
    <td  width="5%">结算比例</td>
	<td  width="5%">折前单价</td>
	<td  width="5%">销售总价</td>
	<td  width="15%">备注</td>

  </tr>
  <%

	String dwmc=null;
	String khbh=null;
	String khxm=null;
	String bjjbmc=null;
	String hxmc=null;
	int row=0;
	double zjsl=0;
	double zjzjhsl=0;
	double zjje=0;
	double zjycf=0;
	double zjqtfy=0;
	double zjcxhdje=0;
	double xjzjje=0;
	double qtycf=0;
	double zjqtycf=0;
	double zjxjxszj=0;
	double xszjje=0;

	ls_sql =" select khbh,khxm,dwmc,bjjbmc,hxmc,sum(qtycf) qtycf";
    ls_sql+=" from ";
    ls_sql+=" ( ";

	ls_sql+=" select jc_zcdd.khbh,khxm,dwmc,bjjbmc,hxmc,sum(NVL(jc_zcdd.qtycf,0)) qtycf";
	ls_sql+=" from jc_fcgysjsmx,jc_zcdd,crm_khxx,sq_dwxx,bdm_bjjbbm,dm_hxbm";
	ls_sql+=" where jc_fcgysjsmx.ddbh=jc_zcdd.ddbh ";
	ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh" ;
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)" ;
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)" ;
	ls_sql+=" and crm_khxx.hxbm=dm_hxbm.hxbm(+)" ;
	ls_sql+=" and jc_fcgysjsmx.jsjlh="+jsjlh;
    ls_sql+=" group by jc_zcdd.khbh,khxm,dwmc,bjjbmc,hxmc";

    ls_sql+=" UNION ALL ";

	ls_sql+=" select jc_zczjx.khbh,khxm,dwmc,bjjbmc,hxmc,0 qtycf";
	ls_sql+=" from jc_fcgysjsmx,jc_zczjx,crm_khxx,sq_dwxx,bdm_bjjbbm,dm_hxbm";
	ls_sql+=" where jc_fcgysjsmx.ddbh=jc_zczjx.zjxbh ";
	ls_sql+=" and jc_zczjx.khbh=crm_khxx.khbh" ;
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)" ;
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)" ;
	ls_sql+=" and crm_khxx.hxbm=dm_hxbm.hxbm(+)" ;
	ls_sql+=" and jc_fcgysjsmx.jsjlh="+jsjlh;
    ls_sql+=" group by jc_zczjx.khbh,khxm,dwmc,bjjbmc,hxmc";

    ls_sql+=" ) ";

    ls_sql+=" group by khbh,khxm,dwmc,bjjbmc,hxmc";
	ls_sql+=" order by khxm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		khbh=cf.fillNull(rs1.getString("khbh"));
		khxm=cf.fillNull(rs1.getString("khxm"));
		dwmc=cf.fillNull(rs1.getString("dwmc"));
		bjjbmc=cf.fillNull(rs1.getString("bjjbmc"));
		hxmc=cf.fillNull(rs1.getString("hxmc"));
		qtycf=rs1.getDouble("qtycf");

		zjqtycf+=qtycf;

		String qtycfStr="&nbsp;";
		if (qtycf!=0)
		{
			qtycfStr="<font color=\"#990000\">套餐远程费:"+qtycf+"</font>";
		}


		int count=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM ( ";
		
		ls_sql+=" SELECT jc_zcdd.ddbh,jc_zcdd.qhtsj,jc_zcdd.sshsj,crm_khxx.khxm,crm_khxx.fwdz,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zcddmx.sl,jc_zcddmx.cbj,ROUND(NVL(jc_zcddmx.cbj*jc_zcddmx.sl,0),2) je,NVL(jc_zcddmx.ycf,0) ycf,NVL(jc_zcddmx.qtfyje,0) qtfy,cxhdbl||'%' cxhdbl,NVL(jc_zcddmx.cxhdje,0) cxhdje,jc_zcddmx.bz";
		ls_sql+=" FROM jc_zcddmx,jc_zcdd,crm_khxx,jc_fcgysjsmx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh" ;
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh" ;
		ls_sql+=" AND jc_zcddmx.lx='1' ";//1：合同项；2：增项
		ls_sql+=" and jc_fcgysjsmx.ddbh=jc_zcdd.ddbh ";
		ls_sql+=" and jc_fcgysjsmx.jsjlh="+jsjlh;
		ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";

		ls_sql+=" UNION ALL ";

		ls_sql+=" SELECT jc_zczjx.zjxbh ddbh,jc_zczjx.zjxfssj qhtsj,jc_zczjx.sshsj,crm_khxx.khxm,crm_khxx.fwdz,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zczjxmx.zjsl sl,jc_zcddmx.cbj,ROUND(NVL(jc_zcddmx.cbj*jc_zczjxmx.zjsl,0),2) je,NVL(jc_zczjxmx.zjycf,0) ycf,NVL(jc_zczjxmx.zjqtfy,0) qtfy,cxhdbl||'%' cxhdbl,jc_zczjxmx.zjcxhdje cxhdje,jc_zcddmx.bz";

		ls_sql+=" FROM jc_zcddmx,jc_zczjx,jc_zczjxmx,crm_khxx,jc_fcgysjsmx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zczjx.ddbh and jc_zczjx.zjxbh=jc_zczjxmx.zjxbh and jc_zcddmx.xh=jc_zczjxmx.xh" ;
		ls_sql+=" and jc_zczjx.khbh=crm_khxx.khbh" ;
		ls_sql+=" and jc_fcgysjsmx.ddbh=jc_zczjx.zjxbh ";
		ls_sql+=" and jc_fcgysjsmx.jsjlh="+jsjlh;
		ls_sql+=" and jc_zczjx.khbh='"+khbh+"'";


		ls_sql+=" ) ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		
		ls_sql=" SELECT count(distinct jsbl) ";
		ls_sql+=" FROM ( ";
		
		ls_sql+=" SELECT jc_zcddmx.jsbl";
		ls_sql+=" FROM jc_zcddmx,jc_zcdd,crm_khxx,jc_fcgysjsmx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh" ;
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh" ;
		ls_sql+=" AND jc_zcddmx.lx='1' ";//1：合同项；2：增项
		ls_sql+=" and jc_fcgysjsmx.ddbh=jc_zcdd.ddbh ";
		ls_sql+=" and jc_fcgysjsmx.jsjlh="+jsjlh;
		ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";

		ls_sql+=" UNION ALL ";

		ls_sql+=" SELECT jc_zcddmx.jsbl";

		ls_sql+=" FROM jc_zcddmx,jc_zczjx,jc_zczjxmx,crm_khxx,jc_fcgysjsmx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zczjx.ddbh and jc_zczjx.zjxbh=jc_zczjxmx.zjxbh and jc_zcddmx.xh=jc_zczjxmx.xh" ;
		ls_sql+=" and jc_zczjx.khbh=crm_khxx.khbh" ;
		ls_sql+=" and jc_fcgysjsmx.ddbh=jc_zczjx.zjxbh ";
		ls_sql+=" and jc_fcgysjsmx.jsjlh="+jsjlh;
		ls_sql+=" and jc_zczjx.khbh='"+khbh+"'";

		ls_sql+=" ) ";

		ls_sql+=" order by jsbl desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count+=rs.getInt(1);
		}
		rs.close();
		ps.close();

		String dwbh=null;
		String fwdz=null;
		String lx=null;
		String zcpzwzbm=null;
		String zcmc=null;
		String gg=null;
		String xinghao=null;
		String jldwbm=null;
		double sl=0;
		double zjhsl=0;
		String cbj=null;
		double jsbl=0;
		double je=0;
		double ycf=0;
		double qtfy=0;
		String cxhdbl=null;
		double cxhdje=0;
		String bz=null;

		double xjsl=0;
		double xjzjhsl=0;
		double xjje=0;
		double xjycf=0;
		double xjqtfy=0;
		double xjcxhdje=0;
		String qhtsj=null;
		String sshsj=null;
		String getddbh=null;
		double zqdj=0;
		double xjzqdj=0;
		double xszj=0;
		double xjxszj=0;
		

		row=0;

		
		ls_sql=" SELECT distinct jsbl ";
		ls_sql+=" FROM ( ";
		
		ls_sql+=" SELECT jc_zcddmx.jsbl";
		ls_sql+=" FROM jc_zcddmx,jc_zcdd,crm_khxx,jc_fcgysjsmx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh" ;
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh" ;
		ls_sql+=" AND jc_zcddmx.lx='1' ";//1：合同项；2：增项
		ls_sql+=" and jc_fcgysjsmx.ddbh=jc_zcdd.ddbh ";
		ls_sql+=" and jc_fcgysjsmx.jsjlh="+jsjlh;
		ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";

		ls_sql+=" UNION ALL ";

		ls_sql+=" SELECT jc_zcddmx.jsbl";

		ls_sql+=" FROM jc_zcddmx,jc_zczjx,jc_zczjxmx,crm_khxx,jc_fcgysjsmx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zczjx.ddbh and jc_zczjx.zjxbh=jc_zczjxmx.zjxbh and jc_zcddmx.xh=jc_zczjxmx.xh" ;
		ls_sql+=" and jc_zczjx.khbh=crm_khxx.khbh" ;
		ls_sql+=" and jc_fcgysjsmx.ddbh=jc_zczjx.zjxbh ";
		ls_sql+=" and jc_fcgysjsmx.jsjlh="+jsjlh;
		ls_sql+=" and jc_zczjx.khbh='"+khbh+"'";

		ls_sql+=" ) ";

		ls_sql+=" order by jsbl desc";
		
		
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		zjje=0;
		zjxjxszj=0;
		while (rs2.next())
		{
			
			 xjje=0;
			 xjxszj=0;
			 
			jsbl=rs2.getDouble("jsbl");


			ls_sql=" SELECT dwbh,ddbh,qhtsj,sshsj,khxm,fwdz,zcmc,gg,xinghao,jldwbm,sl,cbj,jsbl,je,ycf,qtfy,cxhdbl,cxhdje,zqdj,xszj,bz";
			ls_sql+=" FROM ( ";
			
			ls_sql+=" SELECT jc_zcdd.ddbh,jc_zcdd.qhtsj,jc_zcdd.sshsj,crm_khxx.khxm,crm_khxx.fwdz,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zcddmx.sl,jc_zcddmx.cbj,jc_zcddmx.jsbl,ROUND(NVL(jc_zcddmx.cbj*jc_zcddmx.sl,0),2) je,NVL(jc_zcddmx.ycf,0) ycf,NVL(jc_zcddmx.qtfyje,0) qtfy,cxhdbl||'%' cxhdbl,NVL(jc_zcddmx.cxhdje,0) cxhdje,jc_zcddmx.zqdj,ROUND(NVL(jc_zcddmx.dj*jc_zcddmx.sl,0),2) xszj,jc_zcddmx.bz";
			ls_sql+=" FROM jc_zcddmx,jc_zcdd,crm_khxx,jc_fcgysjsmx";
			ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh" ;
			ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh" ;
			ls_sql+=" AND jc_zcddmx.lx='1' ";//1：合同项；2：增项
			ls_sql+=" and jc_fcgysjsmx.ddbh=jc_zcdd.ddbh ";
			ls_sql+=" and jc_fcgysjsmx.jsjlh="+jsjlh;
			ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";
			ls_sql+=" and jc_zcddmx.jsbl="+jsbl;

			ls_sql+=" UNION ALL ";

			ls_sql+=" SELECT jc_zczjx.zjxbh ddbh,jc_zczjx.zjxfssj qhtsj,jc_zczjx.sshsj,crm_khxx.khxm,crm_khxx.fwdz,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zczjxmx.zjsl sl,jc_zcddmx.cbj,jc_zcddmx.jsbl,ROUND(NVL(jc_zcddmx.cbj*jc_zczjxmx.zjsl,0),2) je,NVL(jc_zczjxmx.zjycf,0) ycf,NVL(jc_zczjxmx.zjqtfy,0) qtfy,cxhdbl||'%' cxhdbl,jc_zczjxmx.zjcxhdje cxhdje,jc_zcddmx.zqdj,ROUND(NVL(jc_zcddmx.dj*jc_zcddmx.sl,0),2) xszj,jc_zcddmx.bz";

			ls_sql+=" FROM jc_zcddmx,jc_zczjx,jc_zczjxmx,crm_khxx,jc_fcgysjsmx";
			ls_sql+=" where jc_zcddmx.ddbh=jc_zczjx.ddbh and jc_zczjx.zjxbh=jc_zczjxmx.zjxbh and jc_zcddmx.xh=jc_zczjxmx.xh" ;
			ls_sql+=" and jc_zczjx.khbh=crm_khxx.khbh" ;
			ls_sql+=" and jc_fcgysjsmx.ddbh=jc_zczjx.zjxbh ";
			ls_sql+=" and jc_fcgysjsmx.jsjlh="+jsjlh;
			ls_sql+=" and jc_zczjx.khbh='"+khbh+"'";
			ls_sql+=" and jc_zcddmx.jsbl="+jsbl;

			ls_sql+=" ) ";

			ls_sql+=" order by ddbh,dwbh,xinghao";
			
			
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				
				dwbh=cf.fillHtml(rs.getString("dwbh"));
				getddbh=cf.fillHtml(rs.getString("ddbh"));
				qhtsj=cf.fillHtml(rs.getDate("qhtsj"));
				sshsj=cf.fillHtml(rs.getDate("sshsj"));
				khxm=cf.fillHtml(rs.getString("khxm"));
				fwdz=cf.fillHtml(rs.getString("fwdz"));
				zcmc=cf.fillHtml(rs.getString("zcmc"));
				gg=cf.fillHtml(rs.getString("gg"));
				xinghao=cf.fillHtml(rs.getString("xinghao"));
				jldwbm=cf.fillHtml(rs.getString("jldwbm"));
				sl=rs.getDouble("sl");
				jsbl=rs.getDouble("jsbl");
				cbj=cf.fillHtml(rs.getString("cbj"));
				je=rs.getDouble("je");
				ycf=rs.getDouble("ycf");
				qtfy=rs.getDouble("qtfy");
				cxhdbl=cf.fillHtml(rs.getString("cxhdbl"));
				cxhdje=rs.getDouble("cxhdje");
				bz=cf.fillHtml(rs.getString("bz"));
				zqdj=rs.getDouble("zqdj");
				xszj=rs.getDouble("xszj");

				xjsl+=sl;
				xjje+=je;
				xjycf+=ycf;
				xjqtfy+=qtfy;
				xjcxhdje+=cxhdje;
				xjzqdj+=zqdj;
				xjxszj+=xszj;
				
								
				row++;

				if (row==1)
				{
					%> 
					  <tr bgcolor="#FFFFFF"  align="center"> 
						<td rowspan="<%=count%>"><%=khxm%>(<%=dwmc%>、<%=bjjbmc%>、<%=hxmc%>)</td>
						<td  rowspan="<%=count%>"><%=fwdz%></td>
						<td ><%=getddbh%></td>
						<td ><%=qhtsj%></td>
						<td ><%=sshsj%></td>
						<td ><%=zcmc%></td>
						<td ><%=gg%></td>
						<td ><%=xinghao%></td>
						<td ><%=jldwbm%></td>
						<td ><%=sl%></td>
						<td ><%=cbj%></td>
						<td ><%=je%></td>
						<td ><%=cf.round(ycf+qtfy,2)%></td>
						<td ><%=jsbl%></td>
						<td ><%=zqdj%></td>
						<td ><%=cf.round(xszj,2)%></td>
						<td ><%=bz%></td>
					  </tr>
					  <%
				}
				else{
					%> 
					  <tr bgcolor="#FFFFFF"  align="center"> 
						<td ><%=getddbh%></td>
						<td ><%=qhtsj%></td>
						<td ><%=sshsj%></td>
						<td ><%=zcmc%></td>
						<td ><%=gg%></td>
						<td ><%=xinghao%></td>
						<td ><%=jldwbm%></td>
						<td ><%=sl%></td>
						<td ><%=cbj%></td>
						<td ><%=je%></td>
						<td ><%=cf.round(ycf+qtfy,2)%></td>
						<td ><%=jsbl%></td>
						<td ><%=zqdj%></td>
						<td ><%=cf.round(xszj,2)%></td>
						<td ><%=bz%></td>
					  </tr>
					  <%
				}
				

			}
			rs.close();
			ps.close();

			zjje+=xjje;
			zjxjxszj+=xjxszj;
			%> 
			  <tr bgcolor="#E8E8FF"  align="center"> 
				<td colspan="2">结算比例[<%=jsbl%>]小计</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><%=cf.formatDouble(xjje)%></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><%=cf.round(xjxszj,2)%></td>
				<td>&nbsp;</td>

			  </tr>
			  <%
		}
		rs2.close();
		ps2.close();
		xjycf+=qtycf;
		zjsl+=xjsl;
		
		zjycf+=xjycf;
		zjqtfy+=xjqtfy;
		zjcxhdje+=xjcxhdje;
		xjzjje+=zjje;
		xszjje+=zjxjxszj;
		
		%> 
		  <tr bgcolor="#E8E8FF"  align="center" height="22"> 
			<td colspan="9"><font size="2"><b>[<%=khxm%>]小计</b></font></td>
			<td><%=cf.formatDouble(xjsl)%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(zjje)%></td>
			<td ><%=cf.round(xjycf+xjqtfy,2)%></td>
			<td><%=qtycfStr%></td>
			<td>&nbsp;</td>
			<td><%=zjxjxszj%></td>
			<td>&nbsp;</td>
		  </tr>
		  <%
	}
	rs1.close();
	ps1.close();

	String qtycfStr="&nbsp;";
	if (zjqtycf!=0)
	{
		qtycfStr="<font color=\"#990000\" ><B>含套餐远程费:"+zjqtycf+"</B></font>";
	}
	
	%> 
		  <tr bgcolor="#E8E8FF"  align="center"  >
            <td colspan="8"><font size="3"><b>套餐总计：<%=cf.formatDouble(xjzjje+zjycf+zjqtfy)%></b></font></td>
		    <td colspan="3">&nbsp;</td>
		    <td ><%=cf.formatDouble(xjzjje)%></td>
		    <td ><%
			if("175".equals(jsjlh))
			out.print("0");
			else
			out.print(cf.formatDouble(zjycf+zjqtfy));%></td>
		    <td><%=qtycfStr%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xszjje)%></td>
			<td>&nbsp;</td>
  </tr>
		  <tr bgcolor="#E8E8FF"  align="center"  >
            <td colspan="8"><font size="3"><b>扣除费用</b></font></td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		    <td colspan="2"><%=cf.formatDouble(kcfy)%></td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
  </tr>
	  <tr bgcolor="#E8E8FF"  align="center"  > 
		<td colspan="8"><font size="3"><b>应结算金额</b></font></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td colspan="2"><%=cf.formatDouble(xjzjje+zjycf+zjqtfy-kcfy)%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	  </tr>
	  <%

}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
</table>

<P>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
  <tr>
    <td>结算说明:<%=jssm%></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="20%">&nbsp;</td>
  </tr>
  <tr>
    <td width="27%">审核人：<%=shr%></td>
    <td width="27%">松下亿达核算人：</td>
    <td width="24%">采购审核：</td>
    <td colspan="2">厂商确认：</td>
  </tr>
  <tr>
    <td>日期：<%=shsj%></td>
    <td height="25">日期：</td>
    <td>日期：</td>
    <td colspan="2">日期：</td>
  </tr>
  <tr>
    <td height="40" colspan="5">备注：请核对以上对账明细，如有问题，请签字确认，近期内携带上述金额发票来松下亿达领取支票。（发票抬头：松下亿达）</td>
  </tr>
</table>
</body>
</html>

