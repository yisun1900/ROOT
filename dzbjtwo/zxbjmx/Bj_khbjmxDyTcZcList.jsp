<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<style>
@media print{
	INPUT {display:none}
}
.STYLE2 {font-size: 18px}
</style>

</head>


<%
String qydmbh=null;
String qydm=null;

String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

int row=0;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String jldwmc=null;
double dj=0;
double qye=0;
String gycl=null;
String flmcgg=null;
String bjbz=null;
double xjqye=0;
double zjqye=0;

String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
String clgw=null;
int fwmj=0;

String bjbbh=null;
String dqbm =null;
String hxbm =null;
String bjjbmc  =null;
String bjjbbm  =null;

try {
	conn=cf.getConnection();

	
	//检查：主材项目.必选项
	String jgwzbm =null;
	String clxlmc =null;
	String cuowu ="";
	ls_sql="SELECT jgwzbm,clxlmc";
	ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm";
    ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm(+) and bj_khzcxmxj.khbh='"+khbh+"' and bj_khzcxmxj.sfbxx='Y' and bj_khzcxmxj.sjsl=0";
	ls_sql+=" order by jgwzbm,bj_khzcxmxj.tcsjflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jgwzbm=rs.getString("jgwzbm");
		clxlmc=rs.getString("clxlmc");
		cuowu+="错误！『"+jgwzbm+"："+clxlmc+"』是必选项，没有选择主材\\n";
    }
    %>
	<SCRIPT language=javascript>
	//out.println("<BR>错误！『"+jgwzbm+"："+clxlmc+"』是必选项，没有选择主材");
	alert("主材清单检查错误！\r\n<%=cuowu%>")
	</SCRIPT>
	<%
   
	rs.close();
	ps.close();
	


	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,crm_zxkhxx.bjjb,bjjbmc,ssfgs,fwmj,bjbbh,hxbm,zxdm";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
	   
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		bjjbbm=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		qydmbh=cf.fillNull(rs.getString("zxdm"));
	}
	rs.close();
	ps.close();
	
	//查询签约店面
	ls_sql="SELECT dwmc from sq_dwxx";
    ls_sql+=" where dwbh='"+qydmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qydm=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();


	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillHtml(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	//套餐价格表（bj_tcjgb）
	int tcfwmj=0;
	double tcjg=0;
	double pmzjdj=0;
	double tlgbzjj=0;
	ls_sql="SELECT fwmj,tcjg,pmzjdj,tlgbzjj";
	ls_sql+=" FROM bj_tcjgb";
    ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and hxbm='"+hxbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcfwmj=rs.getInt("fwmj");
		tcjg=rs.getDouble("tcjg");
		pmzjdj=rs.getDouble("pmzjdj");
		tlgbzjj=rs.getDouble("tlgbzjj");
	}
	rs.close();
	ps.close();

	int mjzj=fwmj-tcfwmj;//面积增加
	double mjzjzj=pmzjdj*mjzj;//面积增加金额

	double zcsjcj=0;

	//主材升级差价
	String tcsjflbm =null;
	String tcsjflmc =null;
	String khbjjbbm =null;
	String getbjjbbm =null;
	double bzsl=0;
	double ccbfjj=0;
	double sjsl=0;
	double xjjsl=0;
	ls_sql="SELECT tcsjflmc,bj_khzcxmxj.tcsjflbm,bj_khzcxmxj.khbjjbbm,bjjbbm,bzsl,ccbfjj,sjsl,xjjsl";
	ls_sql+=" FROM bj_khzcxmxj,bj_tcsjflbm";
    ls_sql+=" where bj_khzcxmxj.tcsjflbm=bj_tcsjflbm.tcsjflbm and bj_khzcxmxj.khbjjbbm!=bj_khzcxmxj.bjjbbm";
    ls_sql+=" and bj_khzcxmxj.khbh='"+khbh+"' and bj_khzcxmxj.khbjjbbm!=bj_khzcxmxj.bjjbbm";
    ls_sql+=" and bj_khzcxmxj.sfyxsj='Y' ";//升级是否收费  Y：是；N：否
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcsjflmc=cf.fillNull(rs.getString("tcsjflmc"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		khbjjbbm=cf.fillNull(rs.getString("khbjjbbm"));
		getbjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		bzsl=rs.getDouble("bzsl");
		ccbfjj=rs.getDouble("ccbfjj");
		sjsl=rs.getDouble("sjsl");
		xjjsl=rs.getDouble("xjjsl");

		double sjcj=0;
		ls_sql="SELECT sjcj";
		ls_sql+=" FROM bj_tcsjcjb";
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+khbjjbbm+"' and bjjbbm1='"+getbjjbbm+"' and tcsjflbm='"+tcsjflbm+"'";
		ls_sql+=" and bjjbbm1>bjjbbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjcj=rs1.getDouble("sjcj");
		}
		else{
			out.println("错误！["+tcsjflmc+"]没有升级差价");
			return;
		}
		rs1.close();
		ps1.close();

		zcsjcj+=sjsl*sjcj;
		zcsjcj=cf.round(zcsjcj,2);
	}
	rs.close();
	ps.close();

	//主材超量加价
	double zccljj=0;
	ls_sql="SELECT sum(ROUND(xjjsl*ccbfjj,2))";
	ls_sql+=" FROM bj_khzcxmxj";
    ls_sql+=" where khbh='"+khbh+"' and sfxzsl='1'";//1：可增项；2：不可增项；3：不控制
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zccljj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//需收费主材
	double xsfzc=0;
	ls_sql="SELECT sum(jjje*sl)";
	ls_sql+=" FROM bj_khzcxm";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xsfzc=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//工程超量加价
	double gccljj=0;

	String sfxzsl =null;
//	double bzsl=0;
//	double ccbfjj=0;
	ls_sql="SELECT xmbh,bzsl,sfxzsl,ccbfjj";
	ls_sql+=" FROM bj_khgcxmxj";
    ls_sql+=" where khbh='"+khbh+"' and tcnxmbz='Y'";//套餐内项目标志
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		sfxzsl=rs.getString("sfxzsl");
		bzsl=rs.getDouble("bzsl");
		ccbfjj=rs.getDouble("ccbfjj");

		sjsl=0;
		ls_sql="SELECT sum(bj_gclmx.sl)";
		ls_sql+=" FROM bj_gclmx";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();


		xjjsl=0;//加价数量

		if (sfxzsl.equals("1"))//1：可增项；2：不可增项；3：不控制
		{
			if (sjsl>bzsl)
			{
				xjjsl=sjsl-bzsl;
			}
			else{
				xjjsl=0;
			}
		}
		else if (sfxzsl.equals("2"))//1：可增项；2：不可增项；3：不控制
		{
			if (sjsl>bzsl)
			{
//				out.println("<BR>错误！项目编号『"+xmbh+"』不可增项，[实际数量："+sjsl+"]超出[标准数量："+bzsl+"]");
			}
		}


		ls_sql="update bj_khgcxmxj set sjsl="+sjsl+",xjjsl="+xjjsl;
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		gccljj+=ccbfjj*xjjsl;
		gccljj=cf.round(gccljj,2);

	}
	rs.close();
	ps.close();

	//套餐外施工项造价
	double tcwgczj=0;

	//1：工程类（与其它收费项目相关）；2：工程类（与其它收费项目无关）；3：主材类
	ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" and (bj_bjxmmx.tcnxmbz='N' OR bj_bjxmmx.tcnxmbz is null)";//Y：是；N：否
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwgczj=rs.getDouble(1);
	}
	rs.close();
	ps.close();



	double tcze=0;
	tcze=tcjg+mjzjzj+zcsjcj+zccljj+xsfzc+gccljj+tcwgczj;
	tcze=cf.round(tcze,2);
  
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	double zhtcze=dzbj.getZhBzTCZj(conn,khbh,"yz");
	dzbj.updateTCSfxm(conn,khbh,"yz",tcze,zhtcze);
	
	
	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,fwmj";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
	}
	rs.close();
	ps.close();


	//dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//输入:  lx 9：检查全部；1：检查单价；2：检查名称；3：检查工艺材料简介；4：检查报价级别；5：检查必选项目；6：检查不存在项目；7：检查关联项目
	String retStr=dzbj.checkBjjb(conn,khbh,5);
	if (!retStr.equals("0"))
	{
		%>
		<SCRIPT language=javascript >
		<!--
		//	alert("电子报价检查错误！\r\n<%=retStr%>");
		//-->
		</SCRIPT>
		<%
	}

%>
<body >

<TABLE border="0" cellspacing="0" cellpadding="0" width="100%" cellspacing="0 style='FONT-SIZE: 14px'">

<THEAD bgcolor="#FFFFFF" style="display:table-header-group;font-weight:bold">
<tr><td>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="8" align="center" class="STYLE2" ><B>全装修套餐主材明细&nbsp;LWTC-02</B></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >客户姓名：<%=khxm%></td>
    <td colspan="3" >工程负责人：</td>
    <td width="27%" >设 计 师：<%=sjs%></td>
	<td width="21%" >制单日期：<%=cf.today()%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="12"  >客户地址：<%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >客户电话：<%=lxfs%></td>
    <td align="left" >竣工时间：</td>
	<td >建筑面积：<%=fwmj%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >签约店面：&nbsp;<%=qydm%></td>
    <td align="left" >材料顾问：&nbsp;</td>
	<td >套餐级别：&nbsp;</td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td  width="6%" align="center">空间</td>
    <td  width="10%" align="center">产品类别</td>
    <td  width="10%" align="center">品牌</td>
    <td  width="10%" align="center">型号</td>
	<td  width="10%" align="center">规格</td>
    <td  width="8%" align="center">单位</td>
    <td  width="8%" align="center">数量（实际）</td>
    <td  width="25%" align="center">配套产品说明</td>
    <td  width="8%" align="center">级别</td>
  </tr>

	
<%
	int i=0;
	String tccplbbm=null;
	String tccplbmc=null;
	String oldjgwzmc="";
	ls_sql="SELECT distinct bj_khzcxmxj.jgwzbm ";
	ls_sql+=" FROM bj_khzcxmxj ";
    ls_sql+=" where bj_khzcxmxj.khbh='"+khbh+"'";
	ls_sql+=" order by bj_khzcxmxj.jgwzbm ";
//	out.println(ls_sql);
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		jgwzmc=rs2.getString("jgwzbm");


		//房间内[产品类别]数量
		int cplbsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzcxmxj";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cplbsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//房间内[有主材项目的产品类别]数量
		int zccplbsl=0;
		ls_sql="SELECT count(distinct tccplbbm)";
		ls_sql+=" FROM bj_khzcxm";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zccplbsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//房间内[主材项目]数量
		int fjxmsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzcxm,jxc_clxlbm";
		ls_sql+=" where bj_khzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and bj_khzcxm.khbh='"+khbh+"' and bj_khzcxm.jgwzbm='"+jgwzmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fjxmsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		int hbsl=0;//第一行应合并数量
		if (fjxmsl==0)//整个房间无主材项目
		{
			hbsl=cplbsl;
		}
		else{
			hbsl=(cplbsl-zccplbsl)+fjxmsl;
		}

		if (fjxmsl==0)//整个房间无主材项目
		{
			//房间内[产品类别]
			ls_sql="SELECT distinct bj_khzcxmxj.tccplbbm,clxlmc";
			ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm ";
			ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm(+) ";
			ls_sql+=" and bj_khzcxmxj.khbh='"+khbh+"'";
			ls_sql+=" and bj_khzcxmxj.jgwzbm='"+jgwzmc+"'";
			ls_sql+=" order by bj_khzcxmxj.tccplbbm";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				tccplbbm=rs1.getString("tccplbbm");
				tccplbmc=rs1.getString("clxlmc");

				if (!oldjgwzmc.equals(jgwzmc))//房间第一行
				{
					oldjgwzmc=jgwzmc;

					%> 
					  <tr bgcolor="#FFFFFF"> 
						<td align="center" rowspan="<%=hbsl%>"><%=jgwzmc%></td>
						<td align="center"><%=tccplbmc%></td>
						<td colspan="7">未选择任何主材</td>
					  </tr>
					<%
				}
				else{
					%> 
					  <tr bgcolor="#FFFFFF"> 
						<td align="center"><%=tccplbmc%></td>
						<td colspan="7">未选择任何主材</td>
					  </tr>
					<%
				}
			}
			rs1.close();
			ps1.close();

		}
		else{//整个房间有主材项目
			//房间内[产品类别]
			ls_sql="SELECT distinct bj_khzcxmxj.tccplbbm,clxlmc";
			ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm ";
			ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm(+) ";
			ls_sql+=" and bj_khzcxmxj.khbh='"+khbh+"'";
			ls_sql+=" and bj_khzcxmxj.jgwzbm='"+jgwzmc+"'";
			ls_sql+=" order by bj_khzcxmxj.tccplbbm";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				tccplbbm=rs1.getString("tccplbbm");
				tccplbmc=rs1.getString("clxlmc");

			
				//类别内[主材项目]数量
				int lbzcsl=0;
				ls_sql="SELECT count(*)";
				ls_sql+=" FROM bj_khzcxm";
				ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzmc+"' and tccplbbm='"+tccplbbm+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					lbzcsl=rs.getInt(1);
				}
				rs.close();
				ps.close();

				if (lbzcsl==0)//类别内[主材项目]未选择
				{
					if (!oldjgwzmc.equals(jgwzmc))//房间第一行
					{
						oldjgwzmc=jgwzmc;

						%> 
						  <tr bgcolor="#FFFFFF"> 
							<td align="center" rowspan="<%=hbsl%>"><%=jgwzmc%></td>
							<td align="center"><%=tccplbmc%></td>
							<td colspan="7">未选择任何主材</td>
						  </tr>
						<%
					}
					else{
						%> 
						  <tr bgcolor="#FFFFFF"> 
							<td align="center"><%=tccplbmc%></td>
							<td colspan="7">未选择任何主材</td>
						  </tr>
						<%
					}
				}
				else{//类别内[主材项目]选择
					//输出项目明细
					String ppmc=null;
					String xh=null;
					String gg=null;
					String jldw=null;
					double sl=0;
					String ptcpsm=null;
					ls_sql="SELECT ppmc,xh,gg,jldw,sl,ptcpsm,bjjbmc";
					ls_sql+=" FROM bj_khzcxm,bdm_bjjbbm";
					ls_sql+=" where bj_khzcxm.bjjbbm=bdm_bjjbbm.bjjbbm";
					ls_sql+=" and bj_khzcxm.khbh='"+khbh+"' and bj_khzcxm.jgwzbm='"+jgwzmc+"' and bj_khzcxm.tccplbbm='"+tccplbbm+"'";
					ls_sql+=" order by xh";
				//	out.println(ls_sql);
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					while (rs.next())
					{
						ppmc=rs.getString("ppmc");
						xh=cf.fillHtml(rs.getString("xh"));
						gg=cf.fillHtml(rs.getString("gg"));
						jldw=rs.getString("jldw");
						sl=rs.getDouble("sl");
						ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
						bjjbmc=rs.getString("bjjbmc");

						row++;

						if (!oldjgwzmc.equals(jgwzmc))//开始新房间
						{
							oldjgwzmc=jgwzmc;

							//输出每行数据
							%> 
							  <tr bgcolor="#FFFFFF"> 
								<td align="center" rowspan="<%=hbsl%>"><%=jgwzmc%></td>
								<td align="center"><%=tccplbmc%></td>
								<td align="center"><%=ppmc%></td>
								<td align="center"><%=xh%></td>
								<td align="center"><%=gg%></td>
								<td align="center"><%=jldw%></td>
								<td align="center"><%=cf.formatDouble(sl)%></td>
								<td align="left" ><%=ptcpsm%></td>
								<td align="center"><%=bjjbmc%></td>
							  </tr>
							<%
						}
						else{
							//输出每行数据
							%> 
							  <tr bgcolor="#FFFFFF"> 
								<td align="center"><%=tccplbmc%></td>
								<td align="center"><%=ppmc%></td>
								<td align="center"><%=xh%></td>
								<td align="center"><%=gg%></td>
								<td align="center"><%=jldw%></td>
								<td align="center"><%=cf.formatDouble(sl)%></td>
								<td align="left" ><%=ptcpsm%></td>
								<td align="center"><%=bjjbmc%></td>
							  </tr>
							<%
						}
					}
					rs.close();
					ps.close();
				}
			}
			rs1.close();
			ps1.close();
		}
	}
	rs2.close();
	ps2.close();
%> 
  		

</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">客户签字：            </td>
    <td colspan="2" height="42">设计师签字：</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">日期：</td>
    <td colspan="2" height="42">日期：</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">材料员签字：</td>
    <td colspan="2" height="42">店面经理签字：</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">日期：</td>
    <td colspan="2" height="42">日期：</td>
  </tr>
</table>

</td></tr>
</TBODY>

</table>


</body>
</html>

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






