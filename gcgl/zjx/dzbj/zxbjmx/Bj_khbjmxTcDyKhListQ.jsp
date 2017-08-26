<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
//显示单价，套餐内项目，单价＝0，套餐外正常
//显示超量加价

String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

int row=0;

String xh=null;
String xmbh=null;
String xmmc=null;

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

String khxm=null;
String lxfs=null;
String fwdz=null;
String hth="";
String sjs=null;
String kgrq="";
String jyjdrq=null;
String jgrq="";
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
String dh=null;
String hxbm=null;
String ysshbz="";
String ysshr="";
String bjbbh="";
String dqbm="";
String bjjbbm="";
int fwmj=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT crm_zxkhxx.bjbbh,crm_zxkhxx.bjjb,fwmj,khxm,lxfs,fwdz,sjs,bjjbmc bjjb,crm_zxkhxx.ssfgs,ysshr,DECODE(ysshbz,'N','未审核','Y','通过','M','审核未通过')ysshbz,hth,yjzxsj,zjzbjsj,fwmj,sq_yhxx.dh dh,hxbm";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm,sq_yhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_zxkhxx.sjsgh=sq_yhxx.ygbh(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		bjjbbm=cf.fillHtml(rs.getString("bjjb"));
		fwmj=rs.getInt("fwmj");
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		dh=cf.fillHtml(rs.getString("dh"));
		hxbm=cf.fillHtml(rs.getString("hxbm"));
		hth=cf.fillNull(rs.getString("hth"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
	}
	rs.close();
	ps.close();
	
	
	//提取开工日期、竣工日期
	
	ls_sql="select kgrq,jgrq";
	ls_sql+=" from  crm_khxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
	}
	rs.close();
	ps.close();
	
	//提取结束


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



	//工程超量加价：计算：实际数量、需加价数量
//	String xmbh =null;
	String sfxzsl =null;
	double bzsl=0;
	ls_sql="SELECT bj_khgcxmxjq.xmbh,bj_khgcxmxjq.bzsl,bj_khgcxmxjq.sfxzsl";
	ls_sql+=" from  bj_khgcxmxjq,bj_bjxmmxq";
	ls_sql+=" where bj_khgcxmxjq.zjxxh=bj_bjxmmxq.zjxxh and bj_khgcxmxjq.xmbh=bj_bjxmmxq.xmbh ";
    ls_sql+=" and bj_khgcxmxjq.zjxxh='"+zjxxh+"' and bj_khgcxmxjq.tcnxmbz='Y'";//套餐内项目标志
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		sfxzsl=rs.getString("sfxzsl");
		bzsl=rs.getDouble("bzsl");

		double sjsl=0;
		ls_sql="SELECT sum(bj_gclmxq.sl)";
		ls_sql+=" FROM bj_gclmxq";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();


		double xjjsl=0;//加价数量

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
				out.println("<BR>错误！项目编号『"+xmbh+"』不可增项，[实际数量："+sjsl+"]超出[标准数量："+bzsl+"]");
			}
		}


		ls_sql="update bj_khgcxmxjq set sjsl="+sjsl+",xjjsl="+xjjsl;
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();




%>
<body >

<div align="center"> </div>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="8"><span lang=EN-US><img src="/images/tubiao111.jpg" v:shapes="_x0000_i1025" width="100"></span></td>
    <td width="17%" align="center">&nbsp;</td>
   <!--  <td align="right">http://www.jrchina.com</td> -->
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="9" height="35"><b><font size="5">松下亿达装饰工程（大连）有限公司</font></b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="9" height="35"><b><font size="3">住宅室内装饰装修工程预算报价书（各部位）LWTC-01</font></b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" >客户姓名：<%=khxm%></td>
	<td colspan="3" >客户电话：<%=lxfs%></td>
    <td align="left">合同号：<%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="8" >工程地址：<%=fwdz%></td>
    <td align="left" >开工日期：<%=kgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" >户型说明：<%cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);%></td>
	<td colspan="3">
	<input type="checkbox" name="checkbox" value="checkbox">
	平层结构
	<input type="checkbox" name="checkbox2" value="checkbox">
	复式结构
	<input type="checkbox" name="checkbox3" value="checkbox">
	联排别墅
	<input type="checkbox" name="checkbox4" value="checkbox">
	独栋别墅
	<input type="checkbox" name="checkbox5" value="checkbox">
	旧房改造	</td>
    <td align="left" >竣工日期：<%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" >设计师：<%=sjs%></td>
	<td width="17%" >设计师电话：<%=dh%></td>
    <td width="18%" align="center">审核人：<%=ysshr%></td>
    <td width="12%" align="center">&nbsp;</td>
    <td align="left" >预算审核：<%=ysshbz%></td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"> 
    <td  width="3%" align="center">序号</td>
    <td  width="8%" align="center">项目编号</td>
    <td  width="18%" align="center">项目名称</td>
	<td  width="5%" align="center">单位</td>
    <td  width="5%" align="center">单价:元</td>
    <td  width="3%" align="center">数量</td>
    <td  width="9%" align="center">金额（元）</td>
    <td  width="30%" align="center">工艺做法及材料说明</td>
	<td  width="19%" align="center">辅料名称规格</td>
  </tr>
  <%
	int i=0;
	ls_sql="SELECT bj_fjxxq.jgwzbm";
	ls_sql+=" FROM bj_fjxxq ";
    ls_sql+=" where zjxxh='"+zjxxh+"'";
	ls_sql+=" order by bj_fjxxq.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjsl=0;
		xjqye=0;
		
		//输出标题
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="9"> 
			  <div align="cenetr"><b><i><font size="3">结构位置：<%=jgwzmc%></i></b></div>
			</td>
		  </tr>
		<%

		//输出项目明细
		String tcnxmbz=null;
		double zqdj=0;
		ls_sql="SELECT bj_bjxmmxq.tcnxmbz,bj_bjxmmxq.xh xh,bj_bjxmmxq.xmbh,xmmc,bj_bjxmmxq.zqdj,jldwmc,bj_gclmxq.sl,bj_gclmxq.sl*bj_bjxmmxq.zqdj as je,gycl,bj_bjxmmxq.flmcgg,bj_bjxmmxq.bz";
		ls_sql+=" FROM bj_bjxmmxq,jdm_jldwbm,bj_gclmxq,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxq.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxq.zjxxh='"+zjxxh+"' and bj_gclmxq.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxq.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxq.zjxxh=bj_gclmxq.zjxxh and bj_bjxmmxq.dqbm=bj_gclmxq.dqbm and bj_bjxmmxq.xmbh=bj_gclmxq.xmbh";
		ls_sql+=" order by bj_gclmxq.fjnxh,bj_bjxmmxq.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			tcnxmbz=cf.fillNull(rs.getString("tcnxmbz"));
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			zqdj=rs.getDouble("zqdj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));
			flmcgg=cf.fillHtml(rs.getString("flmcgg"));
			bjbz=cf.fillHtml(rs.getString("bz"));

			if (tcnxmbz.equals("Y"))
			{
				sl=0;
				qye=0;

			}

			xjsl+=sl;
			xjqye+=qye;

			allsl+=sl;
			allqye+=qye;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td align="center"><%=row%></td>
				<td align="center"><%=xmbh%></td>
				<td align="center"><%=xmmc%></td>
				<td align="center"><%=jldwmc%></td>
				<td align="center"><%=zqdj%></td>
				<td align="center"><%=cf.formatDouble(sl)%></td>
				<td align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
				<td align="left"><%=gycl%></td>
				<td align="left"><%=flmcgg%></td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();

		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="9"> 
			  <div align="right"><b><i><font size="3"><%=jgwzmc%>小计：<%=cf.formatDouble(xjqye,"#########.##")%>元</font></i></b></div>
			</td>
		  </tr>
		<%
	
	}
	rs1.close();
	ps1.close();

	%> 
	  <tr bgcolor="#FFFFFF"> 
		<td colspan="9"> 
		  <div align="right"><b><i><font size="3">套餐外施工项小计：<%=cf.formatDouble(allqye,"#########.##")%>元</font></i></b></div>
		</td>
	  </tr>

	  <tr bgcolor="#FFFFFF"> 
		<td colspan="9"> 
		  <div align="cenetr"><b><i><font size="3">工程量超量加价部分</i></b></div>
		</td>
	  </tr>
	<%

	bzsl=0;
	double sjsl=0;
	double xjjsl=0;
	xjsl=0;
	xjqye=0;

	double zqdj=0;
	ls_sql="select bj_bjxmmxq.xmbh,bj_bjxmmxq.xmmc,bj_bjxmmxq.xmmc,jldwmc,bj_bjxmmxq.zqdj,bj_khgcxmxjq.bzsl,bj_khgcxmxjq.sjsl,bj_khgcxmxjq.xjjsl";
	ls_sql+=" from  bj_khgcxmxjq,bj_bjxmmxq,jdm_jldwbm";
	ls_sql+=" where bj_khgcxmxjq.zjxxh=bj_bjxmmxq.zjxxh and bj_khgcxmxjq.xmbh=bj_bjxmmxq.xmbh ";
	ls_sql+=" and bj_bjxmmxq.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_khgcxmxjq.xjjsl>0 and bj_khgcxmxjq.tcnxmbz='Y'";
	ls_sql+=" and bj_khgcxmxjq.zjxxh='"+zjxxh+"' and bj_khgcxmxjq.sfxzsl='1'";//1：可增项；2：不可增项；3：不控制
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		xmbh=cf.fillHtml(rs2.getString("xmbh"));
		xmmc=cf.fillHtml(rs2.getString("xmmc"));
		jldwmc=cf.fillHtml(rs2.getString("jldwmc"));
		zqdj=rs2.getDouble("zqdj");
		bzsl=rs2.getDouble("bzsl");
		sjsl=rs2.getDouble("sjsl");
		xjjsl=rs2.getDouble("xjjsl");

		gycl="标准数量:"+bzsl+"，实际数量:"+sjsl+"，需加价数量:"+xjjsl;

		sl=xjjsl;

		qye=zqdj*sl;

		xjsl+=sl;
		xjqye+=qye;

		allsl+=sl;
		allqye+=qye;
		
		row++;

		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td align="center"><%=row%></td>
			<td align="center"><%=xmbh%></td>
			<td align="center"><%=xmmc%></td>
			<td align="center"><%=jldwmc%></td>
			<td align="center"><%=zqdj%></td>
			<td align="center"><%=cf.formatDouble(sl)%></td>
			<td align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
			<td align="left"><%=gycl%></td>
			<td align="left">&nbsp;</td>
		  </tr>
		<%
	}
	rs2.close();
	ps2.close();

	%> 
	  <tr bgcolor="#FFFFFF"> 
		<td colspan="9"> 
		  <div align="right"><b><i><font size="3"><%=jgwzmc%>小计：<%=cf.formatDouble(xjqye,"#########.##")%>元</font></i></b></div>
		</td>
	  </tr>
	<%

			


%> 
  <tr bgcolor="#FFFFFF"> 
    <td align="right" colspan="9"><i><b><font size="3">总 计：<%=cf.formatDouble(allqye,"#########.##")%>元</font></b></i></td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" height="42">甲方签字：</td>
    <td colspan="6" height="42">乙方签字：</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >日期：：</td>
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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






