<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jc_mmzjx_yddbh=null;
String jc_mmzjx_zjxxh=null;
String jc_mmzjx_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_qyrq=null;
String crm_khxx_dwbh=null;
String crm_khxx_zjxm=null;
String crm_khxx_sgd=null;
String jc_mmzjx_mmzjxyybm=null;
String jc_mmzjx_mmzjxje=null;
String jc_mmzjx_wjzjxje=null;
String jc_mmzjx_blzjxje=null;
String jc_mmzjx_zjxze=null;
String jc_mmzjx_srksj=null;
String jc_mmzjx_rkr=null;
String jc_mmzjx_rksm=null;
String jc_mmzjx_jhazsj=null;
String jc_mmzjx_azwcsj=null;
String jc_mmzjx_clzt=null;
String jc_mmzjx_lrr=null;
String jc_mmzjx_lrsj=null;
String jc_mmzjx_dwbh=null;
String qrsj=null;
String qrr=null;
String jc_mmzjx_bz=null;
String zjxfssj=null;

String pdgc=null;
String pdgcmc=null;
String gys=null;
String ppmc=null;
String clgw=null;
String ztjjgw=null;
String xmzy=null;
String mmcljs=null;
String zjxqrsj=null;
String zjxqrr=null;
String yddbh=null;

double mmzkl=0;
String dzyy=null;
double zqmmzjxje=0;
double zqwjzjxje=0;
double zqblzjxje=0;
double zqzjxze=0;

String zjxxh=request.getParameter("zjxxh");
String dqbm=cf.executeQuery("select dqbm from jc_mmydd,sq_dwxx where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'");

String ssfgsbh=null;
String qddm=null;
String jzsjs=null;
String khjl=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select yddbh,jc_mmzjx.zjxqrsj,jc_mmzjx.zjxqrr,pdgc,pdgcmc,gys,ppmc,clgw,ztjjgw,jc_mmzjx.xmzy,mmcljs,jc_mmzjx.fgsbh,jc_mmzjx.qddm,jc_mmzjx.jzsjs,zjxfssj,qrr,qrsj,jc_mmzjx.yddbh as jc_mmzjx_yddbh,jc_mmzjx.zjxxh as jc_mmzjx_zjxxh,jc_mmzjx.khbh as jc_mmzjx_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.dwbh as crm_khxx_dwbh,crm_khxx.zjxm as crm_khxx_zjxm,crm_khxx.sgd as crm_khxx_sgd,jc_mmzjx.mmzjxyybm as jc_mmzjx_mmzjxyybm,jc_mmzjx.mmzjxje as jc_mmzjx_mmzjxje,jc_mmzjx.wjzjxje as jc_mmzjx_wjzjxje,jc_mmzjx.blzjxje as jc_mmzjx_blzjxje,jc_mmzjx.zjxze as jc_mmzjx_zjxze,jc_mmzjx.srksj as jc_mmzjx_srksj,jc_mmzjx.rkr as jc_mmzjx_rkr,jc_mmzjx.rksm as jc_mmzjx_rksm,jc_mmzjx.jhazsj as jc_mmzjx_jhazsj,jc_mmzjx.azwcsj as jc_mmzjx_azwcsj,jc_mmzjx.clzt as jc_mmzjx_clzt,jc_mmzjx.lrr as jc_mmzjx_lrr,jc_mmzjx.lrsj as jc_mmzjx_lrsj,jc_mmzjx.dwbh as jc_mmzjx_dwbh,jc_mmzjx.bz as jc_mmzjx_bz ";
	ls_sql+=" ,mmzkl,dzyy,zqmmzjxje,zqwjzjxje,zqblzjxje,zqzjxze,jc_mmzjx.khjl";
	ls_sql+=" from  crm_khxx,jc_mmzjx";
	ls_sql+=" where jc_mmzjx.khbh=crm_khxx.khbh(+) and jc_mmzjx.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khjl=cf.fillNull(rs.getString("khjl"));
		mmzkl=rs.getDouble("mmzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		zqmmzjxje=rs.getDouble("zqmmzjxje");
		zqwjzjxje=rs.getDouble("zqwjzjxje");
		zqblzjxje=rs.getDouble("zqblzjxje");
		zqzjxze=rs.getDouble("zqzjxze");

		yddbh=cf.fillNull(rs.getString("yddbh"));
		zjxqrr=cf.fillNull(rs.getString("zjxqrr"));
		zjxqrsj=cf.fillNull(rs.getDate("zjxqrsj"));
		pdgc=rs.getString("pdgc");
		pdgcmc=rs.getString("pdgcmc");
		gys=rs.getString("gys");
		ppmc=rs.getString("ppmc");
		clgw=rs.getString("clgw");
		ztjjgw=rs.getString("ztjjgw");
		xmzy=rs.getString("xmzy");
		mmcljs=rs.getString("mmcljs");

		ssfgsbh=cf.fillNull(rs.getString("fgsbh"));
		qddm=cf.fillNull(rs.getString("qddm"));
		jzsjs=cf.fillNull(rs.getString("jzsjs"));
		zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));
		qrr=cf.fillNull(rs.getString("qrr"));
		qrsj=cf.fillNull(rs.getDate("qrsj"));
		jc_mmzjx_yddbh=cf.fillNull(rs.getString("jc_mmzjx_yddbh"));
		jc_mmzjx_zjxxh=cf.fillNull(rs.getString("jc_mmzjx_zjxxh"));
		jc_mmzjx_khbh=cf.fillNull(rs.getString("jc_mmzjx_khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		jc_mmzjx_mmzjxyybm=cf.fillNull(rs.getString("jc_mmzjx_mmzjxyybm"));
		jc_mmzjx_mmzjxje=cf.fillNull(rs.getString("jc_mmzjx_mmzjxje"));
		jc_mmzjx_wjzjxje=cf.fillNull(rs.getString("jc_mmzjx_wjzjxje"));
		jc_mmzjx_blzjxje=cf.fillNull(rs.getString("jc_mmzjx_blzjxje"));
		jc_mmzjx_zjxze=cf.fillNull(rs.getString("jc_mmzjx_zjxze"));
		jc_mmzjx_srksj=cf.fillNull(rs.getDate("jc_mmzjx_srksj"));
		jc_mmzjx_rkr=cf.fillNull(rs.getString("jc_mmzjx_rkr"));
		jc_mmzjx_rksm=cf.fillNull(rs.getString("jc_mmzjx_rksm"));
		jc_mmzjx_jhazsj=cf.fillNull(rs.getDate("jc_mmzjx_jhazsj"));
		jc_mmzjx_azwcsj=cf.fillNull(rs.getDate("jc_mmzjx_azwcsj"));
		jc_mmzjx_clzt=cf.fillNull(rs.getString("jc_mmzjx_clzt"));
		jc_mmzjx_lrr=cf.fillNull(rs.getString("jc_mmzjx_lrr"));
		jc_mmzjx_lrsj=cf.fillNull(rs.getDate("jc_mmzjx_lrsj"));
		jc_mmzjx_dwbh=cf.fillNull(rs.getString("jc_mmzjx_dwbh"));
		jc_mmzjx_bz=cf.fillNull(rs.getString("jc_mmzjx_bz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">木门增减项(增减项序号：<%=jc_mmzjx_zjxxh%>) </div>

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#99CCFF"> 
    <td width="19%" align="right">所属分公司</td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgsbh+"'",ssfgsbh,true);
%> </td>
    <td width="19%" align="right">所属店面</td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+qddm+"'",qddm,true);
%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" align="right"> 
      家装设计师    </td>
    <td width="32%"><%=jzsjs%> </td>
    <td width="19%" align="right">客户经理</td>
    <td width="32%"><%=khjl%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">派单工厂编号</td>
    <td width="32%"><%=pdgc%></td>
    <td width="19%" align="right">派单工厂名称</td>
    <td width="32%"><%=pdgcmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">供应商</td>
    <td width="32%"><%=gys%></td>
    <td width="19%" align="right">品牌</td>
    <td width="32%"><%=ppmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">驻店家居顾问</td>
    <td width="32%"><%=clgw%></td>
    <td width="19%" align="right">展厅家居顾问</td>
    <td width="32%"><%=ztjjgw%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">项目专员</td>
    <td width="32%"><%=xmzy%></td>
    <td width="19%" align="right">木门测量技师</td>
    <td width="32%"><%=mmcljs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"> 
      客户编号    </td>
    <td width="32%"> <%=jc_mmzjx_khbh%> </td>
    <td width="19%" align="right"> 
      合同号    </td>
    <td width="32%"><%=crm_khxx_hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">房屋地址</td>
    <td colspan="3"><%=crm_khxx_fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"> 
      客户姓名    </td>
    <td width="32%"><%=crm_khxx_khxm%> </td>
    <td width="19%" align="right"> 
      签约日期    </td>
    <td width="32%"><%=crm_khxx_qyrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"> 
      签约店面    </td>
    <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_khxx_dwbh+"'",crm_khxx_dwbh,true);
%> </td>
    <td width="19%" align="right"> 
      设计师    </td>
    <td width="32%"><%=crm_khxx_sjs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"> 
      施工队    </td>
    <td width="32%"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%> </td>
    <td width="19%" align="right"> 
      质检    </td>
    <td width="32%"> <%=crm_khxx_zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"> 
      增减项原因    </td>
    <td width="32%"><%
	cf.selectItem(out,"select mmzjxyybm,mmzjxyymc from jdm_mmzjxyybm order by mmzjxyybm",jc_mmzjx_mmzjxyybm,true);
%></td>
    <td width="19%" align="right"> 
      <font color="#FF0000">*</font>增减项发生时间    </td>
    <td width="32%"><%=zjxfssj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="19" align="right">折扣率</td>
    <td height="19"><%=mmzkl%></td>
    <td height="19" align="right">&nbsp;</td>
    <td height="19">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="19" align="right">打折原因</td>
    <td height="19" colspan="3"><%=dzyy%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="19%" align="right"><strong> 折前-木门增减项金额 </strong></td>
    <td width="32%"><%=zqmmzjxje%> </td>
    <td width="19%" align="right"><font color="#0000CC"><strong> 折后-木门增减项金额 </strong></font></td>
    <td width="32%"><%=jc_mmzjx_mmzjxje%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>折前-五金增减项金额</strong></td>
    <td><%=zqwjzjxje%></td>
    <td align="right"><font color="#0000CC"><strong>折后-五金增减项金额</strong></font></td>
    <td><%=jc_mmzjx_wjzjxje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="19%" align="right"><strong> 折前-玻璃增减项金额 </strong></td>
    <td width="32%"><%=zqblzjxje%> </td>
    <td width="19%" align="right"><font color="#0000CC"><strong> 折后-玻璃增减项金额 </strong></font></td>
    <td width="32%"><%=jc_mmzjx_blzjxje%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>折前-增减项总额</strong></td>
    <td><%=zqzjxze%></td>
    <td align="right"><font color="#0000CC"><strong>折后-增减项总额</strong></font></td>
    <td><%=jc_mmzjx_zjxze%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">增减项确认时间</td>
    <td width="32%"><%=zjxqrsj%></td>
    <td width="19%" align="right">增减项确认人</td>
    <td width="32%"><%=zjxqrr%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">工厂接收时间</td>
    <td width="32%"><%=qrsj%></td>
    <td width="19%" align="right">工厂接收人</td>
    <td width="32%"><%=qrr%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"> 
      实入库时间    </td>
    <td width="32%"><%=jc_mmzjx_srksj%> </td>
    <td width="19%" align="right"> 
      入库人    </td>
    <td width="32%"><%=jc_mmzjx_rkr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">入库说明</td>
    <td colspan="3"><%=jc_mmzjx_rksm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"> 
      计划安装时间    </td>
    <td width="32%"> <%=jc_mmzjx_jhazsj%> </td>
    <td width="19%" align="right"> 
      安装完成时间    </td>
    <td width="32%"> <%=jc_mmzjx_azwcsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"> 
      处理状态    </td>
    <td width="32%"> <%
	cf.selectToken(out,"00+录入未完成&01+录入已完成&05+增减项确认&02+工厂已接收&03+已入库&04+安装完成&99+取消订单",jc_mmzjx_clzt,true);
%> </td>
    <td width="19%" align="right"> 
      录入人    </td>
    <td width="32%"> <%=jc_mmzjx_lrr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"> 
      录入时间    </td>
    <td width="32%"> <%=jc_mmzjx_lrsj%> </td>
    <td width="19%" align="right"> 
      录入部门    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jc_mmzjx_dwbh+"'",jc_mmzjx_dwbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">备注</td>
    <td colspan="3"><%=jc_mmzjx_bz%></td>
  </tr>
</table>
<CENTER >
  <font size="2">木门增减项明细</font>
</CENTER>
<table border="1" width="190%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">类型</td>
	<td  width="3%">订购类型</td>
	<td  width="3%">门类型</td>
	<td  width="3%">木门型号</td>
	<td  width="6%">材质</td>
	<td  width="4%">油色</td>
	<td  width="4%">安装位置</td>
	<td  width="4%">开启方向</td>
	<td  width="4%">门套线</td>
	<td  width="4%">门芯线</td>
	<td  width="3%">地材种类</td>
	<td  width="3%">地板厚</td>
	<td  width="6%">门洞宽×高×墙厚</td>
	<td  width="3%">踢脚线</td>
	<td  width="4%">玻璃型号</td>
	<td  width="3%">窗套边数</td>
	<td  width="4%">门套/哑口材质</td>
	<td  width="3%">是否有顶窗</td>
	<td  width="3%">折前单价</td>
	<td  width="3%">折后单价</td>
	<td  width="3%" bgcolor="#99CCFF">原数量</td>
	<td  width="3%" bgcolor="#99CCFF">新数量</td>
	<td  width="3%">折前增减金额</td>
	<td  width="3%">折后增减金额</td>
	<td  width="6%">照片</td>
	<td  width="13%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT DECODE(jc_mmdgdmx.lx,'1','合同','2','增项') lx,mmdglxmc,mlxmc,jc_mmdgdmx.mmxh,mmczmc,czmc,azwzmc,kqfxmc,mtxmc,mxxmc,dczlmc,TO_CHAR(jc_mmdgdmx.dbh) dbh, jc_mmdgdmx.mdk||'×'||jc_mmdgdmx.mdg||'×'||jc_mmdgdmx.qh md,TO_CHAR(jc_mmdgdmx.tjx) tjx,blxh, DECODE(jc_mmdgdmx.ctbs,'3','三边','4','四边') ctbs,DECODE(sfsmjcc,'Y','松木集成材','N','非松木集成材') sfsmjcc,DECODE(sfydc,'Y','有顶窗','N','无顶窗') sfydc,TO_CHAR(jc_mmdgdmx.bzdj) bzdj,TO_CHAR(jc_mmdgdmx.dj) dj,jc_mmzjxmx.ysl,jc_mmzjxmx.xsl,(jc_mmzjxmx.xsl-jc_mmzjxmx.ysl)*jc_mmdgdmx.bzdj,(jc_mmzjxmx.xsl-jc_mmzjxmx.ysl)*jc_mmdgdmx.dj,NVL2(jc_mmxhb.zp,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\">','') zp,jc_mmdgdmx.bz  ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_mmdglx,jc_mmdgdmx,jc_mmzjxmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jdm_dczlbm,jc_mmxhb,jdm_mtxbm,jdm_mxxbm   ";
	ls_sql+=" where jc_mmdgdmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
	ls_sql+=" and jc_mmdgdmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmdgdmx.czbm=dm_czbm.czbm(+) and jc_mmdgdmx.ysbm=jdm_mmczbm.mmczbm";
	ls_sql+=" and jc_mmdgdmx.mmdglxbm=jc_mmdglx.mmdglxbm(+)";
	ls_sql+=" and jc_mmdgdmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmdgdmx.dczlbm=jdm_dczlbm.dczlbm(+)";
	ls_sql+=" and  jc_mmdgdmx.mlx=jdm_mlx.mlx(+) and jc_mmdgdmx.xh=jc_mmzjxmx.xh and jc_mmdgdmx.mtxbm=jdm_mtxbm.mtxbm(+) and jc_mmdgdmx.mxxbm=jdm_mxxbm.mxxbm(+)";
	ls_sql+=" and jc_mmzjxmx.zjxxh="+zjxxh;
    ls_sql+=" and jc_mmxhb.dqbm(+)='"+dqbm+"'";
	ls_sql+=" order by jc_mmdgdmx.lx,jc_mmdgdmx.mmxh";
	pageObj.sql=ls_sql;
	//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
	pageObj.displayFoot();

%>
</table>
<CENTER >
  <font size="2">五金减项明细</font>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="5%">类型</td>
	<td  width="16%">五金名称</td>
	<td  width="8%">五金类别</td>
	<td  width="8%">型号</td>
	<td  width="8%">锁把手</td>
	<td  width="6%">折前单价</td>
	<td  width="6%">折后单价</td>
	<td  width="5%" bgcolor="#99CCFF">原数量</td>
	<td  width="5%" bgcolor="#99CCFF">新数量</td>
	<td  width="6%">折前增减金额</td>
	<td  width="6%">折后增减金额</td>
	<td  width="18%">备注</td>
</tr>
<%
	ls_sql="SELECT TO_CHAR(jc_wjjddmx.lrxh) lrxh,DECODE(jc_wjjddmx.lx,'1','合同项','2','增项') lx,wjmc,jdm_wjjbm.wjjmc as jdm_wjjbm_wjjmc,jc_wjjddmx.xinghao as jc_wjjbj_xinghao,mmsbsmc,TO_CHAR(jc_wjjddmx.bzdj),TO_CHAR(jc_wjjddmx.dj) as jc_wjjddmx_dj,jc_wjzjxmx.ysl,jc_wjzjxmx.xsl ,(jc_wjzjxmx.xsl-jc_wjzjxmx.ysl)*jc_wjjddmx.bzdj,(jc_wjzjxmx.xsl-jc_wjzjxmx.ysl)*jc_wjjddmx.dj,jc_wjjddmx.bz as jc_wjjddmx_bz  ";
	ls_sql+=" FROM jc_wjjddmx,jc_wjzjxmx,jdm_wjjbm,jdm_mmsbsbm  ";
    ls_sql+=" where jc_wjjddmx.wjjbm=jdm_wjjbm.wjjbm ";
    ls_sql+=" and jc_wjjddmx.mmsbsbm=jdm_mmsbsbm.mmsbsbm(+) and jc_wjjddmx.lrxh=jc_wjzjxmx.lrxh";
	ls_sql+=" and jc_wjzjxmx.zjxxh="+zjxxh;
    ls_sql+=" order by jc_wjjddmx.yddbh,jc_wjjddmx.lrxh";
	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
	pageObj.displayFoot();

%>
</table>
<CENTER >
  <font size="2">玻璃减项明细</font>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">序号</td>
	<td  width="6%">类型</td>
	<td  width="24%">玻璃型号</td>
	<td  width="6%">折前单价</td>
	<td  width="6%">折后单价</td>
	<td  width="5%" bgcolor="#99CCFF">原数量</td>
	<td  width="5%" bgcolor="#99CCFF">新数量</td>
	<td  width="8%">折前增减金额</td>
	<td  width="8%">折后增减金额</td>
	<td  width="28%">备注</td>
</tr>
<%
	ls_sql="SELECT TO_CHAR(jc_blddmx.lrxh) lrxh,DECODE(jc_blddmx.lx,'1','合同项','2','增项') lx,blxh,TO_CHAR(jc_blddmx.bzdj),TO_CHAR(jc_blddmx.dj) as jc_blddmx_dj,jc_blzjxmx.ysl,jc_blzjxmx.xsl,(jc_blzjxmx.xsl-jc_blzjxmx.ysl)*jc_blddmx.bzdj,(jc_blzjxmx.xsl-jc_blzjxmx.ysl)*jc_blddmx.dj,jc_blddmx.bz as jc_blddmx_bz  ";
	ls_sql+=" FROM jc_blddmx,jc_blzjxmx  ";
    ls_sql+=" where jc_blddmx.lrxh=jc_blzjxmx.lrxh";
	ls_sql+=" and jc_blzjxmx.zjxxh="+zjxxh;
    ls_sql+=" order by jc_blddmx.yddbh,jc_blddmx.lrxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
	pageObj.displayFoot();

%>
</table>
</body>
</html>
