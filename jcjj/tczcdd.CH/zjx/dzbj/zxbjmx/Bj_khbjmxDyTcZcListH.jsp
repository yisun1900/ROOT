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
//把主材按房间显示数量
String qydmbh=null;
String qydm=null;

String zjxxh=request.getParameter("zjxxh");
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
String ysshr="";
String ysshbz="";

try {
	conn=cf.getConnection();

	
	//检查：主材项目.必选项
	String jgwzbm =null;
	String clxlmc =null;
	String cuowu ="";
	ls_sql="SELECT jgwzbm,clxlmc";
	ls_sql+=" FROM bj_khzcxmxjh,jxc_clxlbm";
    ls_sql+=" where bj_khzcxmxjh.tccplbbm=jxc_clxlbm.clxlbm(+) and bj_khzcxmxjh.zjxxh='"+zjxxh+"' and bj_khzcxmxjh.sfbxx='Y' and bj_khzcxmxjh.sjsl=0";
	ls_sql+=" order by jgwzbm,bj_khzcxmxjh.tcsjflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jgwzbm=rs.getString("jgwzbm");
		clxlmc=rs.getString("clxlmc");
		cuowu+="错误！『"+jgwzbm+"："+clxlmc+"』是必选项，没有选择主材\\n";
    }
	rs.close();
	ps.close();

	if (!cuowu.equals(""))
	{
		%>
		<SCRIPT language=javascript>

//		alert("主材清单检查错误！\r\n<%=cuowu%>")
		</SCRIPT>
		<%
	}
   
	


	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,crm_zxkhxx.bjjb,bjjbmc,ssfgs,fwmj,bjbbh,hxbm,zxdm,ysshr,DECODE(ysshbz,'N','未审核','Y','通过','M','审核未通过')ysshbz";
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
		ysshr=cf.fillNull(rs.getString("ysshr"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		
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


%>
<body >

<TABLE border="0" cellspacing="0" cellpadding="0" width="100%" cellspacing="0 style='FONT-SIZE: 14px'">

<THEAD bgcolor="#FFFFFF" style="display:table-header-group;font-weight:bold">
<tr><td>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="8" align="center" class="STYLE2" ><B>主材明细&nbsp;LWTC-02</B></td>
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
  <tr bgcolor="#FFFFFF">
  <td colspan="7" >审核人：&nbsp;<%=ysshr%></td>
    <td align="left" >预算审核：&nbsp;<%=ysshbz%></td>
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
	double sjjmsl=0;
	double sjjmje=0;
	double jmdj=0;
	ls_sql="SELECT distinct bj_khzcxmxjh.jgwzbm ";
	ls_sql+=" FROM bj_khzcxmxjh ";
    ls_sql+=" where bj_khzcxmxjh.zjxxh='"+zjxxh+"' ";
	ls_sql+=" order by bj_khzcxmxjh.jgwzbm ";
//	out.println(ls_sql);
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		jgwzmc=rs2.getString("jgwzbm");


		//房间内[标准套餐：产品类别]数量
		int cplbsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzcxmxjh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cplbsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();


		//房间内[标准套餐：选择主材产品类别]数量
		int zccplbsl=0;
		ls_sql="SELECT count(distinct tccplbbm)";
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzmc+"' and tccplbbm in(select tccplbbm from bj_khzcxmxjh where  zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzmc+"')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zccplbsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//房间内[标准套餐：未选择主材产品类别]数量
		int zccplbslw=0;
		zccplbslw=cplbsl-zccplbsl;

		//房间内[标准套餐：主材项目]数量
		int fjxmsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzcxmh,jxc_clxlbm";
		ls_sql+=" where bj_khzcxmh.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and bj_khzcxmh.zjxxh='"+zjxxh+"' and bj_khzcxmh.jgwzbm='"+jgwzmc+"'";
	    ls_sql+=" and zclx in('1','2')";//1：套餐内；2：套餐外；3：升级大店；4：大店外
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fjxmsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//房间内[顶配：主材项目]数量
		int fjxmsldp=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzcxmh,jxc_clxlbm";
		ls_sql+=" where bj_khzcxmh.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and bj_khzcxmh.zjxxh='"+zjxxh+"' and bj_khzcxmh.jgwzbm='"+jgwzmc+"'";
	    ls_sql+=" and zclx not in('1','2')";//1：套餐内；2：套餐外；3：升级大店；4：大店外
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fjxmsldp=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		int hbsl=0;//第一行应合并数量

		hbsl=zccplbslw+fjxmsl+fjxmsldp;//合并数量=[标准套餐：未选择主材产品类别]数量+[标准套餐：主材项目]数量+[顶配：主材项目]数量

		if ((fjxmsl+fjxmsldp)==0)//整个房间无主材项目
		{
			//房间内[标准套餐：产品类别]
			ls_sql="SELECT distinct bj_khzcxmxjh.tccplbbm,clxlmc,sjjmsl,sjjmje,jmdj";
			ls_sql+=" FROM bj_khzcxmxjh,jxc_clxlbm ";
			ls_sql+=" where bj_khzcxmxjh.tccplbbm=jxc_clxlbm.clxlbm(+) ";
			ls_sql+=" and bj_khzcxmxjh.zjxxh='"+zjxxh+"'";
			ls_sql+=" and bj_khzcxmxjh.jgwzbm='"+jgwzmc+"'";
			ls_sql+=" order by bj_khzcxmxjh.tccplbbm";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				tccplbbm=rs1.getString("tccplbbm");
				tccplbmc=rs1.getString("clxlmc");
				sjjmsl=rs1.getDouble("sjjmsl");
				sjjmje=rs1.getDouble("sjjmje");
				jmdj=rs1.getDouble("jmdj");

				String xs="未选择任何主材";
				if (sjjmsl>0)
				{
					xs="减免数量:"+sjjmsl+"；减免金额:"+sjjmje;
				}

				if (!oldjgwzmc.equals(jgwzmc))//房间第一行
				{
					oldjgwzmc=jgwzmc;

					%> 
					  <tr bgcolor="#FFFFFF"> 
						<td align="center" rowspan="<%=hbsl%>"><%=jgwzmc%></td>
						<td align="center"><%=tccplbmc%></td>
						<td colspan="7"><%=xs%></td>
					  </tr>
					<%
				}
				else{
					%> 
					  <tr bgcolor="#FFFFFF"> 
						<td align="center"><%=tccplbmc%></td>
						<td colspan="7"><%=xs%></td>
					  </tr>
					<%
				}
			}
			rs1.close();
			ps1.close();

		}
		else{//整个房间有主材项目
			//房间内[标准套餐：产品类别]＋＋＋＋＋＋开始
			ls_sql="SELECT distinct bj_khzcxmxjh.tccplbbm,clxlmc,sjjmsl,sjjmje,jmdj";
			ls_sql+=" FROM bj_khzcxmxjh,jxc_clxlbm ";
			ls_sql+=" where bj_khzcxmxjh.tccplbbm=jxc_clxlbm.clxlbm(+) ";
			ls_sql+=" and bj_khzcxmxjh.zjxxh='"+zjxxh+"'";
			ls_sql+=" and bj_khzcxmxjh.jgwzbm='"+jgwzmc+"'";
			ls_sql+=" order by bj_khzcxmxjh.tccplbbm";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				tccplbbm=rs1.getString("tccplbbm");
				tccplbmc=rs1.getString("clxlmc");
				sjjmje=rs1.getDouble("sjjmje");
				sjjmsl=rs1.getDouble("sjjmsl");
				jmdj=rs1.getDouble("jmdj");

			
				//类别内[主材项目]数量：含套内、顶配
				int lbzcsl=0;
				ls_sql="SELECT count(*)";
				ls_sql+=" FROM bj_khzcxmh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzmc+"' and tccplbbm='"+tccplbbm+"'";
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
					String xs="未选择任何主材";
					if (sjjmsl>0)
					{
						xs="减免数量:"+sjjmsl+"；减免金额:"+sjjmje;
					}

					if (!oldjgwzmc.equals(jgwzmc))//房间第一行
					{
						oldjgwzmc=jgwzmc;

						%> 
						  <tr bgcolor="#FFFFFF"> 
							<td align="center" rowspan="<%=hbsl%>"><%=jgwzmc%></td>
							<td align="center"><%=tccplbmc%></td>
							<td colspan="7"><%=xs%></td>
						  </tr>
						<%
					}
					else{
						%> 
						  <tr bgcolor="#FFFFFF"> 
							<td align="center"><%=tccplbmc%></td>
							<td colspan="7"><%=xs%></td>
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

					//套餐主材
					ls_sql="SELECT ppmc,xh,gg,jldw,sl,ptcpsm,bjjbmc";
					ls_sql+=" FROM bj_khzcxmh,bdm_bjjbbm";
					ls_sql+=" where bj_khzcxmh.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
					ls_sql+=" and bj_khzcxmh.zjxxh='"+zjxxh+"' and bj_khzcxmh.jgwzbm='"+jgwzmc+"' and bj_khzcxmh.tccplbbm='"+tccplbbm+"'";
					ls_sql+=" and zclx in('1','2')";//1：套餐内；2：套餐外；3：升级大店；4：大店外
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
							  <tr bgcolor="#FFFFFF" align="center"> 
								<td rowspan="<%=hbsl%>"><%=jgwzmc%></td>
								<td><%=tccplbmc%></td>
								<td><%=ppmc%></td>
								<td><%=xh%></td>
								<td><%=gg%></td>
								<td><%=jldw%></td>
								<td><%=cf.formatDouble(sl)%></td>
								<td align="left" ><%=ptcpsm%></td>
								<td><%=bjjbmc%></td>
							  </tr>
							<%
						}
						else{
							//输出每行数据
							%> 
							  <tr bgcolor="#FFFFFF" align="center"> 
								<td><%=tccplbmc%></td>
								<td><%=ppmc%></td>
								<td><%=xh%></td>
								<td><%=gg%></td>
								<td><%=jldw%></td>
								<td><%=cf.formatDouble(sl)%></td>
								<td align="left" ><%=ptcpsm%></td>
								<td><%=bjjbmc%></td>
							  </tr>
							<%
						}
					}
					rs.close();
					ps.close();


					//顶配主材
					String zclx="";
					String zclxmc="";
					String ddcljjfs="";
					ls_sql="SELECT ppmc,xh,gg,jldw,sl,ptcpsm,bjjbmc,zclx,decode(zclx,'3','顶配升级','4','选配项') zclxmc,decode(ddcljjfs,'0','套餐主材','1','顶配升级','2','顶配独立收费','3','套餐选配') ddcljjfs";
					ls_sql+=" FROM bj_khzcxmh,bdm_bjjbbm";
					ls_sql+=" where bj_khzcxmh.bjjbbm=bdm_bjjbbm.bjjbbm";
					ls_sql+=" and bj_khzcxmh.zjxxh='"+zjxxh+"'";
					ls_sql+=" and bj_khzcxmh.jgwzbm='"+jgwzmc+"'";
					ls_sql+=" and bj_khzcxmh.tccplbbm='"+tccplbbm+"'";
					ls_sql+=" and zclx not in('1','2')";//1：套餐内；2：套餐外；3：升级大店；4：大店外
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
						zclx=rs.getString("zclx");
						zclxmc=rs.getString("zclxmc");
						ddcljjfs=rs.getString("ddcljjfs");

						if (zclx.equals("4"))//3：升级大店；4：大店外
						{
							zclxmc=ddcljjfs;
						}

						row++;

						if (!oldjgwzmc.equals(jgwzmc))//开始新房间
						{
							oldjgwzmc=jgwzmc;

							//输出每行数据
							%> 
							  <tr bgcolor="#FFFFFF" align="center"> 
								<td rowspan="<%=hbsl%>"><%=jgwzmc%></td>
								<td><%=tccplbmc%></td>
								<td><%=ppmc%></td>
								<td><%=xh%></td>
								<td><%=gg%></td>
								<td><%=jldw%></td>
								<td><%=cf.formatDouble(sl)%></td>
								<td align="left" ><%=ptcpsm%></td>
								<td><%=zclxmc%></td>
							  </tr>
							<%
						}
						else{
							//输出每行数据
							%> 
							  <tr bgcolor="#FFFFFF" align="center"> 
								<td><%=tccplbmc%></td>
								<td><%=ppmc%></td>
								<td><%=xh%></td>
								<td><%=gg%></td>
								<td><%=jldw%></td>
								<td><%=cf.formatDouble(sl)%></td>
								<td align="left" ><%=ptcpsm%></td>
								<td><%=zclxmc%></td>
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
			//房间内[标准套餐：产品类别]＝＝＝＝＝＝＝结束
		
		
		
			//房间内[标准套餐外（顶配主材）：产品类别]＋＋＋＋＋＋开始
			ls_sql="SELECT distinct bj_khzcxmh.tccplbbm,clxlmc";
			ls_sql+=" FROM bj_khzcxmh,jxc_clxlbm ";
			ls_sql+=" where bj_khzcxmh.tccplbbm=jxc_clxlbm.clxlbm(+) ";
			ls_sql+=" and bj_khzcxmh.zjxxh='"+zjxxh+"'";
			ls_sql+=" and bj_khzcxmh.jgwzbm='"+jgwzmc+"'";
			ls_sql+=" and bj_khzcxmh.tccplbbm not in(select tccplbbm from bj_khzcxmxjh where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzmc+"')";
			ls_sql+=" and bj_khzcxmh.zclx not in('1','2')";//1：套餐内；2：套餐外；3：升级大店；4：大店外
			ls_sql+=" order by bj_khzcxmh.tccplbbm";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				tccplbbm=rs1.getString("tccplbbm");
				tccplbmc=rs1.getString("clxlmc");

			
				//类别内[主材项目]数量：含套内、顶配
				int lbzcsl=0;
				ls_sql="SELECT count(*)";
				ls_sql+=" FROM bj_khzcxmh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzmc+"' and tccplbbm='"+tccplbbm+"'";
				ls_sql+=" and bj_khzcxmh.zclx not in('1','2')";//1：套餐内；2：套餐外；3：升级大店；4：大店外
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					lbzcsl=rs.getInt(1);
				}
				rs.close();
				ps.close();


				//输出项目明细
				String ppmc=null;
				String xh=null;
				String gg=null;
				String jldw=null;
				double sl=0;
				String ptcpsm=null;
				//顶配主材
				String zclx="";
				String zclxmc="";
				String ddcljjfs="";
				ls_sql="SELECT ppmc,xh,gg,jldw,sl,ptcpsm,bjjbmc,zclx,decode(zclx,'3','顶配升级','4','选配项') zclxmc,decode(ddcljjfs,'0','套餐主材','1','顶配升级','2','顶配独立收费','3','套餐选配') ddcljjfs";
				ls_sql+=" FROM bj_khzcxmh,bdm_bjjbbm";
				ls_sql+=" where bj_khzcxmh.bjjbbm=bdm_bjjbbm.bjjbbm";
				ls_sql+=" and bj_khzcxmh.zjxxh='"+zjxxh+"' and bj_khzcxmh.jgwzbm='"+jgwzmc+"' and bj_khzcxmh.tccplbbm='"+tccplbbm+"'";
				ls_sql+=" and zclx not in('1','2')";//1：套餐内；2：套餐外；3：升级大店；4：大店外
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
					zclx=rs.getString("zclx");
					zclxmc=rs.getString("zclxmc");
					ddcljjfs=rs.getString("ddcljjfs");

					if (zclx.equals("4"))//3：升级大店；4：大店外
					{
						zclxmc=ddcljjfs;
					}

					row++;

					if (!oldjgwzmc.equals(jgwzmc))//开始新房间
					{
						oldjgwzmc=jgwzmc;

						//输出每行数据
						%> 
						  <tr bgcolor="#FFFFFF" align="center"> 
							<td rowspan="<%=hbsl%>"><%=jgwzmc%></td>
							<td><%=tccplbmc%></td>
							<td><%=ppmc%></td>
							<td><%=xh%></td>
							<td><%=gg%></td>
							<td><%=jldw%></td>
							<td><%=cf.formatDouble(sl)%></td>
							<td align="left" ><%=ptcpsm%></td>
							<td><%=zclxmc%></td>
						  </tr>
						<%
					}
					else{
						//输出每行数据
						%> 
						  <tr bgcolor="#FFFFFF" align="center"> 
							<td><%=tccplbmc%></td>
							<td><%=ppmc%></td>
							<td><%=xh%></td>
							<td><%=gg%></td>
							<td><%=jldw%></td>
							<td><%=cf.formatDouble(sl)%></td>
							<td align="left" ><%=ptcpsm%></td>
							<td><%=zclxmc%></td>
						  </tr>
						<%
					}
				}
				rs.close();
				ps.close();

			}
			rs1.close();
			ps1.close();
			//房间内[标准套餐：产品类别]＝＝＝＝＝＝＝结束
		
		
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






