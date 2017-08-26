<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE4 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String jsjlh=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String gdjsjd=null;
String zjxxh="";
int fwmj=0;

double clcb=0;
double kgcyz=0;

double kzbjbl=2;
double kfxbzjbl=3;
double zjcbglfbl=0;
double sdlcbfbl=70;
double htwzjcbbl=75;
double sjfbl=5;
double htnsdjebl=70;
double ycfbl=0;
double cldbbl=21;

double qye=0;
double zjxje=0;
double zxje=0;
double jxje=0;
double jxjesgcb=0;
double jxjesgcbclf=0;
double jxjesgcbrgf=0;
double htsgcb=0;
double htsgcbclf=0;
double htsgcbrgf=0;
double zjxsgcb=0;


double zjcbglf=0;
double sdlzxje=0;
double sldzjcb=0;
double htwzjje=0;
double htwzjcb=0;
double sgcb=0;
double sgcbclf=0;
double sgcbrgf=0;

double sssjf=0;
double sjftc=0;
double kqzlf=0;
double bbjf=0;
double bqtf=0;
double htnsdje=0;
double bsdcb=0;
double ycfje=0;

double bycf=0;
double cbhjje=0;
double kzbj=0;
double kfxbzj=0;
double xxfh=0;
double clbdbkk=0;
double kgjsje=0;
double kqtf=0;
double kxcf=0;
double sjzfe=0;

double htsdl=0;
double sdlzjx=0;
double wxxkk=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select zjxxh,gdjsjd,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" ,qye,zjxje,fwmj";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qye=rs.getDouble("qye");
		zjxje=rs.getDouble("zjxje");
		fwmj=rs.getInt("fwmj");

		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));


		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	if (!gdjsjd.equals("X"))//1:交齐中期结算资料
	{
		out.println("<BR>！！！错误，结算进度不正确");
		return;
	}

	if (zjxxh.equals(""))
	{
		//增项金额
		zxje=0;
		//减项金额
		jxje=0;
	}
	else{
		//增项金额
		zxje=0;
		String getxmbh=null;
		double newje=0;
		ls_sql="SELECT  bj_bjxmmxh.xmbh,sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
		ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
		ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ls_sql+=" and (bj_bjxmmxh.xmflbm is null or bj_bjxmmxh.xmflbm!='01')";
		ls_sql+=" group by bj_bjxmmxh.xmbh ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getxmbh=rs.getString(1);
			newje=rs.getDouble(2);


			double oldje=0;
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmbh='"+getxmbh+"'";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				oldje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			if (newje>oldje)
			{
				zxje+=newje-oldje;
			}


		}
		rs.close();
		ps.close();

		//减项金额
		jxje=0;
		jxjesgcb=0;
		jxjesgcbclf=0;
		jxjesgcbrgf=0;
		double oldje=0;
		double oldsgcb=0;
		double oldsgcbclf=0;
		double oldsgcbrgf=0;
		ls_sql="SELECT bj_bjxmmx.xmbh,sum(bj_gclmx.sl*bj_bjxmmx.dj),sum(bj_gclmx.sl*bj_bjxmmx.cbenj),sum(bj_gclmx.sl*bj_bjxmmx.clcb),sum(bj_gclmx.sl*bj_bjxmmx.rgcb)";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" and (bj_bjxmmx.xmflbm is null or bj_bjxmmx.xmflbm!='01')";
		ls_sql+=" group by bj_bjxmmx.xmbh ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getxmbh=rs.getString(1);
			oldje=rs.getDouble(2);
			oldsgcb=rs.getDouble(3);
			oldsgcbclf=rs.getDouble(4);
			oldsgcbrgf=rs.getDouble(5);


			newje=0;
			double newsgcb=0;
			double newsgcbclf=0;
			double newsgcbrgf=0;
			ls_sql="SELECT  sum(bj_gclmxh.sl*bj_bjxmmxh.dj),sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj),sum(bj_gclmxh.sl*bj_bjxmmxh.clcb),sum(bj_gclmxh.sl*bj_bjxmmxh.rgcb)";
			ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh";
			ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
			ls_sql+=" and bj_bjxmmxh.xmbh='"+getxmbh+"'";
			ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				newje=rs1.getDouble(1);
				newsgcb=rs1.getDouble(2);
				newsgcbclf=rs1.getDouble(3);
				newsgcbrgf=rs1.getDouble(4);
			}
			rs1.close();
			ps1.close();

			if (oldje>newje)
			{
				jxje+=oldje-newje;
				jxjesgcb+=oldsgcb-newsgcb;
				jxjesgcbclf+=oldsgcbclf-newsgcbclf;
				jxjesgcbrgf+=oldsgcbrgf-newsgcbrgf;
			}


		}
		rs.close();
		ps.close();
	}



	

	ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cbenj),sum(bj_gclmx.sl*bj_bjxmmx.clcb),sum(bj_gclmx.sl*bj_bjxmmx.rgcb)";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		htsgcb=rs.getDouble(1);
		htsgcbclf=rs.getDouble(2);
		htsgcbrgf=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	if (zjxxh.equals(""))
	{
		zjxsgcb=0;
	}
	else{
		double zxcbj=0;

		ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj)";
		ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
		ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zxcbj=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		zjxsgcb=zxcbj-htsgcb;
	}

	//直接成本管理费
	zjcbglf=(zjxsgcb+htsgcb)*zjcbglfbl/100;

	//合同水电路
	ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.xmflbm='01'";
	ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		htsdl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(sfje)";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmlx in('D','E')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		htsdl+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (zjxxh.equals(""))
	{
		sdlzjx=0;
	}
	else{
		double zxsdl=0;

		ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
		ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
		ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxh.xmflbm='01'";
		ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zxsdl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="SELECT sum(sfje)";
		ls_sql+=" FROM bj_sfxmmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"'";
		ls_sql+=" and sfxmlx in('D','E')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zxsdl+=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		sdlzjx=zxsdl-htsdl;
	}

	sdlzxje=sdlzjx;

	//水电路增加直接成本费
	sldzjcb=sdlzxje*sdlcbfbl/100;

	htwzjje=zxje;
	//合同外项目增加直接成本费
	htwzjcb=htwzjje*htwzjcbbl/100;

	//施工成本人工费
	sgcb=htsgcb-jxjesgcb;
	sgcbclf=htsgcbclf-jxjesgcbclf;//①材料费
	sgcbrgf=htsgcbrgf-jxjesgcbrgf;//②人工费

	htnsdje=htsdl;
	//补施工组长水电成本
	bsdcb=htnsdje*htnsdjebl/100;

	//实收设计费
	ls_sql="select sum(fkje) ";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='53'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sssjf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	sjftc=sssjf*sjfbl/100;

	//空气治理协调费
	kqzlf=fwmj*0.5;

	//远程费金额
	ls_sql="select sum(fkje) ";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='56'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ycfje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	bycf=ycfje*ycfbl/100;

	cbhjje=cf.round(zjcbglf+sldzjcb+htwzjcb+sgcb+sjftc+kqzlf+bbjf+bqtf+bsdcb+bycf,2);

	//扣工地质保金
	kzbj=cbhjje*kzbjbl/100;
	//扣风险保证金
	kfxbzj=cbhjje*kfxbzjbl/100;
	//材料不达标扣款
	clbdbkk=cf.round((qye+zjxje)*cldbbl/100,2);

	kxcf=30;


	
	
	//材料单
	ls_sql="select sum(pszje)";
	ls_sql+=" from  jxc_clpsd";
	ls_sql+=" where khbh='"+khbh+"' and psdzt in('2','3','5')";
	//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clcb=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	

	
	//已付工费
	ls_sql="select sum(bfje)";
	ls_sql+=" from  cw_chbgfjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kgcyz=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	wxxkk=cf.round(qye*0.01,2);


	sjzfe=cf.round(cbhjje-kzbj-kfxbzj-kgcyz-xxfh-clcb-clbdbkk-kgjsje-kqtf-kxcf-wxxkk,2);

	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,8,2)),0)";
	ls_sql+=" from  cw_chsgdjs";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jsjlh=khbh+cf.addZero(count+1,2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_chsgdjs.jsp" name="insertform"  >
<div align="center">请录入数据</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">拨工费记录号</td>
	<td  width="8%">类型</td>
	<td  width="7%">拨付日期</td>
	<td  width="7%">合同金额</td>
	<td  width="6%">橱柜木门金额</td>
	<td  width="8%">实收款</td>
	<td  width="7%">已付工费</td>
	<td  width="4%">拨付比例</td>
	<td  width="7%">拨付金额</td>
	<td  width="5%">录入人</td>
	<td  width="54%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_chbgfjl.bgfjlh,gdjsjdmc,cw_chbgfjl.bfrq,TO_CHAR(cw_chbgfjl.qye),TO_CHAR(cw_chbgfjl.zhhtzcbj),TO_CHAR(cw_chbgfjl.ssk),TO_CHAR(cw_chbgfjl.yfgf),cw_chbgfjl.bfbl||'%',cw_chbgfjl.bfje,cw_chbgfjl.lrr,cw_chbgfjl.bz  ";
	ls_sql+=" FROM cw_chbgfjl,dm_gdjsjd  ";
    ls_sql+=" where cw_chbgfjl.lx=dm_gdjsjd.gdjsjd(+) ";
    ls_sql+=" and cw_chbgfjl.khbh='"+khbh+"'";
    ls_sql+=" order by cw_chbgfjl.lrsj desc";
    pageObj.sql=ls_sql;
	pageObj.initPage("Cw_chbgfjlCxList.jsp","","","");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户编号</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">合同号</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">质检姓名</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">施工队</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','')||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">施工班组</font></td>
    <td><%=sgbz%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">设计师</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">签约店面</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">客户经理</span></td>
    <td><%=khjl%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">签约日期</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><font color="#0000FF">建议交底日期</font></td>
    <td><%=jyjdrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">合同开工日期</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">合同竣工日期</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#E8E8FF"><input name="button3" type="button" onClick="window.open('/dzbjtwo/zxbjmx/Bj_khbjmxViewList.jsp?khbh=<%=khbh%>')" value="电子报价">
        <input name="button4" type="button" onClick="window.open('/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>')"  value="验收记录">
        <input name="button5" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="付款信息">
        <input name="button6" type="button" onClick="window.open('/khxx/Jxc_clpsdCxList.jsp?khbh=<%=khbh%>')"  value="领料单"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2"><font color="#0000CC">结算记录号</font></span></td>
    <td><input type="text" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>    </td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">客户编号</font></span></td>
    <td><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">施工队</font></span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
      </select>    </td>
    <td align="right"><span class="STYLE2"><font color="#0000CC">现场负责人</font></span></td>
    <td><input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE4">合同额</span></td> 
  <td width="30%"><input type="text" name="qye" value="<%=qye%>" size="20" maxlength="17" readonly></td>
  <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE4">增减项</span></td> 
  <td width="30%"><input type="text" name="zjxje" value="<%=zjxje%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE4">增项金额</span></td> 
  <td width="30%"><input type="text" name="zxje" value="<%=zxje%>" size="20" maxlength="17" readonly>
    不含水电</td>
  <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE4">减项金额</span></td> 
  <td width="30%"><input type="text" name="jxje" value="<%=jxje%>" size="20" maxlength="17" readonly>
    不含水电</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE4">合同水电路</span></td>
  <td><input type="text" name="htsdl" value="<%=htsdl%>" size="20" maxlength="17" readonly></td>
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE4"><font color="#FF0000">*</font>水电路增减项</span></td>
  <td><input type="text" name="sdlzjx" value="<%=sdlzjx%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE4">合同施工成本</span></td> 
  <td width="30%"><input type="text" name="htsgcb" value="<%=htsgcb%>" size="20" maxlength="17" readonly></td>
  <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE4">增减项施工成本</span></td> 
  <td width="30%"><input type="text" name="zjxsgcb" value="<%=zjxsgcb%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#E8E8FF">补款项目</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font>直接成本管理费比例</td> 
  <td width="30%"><input type="text" name="zjcbglfbl" value="<%=zjcbglfbl%>" size="10" maxlength="9" onChange="f_jsje(insertform)">    
    %</td>
  <td align="right" width="20%">&nbsp;</td> 
  <td width="30%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">直接成本管理费</span></td>
  <td colspan="3"><input type="text" name="zjcbglf" value="<%=zjcbglf%>" size="20" maxlength="17" >
    直接成本管理费＝施工成本(合同＋增减项)×直接成本管理费比例</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font><span class="STYLE4">水电路增项金额</span></td> 
  <td width="30%"><input type="text" name="sdlzxje" value="<%=sdlzxje%>" size="20" maxlength="17" ></td>
  <td align="right" width="20%"><font color="#FF0000">*</font>水电路成本费比例</td> 
  <td width="30%"><input type="text" name="sdlcbfbl" value="<%=sdlcbfbl%>" size="10" maxlength="9" onChange="f_jsje(insertform)">
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font><span class="STYLE4">水电路增加直接成本费</span></td> 
  <td colspan="3"><input type="text" name="sldzjcb" value="<%=sldzjcb%>" size="20" maxlength="17" >
    水电路增加直接成本费＝水电路增项金额×水电路成本费比例</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font><span class="STYLE4">合同外项目增加金额</span></td> 
  <td width="30%"><input type="text" name="htwzjje" value="<%=htwzjje%>" size="20" maxlength="17" >
    不含水电</td>
  <td align="right" width="20%"><font color="#FF0000">*</font>合同外项目增加成本比例</td> 
  <td width="30%"> 
    <input type="text" name="htwzjcbbl" value="<%=htwzjcbbl%>" size="10" maxlength="9" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font><span class="STYLE4">合同外项目增加直接成本费</span></td> 
  <td colspan="3"> 
    <input type="text" name="htwzjcb" value="<%=htwzjcb%>" size="20" maxlength="17" >
    合同外项目增加直接成本费＝合同外项目增加金额×合同外项目增加成本比例</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">施工成本人工费</span></td>
  <td colspan="3"><input type="text" name="sgcb" value="<%=sgcb%>" size="20" maxlength="17" >
    施工成本人工费＝合同施工成本价－减少项目施工成本</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font><span class="STYLE4">①材料费</span></td> 
  <td width="30%"> 
    <input type="text" name="sgcbclf" value="<%=sgcbclf%>" size="20" maxlength="17" >  </td>
  <td align="right" width="20%"><font color="#FF0000">*</font><span class="STYLE4">②人工费</span></td> 
  <td width="30%"> 
    <input type="text" name="sgcbrgf" value="<%=sgcbrgf%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font><span class="STYLE4">实收设计费</span></td> 
  <td width="30%"> 
    <input type="text" name="sssjf" value="<%=sssjf%>" size="20" maxlength="17" >  </td>
  <td align="right" width="20%"><font color="#FF0000">*</font>设计费提成比例</td> 
  <td width="30%"> 
    <input type="text" name="sjfbl" value="<%=sjfbl%>" size="10" maxlength="9" >
    %  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font><span class="STYLE4">补设计费提成</span></td> 
  <td colspan="3"> 
    <input type="text" name="sjftc" value="<%=sjftc%>" size="20" maxlength="17" >
    补设计费提成＝实收设计费×设计费提成比例</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">房屋面积</span></td>
  <td><input type="text" name="fwmj" value="<%=fwmj%>" size="20" maxlength="8" ></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">空气治理协调费</span></td>
  <td><input type="text" name="kqzlf" value="<%=kqzlf%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font>补保洁费</td> 
  <td width="30%"><input type="text" name="bbjf" value="<%=bbjf%>" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
  <td align="right" width="20%"><font color="#FF0000">*</font>补其他费用</td> 
  <td width="30%"><input type="text" name="bqtf" value="<%=bqtf%>" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">补其他费用说明</td> 
  <td colspan="3"><input type="text" name="bqtfsm" value="" size="73" maxlength="200" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font><span class="STYLE4">合同内水电金额</span></td> 
  <td width="30%"><input type="text" name="htnsdje" value="<%=htnsdje%>" size="20" maxlength="17" ></td>
  <td align="right" width="20%"><font color="#FF0000">*</font>合同内水电金额比例</td> 
  <td width="30%"> 
    <input type="text" name="htnsdjebl" value="<%=htnsdjebl%>" size="10" maxlength="9" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font><span class="STYLE4">补施工组长水电成本</span></td> 
  <td width="30%"> 
    <input type="text" name="bsdcb" value="<%=bsdcb%>" size="20" maxlength="17" >  </td>
  <td align="right" width="20%">&nbsp;</td> 
  <td width="30%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">远程费金额</span></td>
  <td><input type="text" name="ycfje" value="<%=ycfje%>" size="20" maxlength="17" ></td>
  <td align="right"><font color="#FF0000">*</font>远程费比例</td>
  <td><input type="text" name="ycfbl" value="<%=ycfbl%>" size="10" maxlength="9" onChange="f_jsje(insertform)">
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font><span class="STYLE4">补施工组长远程费</span></td> 
  <td colspan="3"><input type="text" name="bycf" value="<%=bycf%>" size="20" maxlength="17" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font><span class="STYLE4">施工组长成本合计金额</span></td> 
  <td colspan="3"> 
      <input type="text" name="cbhjje" value="<%=cbhjje%>" size="20" maxlength="17" >
<BR>     <strong>施工组长成本合计金额=直接成本管理费+水电路增加直接成本费+合同外项目增加直接成本费+施工成本人工费
<BR><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+补设计费提成+空气治理协调费+补保洁费+补其他费用+补施工组长水电成本+补施工组长远程费
</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#E8E8FF">扣款项目</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>扣工地质保金比例</td>
  <td><input type="text" name="kzbjbl" value="<%=kzbjbl%>" size="10" maxlength="9" onChange="f_jsje(insertform)">
    %</td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">扣工地质保金</span></td>
  <td><input type="text" name="kzbj" value="<%=kzbj%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font>扣风险保证金比例</td> 
  <td width="30%"> 
    <input type="text" name="kfxbzjbl" value="<%=kfxbzjbl%>" size="10" maxlength="9" onChange="f_jsje(insertform)">
    % </td>
  <td align="right" width="20%"><font color="#FF0000">*</font><span class="STYLE4">扣风险保证金</span></td> 
  <td width="30%"> 
    <input type="text" name="kfxbzj" value="<%=kfxbzj%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">扣工程预支</span></td>
  <td><input type="text" name="kgcyz" value="<%=kgcyz%>" size="20" maxlength="17" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font>施工组长信息返回</td> 
  <td width="30%"> 
    <input type="text" name="xxfh" value="<%=xxfh%>" size="20" maxlength="17" onChange="f_jsje(insertform)">  </td>
  <td align="right" width="20%"><font color="#FF0000">*</font><span class="STYLE4">材料成本</span></td> 
  <td width="30%"> 
    <input type="text" name="clcb" value="<%=clcb%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font>材料达标比例</td> 
  <td width="30%"> 
    <input type="text" name="cldbbl" value="<%=cldbbl%>" size="10" maxlength="9" >
    % </td>
  <td align="right" width="20%"><font color="#FF0000">*</font><span class="STYLE4">材料不达标扣款</span></td> 
  <td width="30%"> 
    <input type="text" name="clbdbkk" value="<%=clbdbkk%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font>承担开工减少金额</td> 
  <td width="30%"> 
    <input type="text" name="kgjsje" value="<%=kgjsje%>" size="20" maxlength="17" onChange="f_jsje(insertform)">  </td>
  <td align="right" width="20%"><font color="#FF0000">*</font>扣施工组长其他费用</td> 
  <td width="30%"> 
    <input type="text" name="kqtf" value="<%=kqtf%>" size="20" maxlength="17" onChange="f_jsje(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">扣施工组长其他费用说明</td> 
  <td colspan="3"> 
    <input type="text" name="kqtfsm" value="" size="73" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>精益工程罚款</td>
  <td><input type="text" name="kfk" value="0" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>服务监察罚款</td>
  <td><input type="text" name="fwjcfk" value="0" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>无信息扣款</td>
  <td><input type="text" name="wxxkk" value="<%=wxxkk%>" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>扣代扣款</td>
  <td><input type="text" name="kdkk" value="0" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>扣物料宣传费</td>
  <td><input type="text" name="kxcf" value="<%=kxcf%>" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font><span class="STYLE4">实际支付施工组长金额</span></td> 
  <td colspan="3"> 
    <input type="text" name="sjzfe" value="<%=sjzfe%>" size="20" maxlength="17" >
    <BR><strong>实际支付施工组长金额=施工组长成本合计金额-扣工地质保金-扣风险保证金-施工组长信息返回-材料成本
	<BR>
	-材料不达标扣款-承担开工减少金额-扣施工组长其他费用-扣物料宣传费－精益工程罚款－服务监察罚款－扣代扣款－无信息扣款</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right"><font color="#FF0000">*</font>结算日期</td>
  <td><input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>      </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_jsje(FormName)//参数FormName:Form的名称
{
	var zjcbglf=(FormName.htsgcb.value*1.0+FormName.zjxsgcb.value*1.0)*FormName.zjcbglfbl.value/100.0;
	zjcbglf=round(zjcbglf,2);
	FormName.zjcbglf.value=zjcbglf;

	var sldzjcb=FormName.sdlzxje.value*FormName.sdlcbfbl.value/100.0;
	sldzjcb=round(sldzjcb,2);
	FormName.sldzjcb.value=sldzjcb;

	var htwzjcb=FormName.htwzjje.value*FormName.htwzjcbbl.value/100.0;
	htwzjcb=round(htwzjcb,2);
	FormName.htwzjcb.value=htwzjcb;

	var sjftc=FormName.sssjf.value*FormName.sjfbl.value/100.0;
	sjftc=round(sjftc,2);
	FormName.sjftc.value=sjftc;

	var bsdcb=FormName.htnsdje.value*FormName.htnsdjebl.value/100.0;
	bsdcb=round(bsdcb,2);
	FormName.bsdcb.value=bsdcb;

	var bycf=FormName.ycfje.value*FormName.ycfbl.value/100.0;
	bycf=round(bycf,2);
	FormName.bycf.value=bycf;

	//施工组长成本合计金额
	var cbhjje=FormName.zjcbglf.value*1.0+FormName.sldzjcb.value*1.0+FormName.htwzjcb.value*1.0+FormName.sgcb.value*1.0+FormName.sjftc.value*1.0+FormName.kqzlf.value*1.0+FormName.bbjf.value*1.0+FormName.bqtf.value*1.0+FormName.bsdcb.value*1.0+FormName.bycf.value*1.0;
	cbhjje=round(cbhjje,2);
	FormName.cbhjje.value=cbhjje;

	var kzbj=FormName.cbhjje.value*FormName.kzbjbl.value/100.0;
	kzbj=round(kzbj,2);
	FormName.kzbj.value=kzbj;

	var kfxbzj=FormName.cbhjje.value*FormName.kfxbzjbl.value/100.0;
	kfxbzj=round(kfxbzj,2);
	FormName.kfxbzj.value=kfxbzj;

	//实际支付施工组长金额
	var sjzfe=FormName.cbhjje.value*1.0-FormName.kzbj.value*1.0-FormName.kfxbzj.value*1.0-FormName.kgcyz.value*1.0-FormName.xxfh.value*1.0-FormName.clcb.value*1.0-FormName.clbdbkk.value*1.0-FormName.kgjsje.value*1.0-FormName.kqtf.value*1.0-FormName.kxcf.value*1.0-FormName.kfk.value*1.0-FormName.fwjcfk.value*1.0-FormName.kdkk.value*1.0-FormName.wxxkk.value*1.0;
	sjzfe=round(sjzfe,2);
	FormName.sjzfe.value=sjzfe;
}


function f_do(FormName)//参数FormName:Form的名称
{
	f_jsje(FormName);

	if(	javaTrim(FormName.jsjlh)=="") {
		alert("请输入[结算记录号]！");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("请输入[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jsrq)=="") {
		alert("请输入[结算日期]！");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "结算日期"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[合同额]！");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "合同额"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxje)=="") {
		alert("请输入[增减项]！");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "增减项"))) {
		return false;
	}
	if(	javaTrim(FormName.zxje)=="") {
		alert("请输入[增项金额]！");
		FormName.zxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zxje, "增项金额"))) {
		return false;
	}
	if(	javaTrim(FormName.jxje)=="") {
		alert("请输入[减项金额]！");
		FormName.jxje.focus();
		return false;
	}
	if(!(isFloat(FormName.jxje, "减项金额"))) {
		return false;
	}
	if(	javaTrim(FormName.htsgcb)=="") {
		alert("请输入[合同施工成本]！");
		FormName.htsgcb.focus();
		return false;
	}
	if(!(isFloat(FormName.htsgcb, "合同施工成本"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxsgcb)=="") {
		alert("请输入[增减项施工成本]！");
		FormName.zjxsgcb.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxsgcb, "增减项施工成本"))) {
		return false;
	}
	if(	javaTrim(FormName.zjcbglfbl)=="") {
		alert("请输入[直接成本管理费比例]！");
		FormName.zjcbglfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjcbglfbl, "直接成本管理费比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zjcbglf)=="") {
		alert("请输入[直接成本管理费]！");
		FormName.zjcbglf.focus();
		return false;
	}
	if(!(isFloat(FormName.zjcbglf, "直接成本管理费"))) {
		return false;
	}
	if(	javaTrim(FormName.sdlzxje)=="") {
		alert("请输入[水电路增项金额]！");
		FormName.sdlzxje.focus();
		return false;
	}
	if(!(isFloat(FormName.sdlzxje, "水电路增项金额"))) {
		return false;
	}
	if(	javaTrim(FormName.sdlcbfbl)=="") {
		alert("请输入[水电路成本费比例]！");
		FormName.sdlcbfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sdlcbfbl, "水电路成本费比例"))) {
		return false;
	}
	if(	javaTrim(FormName.sldzjcb)=="") {
		alert("请输入[水电路增加直接成本费]！");
		FormName.sldzjcb.focus();
		return false;
	}
	if(!(isFloat(FormName.sldzjcb, "水电路增加直接成本费"))) {
		return false;
	}
	if(	javaTrim(FormName.htwzjje)=="") {
		alert("请输入[合同外项目增加金额]！");
		FormName.htwzjje.focus();
		return false;
	}
	if(!(isFloat(FormName.htwzjje, "合同外项目增加金额"))) {
		return false;
	}
	if(	javaTrim(FormName.htwzjcbbl)=="") {
		alert("请输入[合同外项目增加成本比例]！");
		FormName.htwzjcbbl.focus();
		return false;
	}
	if(!(isFloat(FormName.htwzjcbbl, "合同外项目增加成本比例"))) {
		return false;
	}
	if(	javaTrim(FormName.htwzjcb)=="") {
		alert("请输入[合同外项目增加直接成本费]！");
		FormName.htwzjcb.focus();
		return false;
	}
	if(!(isFloat(FormName.htwzjcb, "合同外项目增加直接成本费"))) {
		return false;
	}
	if(	javaTrim(FormName.sgcb)=="") {
		alert("请输入[施工成本人工费]！");
		FormName.sgcb.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcb, "施工成本人工费"))) {
		return false;
	}
	if(	javaTrim(FormName.sgcbclf)=="") {
		alert("请输入[①材料费]！");
		FormName.sgcbclf.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbclf, "①材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.sgcbrgf)=="") {
		alert("请输入[②人工费]！");
		FormName.sgcbrgf.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbrgf, "②人工费"))) {
		return false;
	}
	if(	javaTrim(FormName.sssjf)=="") {
		alert("请输入[实收设计费]！");
		FormName.sssjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sssjf, "实收设计费"))) {
		return false;
	}
	if(	javaTrim(FormName.sjfbl)=="") {
		alert("请输入[设计费提成比例]！");
		FormName.sjfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjfbl, "设计费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.sjftc)=="") {
		alert("请输入[补设计费提成]！");
		FormName.sjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjftc, "补设计费提成"))) {
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("请输入[房屋面积]！");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "房屋面积"))) {
		return false;
	}
	if(	javaTrim(FormName.kqzlf)=="") {
		alert("请输入[空气治理协调费]！");
		FormName.kqzlf.focus();
		return false;
	}
	if(!(isFloat(FormName.kqzlf, "空气治理协调费"))) {
		return false;
	}
	if(	javaTrim(FormName.bbjf)=="") {
		alert("请输入[补保洁费]！");
		FormName.bbjf.focus();
		return false;
	}
	if(!(isFloat(FormName.bbjf, "补保洁费"))) {
		return false;
	}
	if(	javaTrim(FormName.bqtf)=="") {
		alert("请输入[补其他费用]！");
		FormName.bqtf.focus();
		return false;
	}
	if(!(isFloat(FormName.bqtf, "补其他费用"))) {
		return false;
	}
	if (parseFloat(FormName.bqtf.value)!=0)
	{
		if(	javaTrim(FormName.bqtfsm)=="") {
			alert("请输入[补其他费用说明]！");
			FormName.bqtfsm.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.htnsdje)=="") {
		alert("请输入[合同内水电金额]！");
		FormName.htnsdje.focus();
		return false;
	}
	if(!(isFloat(FormName.htnsdje, "合同内水电金额"))) {
		return false;
	}
	if(	javaTrim(FormName.htnsdjebl)=="") {
		alert("请输入[合同内水电金额比例]！");
		FormName.htnsdjebl.focus();
		return false;
	}
	if(!(isFloat(FormName.htnsdjebl, "合同内水电金额比例"))) {
		return false;
	}
	if(	javaTrim(FormName.bsdcb)=="") {
		alert("请输入[补施工组长水电成本]！");
		FormName.bsdcb.focus();
		return false;
	}
	if(!(isFloat(FormName.bsdcb, "补施工组长水电成本"))) {
		return false;
	}
	if(	javaTrim(FormName.ycfje)=="") {
		alert("请输入[远程费金额]！");
		FormName.ycfje.focus();
		return false;
	}
	if(!(isFloat(FormName.ycfje, "远程费金额"))) {
		return false;
	}
	if(	javaTrim(FormName.ycfbl)=="") {
		alert("请输入[远程费比例]！");
		FormName.ycfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.ycfbl, "远程费比例"))) {
		return false;
	}
	if(	javaTrim(FormName.bycf)=="") {
		alert("请输入[补施工组长远程费]！");
		FormName.bycf.focus();
		return false;
	}
	if(!(isFloat(FormName.bycf, "补施工组长远程费"))) {
		return false;
	}
	if(	javaTrim(FormName.cbhjje)=="") {
		alert("请输入[施工组长成本合计金额]！");
		FormName.cbhjje.focus();
		return false;
	}
	if(!(isFloat(FormName.cbhjje, "施工组长成本合计金额"))) {
		return false;
	}
	if(	javaTrim(FormName.kzbjbl)=="") {
		alert("请输入[扣工地质保金比例]！");
		FormName.kzbjbl.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbjbl, "扣工地质保金比例"))) {
		return false;
	}
	if(	javaTrim(FormName.kzbj)=="") {
		alert("请输入[扣工地质保金]！");
		FormName.kzbj.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbj, "扣工地质保金"))) {
		return false;
	}
	if(	javaTrim(FormName.kgcyz)=="") {
		alert("请输入[扣工程预支]！");
		FormName.kgcyz.focus();
		return false;
	}
	if(!(isFloat(FormName.kgcyz, "扣工程预支"))) {
		return false;
	}
	if(	javaTrim(FormName.kfxbzjbl)=="") {
		alert("请输入[扣风险保证金比例]！");
		FormName.kfxbzjbl.focus();
		return false;
	}
	if(!(isFloat(FormName.kfxbzjbl, "扣风险保证金比例"))) {
		return false;
	}
	if(	javaTrim(FormName.kfxbzj)=="") {
		alert("请输入[扣风险保证金]！");
		FormName.kfxbzj.focus();
		return false;
	}
	if(!(isFloat(FormName.kfxbzj, "扣风险保证金"))) {
		return false;
	}
	if(	javaTrim(FormName.xxfh)=="") {
		alert("请输入[施工组长信息返回]！");
		FormName.xxfh.focus();
		return false;
	}
	if(!(isFloat(FormName.xxfh, "施工组长信息返回"))) {
		return false;
	}
	if(	javaTrim(FormName.clcb)=="") {
		alert("请输入[材料成本]！");
		FormName.clcb.focus();
		return false;
	}
	if(!(isFloat(FormName.clcb, "材料成本"))) {
		return false;
	}
	if(	javaTrim(FormName.cldbbl)=="") {
		alert("请输入[材料达标比例]！");
		FormName.cldbbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cldbbl, "材料达标比例"))) {
		return false;
	}
	if(	javaTrim(FormName.clbdbkk)=="") {
		alert("请输入[材料不达标扣款]！");
		FormName.clbdbkk.focus();
		return false;
	}
	if(!(isFloat(FormName.clbdbkk, "材料不达标扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.kgjsje)=="") {
		alert("请输入[承担开工减少金额]！");
		FormName.kgjsje.focus();
		return false;
	}
	if(!(isFloat(FormName.kgjsje, "承担开工减少金额"))) {
		return false;
	}
	if(	javaTrim(FormName.kqtf)=="") {
		alert("请输入[扣施工组长其他费用]！");
		FormName.kqtf.focus();
		return false;
	}
	if(!(isFloat(FormName.kqtf, "扣施工组长其他费用"))) {
		return false;
	}
	if (parseFloat(FormName.kqtf.value)!=0)
	{
		if(	javaTrim(FormName.kqtfsm)=="") {
			alert("请输入[扣施工组长其他费用说明]！");
			FormName.kqtfsm.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.kfk)=="") {
		alert("请输入[精益工程罚款]！");
		FormName.kfk.focus();
		return false;
	}
	if(!(isFloat(FormName.kfk, "精益工程罚款"))) {
		return false;
	}
	if(	javaTrim(FormName.fwjcfk)=="") {
		alert("请输入[服务监察罚款]！");
		FormName.fwjcfk.focus();
		return false;
	}
	if(!(isFloat(FormName.fwjcfk, "服务监察罚款"))) {
		return false;
	}
	if(	javaTrim(FormName.kdkk)=="") {
		alert("请输入[扣代扣款]！");
		FormName.kdkk.focus();
		return false;
	}
	if(!(isFloat(FormName.kdkk, "扣代扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.kxcf)=="") {
		alert("请输入[扣物料宣传费]！");
		FormName.kxcf.focus();
		return false;
	}
	if(!(isFloat(FormName.kxcf, "扣物料宣传费"))) {
		return false;
	}
	if(	javaTrim(FormName.wxxkk)=="") {
		alert("请输入[无信息扣款]！");
		FormName.kxcf.focus();
		return false;
	}
	if(!(isFloat(FormName.wxxkk, "无信息扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzfe)=="") {
		alert("请输入[实际支付施工组长金额]！");
		FormName.sjzfe.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzfe, "实际支付施工组长金额"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请输入[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
