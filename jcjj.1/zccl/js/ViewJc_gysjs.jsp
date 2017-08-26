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
	ls_sql+=" from  jc_gysjs";
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
	<td  width="5%">报价级别</td>
	<td  width="5%">户型</td>
    <td  width="7%">订单号</td>
    <td  width="5%">订货时间</td>
    <td  width="5%">送货时间</td>
    <td  width="8%">材料名称</td>
    <td  width="8%">规格</td>
    <td  width="7%">型号</td>
    <td  width="4%">单位</td>
    <td  width="5%">订货数量</td>
    <td  width="5%">客户价</td>
    <td  width="5%">结算价</td>
    <td  width="7%">材料总价</td>
    <td  width="6%">远程费+其它费</td>
    <td  width="10%">备注</td>
  </tr>
  <%

	String dwmc=null;
	String khbh=null;
	String khxm=null;
	int row=0;
	double zjsl=0;
	double zjzjhsl=0;
	double zjje=0;
	double zjycf=0;
	double zjqtfy=0;
	double zjcxhdje=0;
	double zjxjdj=0;
	

	double qtycf=0;
	double zjqtycf=0;

	ls_sql =" select khbh,khxm,sum(qtycf) qtycf";
    ls_sql+=" from ";
    ls_sql+=" ( ";

	ls_sql+=" select jc_zcdd.khbh,khxm,sum(NVL(jc_zcdd.qtycf,0)) qtycf";
	ls_sql+=" from jc_gysjsmx,jc_zcdd,crm_khxx";
	ls_sql+=" where jc_gysjsmx.ddbh=jc_zcdd.ddbh ";
	ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh" ;
	ls_sql+=" and jc_gysjsmx.jsjlh="+jsjlh;
    ls_sql+=" group by jc_zcdd.khbh,khxm";

    ls_sql+=" UNION ALL ";

	ls_sql+=" select jc_zczjx.khbh,khxm,0 qtycf";
	ls_sql+=" from jc_gysjsmx,jc_zczjx,crm_khxx";
	ls_sql+=" where jc_gysjsmx.ddbh=jc_zczjx.zjxbh ";
	ls_sql+=" and jc_zczjx.khbh=crm_khxx.khbh" ;
	ls_sql+=" and jc_gysjsmx.jsjlh="+jsjlh;
    ls_sql+=" group by jc_zczjx.khbh,khxm";

    ls_sql+=" ) ";

    ls_sql+=" group by khbh,khxm";
	ls_sql+=" order by khxm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		khbh=cf.fillNull(rs1.getString("khbh"));
		khxm=cf.fillNull(rs1.getString("khxm"));
		qtycf=rs1.getDouble("qtycf");


		ls_sql=" select dwmc";
		ls_sql+=" from crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			dwmc=cf.fillNull(rs.getString("dwmc"));
		}
		rs.close();
		ps.close();
		
		
		zjqtycf+=qtycf;

		String qtycfStr="&nbsp;";
		if (qtycf!=0)
		{
			qtycfStr="<font color=\"#990000\">套餐远程费:"+qtycf+"</font>";
		}


		int count=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM ( ";
		
		ls_sql+=" SELECT jc_zcdd.ddbh,jc_zcdd.qhtsj,jc_zcdd.sshsj,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.bjjb,crm_khxx.hxbm,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zcddmx.sl,jc_zcddmx.cbj,ROUND(NVL(jc_zcddmx.cbj*jc_zcddmx.sl,0),2) je,NVL(jc_zcddmx.ycf,0) ycf,NVL(jc_zcddmx.qtfyje,0) qtfy,cxhdbl||'%' cxhdbl,NVL(jc_zcddmx.cxhdje,0) cxhdje,jc_zcddmx.bz";
		ls_sql+=" FROM jc_zcddmx,jc_zcdd,crm_khxx,jc_gysjsmx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh" ;
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh" ;
		ls_sql+=" AND jc_zcddmx.lx='1' ";//1：合同项；2：增项
		ls_sql+=" and jc_gysjsmx.ddbh=jc_zcdd.ddbh ";
		ls_sql+=" and jc_gysjsmx.jsjlh="+jsjlh;
		ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";

		ls_sql+=" UNION ALL ";

		ls_sql+=" SELECT jc_zczjx.zjxbh ddbh,jc_zczjx.zjxfssj qhtsj,jc_zczjx.sshsj,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.bjjb,crm_khxx.hxbm,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zczjxmx.zjsl sl,jc_zcddmx.cbj,ROUND(NVL(jc_zcddmx.cbj*jc_zczjxmx.zjsl,0),2) je,NVL(jc_zczjxmx.zjycf,0) ycf,NVL(jc_zczjxmx.zjqtfy,0) qtfy,cxhdbl||'%' cxhdbl,jc_zczjxmx.zjcxhdje cxhdje,jc_zcddmx.bz";

		ls_sql+=" FROM jc_zcddmx,jc_zczjx,jc_zczjxmx,crm_khxx,jc_gysjsmx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zczjx.ddbh and jc_zczjx.zjxbh=jc_zczjxmx.zjxbh and jc_zcddmx.xh=jc_zczjxmx.xh" ;
		ls_sql+=" and jc_zczjx.khbh=crm_khxx.khbh" ;
		ls_sql+=" and jc_gysjsmx.ddbh=jc_zczjx.zjxbh ";
		ls_sql+=" and jc_gysjsmx.jsjlh="+jsjlh;
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


		String dwbh=null;
		String fwdz=null;
		String bjjb=null;
		String hxbm=null;
		String lx=null;
		String zcpzwzbm=null;
		String zcmc=null;
		String gg=null;
		String xinghao=null;
		String jldwbm=null;
		double sl=0;
		double zjhsl=0;
		double dj=0;
		double cbj=0;
		double je=0;
		double ycf=0;
		double qtfy=0;
		String cxhdbl=null;
		double cxhdje=0;
		String bz=null;

		double xjsl=0;
		double xjzjhsl=0;
		double xjdj=0;
		double xjcbj=0;
		double xjje=0;
		double xjycf=0;
		double xjqtfy=0;
		double xjcxhdje=0;
		String qhtsj=null;
		String sshsj=null;
		String getddbh=null;


		ls_sql=" SELECT dwbh,ddbh,qhtsj,sshsj,khxm,fwdz,bjjb,hxbm,zcmc,gg,xinghao,jldwbm,sl,dj,cbj,je,ycf,qtfy,cxhdbl,cxhdje,bz";
		ls_sql+=" FROM ( ";
		
		ls_sql+=" SELECT jc_zcdd.ddbh,jc_zcdd.qhtsj,jc_zcdd.sshsj,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.bjjb,crm_khxx.hxbm,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zcddmx.sl,ROUND(NVL(jc_zcddmx.sl*jc_zcddmx.dj,0),2) dj,jc_zcddmx.cbj,ROUND(NVL(jc_zcddmx.cbj*jc_zcddmx.sl,0),2) je,NVL(jc_zcddmx.ycf,0) ycf,NVL(jc_zcddmx.qtfyje,0) qtfy,cxhdbl||'%' cxhdbl,NVL(jc_zcddmx.cxhdje,0) cxhdje,jc_zcddmx.bz";
		ls_sql+=" FROM jc_zcddmx,jc_zcdd,crm_khxx,jc_gysjsmx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh" ;
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh" ;
		ls_sql+=" AND jc_zcddmx.lx='1' ";//1：合同项；2：增项
		ls_sql+=" and jc_gysjsmx.ddbh=jc_zcdd.ddbh ";
		ls_sql+=" and jc_gysjsmx.jsjlh="+jsjlh;
		ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";

		ls_sql+=" UNION ALL ";

		ls_sql+=" SELECT jc_zczjx.zjxbh ddbh,jc_zczjx.zjxfssj qhtsj,jc_zczjx.sshsj,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.bjjb,crm_khxx.hxbm,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zczjxmx.zjsl sl,ROUND(NVL(jc_zcddmx.sl*jc_zcddmx.dj,0),2) dj,jc_zcddmx.cbj,ROUND(NVL(jc_zcddmx.cbj*jc_zczjxmx.zjsl,0),2) je,NVL(jc_zczjxmx.zjycf,0) ycf,NVL(jc_zczjxmx.zjqtfy,0) qtfy,cxhdbl||'%' cxhdbl,jc_zczjxmx.zjcxhdje cxhdje,jc_zcddmx.bz";

		ls_sql+=" FROM jc_zcddmx,jc_zczjx,jc_zczjxmx,crm_khxx,jc_gysjsmx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zczjx.ddbh and jc_zczjx.zjxbh=jc_zczjxmx.zjxbh and jc_zcddmx.xh=jc_zczjxmx.xh" ;
		ls_sql+=" and jc_zczjx.khbh=crm_khxx.khbh" ;
		ls_sql+=" and jc_gysjsmx.ddbh=jc_zczjx.zjxbh ";
		ls_sql+=" and jc_gysjsmx.jsjlh="+jsjlh;
		ls_sql+=" and jc_zczjx.khbh='"+khbh+"'";

		ls_sql+=" ) ";

		ls_sql+=" order by ddbh,dwbh,xinghao";
		
		
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			dwbh=cf.fillHtml(rs.getString("dwbh"));
			getddbh=cf.fillHtml(rs.getString("ddbh"));
			qhtsj=cf.fillHtml(rs.getDate("qhtsj"));
			sshsj=cf.fillHtml(rs.getDate("sshsj"));
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillHtml(rs.getString("fwdz"));
			zcmc=cf.fillHtml(rs.getString("zcmc"));
			gg=cf.fillHtml(rs.getString("gg"));
			xinghao=cf.fillHtml(rs.getString("xinghao"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			sl=rs.getDouble("sl");
			dj=rs.getDouble("dj");
			cbj=rs.getDouble("cbj");
			je=rs.getDouble("je");
			ycf=rs.getDouble("ycf");
			qtfy=rs.getDouble("qtfy");
			cxhdbl=cf.fillHtml(rs.getString("cxhdbl"));
			cxhdje=rs.getDouble("cxhdje");
			bz=cf.fillHtml(rs.getString("bz"));
			bjjb=cf.fillNull(rs.getString("bjjb"));
			hxbm=cf.fillHtml(rs.getString("hxbm"));

			ls_sql=" select bjjbmc";
			ls_sql+=" from bdm_bjjbbm";
			ls_sql+=" where bjjbbm='"+bjjb+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			if (rs2.next())
			{
				bjjb=cf.fillNull(rs2.getString(1));
			}
			rs2.close();
			ps2.close();

			ls_sql=" select hxmc";
			ls_sql+=" from dm_hxbm";
			ls_sql+=" where hxbm='"+hxbm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			if (rs2.next())
			{
				hxbm=cf.fillNull(rs2.getString(1));
			}
			rs2.close();
			ps2.close();

			String ddlx="";
			ls_sql=" select '('||DECODE(jc_zcdd.ddlx,'1','代销品','3','补录合同','4','有库存订单','5','标准套餐','6','家具健康套餐','7','温暖静音套餐','8','窗帘套餐','9','代购主材','A','顶配升级','B','顶配独立收费','C','选配主材','D','套餐外主材')||')' ";
			ls_sql+=" from jc_zcdd";
			ls_sql+=" where ddbh='"+getddbh+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			if (rs2.next())
			{
				ddlx=cf.fillNull(rs2.getString(1));
			}
			rs2.close();
			ps2.close();

			xjsl+=sl;
			xjdj+=dj;
			xjcbj+=cbj;
			xjje+=je;
			xjycf+=ycf;
			xjqtfy+=qtfy;
			xjcxhdje+=cxhdje;
					

			row++;

			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td rowspan="<%=count%>"><%=khxm%>(<%=dwmc%>)</td>
				<td  rowspan="<%=count%>"><%=fwdz%></td>
				<td  rowspan="<%=count%>"><%=bjjb%></td>
				<td  rowspan="<%=count%>"><%=hxbm%></td>
				<td ><%=getddbh%><%=ddlx%></td>
				<td ><%=qhtsj%></td>
				<td ><%=sshsj%></td>
				<td ><%=zcmc%></td>
				<td ><%=gg%></td>
				<td ><%=xinghao%></td>
				<td ><%=jldwbm%></td>
				<td ><%=sl%></td>
				<td ><%=dj%></td>
				<td ><%=cbj%></td>
				<td ><%=je%></td>
				<td ><%=cf.round(ycf+qtfy,2)%></td>
				<td ><%=bz%></td>
			  </tr>
			  <%
		}

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
			dj=rs.getDouble("dj");
			cbj=rs.getDouble("cbj");
			je=rs.getDouble("je");
			ycf=rs.getDouble("ycf");
			qtfy=rs.getDouble("qtfy");
			cxhdbl=cf.fillHtml(rs.getString("cxhdbl"));
			cxhdje=rs.getDouble("cxhdje");
			bz=cf.fillHtml(rs.getString("bz"));
			bjjb=cf.fillHtml(rs.getString("bjjb"));
			hxbm=cf.fillHtml(rs.getString("hxbm"));

			String ddlx="";
			ls_sql=" select '('||DECODE(jc_zcdd.ddlx,'1','代销品','3','补录合同','4','有库存订单','5','标准套餐','6','家具健康套餐','7','温暖静音套餐','8','窗帘套餐','9','代购主材','A','顶配升级','B','顶配独立收费','C','选配主材','D','套餐外主材')||')' ";
			ls_sql+=" from jc_zcdd";
			ls_sql+=" where ddbh='"+getddbh+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			if (rs2.next())
			{
				ddlx=cf.fillNull(rs2.getString(1));
			}
			rs2.close();
			ps2.close();

			xjsl+=sl;
			xjdj+=dj;
			xjcbj+=cbj;
			xjje+=je;
			xjycf+=ycf;
			xjqtfy+=qtfy;
			xjcxhdje+=cxhdje;
			
			row++;

			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td ><%=getddbh%><%=ddlx%></td>
				<td ><%=qhtsj%></td>
				<td ><%=sshsj%></td>
				<td ><%=zcmc%></td>
				<td ><%=gg%></td>
				<td ><%=xinghao%></td>
				<td ><%=jldwbm%></td>
				<td ><%=sl%></td>
				<td ><%=dj%></td>
				<td ><%=cbj%></td>
				<td ><%=je%></td>
				<td ><%=cf.round(ycf+qtfy,2)%></td>
				<td ><%=bz%></td>
			  </tr>
			  <%
		}
		rs.close();
		ps.close();
		
		xjycf+=qtycf;

		zjsl+=xjsl;
		zjje+=xjje;
		zjycf+=xjycf;
		zjqtfy+=xjqtfy;
		zjcxhdje+=xjcxhdje;
		zjxjdj+=xjdj;
		
		
		%> 
		  <tr bgcolor="#E8E8FF"  align="center" height="22"> 
			<td colspan="11"><font size="2"><b>[<%=khxm%>]小计</b></font></td>
			<td><%=cf.formatDouble(xjsl)%></td>
			<td><%=cf.formatDouble(xjdj)%></td>
			<td><%=cf.formatDouble(xjcbj)%></td>
			<td><%=cf.formatDouble(xjje)%></td>
			<td ><%=cf.round(xjycf+xjqtfy,2)%></td>
			<td><%=qtycfStr%></td>
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
            <td colspan="11"><font size="3"><b>套餐总计：<%=cf.formatDouble(zjje+zjycf+zjqtfy)%></b></font></td>
		    <td >&nbsp;</td>
			<td ><%=cf.formatDouble(zjxjdj)%></td>
			<td >&nbsp;</td>
		    <td ><%=cf.formatDouble(zjje)%></td>
		    <td ><%
			if("175".equals(jsjlh))
			out.print("0");
			else
			out.print(cf.formatDouble(zjycf+zjqtfy));%></td>
		    <td><%=qtycfStr%></td>
  </tr>
		  <tr bgcolor="#E8E8FF"  align="center"  >
            <td colspan="10"><font size="3"><b>扣除费用</b></font></td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		    <td colspan="2"><%=cf.formatDouble(kcfy)%></td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
  </tr>
	  <tr bgcolor="#E8E8FF"  align="center"  > 
		<td colspan="10"><font size="3"><b>应结算金额</b></font></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td colspan="2"><%=cf.formatDouble(zjje+zjycf+zjqtfy-kcfy)%></td>
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
    <td height="40" colspan="5">备注：请核对以上对账明细，如没有问题，请签字确认，近期内携带上述金额发票来松下亿达领取支票。（发票抬头：松下亿达）</td>
  </tr>
</table>
</body>
</html>

