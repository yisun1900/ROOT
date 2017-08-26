<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String zjxxh=request.getParameter("zjxxh");
String khbh=request.getParameter("khbh");

String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwmc=null;
String clgw=null;
String sgdmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String clxlmc=null;
String ppmc=null;
String bjjbmc=null;
String bjjbbm=null;
String xh=null;
String gg=null;
double dj=0;
String jldw=null;
double sl=0;
double je=0;
String ptcpsm=null;
String zclx=null;
String ddcljjfs=null;
String jgwzbm=null;
String tccplbbm=null;

double allsl=0;
double allje=0;
	String bjjb=null;

try {
	conn=cf.getConnection();


	ls_sql="SELECT hth,khxm,lxfs,fwdz,sjs,crm_khxx.bjjb,bjjbmc,sgdmc,dwmc,clgw";
	ls_sql+=" FROM crm_khxx,bdm_bjjbbm,sq_sgd,sq_dwxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		bjjb=rs.getString("bjjb");
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		clgw=cf.fillHtml(rs.getString("clgw"));
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<style type="text/css">
<!--
.STYLE2 {font-size: 18px}
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
  <table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#FFFFFF">
      <td height="29" colspan="3" align="center" class="STYLE2" ><B>快捷套餐主材变更单</B></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="37%" height="30"  >客户姓名：<%=khxm%></td>
      <td width="40%"   >客户电话：<%=lxfs%></td>
      <td width="23%" >合同号：<%=hth%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="31"  >客户地址：<%=fwdz%></td>
      <td  >签约店面/设计师：<%=dwmc%>/<%=sjs%></td>
      <td  >报价级别：<%=bjjbmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="29"  >施工队：<%=sgdmc%></td>
      <td  >材料顾问：<%=clgw%></td>
      <td  >&nbsp;</td>
    </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">产品类别</td>
	<td  width="4%">品牌</td>
	<td  width="2%">报价级别</td>
	<td  width="4%">型号</td>
	<td  width="4%">规格</td>
	<td  width="2%">计量单位</td>
	<td  width="2%">数量</td>
	<td  width="2%">单价</td>
	<td  width="3%">金额</td>
	<td  width="8%">配套产品说明</td>
</tr>
<%

		//客户折扣
	double zcsjzk=10;
	double zcjmzk=10;
	double zcsfzk=10;
	ls_sql="select zcsjzk,zcjmzk,zcsfzk ";
	ls_sql+=" from crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsjzk=rs.getDouble("zcsjzk");
		zcjmzk=rs.getDouble("zcjmzk");
		zcsfzk=rs.getDouble("zcsfzk");
	}
	rs.close();
	ps.close();

	//需收费主材
	dzbj.Tc tc=new dzbj.Tc();
	double xsfzc=0;
	xsfzc=tc.getXsfzcZjx(conn,zjxxh,khbh,"yz");//获取:需收费主材


	ls_sql="SELECT jxc_clxlbm.clxlmc,bj_zjxzcbgqd.ppmc,bj_zjxzcbgqd.bjjbbm,bdm_bjjbbm.bjjbmc,bj_zjxzcbgqd.xh,bj_zjxzcbgqd.gg,bj_zjxzcbgqd.dj,bj_zjxzcbgqd.jldw,bj_zjxzcbgqd.sl,ROUND(bj_zjxzcbgqd.dj*bj_zjxzcbgqd.sl,2) je,bj_zjxzcbgqd.ptcpsm";
	ls_sql+=" ,bj_zjxzcbgqd.zclx,bj_zjxzcbgqd.ddcljjfs,bj_zjxzcbgqd.jgwzbm,bj_zjxzcbgqd.tccplbbm ";
	ls_sql+=" FROM bdm_bjjbbm,bj_zjxzcbgqd,jxc_clxlbm  ";
	ls_sql+=" where bj_zjxzcbgqd.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_zjxzcbgqd.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and bj_zjxzcbgqd.khbh='"+khbh+"' and bj_zjxzcbgqd.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_zjxzcbgqd.tclx='1'";//1：套餐；2：主材套餐
	ls_sql+=" order by bj_zjxzcbgqd.ppmc,bj_zjxzcbgqd.xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		clxlmc=cf.fillHtml(rs.getString("clxlmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		dj=rs.getDouble("dj");
		jldw=cf.fillNull(rs.getString("jldw"));
		sl=rs.getDouble("sl");
		je=rs.getDouble("je");
		ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
		zclx=cf.fillNull(rs.getString("zclx"));
		ddcljjfs=cf.fillNull(rs.getString("ddcljjfs"));
		jgwzbm=cf.fillNull(rs.getString("jgwzbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));

		//发生减项，按折后减除
		if (xsfzc<0)
		{
			dj=cf.round(dj*zcsfzk/10,2);
			je=cf.round(je*zcsfzk/10,2);
		}


		if (zclx.equals("1") || zclx.equals("2"))//1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
		{
			if (!bjjbbm.equals(bjjb))//发生升降级
			{

				double sjcjQ=0;
				String bjjbbmQ="";
				double sjsfjeQ=0;
				ls_sql="SELECT sjcj,bjjbbm,sjsfje";
				ls_sql+=" FROM bj_khzcxmxjq ";
				ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
				ls_sql+=" and sfyxsj='Y' ";//升级是否收费  Y：是；N：否
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					sjcjQ=rs1.getDouble("sjcj");
					bjjbbmQ=cf.fillNull(rs1.getString("bjjbbm"));
					sjsfjeQ=rs1.getDouble("sjsfje");
				}
				rs1.close();
				ps1.close();

				double sjcjH=0;
				String bjjbbmH="";
				double sjsfjeH=0;
				ls_sql="SELECT sjcj,bjjbbm,sjsfje";
				ls_sql+=" FROM bj_khzcxmxjh ";
				ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
				ls_sql+=" and sfyxsj='Y' ";//升级是否收费  Y：是；N：否
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					sjcjH=rs1.getDouble("sjcj");
					bjjbbmH=cf.fillNull(rs1.getString("bjjbbm"));
					sjsfjeH=rs1.getDouble("sjsfje");
				}
				rs1.close();
				ps1.close();

				double sjcj=0;
				if (!bjjbbmQ.equals(bjjbbmH))//级别发生变化，需收费
				{
					if (sl<0)//减项:把优惠折扣减初,增减不优惠
					{
						//是否品牌升级优惠
						int isPpsjcj=0;
						ls_sql="SELECT count(*)";
						ls_sql+=" FROM bj_khppsjcjb";
						ls_sql+=" where ppmc='"+ppmc+"' and khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
						ps1= conn.prepareStatement(ls_sql);
						rs1 =ps1.executeQuery();
						if (rs1.next())
						{
							isPpsjcj=rs1.getInt(1);
						}
						rs1.close();
						ps1.close();

						if (isPpsjcj>0)//做报价时，有此品牌升级优惠
						{
							ls_sql="SELECT sjcj";
							ls_sql+=" FROM bj_khppsjcjb";
							ls_sql+=" where ppmc='"+ppmc+"' and khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
							ps1= conn.prepareStatement(ls_sql);
							rs1 =ps1.executeQuery();
							if (rs1.next())
							{
								sjcj=rs1.getDouble("sjcj");
							}
							rs1.close();
							ps1.close();
						}
						else{
							sjcj=sjcjQ;
						}

						sjcj=cf.round(sjcj*zcsjzk/10,2);//减项打折
					}
					else{
						sjcj=sjcjH;
					}
				}
					

				dj+=sjcj;//包含需收费主材价格
				dj=cf.round(dj,2);

				je=cf.round(dj*sl,2);
			}
		}
		
		
		
		allsl+=sl;
		allje+=je;
		allsl=cf.round(allsl,2);
		allje=cf.round(allje,2);

		if (zclx.equals("3") || zclx.equals("4"))//1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
		{
			if (ddcljjfs.equals("1") || ddcljjfs.equals("2"))//0：非顶配材料；1：顶配（补差价）；2：顶配（独立计价）；3：套餐选配
			{
				bjjbmc="顶配升级";
			}
			else{
				bjjbmc="选配";
			}
		}

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=clxlmc%></td>
			<td><%=ppmc%></td>
			<td><%=bjjbmc%></td>
			<td><%=xh%></td>
			<td><%=gg%></td>
			<td><%=jldw%></td>
			<td><%=sl%></td>
			<td><%=dj%></td>
			<td><%=je%></td>
			<td><%=ptcpsm%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
<tr bgcolor="#FFFFFF"  align="center">
	<td>小计</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=allsl%></td>
	<td>&nbsp;</td>
	<td><%=allje%></td>
	<td>&nbsp;</td>
</tr>
</table>

<%
	double alljmjeq=0;	
	ls_sql="SELECT sum(sjjmje)";
	ls_sql+=" FROM bj_khzcxmxjq ";
    ls_sql+=" where zjxxh='"+zjxxh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		alljmjeq=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double alljmjeh=0;	
	ls_sql="SELECT sum(sjjmje)";
	ls_sql+=" FROM bj_khzcxmxjh ";
    ls_sql+=" where zjxxh='"+zjxxh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		alljmjeh=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double sjjmslBgq=0;
	double sjjmjeBgq=0;
	double sjjmslBgh=0;
	double sjjmjeBgh=0;

	if (alljmjeh!=alljmjeq)
	{
		%>
		<center>变更前减免清单</center>
		<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="8%">空间</td>
			<td  width="12%">产品类别</td>
			<td  width="8%">是否限制数量</td>
			<td  width="8%">计量单位</td>
			<td  width="8%">标准数量</td>
			<td  width="8%">减免计量单位</td>
			<td  width="8%">减免单价</td>
			<td  width="8%">减免数量</td>
			<td  width="8%">减免金额</td>

		  </tr>
		<%
			String jgwzmc=null;
			String tccplbmc=null;
		//	String jldw=null;
			String sfxzsl=null;
			double bzsl=0;
			String jmjldw=null;
			double jmdj=0;
			double sjjmsl=0;
			double sjjmje=0;


			ls_sql="SELECT jgwzbm,clxlmc,DECODE(bj_khzcxmxjq.sfxzsl,'1','超量需加价','2','不可超量','3','无数量限制') sfxzsl,jldw,jmjldw,bzsl,jmdj,sjjmsl,sjjmje";
			ls_sql+=" FROM bj_khzcxmxjq,jxc_clxlbm ";
			ls_sql+=" where bj_khzcxmxjq.tccplbbm=jxc_clxlbm.clxlbm";
			ls_sql+=" and bj_khzcxmxjq.zjxxh='"+zjxxh+"' ";
			ls_sql+=" and bj_khzcxmxjq.sjjmsl>0";
			ls_sql+=" order by bj_khzcxmxjq.jgwzbm,bj_khzcxmxjq.tccplbbm";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				jgwzmc=rs.getString("jgwzbm");
				tccplbmc=rs.getString("clxlmc");
				sfxzsl=rs.getString("sfxzsl");
				jldw=rs.getString("jldw");
				jmjldw=rs.getString("jmjldw");


				bzsl=rs.getDouble("bzsl");
				jmdj=rs.getDouble("jmdj");
				sjjmsl=rs.getDouble("sjjmsl");

				sjjmje=rs.getDouble("sjjmje");


				sjjmslBgq+=sjjmsl;
				sjjmjeBgq+=sjjmje;
				
				sjjmslBgq=cf.round(sjjmslBgq,2);
				sjjmjeBgq=cf.round(sjjmjeBgq,2);
				

				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF"  align="center"> 
					<td ><%=jgwzmc%></td>
				
					<td><%=tccplbmc%></td>
					<td><%=sfxzsl%></td>
					<td><%=jldw%></td>
					<td><%=bzsl%></td>
					<td><%=jmjldw%></td>
					<td><%=cf.formatDouble(jmdj*zcjmzk/10)%></td>
					<td><%=cf.formatDouble(sjjmsl)%></td>
					<td><%=cf.formatDouble(sjjmje*zcjmzk/10)%></td>
				  </tr>
				  
			
				<%
			}
			rs.close();
			ps.close();
		%> 
				
		  <tr bgcolor="#FFFFFF"  align="center"> 
			<td colspan="2">合计</td>

			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(sjjmslBgq)%></td>
			<td><%=cf.formatDouble(sjjmjeBgq*zcjmzk/10)%></td>
		   </tr>

		</table>



		<center>变更后减免清单</center>
		<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="8%">空间</td>
			<td  width="12%">产品类别</td>
			<td  width="8%">是否限制数量</td>
			<td  width="8%">计量单位</td>
			<td  width="8%">标准数量</td>
			<td  width="8%">减免计量单位</td>
			<td  width="8%">减免单价</td>
			<td  width="8%">减免数量</td>
			<td  width="8%">减免金额</td>
		  </tr>

			
		<%

			ls_sql="SELECT jgwzbm,clxlmc,DECODE(bj_khzcxmxjh.sfxzsl,'1','超量需加价','2','不可超量','3','无数量限制') sfxzsl,jldw,jmjldw,bzsl,jmdj,sjjmsl,sjjmje";
			ls_sql+=" FROM bj_khzcxmxjh,jxc_clxlbm ";
			ls_sql+=" where bj_khzcxmxjh.tccplbbm=jxc_clxlbm.clxlbm";
			ls_sql+=" and bj_khzcxmxjh.zjxxh='"+zjxxh+"' ";
			ls_sql+=" and bj_khzcxmxjh.sjjmsl>0";
			ls_sql+=" order by bj_khzcxmxjh.jgwzbm,bj_khzcxmxjh.tccplbbm";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				jgwzmc=rs.getString("jgwzbm");
				tccplbmc=rs.getString("clxlmc");
				sfxzsl=rs.getString("sfxzsl");
				jldw=rs.getString("jldw");
				jmjldw=rs.getString("jmjldw");


				bzsl=rs.getDouble("bzsl");
				jmdj=rs.getDouble("jmdj");
				sjjmsl=rs.getDouble("sjjmsl");

				sjjmje=rs.getDouble("sjjmje");


				sjjmslBgh+=sjjmsl;
				sjjmjeBgh+=sjjmje;
				
				sjjmslBgh=cf.round(sjjmslBgh,2);
				sjjmjeBgh=cf.round(sjjmjeBgh,2);

				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF"  align="center"> 
					<td ><%=jgwzmc%></td>
				
					<td><%=tccplbmc%></td>
					<td><%=sfxzsl%></td>
					<td><%=jldw%></td>
					<td><%=bzsl%></td>
					<td><%=jmjldw%></td>
					<td><%=cf.formatDouble(jmdj*zcjmzk/10)%></td>
					<td><%=cf.formatDouble(sjjmsl)%></td>
					<td><%=cf.formatDouble(sjjmje*zcjmzk/10)%></td>
				  </tr>
				  
			
				<%
			}
			rs.close();
			ps.close();
		%> 
				
		  <tr bgcolor="#FFFFFF"  align="center"> 
			<td colspan="2">合计</td>

			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(sjjmslBgh)%></td>
			<td><%=cf.formatDouble(sjjmjeBgh*zcjmzk/10)%></td>
		   </tr>

		</table>
		<%
	}

%>


<center>主材套餐变更</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="15%" >套餐名称</td>
    <td  width="8%" >价格</td>
    <td  width="15%" >产品名称</td>
    <td  width="15%" >品牌</td>
    <td  width="20%" >型号</td>
	<td  width="15%" >规格</td>
    <td  width="6%" >单位</td>
    <td  width="6%" >数量</td>
  </tr>

	
<%
	int i=0;
	String tcbm=null;
	String tcmc=null;
	double yj=0;
	double tcj=0;
	double alltcj=0;
	String bz=null;
	ls_sql="SELECT tcbm,tcmc,yj,tcj,bz";
	ls_sql+=" FROM bj_khzctcmch ";
    ls_sql+=" where zjxxh='"+zjxxh+"' ";
	ls_sql+=" order by tcbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcbm=rs.getString("tcbm");
		tcmc=rs.getString("tcmc");
		yj=rs.getDouble("yj");
		tcj=rs.getDouble("tcj");
		bz=cf.fillHtml(rs.getString("bz"));

		int zjx=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzctcmcq ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcbm='"+tcbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zjx=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (zjx!=0)
		{
			continue;
		}

		alltcj+=tcj;

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzctcmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count==0)
		{
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=tcmc%></td>
				<td ><%=tcj%></td>
				<td colspan="6" align="left"><B>未选择主材</B></td>
			  </tr>
			<%
			continue;
		}

		String cpbm=null;
		String cpmc=null;
//		String ppmc=null;
//		String xh=null;
//		String gg=null;
//		String jldw=null;
//		double sl=0;
		ls_sql="SELECT cpbm,cpmc,ppmc,xh,gg,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr,lrsj,bz";
		ls_sql+=" FROM bj_khzctcmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcj%></td>
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>未选择主材</B></td>
				  </tr>
				<%
			}
			else{
				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcj%></td>
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}


		}

		while (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>未选择主材</B></td>
				  </tr>
				<%
			}
			else{
				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}

		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();

	ls_sql="SELECT tcbm,tcmc,yj,tcj,bz";
	ls_sql+=" FROM bj_khzctcmcq ";
    ls_sql+=" where zjxxh='"+zjxxh+"' ";
	ls_sql+=" order by tcbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcbm=rs.getString("tcbm");
		tcmc=rs.getString("tcmc");
		yj=rs.getDouble("yj");
		tcj=rs.getDouble("tcj");
		bz=cf.fillHtml(rs.getString("bz"));

		tcj=-1*tcj;

		int zjx=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzctcmch ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcbm='"+tcbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zjx=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (zjx!=0)
		{
			continue;
		}

		alltcj+=tcj;

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzctcmxq";
		ls_sql+=" where zjxxh='"+zjxxh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count==0)
		{
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=tcmc%></td>
				<td ><%=tcj%></td>
				<td colspan="6" align="left"><B>未选择主材</B></td>
			  </tr>
			<%
			continue;
		}

		String cpbm=null;
		String cpmc=null;
//		String ppmc=null;
//		String xh=null;
//		String gg=null;
//		String jldw=null;
//		double sl=0;
		ls_sql="SELECT cpbm,cpmc,ppmc,xh,gg,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr,lrsj,bz";
		ls_sql+=" FROM bj_khzctcmxq";
		ls_sql+=" where zjxxh='"+zjxxh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcj%></td>
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>未选择主材</B></td>
				  </tr>
				<%
			}
			else{
				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcj%></td>
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}


		}

		while (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>未选择主材</B></td>
				  </tr>
				<%
			}
			else{
				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}

		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();


%> 
  		
  <tr bgcolor="#FFFFFF" align="center"> 
	<td><B>小 计</B></td>
	<td><B><%=alltcj%></B></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>

  <tr bgcolor="#FFFFFF" align="center"> 
	<td><B>变更单总计</B></td>
	<td><B><%=cf.round(alltcj+allje+(sjjmjeBgq-sjjmjeBgh)*zcjmzk/10,2)%></B></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>

</table>

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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
<BR>
说明：&nbsp;1、此单适用于签单后，顾客对原签约套餐主材进行变更时使用。实际安装主材以变更单所确认产品为准。
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、设计师与顾客确认主材变更型号及数量，如已定做加工产品不允许进行变更。
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、经顾客、设计师签字确认后，由材料员按此单内容安排订货。
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4、顾客对此单签字确认后，顾客必须将此单所涉及的主材变更款交松下亿达

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF">
    <td width="50%"  height="42">客户签字： </td>
    <td width="50%"  height="42">设计师签字：</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td  height="42">日期：</td>
    <td  height="42">日期：</td>
  </tr>
</table>
</body>
</html>