<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>合并客户信息详情</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">


<%
String khbh1=cf.GB2Uni(request.getParameter("khbh1"));
String khbh2=cf.GB2Uni(request.getParameter("khbh2"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
%>


<form method="post" action="" name="selectform" target="_blank">
  <table width="100%" border="0">
    <tr align="center"> 
      <td colspan="2">合并客户信息详情 
        <input type="button"  value="开始合并" onClick="f_do(selectform)" name="button">
	  <input type="hidden" name="khbh1" value="<%=khbh1%>">
	  <input type="hidden" name="khbh2" value="<%=khbh2%>">
      </td>
    </tr>
    <tr> 
      <td align="center" width="50%" bgcolor="#CCCCFF"><b>删除客户信息</b></td>
      <td align="center" width="50%" bgcolor="#CCFFCC"><b>保留客户信息</b></td>
    </tr>
    <tr> 
      <td width="50%" height="233" valign="top"> 
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <%
	String khbh=null;
	String hth=null;
	String khxm=null;
	String lxfs=null;
	String fwdz=null;
	String sjs=null;
	String zjxm=null;
	String gcjdmc=null;
	String sgdmc=null;
	String qyrq=null;
	String jzkfkcs=null;
	String qye=null;
	String sfke=null;

	ls_sql="select khbh,hth,khxm,lxfs,fwdz,sjs,zjxm,gcjdmc,sgdmc,qyrq,jzkfkcs,qye,sfke";
	ls_sql+=" from  crm_khxx,dm_gcjdbm,sq_sgd";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh1+"' ";
	ls_sql+=" order by khxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=rs.getString("khxm");
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		gcjdmc=cf.fillHtml(rs.getString("gcjdmc"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		jzkfkcs=cf.fillNull(rs.getString("jzkfkcs"));
		qye=cf.fillNull(rs.getString("qye"));
		sfke=cf.fillNull(rs.getString("sfke"));
	}
	else{
		out.println("错误！【删除客户】不存在");
		return;
	}
	rs.close();
	ps.close();
%> 
          <tr bgcolor="#FFFFFF"> 
            <td align="right" width="24%" bgcolor="#E8E8FF">合同号</td>
            <td width="26%"><%=hth%> </td>
            <td width="23%" bgcolor="#E8E8FF" align="right">客户编号</td>
            <td width="27%"><%=khbh%> 
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align="right" width="24%" bgcolor="#E8E8FF">姓名</td>
            <td colspan="3"><%=khxm%>（<%=lxfs%>）</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align="right" width="24%" bgcolor="#E8E8FF">房屋地址</td>
            <td colspan="3"><%=fwdz%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align="right" width="24%" bgcolor="#E8E8FF">设计师</td>
            <td width="26%"><%=sjs%> </td>
            <td align="right" bgcolor="#E8E8FF" width="23%">工程进度</td>
            <td width="27%"><%=gcjdmc%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align="right" width="24%" bgcolor="#E8E8FF">施工队</td>
            <td width="26%"><%=sgdmc%></td>
            <td align="right" bgcolor="#E8E8FF" width="23%">工程担当</td>
            <td width="27%"><%=zjxm%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align="right" width="24%" bgcolor="#E8E8FF">签约日期</td>
            <td width="26%"><%=qyrq%></td>
            <td align="right" bgcolor="#E8E8FF" width="23%">签约额</td>
            <td width="27%"><%=qye%>￥</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align="right" width="24%" bgcolor="#E8E8FF">家装收款期数</td>
            <td width="26%"><%
		cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs where fkcs='"+jzkfkcs+"'",jzkfkcs,true);
		%></td>
            <td align="right" bgcolor="#E8E8FF" width="23%">家装实收款</td>
            <td width="27%"><%=sfke%>￥</td>
          </tr>
        </table>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr align="center" bgcolor="#E8E8FF"> 
            <td width="17%">序号</td>
            <td width="22%">收款类型</td>
            <td width="24%">收款品牌</td>
            <td width="18%">金额</td>
            <td width="19%">收款时间</td>
          </tr>
          <%
	String fkxh=null;
	String fklxmc=null;
	String fkcsmc=null;
	String gysbh=null;
	double fkje=0;
	double allfkje=0;
	String sksj=null;
	ls_sql="SELECT fklxmc,fkcsmc,cw_khfkjl.gysbh,cw_khfkjl.fkje,fkxh,cw_khfkjl.skr,cw_khfkjl.sksj,cw_khfkjl.bz  ";
	ls_sql+=" FROM cw_khfkjl,cw_fklxbm,cw_fkcs  ";
	ls_sql+=" where cw_khfkjl.fklxbm=cw_fklxbm.fklxbm";
	ls_sql+=" and cw_khfkjl.fkcs=cw_fkcs.fkcs(+)";
	ls_sql+=" and cw_khfkjl.khbh='"+khbh1+"'";
	ls_sql+=" and cw_khfkjl.scbz='N'";
	ls_sql+=" order by cw_khfkjl.fkxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fkxh=rs.getString("fkxh");
		fklxmc=cf.fillHtml(rs.getString("fklxmc"));
		fkcsmc=cf.fillHtml(rs.getString("fkcsmc"));
		gysbh=cf.fillHtml(rs.getString("gysbh"));
		fkje=rs.getDouble("fkje");
		sksj=cf.fillHtml(rs.getDate("sksj"));

		allfkje+=fkje;

		%> 
          <tr align="center" bgcolor="#FFFFFF"> 
            <td><A HREF="/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh=<%=fkxh%>" target="_blank"><%=fkxh%></A></td>
            <td><%=fklxmc%></td>
            <td><%=gysbh%></td>
            <td><%=fkje%></td>
            <td><%=sksj%></td>
          </tr>
          <%
	}
	rs.close();
	ps.close();
%> 
          <tr align="center" bgcolor="#FFFFFF"> 
            <td>合 计</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><%=allfkje%></td>
            <td>&nbsp;</td>
          </tr>
        </table>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr align="center" bgcolor="#E8E8FF"> 
            <td width="17%">订单编号</td>
            <td width="28%">木门工厂</td>
            <td width="19%">订单状态</td>
            <td width="17%">合同金额</td>
            <td width="19%">合同日期</td>
          </tr>
          <%
	String yddbh=null;
	String pdgcmc=null;
	double htje=0;
	double allhtje=0;
	String htrq=null;
	String bz=null;
	String clztmc=null;
	ls_sql="SELECT yddbh,pdgcmc,htje,htrq,bz,clztmc  ";
	ls_sql+=" FROM jc_mmydd,jdm_mmyddzt  ";
	ls_sql+=" where jc_mmydd.clzt=jdm_mmyddzt.clzt";
	ls_sql+=" and jc_mmydd.khbh='"+khbh1+"'";
	ls_sql+=" order by jc_mmydd.yddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		yddbh=rs.getString("yddbh");
		pdgcmc=cf.fillHtml(rs.getString("pdgcmc"));
		htje=rs.getDouble("htje");
		htrq=cf.fillHtml(rs.getDate("htrq"));
		bz=cf.fillHtml(rs.getString("bz"));
		clztmc=cf.fillHtml(rs.getString("clztmc"));

		allhtje+=htje;

		%> 
          <tr align="center" bgcolor="#FFFFFF"> 
            <td><A HREF="/jcjj/mmdd/ViewJc_mmydd.jsp?yddbh=<%=yddbh%>" target="_blank"><%=yddbh%></A></td>
            <td><%=pdgcmc%></td>
            <td><%=clztmc%></td>
            <td><%=htje%></td>
            <td><%=htrq%></td>
          </tr>
          <%
	}
	rs.close();
	ps.close();
%> 
        </table>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr align="center" bgcolor="#E8E8FF"> 
            <td width="17%">订单编号</td>
            <td width="28%">橱柜工厂</td>
            <td width="19%">订单状态</td>
            <td width="17%">合同金额</td>
            <td width="19%">合同日期</td>
          </tr>
          <%
	String ddbh=null;
	double htze=0;
	double allhtze=0;
	String qhtsj=null;
	ls_sql="SELECT ddbh,pdgcmc,htze,qhtsj,bz,clztmc  ";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt  ";
	ls_sql+=" where jc_cgdd.clzt=jdm_cgddzt.clzt";
	ls_sql+=" and jc_cgdd.khbh='"+khbh1+"'";
	ls_sql+=" order by jc_cgdd.ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ddbh=rs.getString("ddbh");
		pdgcmc=cf.fillHtml(rs.getString("pdgcmc"));
		htze=rs.getDouble("htze");
		qhtsj=cf.fillHtml(rs.getDate("qhtsj"));
		bz=cf.fillHtml(rs.getString("bz"));
		clztmc=cf.fillHtml(rs.getString("clztmc"));

		allhtze+=htze;

		%> 
          <tr align="center" bgcolor="#FFFFFF"> 
            <td><A HREF="/jcjj/cgdd/ViewJc_cgdd.jsp?ddbh=<%=ddbh%>" target="_blank"><%=ddbh%></A></td>
            <td><%=pdgcmc%></td>
            <td><%=clztmc%></td>
            <td><%=htze%></td>
            <td><%=qhtsj%></td>
          </tr>
          <%
	}
	rs.close();
	ps.close();
%> 
        </table>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr align="center" bgcolor="#E8E8FF"> 
            <td width="17%">订单编号</td>
            <td width="28%">家具工厂</td>
            <td width="19%">订单状态</td>
            <td width="17%">合同金额</td>
            <td width="19%">合同日期</td>
          </tr>
          <%
	ls_sql="SELECT ddbh,pdgcmc,htze,qhtsj,bz,clztmc  ";
	ls_sql+=" FROM jc_jjdd,jdm_cgddzt  ";
	ls_sql+=" where jc_jjdd.clzt=jdm_cgddzt.clzt";
	ls_sql+=" and jc_jjdd.khbh='"+khbh1+"'";
	ls_sql+=" order by jc_jjdd.ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ddbh=rs.getString("ddbh");
		pdgcmc=cf.fillHtml(rs.getString("pdgcmc"));
		htze=rs.getDouble("htze");
		qhtsj=cf.fillHtml(rs.getDate("qhtsj"));
		bz=cf.fillHtml(rs.getString("bz"));
		clztmc=cf.fillHtml(rs.getString("clztmc"));

		allhtze+=htze;

		%> 
          <tr align="center" bgcolor="#FFFFFF"> 
            <td><A HREF="/jcjj/jjdd/ViewJc_jjdd.jsp?ddbh=<%=ddbh%>" target="_blank"><%=ddbh%></A></td>
            <td><%=pdgcmc%></td>
            <td><%=clztmc%></td>
            <td><%=htze%></td>
            <td><%=qhtsj%></td>
          </tr>
          <%
	}
	rs.close();
	ps.close();
%> 
        </table>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr align="center" bgcolor="#E8E8FF"> 
            <td width="17%">订单编号</td>
            <td width="28%">主材品牌</td>
            <td width="19%">订单状态</td>
            <td width="17%">合同金额</td>
            <td width="19%">合同日期</td>
          </tr>
          <%
	String ppbm=null;
	double hkze=0;
	double allhkze=0;

	ls_sql="SELECT ddbh,ppbm,hkze,qhtsj,bz,clztmc  ";
	ls_sql+=" FROM jc_zcdd,jdm_zcddzt  ";
	ls_sql+=" where jc_zcdd.clzt=jdm_zcddzt.clzt";
	ls_sql+=" and jc_zcdd.khbh='"+khbh1+"'";
	ls_sql+=" order by jc_zcdd.ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ddbh=rs.getString("ddbh");
		ppbm=cf.fillHtml(rs.getString("ppbm"));
		hkze=rs.getDouble("hkze");
		qhtsj=cf.fillHtml(rs.getDate("qhtsj"));
		bz=cf.fillHtml(rs.getString("bz"));
		clztmc=cf.fillHtml(rs.getString("clztmc"));

		allhkze+=hkze;

		%> 
          <tr align="center" bgcolor="#FFFFFF"> 
            <td><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target="_blank"><%=ddbh%></A></td>
            <td><%=ppbm%></td>
            <td><%=clztmc%></td>
            <td><%=hkze%></td>
            <td><%=qhtsj%></td>
          </tr>
          <%
	}
	rs.close();
	ps.close();
%> 
        </table>
      </td>
      <td width="50%" height="233" valign="top"> 
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <%
	ls_sql="select khbh,hth,khxm,lxfs,fwdz,sjs,zjxm,gcjdmc,sgdmc,qyrq,jzkfkcs,qye,sfke";
	ls_sql+=" from  crm_khxx,dm_gcjdbm,sq_sgd";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh2+"' ";
	ls_sql+=" order by khxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=rs.getString("khxm");
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		gcjdmc=cf.fillHtml(rs.getString("gcjdmc"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		jzkfkcs=cf.fillNull(rs.getString("jzkfkcs"));
		qye=cf.fillNull(rs.getString("qye"));
		sfke=cf.fillNull(rs.getString("sfke"));
	}
	else{
		out.println("错误！【保留客户】不存在");
		return;
	}
	rs.close();
	ps.close();
%> 
          <tr bgcolor="#FFFFFF"> 
            <td align="right" width="24%" bgcolor="#E8E8FF">合同号</td>
            <td width="26%"><%=hth%> </td>
            <td width="23%" bgcolor="#E8E8FF" align="right">客户编号</td>
            <td width="27%"><%=khbh%> 
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align="right" width="24%" bgcolor="#E8E8FF">姓名</td>
            <td colspan="3"><%=khxm%>（<%=lxfs%>）</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align="right" width="24%" bgcolor="#E8E8FF">房屋地址</td>
            <td colspan="3"><%=fwdz%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align="right" width="24%" bgcolor="#E8E8FF">设计师</td>
            <td width="26%"><%=sjs%> </td>
            <td align="right" bgcolor="#E8E8FF" width="23%">工程进度</td>
            <td width="27%"><%=gcjdmc%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align="right" width="24%" bgcolor="#E8E8FF">施工队</td>
            <td width="26%"><%=sgdmc%></td>
            <td align="right" bgcolor="#E8E8FF" width="23%">工程担当</td>
            <td width="27%"><%=zjxm%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align="right" width="24%" bgcolor="#E8E8FF">签约日期</td>
            <td width="26%"><%=qyrq%></td>
            <td align="right" bgcolor="#E8E8FF" width="23%">签约额</td>
            <td width="27%"><%=qye%>￥</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align="right" width="24%" bgcolor="#E8E8FF">家装收款期数</td>
            <td width="26%"><%
		cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs where fkcs='"+jzkfkcs+"'",jzkfkcs,true);
		%></td>
            <td align="right" bgcolor="#E8E8FF" width="23%">家装实收款</td>
            <td width="27%"><%=sfke%>￥</td>
          </tr>
        </table>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr align="center" bgcolor="#E8E8FF"> 
            <td width="17%">序号</td>
            <td width="22%">收款类型</td>
            <td width="24%">收款品牌</td>
            <td width="18%">金额</td>
            <td width="19%">收款时间</td>
          </tr>
          <%
	allfkje=0;
	ls_sql="SELECT fklxmc,fkcsmc,cw_khfkjl.gysbh,cw_khfkjl.fkje,fkxh,cw_khfkjl.skr,cw_khfkjl.sksj,cw_khfkjl.bz  ";
	ls_sql+=" FROM cw_khfkjl,cw_fklxbm,cw_fkcs  ";
	ls_sql+=" where cw_khfkjl.fklxbm=cw_fklxbm.fklxbm";
	ls_sql+=" and cw_khfkjl.fkcs=cw_fkcs.fkcs(+)";
	ls_sql+=" and cw_khfkjl.khbh='"+khbh2+"'";
	ls_sql+=" and cw_khfkjl.scbz='N'";
	ls_sql+=" order by cw_khfkjl.fkxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fkxh=rs.getString("fkxh");
		fklxmc=cf.fillHtml(rs.getString("fklxmc"));
		fkcsmc=cf.fillHtml(rs.getString("fkcsmc"));
		gysbh=cf.fillHtml(rs.getString("gysbh"));
		fkje=rs.getDouble("fkje");
		sksj=cf.fillHtml(rs.getDate("sksj"));

		allfkje+=fkje;

		%> 
          <tr align="center" bgcolor="#FFFFFF"> 
            <td><A HREF="/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh=<%=fkxh%>" target="_blank"><%=fkxh%></A></td>
            <td><%=fklxmc%></td>
            <td><%=gysbh%></td>
            <td><%=fkje%></td>
            <td><%=sksj%></td>
          </tr>
          <%
	}
	rs.close();
	ps.close();
%> 
          <tr align="center" bgcolor="#FFFFFF"> 
            <td>合 计</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><%=cf.formatDouble(allfkje)%></td>
            <td>&nbsp;</td>
          </tr>
        </table>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr align="center" bgcolor="#E8E8FF"> 
            <td width="17%">订单编号</td>
            <td width="28%">木门工厂</td>
            <td width="19%">订单状态</td>
            <td width="17%">合同金额</td>
            <td width="19%">合同日期</td>
          </tr>
          <%
	ls_sql="SELECT yddbh,pdgcmc,htje,htrq,bz,clztmc  ";
	ls_sql+=" FROM jc_mmydd,jdm_mmyddzt  ";
	ls_sql+=" where jc_mmydd.clzt=jdm_mmyddzt.clzt";
	ls_sql+=" and jc_mmydd.khbh='"+khbh2+"'";
	ls_sql+=" order by jc_mmydd.yddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		yddbh=rs.getString("yddbh");
		pdgcmc=cf.fillHtml(rs.getString("pdgcmc"));
		htje=rs.getDouble("htje");
		htrq=cf.fillHtml(rs.getDate("htrq"));
		bz=cf.fillHtml(rs.getString("bz"));
		clztmc=cf.fillHtml(rs.getString("clztmc"));

		allhtje+=htje;

		%> 
          <tr align="center" bgcolor="#FFFFFF"> 
            <td><A HREF="/jcjj/mmdd/ViewJc_mmydd.jsp?yddbh=<%=yddbh%>" target="_blank"><%=yddbh%></A></td>
            <td><%=pdgcmc%></td>
            <td><%=clztmc%></td>
            <td><%=htje%></td>
            <td><%=htrq%></td>
          </tr>
          <%
	}
	rs.close();
	ps.close();
%> 
        </table>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr align="center" bgcolor="#E8E8FF"> 
            <td width="17%">订单编号</td>
            <td width="28%">橱柜工厂</td>
            <td width="19%">订单状态</td>
            <td width="17%">合同金额</td>
            <td width="19%">合同日期</td>
          </tr>
          <%
	ls_sql="SELECT ddbh,pdgcmc,htze,qhtsj,bz,clztmc  ";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt  ";
	ls_sql+=" where jc_cgdd.clzt=jdm_cgddzt.clzt";
	ls_sql+=" and jc_cgdd.khbh='"+khbh2+"'";
	ls_sql+=" order by jc_cgdd.ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ddbh=rs.getString("ddbh");
		pdgcmc=cf.fillHtml(rs.getString("pdgcmc"));
		htze=rs.getDouble("htze");
		qhtsj=cf.fillHtml(rs.getDate("qhtsj"));
		bz=cf.fillHtml(rs.getString("bz"));
		clztmc=cf.fillHtml(rs.getString("clztmc"));

		allhtze+=htze;

		%> 
          <tr align="center" bgcolor="#FFFFFF"> 
            <td><A HREF="/jcjj/cgdd/ViewJc_cgdd.jsp?ddbh=<%=ddbh%>" target="_blank"><%=ddbh%></A></td>
            <td><%=pdgcmc%></td>
            <td><%=clztmc%></td>
            <td><%=htze%></td>
            <td><%=qhtsj%></td>
          </tr>
          <%
	}
	rs.close();
	ps.close();
%> 
        </table>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr align="center" bgcolor="#E8E8FF"> 
            <td width="17%">订单编号</td>
            <td width="28%">家具工厂</td>
            <td width="19%">订单状态</td>
            <td width="17%">合同金额</td>
            <td width="19%">合同日期</td>
          </tr>
          <%
	ls_sql="SELECT ddbh,pdgcmc,htze,qhtsj,bz,clztmc  ";
	ls_sql+=" FROM jc_jjdd,jdm_cgddzt  ";
	ls_sql+=" where jc_jjdd.clzt=jdm_cgddzt.clzt";
	ls_sql+=" and jc_jjdd.khbh='"+khbh2+"'";
	ls_sql+=" order by jc_jjdd.ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ddbh=rs.getString("ddbh");
		pdgcmc=cf.fillHtml(rs.getString("pdgcmc"));
		htze=rs.getDouble("htze");
		qhtsj=cf.fillHtml(rs.getDate("qhtsj"));
		bz=cf.fillHtml(rs.getString("bz"));
		clztmc=cf.fillHtml(rs.getString("clztmc"));

		allhtze+=htze;

		%> 
          <tr align="center" bgcolor="#FFFFFF"> 
            <td><A HREF="/jcjj/jjdd/ViewJc_jjdd.jsp?ddbh=<%=ddbh%>" target="_blank"><%=ddbh%></A></td>
            <td><%=pdgcmc%></td>
            <td><%=clztmc%></td>
            <td><%=htze%></td>
            <td><%=qhtsj%></td>
          </tr>
          <%
	}
	rs.close();
	ps.close();
%> 
        </table>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr align="center" bgcolor="#E8E8FF"> 
            <td width="17%">订单编号</td>
            <td width="28%">主材品牌</td>
            <td width="19%">订单状态</td>
            <td width="17%">合同金额</td>
            <td width="19%">合同日期</td>
          </tr>
          <%
	ls_sql="SELECT ddbh,ppbm,hkze,qhtsj,bz,clztmc  ";
	ls_sql+=" FROM jc_zcdd,jdm_zcddzt  ";
	ls_sql+=" where jc_zcdd.clzt=jdm_zcddzt.clzt";
	ls_sql+=" and jc_zcdd.khbh='"+khbh2+"'";
	ls_sql+=" order by jc_zcdd.ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ddbh=rs.getString("ddbh");
		ppbm=cf.fillHtml(rs.getString("ppbm"));
		hkze=rs.getDouble("hkze");
		qhtsj=cf.fillHtml(rs.getDate("qhtsj"));
		bz=cf.fillHtml(rs.getString("bz"));
		clztmc=cf.fillHtml(rs.getString("clztmc"));

		allhkze+=hkze;

		%> 
          <tr align="center" bgcolor="#FFFFFF"> 
            <td><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target="_blank"><%=ddbh%></A></td>
            <td><%=ppbm%></td>
            <td><%=clztmc%></td>
            <td><%=hkze%></td>
            <td><%=qhtsj%></td>
          </tr>
          <%
	}
	rs.close();
	ps.close();
%> 
        </table>
      </td>
    </tr>
    <tr> 
      <td width="50%">&nbsp;</td>
      <td width="50%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="50%">&nbsp;</td>
      <td width="50%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="50%">&nbsp;</td>
      <td width="50%">&nbsp;</td>
    </tr>
  </table>
  </form>

</body>
</html>


<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e)
	{
		if (conn != null) cf.close(conn); 
	}
}

%> 


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if ( confirm("提醒！合并后不可恢复，确实要【进行合并】操作吗？") )	
	{
		FormName.action="hbKh.jsp";
		FormName.submit();
		return true;
	}

}

//-->
</SCRIPT>
