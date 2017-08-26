<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
double mmyfk=0;
double cgyfk=0;
double jjyfk=0;

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

try {
	conn=cf.getConnection();

	if (zt.equals("2"))//2:家装客户;4:非家装客户
	{
		ls_sql="select khxm,crm_khxx.xmzy,crm_khxx.clgw,fwdz,lxfs,hth,khjl,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq,crm_khxx.jjwjbz";
		ls_sql+=" from  sq_dwxx,crm_khxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clgw=cf.fillNull(rs.getString("clgw"));
			xmzy=cf.fillNull(rs.getString("xmzy"));
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
		ls_sql="select khxm,crm_zxkhxx.clgw,fwdz,lxfs,khjl,sjs,crm_zxkhxx.ssfgs,crm_zxkhxx.zxdm,dwmc,cxhdbm,zxdjbm";
		ls_sql+=" from  sq_dwxx,crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and  (crm_zxkhxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
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


	//预付款
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='62'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
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
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='63'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='64'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='65'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double dhze=0;
	ls_sql="select sum(hkze+zjhze)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and clzt>'07' and clzt not in('98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dhze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//本期合同金额＋本期增减项－本期退单金额
	//主材合同金额计算
	double zcje=0;
	ls_sql="SELECT sum(jc_zcdd.hkze) htze";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.khbh='"+khbh+"'";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		zcje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//主材增减项金额计算
	double zczjxje=0;
	ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
	ls_sql+=" FROM jc_zczjx";
	ls_sql+=" where jc_zczjx.khbh='"+khbh+"'";
	ls_sql+=" and jc_zczjx.clzt not in('00')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		zczjxje=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	double zcfkze=0;
	ls_sql="select sum(hkze+zjhze)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcfkze=rs.getDouble(1);
	}
	rs.close();
	ps.close();


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

<form method="post" action="" name="insertform" target="_blank">
<%
if (dds>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="8%">订单编号</td>
		<td  width="9%">处理状态</td>
		<td  width="14%">品牌</td>
		<td  width="6%">材料顾问</td>

		<td  width="6%">项目专员</td>
		<td  width="9%">合同总额</td>
		<td  width="9%">增减项金额</td>
		<td  width="9%">录入时间</td>
		<td  width="6%">录入人</td>
		<td  width="16%">备注</td>
	</tr>
	<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT jc_zcdd.ddbh,clztmc,ppbm,jc_zcdd.clgw,jc_zcdd.xmzy,jc_zcdd.hkze,jc_zcdd.zjhze,jc_zcdd.lrsj,jc_zcdd.lrr,jc_zcdd.bz";
		ls_sql+=" FROM jc_zcdd,jdm_zcddzt";
		ls_sql+=" where jc_zcdd.khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
		ls_sql+=" order by jc_zcdd.zcdlbm,jc_zcdd.ppbm,jc_zcdd.ddbh";
		pageObj.sql=ls_sql;
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//设置每页显示记录数
		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDate();
		//设置显示列
	String[] disColName={"clgw"};
	pageObj.setDisColName(disColName);

	%>
	</table>
	<%
}
%>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#CCCCFF"> 
                客户编号              </td>
              <td width="31%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="18%" align="right" bgcolor="#CCCCFF"> 
                合同号              </td>
              <td width="32%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right">客户姓名</td>
              <td width="31%"><%=khxm%></td>
              <td width="18%" align="right">房屋地址</td>
              <td width="32%"><%=fwdz%></td>
            </tr>
            
            <tr> 
              <td width="20%" bgcolor="#CCCCFF" align="right">签约店面</td>
              <td width="31%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="18%" bgcolor="#CCCCFF" align="right">家装设计师</td>
              <td width="32%" bgcolor="#CCCCFF"><%=sjs%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right"> 
                施工队              </td>
              <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>
              (<%=sgbz%>)</td>
              <td width="18%" align="right">家装签约日期</td>
              <td width="32%"><%=qyrq%></td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="20%" align="right">合同工期</td>
              <td width="31%"><%=kgrq%>－－<%=jgrq%></td>
              <td width="18%" align="right">质检</td>
              <td width="32%"><%=zjxm%></td>
            </tr>

            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right"><font color="#0000FF">合同总额</font></td>
              <td width="31%"> 
                <input type="text" name="hkze" value="0" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"><font color="#0000FF">未打折合同额</font></td>
              <td width="32%"> 
                <input type="text" name="wdzje" value="0" size="20" maxlength="20" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right"><font color="#0000FF">计入促销活动金额</font></td>
              <td width="31%"> 
                <input type="text" name="htcxhdje" value="0" size="20" maxlength="10" readonly>              </td>
              <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font><font color="#0000FF">订单折扣</font></td>
              <td width="32%"><input type="text" name="zczkl" size="8" maxlength="8" value="<%=zczkl%>" readonly>
                <b><font color="#0000FF">（>0且<=10）</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>主材大类</td>
              <td width="31%"><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onchange="changeDl(insertform)">
                <option value=""></option>
                <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3')  order by cldlmc","");
%>
              </select></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>品牌</td>
              <td colspan="3"><select name="ppbm" style="FONT-SIZE:12PX;WIDTH:520PX" onChange="changePp(insertform)">
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">打折原因</td>
              <td colspan="3"> 
                <textarea name="dzyy" cols="71" rows="3"></textarea>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#0000FF">优惠内容</font></td>
              <td colspan="3"  id="yhnr"></td>
            </tr>
            
    <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right"><font color="#FF0000">*</font>材料顾问</td>
    <td width="31%"> 
    <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                </select>              </td>

    <td width="18%" align="right">家居设计师 </td>
    <td width="32%"><select name="jjsjs" style="FONT-SIZE:12PX;WIDTH:152PX" >
      <option value=""></option>
      <%
	listSql="select sq_yhxx.yhmc c1,sq_yhxx.yhmc||':'||sq_yhxx.dh c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" UNION ALL ";
	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||':'||sq_yhxx.dh c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" ORDER BY c2 ";
	cf.selectItem(out,listSql,jjsjs);
%>
    </select></td>
    </tr>
             
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                <font color="#FF0000">*</font>是否等待送货通知              </td>
              <td width="31%"> 
                <input type="radio" name="ddshbz" value="1" checked>不需等待通知                
                <input type="radio" name="ddshbz" value="2" >需等待通知				</td>
              <td width="18%" align="right"> 
                计划通知送货时间              </td>
              <td width="32%"> 
                <input type="text" name="jhtzshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">合同送货时间</td>
              <td width="31%"> 
                <input type="text" name="htshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)" >              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>签合同时间</td>
              <td width="32%"> 
                <input type="text" name="qhtsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#FFFFFF"> 
                <font color="#FF0000">*</font><font color="#0000CC">录入部门</font>              </td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                可减项截止时间              </td>
              <td width="32%"> 
                <input type="text" name="kjxsj" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">录入人</font>              </td>
              <td width="31%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">录入时间</font>              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 

                <input type="hidden" name="xmzy" value="" >
                <input type="hidden" name="ztjjgw" value="" >
                <input type="hidden" name="ddbh" value="<%=ddbh%>" >
                <input type="hidden" name="fgsbh" value="<%=ssfgs%>" >
                <input type="hidden" name="qddm" value="<%=dmbh%>" >
                <input type="hidden" name="khjl" value="<%=khjl%>" >
                <input type="hidden" name="jzsjs" value="<%=sjs%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="zt" value="<%=zt%>">

				<input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
                <input type="button"  value="完成合同" onClick="f_wc(insertform)" name="wc" disabled>
                <input type="button"  value="打印合同" onClick="window.open('/jcjj/dygl/zcht.jsp?ddbh=<%=ddbh%>')" name="dy" disabled>
                <input type="hidden" name="zcxlbm" value="">
                <BR>
                <BR>
                <input type="button"  value="录入－输入型号" onClick="f_srxh(insertform)" name="srxh" disabled>
                <input type="button"  value="录入－查询型号" onClick="f_cxxh(insertform)" name="cxxh" disabled>
                <input type="button"  value="录入手写项目" onClick="f_xzwc(insertform)" name="xzwc" disabled>
                  <input type="button"  value="批量修改明细" onClick="f_plxg(insertform)" name="plxg" disabled>
                  <input type="button"  value="单项修改明细" onClick="f_dpxg(insertform)" name="dpxg" disabled></td>
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
	czlx=3;

	FormName.ppbm.length=1;

	var sql="select jxc_ppxx.ppmc c1,jxc_ppxx.ppmc||NVL2(yhkssj,'（优惠期'||TO_CHAR(yhkssj,'YYYY-MM-DD')||'至'||TO_CHAR(yhjzsj,'YYYY-MM-DD')||'）','') c2 from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+FormName.fgsbh.value+"' and jxc_ppxx.cldl='"+FormName.zcdlbm.value+"' order by jxc_ppxx.ppmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);
	openAjax(actionStr);
}



function changePp(FormName)
{
	czlx=4;

	var sql="select sfyyh,yhkssj,yhjzsj,yhnr ";
	sql+=" from  jxc_ppxx,jxc_ppgysdzb";
	sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm ";
	sql+=" and jxc_ppgysdzb.ssfgs='<%=ssfgs%>' and jxc_ppxx.ppmc='"+FormName.ppbm.value+"'";

	var actionStr="/jcjj/zcdd/getPpYhnr.jsp?sql="+sql;

//	window.open(actionStr);

	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	if (czlx==3)
	{
		strToSelect(insertform.ppbm,ajaxRetStr);
	}
	else if (czlx==4)
	{
		document.getElementById('yhnr').innerHTML="";
		txtNode=document.createTextNode(ajaxRetStr);//供应商
		document.getElementById('yhnr').appendChild(txtNode);
	}
}


function f_do(FormName)//参数FormName:Form的名称
{
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

	
/*	
	if(	javaTrim(FormName.zcxlbm)=="") {
		alert("请选择[主材小类]！");
		FormName.zcxlbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.jkxz)) {
		alert("请选择[客户交款性质]！");
		FormName.jkxz[0].focus();
		return false;
	}

	if (FormName.jkxz[0].checked)
	{
		notRadio(FormName.jkdd);
	}
	else{
		if(	!radioChecked(FormName.jkdd)) {
			alert("请选择[交款地点]！");
			FormName.jkdd[0].focus();
			return false;
		}
	}
*/

	if(	javaTrim(FormName.hkze)=="") {
		alert("请选择[合同总额]！");
		FormName.hkze.focus();
		return false;
	}
	if(!(isFloat(FormName.hkze, "合同总额"))) {
		return false;
	}
/*
	if (parseFloat(FormName.hkze.value)==0)
	{
		alert("[合同总额]不能为0！");
		FormName.hkze.select();
		return false;
	}
*/
	if(	javaTrim(FormName.wdzje)=="") {
		alert("请输入[未打折合同额]！");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "未打折合同额"))) {
		return false;
	}
	if (parseFloat(FormName.wdzje.value)<parseFloat(FormName.hkze.value))
	{
		alert("[未打折合同额]不能小于[合同总额]！");
		FormName.hkze.select();
		return false;
	}
	if(	javaTrim(FormName.wdzje)=="") {
		alert("请选择[未打折合同额]！");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "未打折合同额"))) {
		return false;
	}
	if(	javaTrim(FormName.htcxhdje)=="") {
		alert("请选择[计入促销活动金额]！");
		FormName.htcxhdje.focus();
		return false;
	}
	if(!(isFloat(FormName.htcxhdje, "计入促销活动金额"))) {
		return false;
	}
	if(	javaTrim(FormName.clgw)=="") {
		alert("请输入[材料顾问]！");
		FormName.clgw.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.xmzy)=="") {
		alert("请输入[项目专员]！");
		FormName.xmzy.focus();
		return false;
	}
	if(	javaTrim(FormName.ztjjgw)=="") {
		alert("请输入[展厅家居顾问]！");
		FormName.ztjjgw.focus();
		return false;
	}
*/
	if(	!radioChecked(FormName.ddshbz)) {
		alert("请选择[是否等待送货通知]！");
		FormName.ddshbz[0].focus();
		return false;
	}


	if(!(isDatetime(FormName.jhtzshsj, "计划通知送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.kjxsj, "可减项截止时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.htshsj, "合同送货时间"))) {
		return false;
	}
	if(	javaTrim(FormName.qhtsj)=="") {
		alert("请输入[签合同时间]！");
		FormName.qhtsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qhtsj, "签合同时间"))) {
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
	if(	javaTrim(FormName.zczkl)=="") {
		alert("请输入[订单折扣]！");
		FormName.zczkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zczkl, "订单折扣"))) {
		return false;
	}
	if (FormName.zczkl.value<=0 || FormName.zczkl.value>10)
	{
		alert("错误！[订单折扣]应该在0和10之间！");
		FormName.zczkl.select();
		return false;
	}
	if (FormName.zczkl.value!=10)
	{
		if(	javaTrim(FormName.dzyy)=="") {
			alert("请输入[打折原因]！");
			FormName.dzyy.focus();
			return false;
		}
	}

	FormName.action="SaveInsertJc_zcdd.jsp";
	FormName.submit();

	FormName.srxh.disabled=false;
	FormName.cxxh.disabled=false;
	FormName.xzwc.disabled=false;
	FormName.plxg.disabled=false;
	FormName.dpxg.disabled=false;
	FormName.wc.disabled=false;
	FormName.dy.disabled=false;

	return true;

}
function f_wc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="EndJc_zcdd.jsp";
	FormName.submit();
	return true;
}
function f_srxh(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertAjaxMain.jsp";
	FormName.submit();
	return true;
}
function f_cxxh(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="SelectCxJc_zcjgb.jsp";
	FormName.submit();
	return true;
}

function f_xzwc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

<%
	if (djlrfs.equals("1"))//1：录入单价算折扣；2：录入折扣算单价；3：不可打折
	{
		%>
		FormName.action="InsertJc_zcddmxSxhtDj.jsp";
		<%
	}
	else if (djlrfs.equals("2"))
	{
		%>
		FormName.action="InsertJc_zcddmxSxhtZk.jsp";
		<%
	}
	else
	{
		%>
		FormName.action="InsertJc_zcddmxSxht.jsp";
		<%
	}
%>

	FormName.submit();
	return true;
}

function f_plxg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

<%
	if (djlrfs.equals("1"))//1：录入单价算折扣；2：录入折扣算单价；3：不可打折
	{
		if (kgcxhdbl.equals("Y"))//Y：可改；N：不可改
		{
			%>
			FormName.action="EditAllDjBlJc_zcddmx.jsp";
			<%
		}
		else{
			%>
			FormName.action="EditAllDjJc_zcddmx.jsp";
			<%
		}
	}
	else if (djlrfs.equals("2"))
	{
		if (kgcxhdbl.equals("Y"))//Y：可改；N：不可改
		{
			%>
			FormName.action="EditAllZkBlJc_zcddmx.jsp";
			<%
		}
		else{
			%>
			FormName.action="EditAllZkJc_zcddmx.jsp";
			<%
		}
	}
	else
	{
		%>
		FormName.action="EditAllNoJc_zcddmx.jsp";
		<%
	}
%>

	FormName.submit();
	return true;
}

function f_dpxg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_zcddmxList.jsp";
	FormName.submit();
	return true;
}



function f_tc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="SelectCxBj_tczcbj.jsp";
	FormName.submit();
	return true;
}

function f_dp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="SelectCxBj_tcwzck.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
