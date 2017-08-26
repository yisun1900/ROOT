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
.STYLE1 {color: #CC3399}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String zdyhbz=(String)session.getAttribute("zdyhbz");
String zt=request.getParameter("zt");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String khjl=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmbh=null;
String dwmc=null;
String cxhdbm=null;
String zxdjbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;

String sqdj="";
String xmzy="";
String clgw="";

double zcyfk=0;
double zcdjj=0;
double zzczk=0;

double mmyfk=0;
double cgyfk=0;
double jjyfk=0;

double zcfk=0;
double htze=0;
String txxx="";

String ddbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int dds=0;
String jjsjs="";


String zczkl="10";

String listSql="";
String jjwjbz="";

String djlrfs="";//主材订单单价录入方式  1：录入单价算折扣；2：录入折扣算单价；3：不可打折
String kgcxhdbl="";//主材订单是否可改促销活动比例  Y：可改；N：不可改
String dgkh=null;

try {
	conn=cf.getConnection();

	if (zt.equals("2"))//2:家装客户;4:非家装客户
	{
		ls_sql="select dgkh,khxm,crm_khxx.xmzy,crm_khxx.clgw,fwdz,lxfs,hth,khjl,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq,crm_khxx.jjwjbz";
		ls_sql+=" from  sq_dwxx,crm_khxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dgkh=cf.fillNull(rs.getString("dgkh"));
			xmzy=cf.fillNull(rs.getString("xmzy"));
			clgw=cf.fillNull(rs.getString("clgw"));
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			hth=cf.fillNull(rs.getString("hth"));
			khjl=cf.fillNull(rs.getString("khjl"));
			sjs=cf.fillNull(rs.getString("sjs"));
			qye=cf.fillNull(rs.getString("qye"));
			kgrq=cf.fillNull(rs.getDate("kgrq"));
			jgrq=cf.fillNull(rs.getDate("jgrq"));
			ssfgs=cf.fillNull(rs.getString("fgsbh"));
			dmbh=cf.fillNull(rs.getString("dwbh"));
			dwmc=cf.fillNull(rs.getString("dwmc"));
			cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

			zjxm=cf.fillNull(rs.getString("zjxm"));
			sgd=cf.fillNull(rs.getString("sgd"));
			sgbz=cf.fillNull(rs.getString("sgbz"));
			qyrq=cf.fillNull(rs.getDate("qyrq"));
			jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
		}
		rs.close();
		ps.close();
	}
	else{
		ls_sql="select dgkh,khxm,crm_zxkhxx.clgw,fwdz,lxfs,khjl,sjs,crm_zxkhxx.ssfgs,crm_zxkhxx.zxdm,dwmc,cxhdbm,zxdjbm";
		ls_sql+=" from  sq_dwxx,crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and  (crm_zxkhxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dgkh=cf.fillNull(rs.getString("dgkh"));
			clgw=cf.fillNull(rs.getString("clgw"));
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			khjl=cf.fillNull(rs.getString("khjl"));
			sjs=cf.fillNull(rs.getString("sjs"));
			ssfgs=cf.fillNull(rs.getString("ssfgs"));
			dmbh=cf.fillNull(rs.getString("zxdm"));
			dwmc=cf.fillNull(rs.getString("dwmc"));
			cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
			zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
		}
		rs.close();
		ps.close();

		if (dmbh.equals(""))
		{
			ls_sql="select dwbh,dwmc";
			ls_sql+=" from  sq_dwxx";
			ls_sql+=" where dwbh='"+zxdjbm+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				dmbh=cf.fillNull(rs.getString("dwbh"));
				dwmc=cf.fillNull(rs.getString("dwmc"));
			}
			rs.close();
			ps.close();
		}
	}


	//检查客户结算＋＋＋＋＋＋＋＋＋＋＋＋开始
	String getkhjsbz="";
	ls_sql=" select khjsbz ";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getkhjsbz=cf.fillNull(rs.getString("khjsbz"));
	}
	rs.close();
	ps.close();

	if (!getkhjsbz.equals("N") && !getkhjsbz.equals("") && !getkhjsbz.equals("3"))//N：未结算；Y：已结算；2：审批同意；3：审批不同意
	{
		out.println("<font color=\"#FF0000\">错误！客户已结算</font>:"+getkhjsbz);
		return;
	}
	//检查客户结算＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	if (jjsjs.equals(""))
	{
		ls_sql="select cgsjs";
		ls_sql+=" from  jc_cgdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jjsjs=cf.fillNull(rs.getString("cgsjs"));
		}
		rs.close();
		ps.close();
	}

	if (jjsjs.equals(""))
	{
		ls_sql="select jjsjs";
		ls_sql+=" from  jc_jjdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jjsjs=cf.fillNull(rs.getString("jjsjs"));
		}
		rs.close();
		ps.close();
	}



	if (jjwjbz.equals("Y"))
	{
		out.println("错误！客户家居已完结，不能再录入订单");
		return;
	}



	ls_sql="select djlrfs,kgcxhdbl";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djlrfs=cf.fillNull(rs.getString("djlrfs"));
		kgcxhdbl=cf.fillNull(rs.getString("kgcxhdbl"));
	}
	rs.close();
	ps.close();


	//主材预付款
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='62'";//62：主材预付款 
	ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1：财务收款；2：非财务代收款
	ls_sql+=" and zffs!='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='62'";//62：主材预付款 
	ls_sql+=" and zffs='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcyfk+=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	zcyfk=cf.round(zcyfk,2);
	//增值储值卡
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='67'";//67：增值储值卡
	ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1：财务收款；2：非财务代收款
	ls_sql+=" and zffs!='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zzczk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='67'";//67：增值储值卡
	ls_sql+=" and zffs='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zzczk+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//绿色电子礼券卡
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='55'";//55：主材代金券
	ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1：财务收款；2：非财务代收款
	ls_sql+=" and zffs!='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcdjj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='55'";//55：主材代金券
	ls_sql+=" and zffs='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcdjj+=rs.getDouble(1);
	}
	rs.close();
	ps.close();



	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23'";//21:木门；22:橱柜；23:主材；24：家具
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql=" SELECT sum(jc_zcdd.hkze+jc_zcdd.zjhze)";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.khbh='"+khbh+"'";
	ls_sql+=" and clzt>'07' and clzt not in('98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		htze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (htze-zcfk > zcyfk)
	{
		txxx="<B><font color='#FF0000'>提醒！客户应补交款："+cf.round(htze-zcfk-zcyfk-zcdjj,2)+"，订货总额："+htze+"，主材已付款："+zcfk+"，主材预付款:"+(zcyfk+zcdjj)+"</font></B>";
	}

	int count=0;
	ls_sql="select NVL(max(substr(ddbh,8,2)),0)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ddbh=khbh+cf.addZero(count+1,2);

	dds=count;
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

<body bgcolor="#FFFFFF">
<table width="100%" style='FONT-SIZE: 14px'>
  <tr>
    <td width="100%"> 
      <div align="center">请录入主材合同（订单编号：<%=ddbh%>）
    </div></td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform"  >
<%
if (dds>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="7%">订单编号</td>
		<td  width="4%">整单退货</td>
		<td  width="4%">部分退货</td>
		<td  width="9%">处理状态</td>
		<td  width="11%">品牌</td>
		<td  width="6%">家居顾问</td>
		<td  width="9%">销售合同号</td>
		<td  width="9%">正常品材料费</td>
		<td  width="9%">特价品材料费</td>
		<td  width="8%">安装辅料加工费</td>
		<td  width="8%">远程费</td>
		<td  width="9%">合同总额</td>
		<td  width="8%">录入时间</td>
	</tr>
	<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT jc_zcdd.ddbh,'<A HREF=\"InsertJc_zcddTd.jsp?ddbh='||jc_zcdd.ddbh||'\" >退单</A>','<A HREF=\"InsertJc_zcddTh.jsp?ddbh='||jc_zcdd.ddbh||'\" >退货</A>',clztmc,ppbm,jc_zcdd.clgw,jc_zcdd.xshth,jc_zcdd.zcpclf,jc_zcdd.tjpclf,jc_zcdd.qtf,jc_zcdd.ycf,jc_zcdd.wdzje,jc_zcdd.lrsj";
		ls_sql+=" FROM jc_zcdd,jdm_zcddzt";
		ls_sql+=" where jc_zcdd.khbh='"+khbh+"' ";
		ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
		ls_sql+=" and jc_zcdd.ddlx='C'";//9:选配主材主材
		ls_sql+=" order by jc_zcdd.zcdlbm,jc_zcdd.ppbm,jc_zcdd.ddbh";
		pageObj.sql=ls_sql;
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//设置每页显示记录数
		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDateSum();


	%>
	</table>
	<%
}
%>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#CCCCFF"> 
                客户编号              </td>
              <td width="31%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="18%" align="right" bgcolor="#CCCCFF"> 
                合同号              </td>
              <td width="32%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">客户姓名</td>
              <td width="31%"><%=khxm%></td>
              <td width="18%" align="right">房屋地址</td>
              <td width="32%"><%=fwdz%></td>
            </tr>
            
            <tr> 
              <td width="19%" bgcolor="#CCCCFF" align="right">签约店面</td>
              <td width="31%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="18%" bgcolor="#CCCCFF" align="right">家装设计师</td>
              <td width="32%" bgcolor="#CCCCFF"><%=sjs%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"> 
                施工队              </td>
              <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>
              (<%=sgbz%>)</td>
              <td width="18%" align="right">家装签约日期</td>
              <td width="32%"><%=qyrq%></td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">合同工期</td>
              <td width="31%"><%=kgrq%>－－<%=jgrq%></td>
              <td width="18%" align="right">质检</td>
              <td width="32%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right">参加促销活动</td>
              <td colspan="3"> <%=cxhdbm%> </td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right">&nbsp;</td>
              <td colspan="3"><%=txxx%></td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right"><strong>订货总额</strong></td>
              <td><%=htze%></td>
              <td align="right"><b>主材已付款</b></td>
              <td><%=zcfk%></td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right"><font color="#FF0000"><b>预付款结余</b></font></td>
              <td colspan="3"><%=cf.round(zcyfk+zcdjj-(htze-zcfk),2)%><strong>（主材预付款＋主材代金券＋主材已付款－订货总额），如果新订货超过此金额需要客户补款</strong></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right"><b>主材预付款</b></td>
              <td width="31%"><%=zcyfk%></td>
              <td width="18%" align="right"><strong>主材代金券</strong></td>
              <td width="32%"><%=zcdjj%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>主材大类</td>
              <td><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onchange="changeDl(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3')  order by cldlmc","");
%>
              </select></td>
              <td align="right">主材小类</td>
              <td><select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>品牌</td>
              <td colspan="3">
			  <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:520PX"  >
              </select></td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>购买日期</td>
              <td bgcolor="#FFFFFF"><input type="text" name="qhtsj" size="20" maxlength="10" value="<%=cf.today()%>" onDblClick="JSCalendar(this)" ></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>合同送货时间</td>
              <td bgcolor="#FFFFFF"><input type="text" name="htshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)" ></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>主材合同号</td>
              <td bgcolor="#FFFFFF"><input type="text" name="xshth" value="" size="20" maxlength="20" ></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>驻店家居顾问</td>
              <td bgcolor="#FFFFFF"><select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
				if (clgw.equals(""))
				{
					out.println("<option value=\"\"></option>");

					listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
					listSql+=" UNION ALL ";
					listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
					listSql+=" ORDER BY c2 ";
					cf.selectItem(out,listSql,yhmc);
				}
				else{
					out.println("<option value=\""+clgw+"\">"+clgw+"</option>");
				}
%>
              </select></td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*<strong><font color="#FF00FF">正常品-材料费</font></strong></font></td>
              <td><input name="zcpclf" type="text"  onChange="f_jsjg(insertform)" value="" size="20" maxlength="20"></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font><strong><font color="#660099">特价品-材料费</font></strong></td>
              <td><input name="tjpclf" type="text" onChange="f_jsjg(insertform)" value="" size="20" maxlength="20"></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>安装辅料加工费</td>
              <td><input name="qtf" type="text"  onChange="f_jsjg(insertform)" value="" size="20" maxlength="20"></td>
              <td align="right"><font color="#FF0000">*</font>远程费</td>
              <td><input name="ycf" type="text" onChange="f_jsjg(insertform)" value="" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">合同总额</font></td>
              <td colspan="3"><input type="text" name="wdzje" value="" size="20" maxlength="20"  readonly>
              合同总额＝正常品材料费＋特价品材料费＋安装辅料加工费＋远程费</td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td rowspan="4" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>付款方式<BR><BR><input  type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="付款信息"></td>
              <td colspan="3">&nbsp;①、<strong>绿色电子礼券卡</strong>，目前可用金额：
			   <input type="text" name="zcdjj" size="8" value="<%=zcdjj%>" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
			  ，本次转款金额              
              <input name="djjzkje" type="text" onChange="f_jsjg(insertform)" value="" size="10" maxlength="20"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="3">&nbsp;②、<strong>增值储值卡</strong>，目前可用金额：
                <input type="text" name="zzczk" size="8" value="<%=zzczk%>" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
，本次转款金额
<input name="zzczkzkje" type="text" onChange="f_jsjg(insertform)" value="" size="10" maxlength="20"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="3">&nbsp;③、<strong>主材预付款</strong>，目前可用金额：
			   <input type="text" name="zcyfk" size="8" value="<%=zcyfk%>" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
			  ，本次转款金额
              <input name="yfkzkje" type="text" onChange="f_jsjg(insertform)" value="" size="10" maxlength="20"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="3">&nbsp;④、<strong>纸质材料券</strong>
                <select name="djqmc" style="FONT-SIZE:12PX;WIDTH:162PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select djqmc c1,djqmc c2 from cw_djq where fgsbh='"+ssfgs+"'  order by djqmc","");
%>
                </select>
              ，本次使用金额
              <input name="djqje" type="text" onChange="f_jsjg(insertform)" value="0" size="10" maxlength="20" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
凭证号
<input name="sjbh" type="text" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" size="20" maxlength="20"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                <font color="#FF0000">*</font><font color="#0000CC">录入部门</font>              </td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">录入人</font>              </td>
              <td width="31%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">录入时间</font>              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="zqclf" value="0" >
                <input type="hidden" name="ddbh" value="<%=ddbh%>" >
                <input type="hidden" name="fgsbh" value="<%=ssfgs%>" >
                <input type="hidden" name="qddm" value="<%=dmbh%>" >
                <input type="hidden" name="khjl" value="<%=khjl%>" >
                <input type="hidden" name="jzsjs" value="<%=sjs%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="zt" value="<%=zt%>">

				<input type="button"  value="存盘" onClick="f_do(insertform)">
				<input name="button" type="button" onClick="window.open('/jcjj/dygl/dgzcdy.jsp?khbh=<%=khbh%>')"  value="打印">
				<input type="reset"  value="重输" name="reset">
				<input type="hidden" name="xmzy" value="<%=xmzy%>" >
                <input type="hidden" name="jjsjs" value="<%=jjsjs%>" >
                <input type="hidden" name="ztjjgw" value="" >
                <input type="hidden" name="ddshbz" value="1" >
                <input type="hidden" name="jhtzshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)" >
                <input type="hidden" name="dzyy" value="" >
                <input type="hidden" name="kjxsj" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
                <input type="hidden" name="hkze" value="" size="20" maxlength="20" >
                <input type="hidden" name="zczkl" size="8" maxlength="8" value="<%=zczkl%>" readonly>
                <input type="hidden" name="htcxhdje" value="0" size="20" maxlength="10" >
                <input type="hidden" name="jmje" value="0" size="20" maxlength="20" ></td>
            </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	//启用Ajax
	cf.ajax(out);
%>

var czlx;



function changeDl(FormName)
{
	czlx=2;

	FormName.zcxlbm.length=1;
	insertform.ycf.readOnly=false;
	insertform.qtf.readOnly=false;

	var sql="select clxlmc from jxc_clxlbm where cldlmc='"+FormName.zcdlbm.value+"' order by clxlmc";
	var actionStr="/ajax/getstr.jsp?sql="+sql;

	openAjax(actionStr);
//	window.open(actionStr);
}



function getPp(FormName)
{
	czlx=3;

	FormName.ppbm.length=1;

	var sql="select distinct jxc_ppxx.ppmc c1,jxc_ppxx.ppmc  c2 from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+FormName.fgsbh.value+"' and jxc_ppxx.cldl='"+FormName.zcdlbm.value+"' order by jxc_ppxx.ppmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);
	openAjax(actionStr);
}



function getAjax(ajaxRetStr) 
{
	if (czlx==2)
	{
		strToItem2(insertform.zcxlbm,ajaxRetStr);
		getPp(insertform);
	}
	else if (czlx==3)
	{
		strToSelect(insertform.ppbm,ajaxRetStr);
	}
}


function f_jsjg(FormName)//参数FormName:Form的名称
{
	var zqclf=0;
	zqclf=FormName.zcpclf.value*1.0+FormName.tjpclf.value*1.0;
	zqclf=round(zqclf,2);
	FormName.zqclf.value=zqclf;
	
	var wdzje=0;
	wdzje=FormName.zqclf.value*1.0+FormName.qtf.value*1.0+FormName.ycf.value*1.0;
	wdzje=round(wdzje,2);
	FormName.wdzje.value=wdzje;
	
	FormName.hkze.value=FormName.wdzje.value;
	FormName.zczkl.value=10;
}

function f_do(FormName)//参数FormName:Form的名称
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("请选择[主材大类]！");
		FormName.zcdlbm.focus();
		return false;
	}

	if(	javaTrim(FormName.ppbm)=="") {
		alert("请选择[品牌]！");
		FormName.ppbm.focus();
		return false;
	}

	if(	javaTrim(FormName.qhtsj)=="") {
		alert("请输入[购买日期]！");
		FormName.qhtsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qhtsj, "购买日期"))) {
		return false;
	}
	if(	javaTrim(FormName.htshsj)=="") {
		alert("请输入[合同送货时间]！");
		FormName.htshsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.htshsj, "合同送货时间"))) {
		return false;
	}

	if(	javaTrim(FormName.xshth)=="") {
		alert("请输入[主材合同号]！");
		FormName.xshth.focus();
		return false;
	}

	if(	javaTrim(FormName.clgw)=="") {
		alert("请输入[驻店家居顾问]！");
		FormName.clgw.focus();
		return false;
	}
	
	
	if(	javaTrim(FormName.zcpclf)=="") {
		alert("请输入[正常品-材料费]！");
		FormName.zcpclf.focus();
		return false;
	}
	if(!(isFloat(FormName.zcpclf, "正常品-材料费"))) {
		return false;
	}

	if(	javaTrim(FormName.tjpclf)=="") {
		alert("请输入[特价品-材料费]！");
		FormName.tjpclf.focus();
		return false;
	}

	if(!(isFloat(FormName.tjpclf, "特价品-材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.zqclf)=="") {
		alert("请输入[材料费]！");
		FormName.zqclf.focus();
		return false;
	}
	if(!(isFloat(FormName.zqclf, "材料费"))) {
		return false;
	}


	if(	javaTrim(FormName.qtf)=="") {
		alert("请输入[安装辅料加工费]！");
		FormName.qtf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtf, "安装辅料加工费"))) {
		return false;
	}
	if(	javaTrim(FormName.ycf)=="") {
		alert("请输入[远程费]！");
		FormName.ycf.focus();
		return false;
	}
	if(!(isFloat(FormName.ycf, "远程费"))) {
		return false;
	}

	
	
	if(	javaTrim(FormName.wdzje)=="") {
		alert("请输入[合同总额]！");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "合同总额"))) {
		return false;
	}

	if (parseFloat(FormName.wdzje.value)==0)
	{
		alert("[合同总额]不能为0！");
		FormName.zqclf.select();
		return false;
	}


	if(!(isFloat(FormName.djqje, "纸质材料券"))) {
		return false;
	}
	if (parseFloat(FormName.djqje.value)!=0)
	{
		if(	javaTrim(FormName.djqmc)=="") {
			alert("请输入[纸质材料券名称]！");
			FormName.djqmc.focus();
			return false;
		}
		if(	javaTrim(FormName.sjbh)=="") {
			alert("请输入[凭证号]！");
			FormName.sjbh.focus();
			return false;
		}
	}
	else{
		FormName.djqmc.value="";
		FormName.sjbh.value="";
	}


	if(	javaTrim(FormName.djjzkje)=="") {
		alert("请输入[绿色电子礼券卡转款金额]！");
		FormName.djjzkje.focus();
		return false;
	}
	if(!(isFloat(FormName.djjzkje, "绿色电子礼券卡转款金额"))) {
		return false;
	}
	if (parseFloat(FormName.zcdjj.value)<parseFloat(FormName.djjzkje.value))
	{
		alert("绿色电子礼券卡错误！[转款金额]不能大于[目前可用金额]！");
		FormName.djjzkje.select();
		return false;
	}

	if(	javaTrim(FormName.zzczkzkje)=="") {
		alert("请输入[增值储值卡转款金额]！");
		FormName.zzczkzkje.focus();
		return false;
	}
	if(!(isFloat(FormName.zzczkzkje, "增值储值卡转款金额"))) {
		return false;
	}
	if (parseFloat(FormName.zzczk.value)<parseFloat(FormName.zzczkzkje.value))
	{
		alert("增值储值卡付款错误！[转款金额]不能大于[目前可用金额]！");
		FormName.zzczkzkje.select();
		return false;
	}

	if(	javaTrim(FormName.yfkzkje)=="") {
		alert("请输入[主材预付款转款金额]！");
		FormName.yfkzkje.focus();
		return false;
	}
	if(!(isFloat(FormName.yfkzkje, "主材预付款转款金额"))) {
		return false;
	}
	if (parseFloat(FormName.zcyfk.value)<parseFloat(FormName.yfkzkje.value))
	{
		alert("主材预付款错误！[转款金额]不能大于[目前可用金额]！");
		FormName.yfkzkje.select();
		return false;
	}


	var zkze=FormName.djjzkje.value*1.0+FormName.zzczkzkje.value*1.0+FormName.yfkzkje.value*1.0+FormName.djqje.value*1.0;
	if (zkze!=parseFloat(FormName.wdzje.value))
	{
		alert("错误！合同总额不等于[转款金额]！");
		FormName.yfkzkje.select();
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[录入部门]！");
		FormName.dwbh.focus();
		return false;
	}




	FormName.action="SaveInsertJc_zcdd.jsp";
	FormName.submit();
	FormName.dy.disabled=false;
	return true;

}



//-->
</SCRIPT>
