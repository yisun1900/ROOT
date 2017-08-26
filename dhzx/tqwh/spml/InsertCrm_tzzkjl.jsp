<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>审批客户毛利</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String bjjb=null;
String ssfgs=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String khjl=null;
String dmjl="";
String dmjldh="";

String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;

String zklx="";
double zdzk=10;

double gcfqdzk=10;
double glfzk=10;
double sjzk=10;
double sjfzk=10;
double qtsfxmzk=10;

String zjxzklx="";
String sfybfxmzk="";
String sfybffyzk="";
double gczjxfzk=10;
double gcjxzk=10;
double glfzjxzk=10;
double jxglfzk=10;
double sjzjxzk=10;
double sjfzjxzk=10;

double hdzsjz=0;
double djjje=0;
double djjbfb=10;

double clfzk=10;
double zcfzk=10;
double rgfzk=10;
double ysfzk=10;
double jxfzk=10;
double shfzk=10;
double qtfzk=10;

double zjjmje=0;

String djjzsfs="";
String zsjs="";

String yxbffydz="";//是否允许部分费用打折  1：允许；9：不允许

double rfsgcb=0;
double rfjz=0;
double rfmll=0;
double zcxse=0;
double zccb=0;
double zcmll=0;
double khmll=0;
String mlspbz="";

String mlspyj="";
try {
	conn=cf.getConnection();

	String kzdzfs="";
	double zdmll=0;
	double zdzkl=0;
	ls_sql="SELECT kzdzfs,zkl,zdmll";
	ls_sql+=" FROM sq_yhxx";
    ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kzdzfs=cf.fillNull(rs.getString("kzdzfs"));
		zdzkl=rs.getDouble("zkl");//最低折扣
		zdmll=rs.getDouble("zdmll");//签单最低毛利率
	}
	rs.close();
	ps.close();

	String ysshbz="";
	ls_sql="select mlspbz,mlspyj,bjjb,cxhdbm,cxhdbmxq,cxhdbmzh,khjl,crm_zxkhxx.ssfgs,khxm,fwdz,hth,sjs,crm_zxkhxx.zxdm,dwmc,ysshbz,sq_dwxx.yxbffydz";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where  crm_zxkhxx.ssfgs=sq_dwxx.dwbh and crm_zxkhxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mlspbz=cf.fillNull(rs.getString("mlspbz"));
		mlspyj=cf.fillNull(rs.getString("mlspyj"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		khjl=cf.fillNull(rs.getString("khjl"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("zxdm"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));//是否启用预算审核  N：未申请；B：申请审核；C：受理申请；Y：审核通过；M：审核未通过；S：修改方案授权
		yxbffydz=cf.fillNull(rs.getString("yxbffydz"));
	}
	rs.close();
	ps.close();


	if (!cxhdbm.equals(""))
	{
		int duxzs=0;
		ls_sql="SELECT count(*) ";
		ls_sql+=" FROM jc_hdzsxx  ";
		ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			duxzs=rs.getInt(1);
		}
		rs.close();
		ps.close();

		int dxzs=0;
		ls_sql="SELECT count(*) ";
		ls_sql+=" FROM jc_hddxzsxx  ";
		ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dxzs=rs.getInt(1);
		}
		rs.close();
		ps.close();


		if ((duxzs+dxzs)>0)
		{
			double xzsjsl=0;
			ls_sql="SELECT sum(sjsl) ";
			ls_sql+=" FROM crm_khzsxx  ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xzsjsl=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			if (xzsjsl==0)
			{
				out.println("<B><font color='#FF0000' size='5'>提醒！未选择赠送项目</font></B>");
			}
		}
	}


	String sfqyyssh="";
	String bjdysq="";
	ls_sql="SELECT sfqyyssh,bjdysq";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfqyyssh=cf.fillNull(rs.getString("sfqyyssh"));//是否启用预算审核  Y：启用；N：不启用
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//报价打印是否需授权  1：不需授权；2：只需一次授权；3：每次打印都需授权
	}
	rs.close();
	ps.close();

	if (sfqyyssh.equals("Y") && ysshbz.equals("Y") )
	//N：未申请；B：申请审核；C：受理申请；Y：审核通过；M：审核未通过；S：修改方案授权
	{
		out.println("错误！已申请[预算审核]，不能再调折扣"+ysshbz);
		return;
	}

	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double htjz=dzbjje.getHtjz(conn,khbh,"yz");//合同净值＝折后合同总额（含增减项）－赠送净值－赠送代金券－税金（折后）
	double sgcbj=dzbjje.getSgcbj(conn,khbh,"yz");//施工成本价＝工程项施工成本价＋其它项施工成本（不含：管理费、税金）

	if (htjz<0)
	{
		out.println("错误！合同净值为负值："+htjz);
		return;
	}
	double mle=cf.round(htjz-sgcbj,2);//毛利额=合同净值－施工成本价
	if (mle<0)
	{
		out.println("错误！毛利额为负值："+mle);
		return;
	}


	double mll=0;
	if (htjz==0)
	{
		mll=0;
	}
	else{
		mll=cf.round(mle/htjz*100,2);//毛利率＝毛利额÷合同净值
	}


	hdzsjz=dzbjje.getZsjz(conn,khbh);//赠送净值
	djjje=dzbjje.getHtDjj(conn,khbh,"yz");//代金券金额
	djjbfb=dzbjje.getDjjbfb(conn,khbh,"yz");//代金券百分比


	ls_sql="select djjzsfs,zsjs";
	ls_sql+=" from  crm_khdjj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djjzsfs=cf.fillNull(rs.getString("djjzsfs"));
		zsjs=cf.fillNull(rs.getString("zsjs"));
	}
	rs.close();
	ps.close();


	ls_sql="select DECODE(zklx,'1','整单打折','2','单项打折','3','部分费用打折') zklx,zdzk,gcfqdzk,glfzk,sjzk,sjfzk,qtsfxmzk  ,zjxzklx,zjjmje";
	ls_sql+=" from  crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));//折扣类型  1：整单打折；2：单项打折；3：部分费用打折
		zdzk=rs.getDouble("zdzk");
		gcfqdzk=rs.getDouble("gcfqdzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
		qtsfxmzk=rs.getDouble("qtsfxmzk");

		zjxzklx=cf.fillNull(rs.getString("zjxzklx"));//1：同合同；2：独立折扣
		zjjmje=rs.getDouble("zjjmje");
	}
	rs.close();
	ps.close();

	if (zjxzklx.equals(""))
	{
		zjxzklx="1";
	}


	ls_sql="select clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk";
	ls_sql+=" from  crm_khbffyzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clfzk=rs.getDouble("clfzk");
		zcfzk=rs.getDouble("zcfzk");
		rgfzk=rs.getDouble("rgfzk");
		ysfzk=rs.getDouble("ysfzk");
		jxfzk=rs.getDouble("jxfzk");
		shfzk=rs.getDouble("shfzk");
		qtfzk=rs.getDouble("qtfzk");
	}
	rs.close();
	ps.close();

	ls_sql="select gczjxfzk,glfzjxzk,sjzjxzk,sjfzjxzk ";
	ls_sql+=" from  crm_khzjxzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gczjxfzk=rs.getDouble("gczjxfzk");
		glfzjxzk=rs.getDouble("glfzjxzk");
		sjzjxzk=rs.getDouble("sjzjxzk");
		sjfzjxzk=rs.getDouble("sjfzjxzk");
	}
	rs.close();
	ps.close();


	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="、"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select yhmc,dh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and xzzwbm='店面经理' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dmjl=rs.getString("yhmc");
		dmjldh=rs.getString("dh");
	}
	rs.close();
	ps.close();

	int sqtszkcs=0;//每月申请特殊折扣次数
	ls_sql="select sqtszkcs";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqtszkcs=rs.getInt("sqtszkcs");
	}
	rs.close();
	ps.close();

	//主材金额计算
	ls_sql="SELECT sum(hkze+zjhze),sum(cbze+zjxcbze)";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		zcxse=rs.getDouble(1);//主材销售额
		zccb=rs.getInt(2);//主材成本额
	}
	rs.close();
	ps.close();

	zcmll=0;//主材毛利率
	if (zcxse!=0)
	{
		zcmll=cf.round(zccb*100/zcxse,2);
	}

	rfjz=htjz;//人辅净值
	rfsgcb=sgcbj;//人辅施工成本价
	rfmll=mll;//人辅毛利率

	khmll=0;//客户毛利率
	if ((zcxse+rfjz)!=0)
	{
		khmll=cf.round((zcxse-zccb+rfjz-rfsgcb)*100/(zcxse+rfjz),2);
	}

	if (kzdzfs.equals("1"))//1：控制毛利率；2：控制折扣
	{
		if (khmll<zdmll || khmll>100)
		{
			out.println("错误！您的毛利授权为【"+zdmll+"】，您无权审批");
			return;
		}
	}
	else if (kzdzfs.equals("2"))//1：控制毛利率；2：控制折扣
	{
		if (zklx.equals("1"))//1：整单打折；2：单项打折；3：部分费用打折
		{
			if (zdzk<zdzkl)
			{
				out.println("错误！您的折扣授权为【"+zdzkl+"】，您无权审批");
				return;
			}
		}
		else{
			if (gcfqdzk<zdzkl)
			{
				out.println("错误！您的折扣授权为【"+zdzkl+"】，您无权审批");
				return;
			}
		}
	}
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform"  >
<div align="center">审批客户毛利</div>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">处理状态</td>
	<td  width="7%">审批时间</td>
	<td  width="6%">折扣类型</td>
	<td  width="6%">整单折扣</td>
	<td  width="6%">工程费折扣</td>
	<td  width="6%">管理费折扣</td>
	<td  width="6%">税金折扣</td>
	<td  width="6%">设计费折扣</td>
	<td  width="6%">审批人</td>
	<td  width="46%">毛利审批意见</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT DECODE(crm_tzzkjl.clzt,'1','未完成','2','直接修改折扣成功','3','需审批','4','审批通过已改折扣','5','审批未通过'),crm_tzzkjl.lrsj,DECODE(crm_tzzkjl.zklx,'1','整单打折','2','单项打折','3','部分费用打折'),crm_tzzkjl.zdzk,crm_tzzkjl.gcfqdzk,crm_tzzkjl.glfzk,crm_tzzkjl.sjzk,crm_tzzkjl.sjfzk, crm_tzzkjl.lrr,crm_tzzkjl.tzyy ";
	ls_sql+=" FROM crm_zxkhxx,crm_tzzkjl  ";
    ls_sql+=" where crm_tzzkjl.khbh=crm_zxkhxx.khbh ";
    ls_sql+=" and crm_tzzkjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_tzzkjl.lrsj";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();

%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#0000FF">客户编号</font> </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right"><font color="#0000FF">合同号</font> </td>
    <td width="32%"><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td><%=fwdz%></td>
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
    <td align="right"><span class="STYLE2">店长及电话</span></td>
    <td><%=dmjl%>（<%=dmjldh%>）</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">参加公司活动</span></td>
    <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbm%>" target="_blank"><%=cxhdbm%></A>	</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">小区促销活动</span></td>
    <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmxq%>" target="_blank"><%=cxhdbmxq%></A>	</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">展会促销活动</span></td>
    <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmzh%>" target="_blank"><%=cxhdbmzh%></A>	</td>
    </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">折扣类型</span></td>
    <td><%=zklx%></td>
    <td align="right"><span class="STYLE2">整单折扣</span></td>
    <td><%=zdzk%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">工程费签单折扣</span></td>
    <td><%=gcfqdzk%></td>
    <td align="right"><span class="STYLE2">直接减免金额</span></td>
    <td><%=zjjmje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="21" align="right"><span class="STYLE2">管理费折扣</span></td>
    <td><%=glfzk%></td>
    <td align="right"><span class="STYLE2">税金折扣</span></td>
    <td><%=sjzk%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">设计费折扣</span></td>
    <td><%=sjfzk%></td>
    <td align="right"><span class="STYLE2">其它收费项目折扣</span></td>
    <td><%=qtsfxmzk%></td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">
      人辅净值</span></td>
    <td><%=rfjz%></td>
    <td align="right"><span class="STYLE2">人辅施工成本价</span></td>
    <td><%=rfsgcb%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">主材销售额</span></td>
    <td><%=zcxse%></td>
    <td align="right"><span class="STYLE2">主材成本</span></td>
    <td><%=zccb%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">人辅毛利率</span></td>
    <td><%=rfmll%> % </td>
    <td align="right"><span class="STYLE2">主材毛利率</span></td>
    <td><%=zcmll%>%</td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">客户毛利率</span></td>
    <td><%=khmll%>%</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font>审批结论</td>
    <td colspan="3">
	<INPUT type="radio" name="mlspbz" value="Y" <%if (mlspbz.equals("Y")) out.println("checked");%> >
      同意
        <INPUT type="radio" name="mlspbz" value="N" <%if (mlspbz.equals("N")) out.println("checked");%> >
      不同意</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><span class="STYLE1">*</span>毛利审批意见</td>
    <td colspan="3"><textarea name="mlspyj" cols="77" rows="4"><%=mlspyj%></textarea>    </td>
  </tr>
  
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">审批人</span></td>
  <td width="32%"><input type="text" name="mlspr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td width="18%" align="right"><font color="#FF0000">*</font><span class="STYLE2">审批时间</span></td>
  <td width="32%"><input type="text" name="mlspsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>

    <tr align="center"> 
      <td colspan="4"> 
          <input type="hidden" name="khbh" value="<%=khbh%>" > 
          <input type="hidden" name="ssfgs" value="<%=ssfgs%>" > 
          <input type="hidden" name="rfsgcb" value="<%=rfsgcb%>" > 
          <input type="hidden" name="rfjz" value="<%=rfjz%>" > 
          <input type="hidden" name="rfmll" value="<%=rfmll%>" > 
          <input type="hidden" name="zcxse" value="<%=zcxse%>" > 
          <input type="hidden" name="zccb" value="<%=zccb%>" > 
          <input type="hidden" name="zcmll" value="<%=zcmll%>" > 
          <input type="hidden" name="khmll" value="<%=khmll%>" > 
          <input type="button"  value="存盘" onClick="f_do(insertform)">
        
          <input type="reset"  value="重输" name="reset">
          <input name="button2" type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/EditCrm_zxkhxx.jsp?khbh=<%=khbh%>')" value="活动赠送" >
      <input name="button" type="button" onClick="window.open('/dhzx/sjszxone/ylbj.jsp?khbh=<%=khbh%>')"  value="查看报价"></td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
 
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}


	if(	!radioChecked(FormName.mlspbz)) {
		alert("请选择[审批结论]！");
		FormName.mlspbz[0].focus();
		return false;
	}

	if (FormName.mlspbz[1].checked)
	{
		if(	javaTrim(FormName.mlspyj)=="") {
			alert("请输入[审批意见]！");
			FormName.mlspyj.focus();
			return false;
		}
	}


	if(	javaTrim(FormName.mlspr)=="") {
		alert("请输入[审批人]！");
		FormName.mlspr.focus();
		return false;
	}
	if(	javaTrim(FormName.mlspsj)=="") {
		alert("请输入[审批时间]！");
		FormName.mlspsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.mlspsj, "审批时间"))) {
		return false;
	}

	FormName.action="SaveInsertCrm_tzzkjl.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
