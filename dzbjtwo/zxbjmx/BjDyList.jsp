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
.STYLE1 {
	font-size: 18px;
	font-weight: bold;
}
</style>

</head>


<%
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String xh=null;
String jgwzmc=null;
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
String flmcgg=null;
String bjbz=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allzj=0;
double tcnzj=0;

double tcwzj=0;
double htzj=0;

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
String bjjbbm=null;
String bjjbmc=null;
String ssfgs=null;
String dzbjbz=null;
int fwmj=0;
String bjbbh=null;
String dqbm =null;
String hxbm =null;

try {
	conn=cf.getConnection();

	//检查：主材项目.必选项
	String jgwzbm =null;
	String clxlmc =null;
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

//		out.println("<BR>错误！『"+jgwzbm+"："+clxlmc+"』是必选项，没有选择主材");
	}
	rs.close();
	ps.close();


	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,crm_zxkhxx.bjjb,bjjbmc,ssfgs,fwmj,bjbbh,hxbm";
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
	if (mjzj<0)
	{
		mjzj=0;
	}
	double mjzjzj=pmzjdj*mjzj;//面积增加金额
	mjzjzj=cf.round(mjzjzj,2);
	

	double zcsjcj=0;

	//主材升级差价
	String tcsjflbm =null;
	String tcsjflmc =null;
	String khbjjbbm =null;
	String getbjjbbm =null;
	double bzsl=0;
	double ccbfjj=0;
	double sjsl=0;
	double sjjshsl=0;
	double xjjsl=0;
	ls_sql="SELECT tcsjflmc,bj_khzcxmxj.tcsjflbm,bj_khzcxmxj.khbjjbbm,bjjbbm,bzsl,ccbfjj,sjsl,sjjshsl,xjjsl";
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
		sjjshsl=rs.getDouble("sjjshsl");
		xjjsl=rs.getDouble("xjjsl");

		double sjcj=0;
		if (getbjjbbm.compareTo(khbjjbbm)>0)
		{
			ls_sql="SELECT sjcj";
			ls_sql+=" FROM bj_tcsjcjb";
			ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+khbjjbbm+"' and bjjbbm1='"+getbjjbbm+"' and tcsjflbm='"+tcsjflbm+"'";
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
		}
		zcsjcj+=sjjshsl*sjcj;//加损耗数量
		zcsjcj=cf.round(zcsjcj,2);

	}
	rs.close();
	ps.close();

	//分房间主材超量加价
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

	//小类主材超量加价
	double zcxlcljj=0;

	String gettccplbbm=null;
	double getxlsl=0;
	ls_sql="SELECT tccplbbm,sum(sjsl)";
	ls_sql+=" FROM bj_khzcxmxj";
    ls_sql+=" where khbh='"+khbh+"'";//1：可增项；2：不可增项；3：不控制
	ls_sql+=" group by tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		gettccplbbm=rs.getString(1);
		getxlsl=rs.getDouble(2);

		double gettcslxz=0;//套餐数量限制
		double getccbfjj=0;//超出部分加价
		String sfxzsl="";//是否限制数量  1：不限制；2：不能超量；3：可超量需加价
		ls_sql="SELECT tcslxz,ccbfjj,sfxzsl";
		ls_sql+=" FROM jxc_clxlbm";
		ls_sql+=" where clxlbm='"+gettccplbbm+"' and sfxzsl!='1'"; 
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			gettcslxz=rs1.getDouble("tcslxz");
			getccbfjj=rs1.getDouble("ccbfjj");
			sfxzsl=cf.fillNull(rs1.getString("sfxzsl"));

			if (sfxzsl.equals("3"))//3：可超量需加价
			{
				zcxlcljj+=(getxlsl-gettcslxz)*getccbfjj;
			}
			else if (sfxzsl.equals("2"))//2：不能超量
			{
				if (getxlsl>gettcslxz)
				{
					out.println("错误！类别【"+gettccplbbm+"】限制总数量，总数量["+getxlsl+"]不能超过限制数量["+gettcslxz+"]");
					return;
				}
			}
		}
		rs1.close();
		ps1.close();
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

	String xmbh =null;
	String sfxzsl =null;
//	double bzsl=0;
//	double ccbfjj=0;
	ls_sql="SELECT bj_khgcxmxj.xmbh,bj_khgcxmxj.bzsl,bj_khgcxmxj.sfxzsl,bj_bjxmmx.dj";
	ls_sql+=" from  bj_khgcxmxj,bj_bjxmmx";
	ls_sql+=" where bj_khgcxmxj.khbh=bj_bjxmmx.khbh and bj_khgcxmxj.xmbh=bj_bjxmmx.xmbh ";
    ls_sql+=" and bj_khgcxmxj.khbh='"+khbh+"' and bj_khgcxmxj.tcnxmbz='Y'";//套餐内项目标志
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		sfxzsl=rs.getString("sfxzsl");
		bzsl=rs.getDouble("bzsl");
		ccbfjj=rs.getDouble("dj");

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
	tcze=tcjg+mjzjzj+zcsjcj+zccljj+zcxlcljj+xsfzc+gccljj+tcwgczj;
	tcze=cf.round(tcze,2);
	

	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	double zhtcze=dzbj.getZhBzTCZj(conn,khbh,"yz");
	dzbj.updateTCSfxm(conn,khbh,"yz",tcze,zhtcze);

%>
<body >

<div align="center" class="STYLE1"><%=bjjbmc%>套餐总价&nbsp;LWTC-06</div>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

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
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
  <tr align="center"  >
    <td ><strong>序号</strong></td>
    <td ><strong>项目</strong></td>
    <td ><strong>金额（元）</strong></td>
    <td ><strong>备注</strong></td>
  </tr>
  <tr align="center"  >
    <td width="5%"  >①</td>
    <td width="25%"  >套餐标准价格</td>
    <td width="20%"  ><%=tcjg%></td>
    <td width="50%" align="left" ><%=bjjbmc%></td>
  </tr>
  <tr align="center"  >
    <td>②</td>
    <td  >面积增加金额</td>
    <td  ><%=mjzjzj%></td>
    <td align="left" >面积增加<%=mjzj%>平米，每平米<%=pmzjdj%>元</td>
  </tr>
  <tr align="center"  >
    <td rowspan="5"  >③</td>
    <td  >主材升级差价</td>
    <td  ><%=zcsjcj%></td>
    <td align="left" >&nbsp;</td>
  </tr>
  <tr align="center">
    <td >主材超量加价</td>
    <td ><%=cf.round(zccljj+zcxlcljj,2)%></td>
    <td align="left" >实际数量超过限制数量费用</td>
  </tr>
  <tr align="center"  >
    <td >需收费主材</td>
    <td ><%=xsfzc%></td>
    <td align="left">套餐内需收费主材</td>
  </tr>
  <tr align="center"  >
    <td >套餐外施工项造价</td>
    <td ><%=tcwgczj%></td>
    <td align="left" >套餐外新增施工项，不含主材</td>
  </tr>
  <tr align="center"  >
    <td >工程超量加价</td>
    <td ><%=gccljj%></td>
    <td align="left" >实际数量超过限制数量费用</td>
  </tr>
 
<%
	double tczj=tcze;

	String sfxmbm=null;
	String sfxmmc=null;

	double sfbfb=0;
	double sfje=0;
	double zqsfje=0;

	ls_sql="SELECT sfxmbm,sfxmmc,sfbfb,sfje,zqsfje";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and bj_sfxmmx.sfxmlx not in('5','6','7','8','A','B','C')";//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		sfbfb=rs.getDouble("sfbfb");
		sfje=rs.getDouble("sfje");
		zqsfje=rs.getDouble("zqsfje");

		tczj+=zqsfje;

		%> 
	
		  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
			<td>④</td>
			<td><%=sfxmmc%></td>
			<td><%=cf.formatDouble(zqsfje,"#########.##")%></td>
			<td align="left" >④ =（① + ② + ③）× <%=sfbfb%>% 六环路以外的项目</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	tczj=cf.round(tczj,2);

%>
  <tr align="center"  >
    <td>⑤</td>
    <td  >套餐总价</td>
    <td><%=tczj%></td>
    <td align="left" >⑤ = ① + ② + ③ + ④</td>
  </tr>

<%
	tcnzj=tczj;


	ls_sql="SELECT sfxmbm,sfxmmc,sfbfb,sfje,zqsfje";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and bj_sfxmmx.sfxmlx in('5')";//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		sfbfb=rs.getDouble("sfbfb");
		sfje=rs.getDouble("sfje");
		zqsfje=rs.getDouble("zqsfje");

		tcnzj+=zqsfje;

		%> 
	
		  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
			<td>⑥</td>
			<td><%=sfxmmc%></td>
			<td><%=cf.formatDouble(zqsfje,"#########.##")%></td>
			<td align="left" >⑥ = ⑤ × <%=sfbfb%>%</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sfxmbm,sfxmmc,sfbfb,sfje,zqsfje";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and bj_sfxmmx.sfxmlx in('6')";//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		sfbfb=rs.getDouble("sfbfb");
		sfje=rs.getDouble("sfje");
		zqsfje=rs.getDouble("zqsfje");

		tcnzj+=zqsfje;

		%> 
	
		  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
			<td>⑦</td>
			<td><%=sfxmmc%></td>
			<td><%=cf.formatDouble(zqsfje,"#########.##")%></td>
			<td align="left" >⑦ =( ⑤ + ⑥ ) × <%=sfbfb%>%</td>
		  </tr>
		  <tr align="center"  >
            <td>⑧</td>
		    <td>套餐内总价</td>
		    <td><%=tcnzj%></td>
		    <td align="left" >⑧ = ⑤ + ⑥ + ⑦</td>
  </tr>
		<%
	}
	rs.close();
	ps.close();

	tcnzj=cf.round(tcnzj,2);

	ls_sql="SELECT sum(hkze+zjhze)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"' and ddlx!='5'";//1：系统存在品牌订单；2：系统不存在品牌订单；3：补录合同；4：有库存订单；5：套餐分解订单
	ls_sql+=" and clzt>='09' and clzt!='98'";//09：合同已完成
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwzj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(zjxze)";
	ls_sql+=" FROM jc_zczjx  ";
    ls_sql+=" where khbh='"+khbh+"' and clzt not in('00','99')";//00：录入未完成；01：录入已完成；02：已确认；03：已送货；04：厂家已接收；99；退单
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwzj+=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	htzj=tcnzj+tcwzj;
%>
  <tr align="center"  >
	<td>⑨</td>
	<td>套餐外增加主材</td>
	<td><%=tcwzj%></td>
	<td align="left" >不计管理费、税金，不参加任何活动</td>
  </tr>
  <tr align="center"  >
    <td>⑩</td>
    <td>合同总价</td>
    <td><%=htzj%></td>
    <td align="left" >⑩ = ⑧ + ⑨</td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" height="42">甲方签字：</td>
    <td colspan="6" height="42">乙方签字：</td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
  <td colspan="6" >日期：</td>
    <td colspan="6" >日期：</td>
  </tr>
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






