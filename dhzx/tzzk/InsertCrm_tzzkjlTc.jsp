<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
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

double hdzsjz=0;
double djjje=0;
double djjbfb=10;

double zjjmje=0;

double bzjgzk=10;
double mjzjzk=10;
double zcsjzk=10;
double zcclzk=10;
double zcsfzk=10;
double zcjmzk=10;
double ddzccjzk=10;
double ddzcclzk=10;
double tcwgczk=10;
double tcgcclzk=10;

String djjzsfs="";
String zsjs="";

String yxbffydz="";//是否允许部分费用打折  1：允许；9：不允许


String tzjlh="";
try {
	conn=cf.getConnection();

	int jls=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tzzkjl";
	ls_sql+=" where khbh='"+khbh+"' and clzt not in('2','4','5')";//1：未完成；2：直接修改折扣成功；3：需审批；4：审批通过已改折扣；5：审批未通过
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jls=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (jls>0)
	{
		out.println("错误！调折扣记录未完成，或有未审批记录，不允许录入新记录");
		return;
	}

	String ysshbz="";
	ls_sql="select bjjb,cxhdbm,cxhdbmxq,cxhdbmzh,khjl,crm_zxkhxx.ssfgs,khxm,fwdz,hth,sjs,crm_zxkhxx.zxdm,dwmc,ysshbz,sq_dwxx.yxbffydz";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where  crm_zxkhxx.ssfgs=sq_dwxx.dwbh and crm_zxkhxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
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
//		out.println("错误！合同净值为负值："+htjz);
//		return;
	}
	double mle=cf.round(htjz-sgcbj,2);//毛利额=合同净值－施工成本价
	if (mle<0)
	{
//		out.println("错误！毛利额为负值："+mle);
//		return;
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


	ls_sql="select zklx,zdzk,gcfqdzk,glfzk,sjzk,sjfzk,qtsfxmzk  ,zjxzklx";
	ls_sql+=" ,bzjgzk,mjzjzk,zcsjzk,zcclzk,zcsfzk,zcjmzk,ddzccjzk,ddzcclzk,tcwgczk,tcgcclzk,zjjmje ";
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

		bzjgzk=rs.getDouble("bzjgzk");
		mjzjzk=rs.getDouble("mjzjzk");
		zcsjzk=rs.getDouble("zcsjzk");
		zcclzk=rs.getDouble("zcclzk");
		zcsfzk=rs.getDouble("zcsfzk");
		zcjmzk=rs.getDouble("zcjmzk");
		ddzccjzk=rs.getDouble("ddzccjzk");
		ddzcclzk=rs.getDouble("ddzcclzk");
		tcwgczk=rs.getDouble("tcwgczk");
		tcgcclzk=rs.getDouble("tcgcclzk");
		zjjmje=rs.getDouble("zjjmje");
	}
	rs.close();
	ps.close();

	if (zklx.equals("1"))
	{
		glfzk=zdzk;
		sjzk=zdzk;
		sjfzk=zdzk;
		qtsfxmzk=zdzk;
	}


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


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tzzkjl";
	ls_sql+=" where lrr='"+yhmc+"' and clzt='2'  and (SYSDATE-lrsj)<31";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (sqtszkcs>0)
	{
		if (count>sqtszkcs)
		{
			out.println("错误！您每月【申请特殊折扣次数】的上限为["+sqtszkcs+"]，目前已达到："+count);
			return;
		}
	}


	ls_sql="select NVL(max(substr(tzjlh,8,3)),0)";
	ls_sql+=" from  crm_tzzkjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	tzjlh=khbh+cf.addZero(count+1,3);
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
<form method="post" action="" name="insertform" target="_blank">
<div align="center">调整折扣(调整记录号:<%=tzjlh%>)</div>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">处理状态</td>
	<td  width="7%">录入时间</td>
	<td  width="6%">折扣类型</td>
	<td  width="6%">整单折扣</td>
	<td  width="6%">工程费折扣</td>
	<td  width="6%">管理费折扣</td>
	<td  width="6%">税金折扣</td>
	<td  width="6%">设计费折扣</td>
	<td  width="6%">录入人</td>
	<td  width="46%">调整原因</td>
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
    <td align="right"><font color="#0000FF">客户编号</font> </td>
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
    <td align="right"><font color="#FF0000">*</font>直接减免金额</td>
    <td colspan="3"><input name="zjjmje" type="text"  value="<%=zjjmje%>" size="20" maxlength="16" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>折扣类型</td>
  <td colspan="3">
      <INPUT type="radio" name="zklx" value="2" checked>单项打折</td>
  </tr>
     <tr bgcolor="#FFFFCC">
       <td height="24" colspan="4" align="center">精装客户折扣</td>
     </tr>
     <tr bgcolor="#FFFFFF">
      <td width="18%" align="right"><font color="#FF0000">*</font>精装标准价格折扣</td>
      <td width="32%"><input type="text" name="bzjgzk" size="8" maxlength="9"  value="<%=bzjgzk%>" >
      <b><font color="#0000FF">（>=0且<=10）</font></b> </td>
      <td width="18%" align="right">&nbsp;</td>
      <td width="32%"><input type="hidden" name="zcsfzk" size="8" maxlength="8" value="<%=zcsfzk%>">
        <b><font color="#0000FF">
        <input type="hidden" name="ddzccjzk" size="8" maxlength="8" value="<%=ddzccjzk%>">
        <input type="hidden" name="ddzcclzk" size="8" maxlength="8" value="<%=ddzcclzk%>">
        <input type="hidden" name="tcgcclzk" size="8" maxlength="8" value="<%=tcgcclzk%>">
       </font></b></td>
    </tr>
     <tr bgcolor="#FFFFFF">
       <td align="right"><font color="#FF0000">*</font>厨房折扣</td>
       <td><input type="text" name="mjzjzk" size="8" maxlength="9"  value="<%=mjzjzk%>" >
         <b><font color="#0000FF">（>=0且<=10）</font></b></td>
       <td align="right"><font color="#FF0000">*</font>卫生间折扣</td>
       <td><input type="text" name="zcclzk" size="8" maxlength="8" value="<%=zcclzk%>">
         <b><font color="#0000FF">（>=0且<=10）</font></b></td>
     </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>主材升级折扣</td>
      <td><input type="text" name="zcsjzk" size="8" maxlength="9"  value="<%=zcsjzk%>" >
          <b><font color="#0000FF">（>=0且<=10）</font></b></td>
      <td align="right"><font color="#FF0000">*</font>主材减免折扣</td>
      <td><input type="text" name="zcjmzk" size="8" maxlength="8" value="<%=zcjmzk%>">
        <b><font color="#0000FF">（>=0且<=10）</font></b></td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>精装外施工项折扣</td>
      <td><input type="text" name="tcwgczk" size="8" maxlength="8" value="<%=tcwgczk%>">
        <b><font color="#0000FF">（>=0且<=10）</font></b></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
 <tr bgcolor="#FFFFCC">
  <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>管理费折扣</td>
  <td width="32%"><input type="text" name="glfzk" value="<%=glfzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">（>=0且<=10）</font></b></td>
  <td width="18%" align="right"><font color="#FF0000">*</font>税金折扣</td>
  <td width="32%"><input type="text" name="sjzk" value="<%=sjzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">（>=0且<=10）</font></b></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>设计费折扣</td>
  <td><input type="text" name="sjfzk" value="<%=sjfzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">（>=0且<=10）</font></b></td>
  <td align="right"><font color="#FF0000">*</font>其它收费项目折扣</td>
  <td><input name="qtsfxmzk" type="text" value="<%=qtsfxmzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">（>=0且<=10）</font></b></td>
</tr>
</table>


<BR>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>调整原因</td>
    <td colspan="3"><textarea name="tzyy" cols="77" rows="4"></textarea>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">新促销协议</td>
    <td colspan="3"><textarea name="xcxxy" cols="77" rows="6" id="xcxxy"></textarea>
    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">代金券赠送方式</span></td>
  <td><%
	cf.radioToken(out, "1+固定金额&2+百分比",djjzsfs,true);
%></td>
  <td align="right"><span class="STYLE2">赠送基数</span></td>
  <td><%
	cf.radioToken(out, "1+折前合同额&2+折后合同额&3+折前工程费&4+折后工程费&5+结算金额",zsjs,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right"><font color="#FF0000">*</font><span class="STYLE2">代金券百分比</span></td>
  <td width="32%"><input type="text" name="djjbfb" value="<%=djjbfb%>" size="10" maxlength="16" readonly>
  ％</td>
  <td width="18%" align="right"><font color="#FF0000">*</font><span class="STYLE2">代金券金额</span></td>
  <td width="32%"><input type="text" name="djjje" value="<%=djjje%>" size="20" maxlength="16" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">赠送净值</span></td>
  <td><input type="text" name="hdzsjz" value="<%=hdzsjz%>" size="20" maxlength="16" readonly></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
          <input type="hidden" name="tzjlh" value="<%=tzjlh%>" > 
          <input type="hidden" name="khbh" value="<%=khbh%>" > 
          <input type="hidden" name="ssfgs" value="<%=ssfgs%>" > 
          <input type="hidden" name="cxhdbm" value="<%=cxhdbm%>" > 
          <input type="button"  value="存盘" onClick="f_do(insertform)">
        
          <input type="reset"  value="重输" name="reset">
        <p>
          <input name="button" type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/EditCrm_zxkhxx.jsp?khbh=<%=khbh%>')" value="活动赠送" >
          <input name="button2" type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/InsertCrm_khdjj.jsp?khbh=<%=khbh%>')"  value="调整代金券">
          <input name="button" type="button" onClick="window.open('/dhzx/sjszxone/ylbj.jsp?khbh=<%=khbh%>')"  value="查看报价">
          <input name="wc" type="button" onClick="f_wcdz(insertform)"  value="完成折扣修改" disabled>
      </td>
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
	if(	javaTrim(FormName.tzjlh)=="") {
		alert("请输入[调整记录号]！");
		FormName.tzjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.tzyy)=="") {
		alert("请输入[调整原因]！");
		FormName.tzyy.focus();
		return false;
	}

	if(	javaTrim(FormName.zjjmje)=="") {
		alert("请输入[直接减免金额]！");
		FormName.zjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjjmje, "直接减免金额"))) {
		return false;
	}

	if(	javaTrim(FormName.bzjgzk)=="") {
		alert("请输入[精装标准价格折扣]！");
		FormName.bzjgzk.focus();
		return false;
	}
	if(!(isFloat(FormName.bzjgzk, "精装标准价格折扣"))) {
		return false;
	}
	if (FormName.bzjgzk.value<0 || FormName.bzjgzk.value>10)
	{
		alert("错误！[精装标准价格折扣]应该在0和10之间！");
		FormName.bzjgzk.select();
		return false;
	}
	if(	javaTrim(FormName.mjzjzk)=="") {
		alert("请输入[厨房折扣]！");
		FormName.bzjgzk.focus();
		return false;
	}
	if(!(isFloat(FormName.mjzjzk, "厨房折扣"))) {
		return false;
	}
	if (FormName.mjzjzk.value<0 || FormName.mjzjzk.value>10)
	{
		alert("错误！[厨房折扣]应该在0和10之间！");
		FormName.mjzjzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcsjzk)=="") {
		alert("请输入[主材升级差价折扣]！");
		FormName.zcsjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcsjzk, "主材升级差价折扣"))) {
		return false;
	}
	if (FormName.zcsjzk.value<0 || FormName.zcsjzk.value>10)
	{
		alert("错误！[主材升级差价折扣]应该在0和10之间！");
		FormName.zcsjzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcclzk)=="") {
		alert("请输入[卫生间折扣]！");
		FormName.zcclzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcclzk, "卫生间折扣"))) {
		return false;
	}
	if (FormName.zcclzk.value<0 || FormName.zcclzk.value>10)
	{
		alert("错误！[卫生间折扣]应该在0和10之间！");
		FormName.zcclzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcsfzk)=="") {
		alert("请输入[精装外主材]！");
		FormName.zcsfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcsfzk, "精装外主材"))) {
		return false;
	}
	if (FormName.zcsfzk.value<0 || FormName.zcsfzk.value>10)
	{
		alert("错误！[精装外主材]应该在0和10之间！");
		FormName.zcsfzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcjmzk)=="") {
		alert("请输入[主材减免折扣]！");
		FormName.zcjmzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcjmzk, "主材减免折扣"))) {
		return false;
	}
	if (FormName.zcjmzk.value<0 || FormName.zcjmzk.value>10)
	{
		alert("错误！[主材减免折扣]应该在0和10之间！");
		FormName.zcjmzk.select();
		return false;
	}
	if(	javaTrim(FormName.ddzccjzk)=="") {
		alert("请输入[顶配主材折扣]！");
		FormName.ddzccjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.ddzccjzk, "顶配主材折扣"))) {
		return false;
	}
	if (FormName.ddzccjzk.value<0 || FormName.ddzccjzk.value>10)
	{
		alert("错误！[顶配主材折扣]应该在0和10之间！");
		FormName.ddzccjzk.select();
		return false;
	}
	
	if(	javaTrim(FormName.ddzcclzk)=="") {
		alert("请输入[选配主材折扣]！");
		FormName.ddzcclzk.focus();
		return false;
	}
	if(!(isFloat(FormName.ddzcclzk, "选配主材折扣"))) {
		return false;
	}
	if (FormName.ddzcclzk.value<0 || FormName.ddzcclzk.value>10)
	{
		alert("错误！[选配主材折扣]应该在0和10之间！");
		FormName.ddzcclzk.select();
		return false;
	}

	if(	javaTrim(FormName.tcwgczk)=="") {
		alert("请输入[精装外施工项折扣]！");
		FormName.tcwgczk.focus();
		return false;
	}
	if(!(isFloat(FormName.tcwgczk, "精装外施工项折扣"))) {
		return false;
	}
	if (FormName.tcwgczk.value<0 || FormName.tcwgczk.value>10)
	{
		alert("错误！[精装外施工项折扣]应该在0和10之间！");
		FormName.tcwgczk.select();
		return false;
	}

	if(	javaTrim(FormName.tcgcclzk)=="") {
		alert("请输入[工程超量加价折扣]！");
		FormName.tcgcclzk.focus();
		return false;
	}
	if(!(isFloat(FormName.tcgcclzk, "工程超量加价折扣"))) {
		return false;
	}
	if (FormName.tcgcclzk.value<0 || FormName.tcgcclzk.value>10)
	{
		alert("错误！[工程超量加价折扣]应该在0和10之间！");
		FormName.tcgcclzk.select();
		return false;
	}


	if(	javaTrim(FormName.glfzk)=="") {
		alert("请输入[管理费折扣]！");
		FormName.glfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.glfzk, "管理费折扣"))) {
		return false;
	}
	if (FormName.glfzk.value<0 || FormName.glfzk.value>10)
	{
		alert("错误！[管理费折扣]应该在0和10之间！");
		FormName.glfzk.select();
		return false;
	}
	if(	javaTrim(FormName.sjzk)=="") {
		alert("请输入[税金折扣]！");
		FormName.sjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzk, "税金折扣"))) {
		return false;
	}
	if (FormName.sjzk.value<0 || FormName.sjzk.value>10)
	{
		alert("错误！[税金折扣]应该在0和10之间！");
		FormName.sjzk.select();
		return false;
	}
	if(	javaTrim(FormName.sjfzk)=="") {
		alert("请输入[设计费折扣]！");
		FormName.sjfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjfzk, "设计费折扣"))) {
		return false;
	}
	if (FormName.sjfzk.value<0 || FormName.sjfzk.value>10)
	{
		alert("错误！[设计费折扣]应该在0和10之间！");
		FormName.sjfzk.select();
		return false;
	}

	if(	javaTrim(FormName.qtsfxmzk)=="") {
		alert("请输入[其它收费项目折扣]！");
		FormName.qtsfxmzk.focus();
		return false;
	}
	if(!(isFloat(FormName.qtsfxmzk, "其它收费项目折扣"))) {
		return false;
	}
	if (FormName.qtsfxmzk.value<0 || FormName.qtsfxmzk.value>10)
	{
		alert("错误！[其它收费项目折扣]应该在0和10之间！");
		FormName.qtsfxmzk.select();
		return false;
	}

	
	if(	javaTrim(FormName.djjbfb)=="") {
		alert("请输入[代金券百分比]！");
		FormName.djjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.djjbfb, "代金券百分比"))) {
		return false;
	}
	if(	javaTrim(FormName.djjje)=="") {
		alert("请输入[代金券金额]！");
		FormName.djjje.focus();
		return false;
	}
	if(!(isFloat(FormName.djjje, "代金券金额"))) {
		return false;
	}
	
	if(	javaTrim(FormName.hdzsjz)=="") {
		alert("请输入[赠送净值]！");
		FormName.hdzsjz.focus();
		return false;
	}
	if(!(isFloat(FormName.hdzsjz, "赠送净值"))) {
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
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}

	FormName.action="SaveInsertCrm_tzzkjlTc.jsp";
	FormName.submit();
	FormName.wc.disabled=false;
	return true;
}

function f_wcdz(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.tzjlh)=="") {
		alert("请输入[调整记录号]！");
		FormName.tzjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="wcdz.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
