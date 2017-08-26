<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=null;
String khbh=null;
String clgw=null;
String jkxz=null;
String jkdd=null;
String ddshbz=null;
String kjxsj=null;
String xclbz=null;
String htshsj=null;
String xmzy=null;
String qhtsj=null;
String jhclsj=null;
String bz=null;
String clzt="";

double wdzje=0;
double hkze=0;
double zczkl=0;
String dzyy=null;
double htcxhdje=0;
double zjxcxhdje=0;
double zqzjhze=0;
double zjhze=0;



String whereddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmdwbh=null;
String dwmc=null;
String cxhdbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String ppbm=null;
String ztjjgw=null;
String sxhtsfysh=null;


double yfkze=0;
double zcfk=0;
int yfksl=0;
String mark="";

try {
	conn=cf.getConnection();

	ls_sql="select clzt,sxhtsfysh,wdzje,hkze,zczkl,dzyy,htcxhdje,zjxcxhdje,zqzjhze,zjhze   ,ztjjgw,zcdlbm,ppbm,ddbh,khbh,clgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+whereddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		zczkl=rs.getDouble("zczkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		htcxhdje=rs.getDouble("htcxhdje");
		zjxcxhdje=rs.getDouble("zjxcxhdje");
		zqzjhze=rs.getDouble("zqzjhze");
		zjhze=rs.getDouble("zjhze");

		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
		jkxz=cf.fillNull(rs.getString("jkxz"));
		jkdd=cf.fillNull(rs.getString("jkdd"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		xclbz=cf.fillNull(rs.getString("xclbz"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhclsj=cf.fillNull(rs.getDate("jhclsj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	if (clzt.equals("99"))
	{
		out.println("<font color=\"#FF0000\"><B>注意！该订单已退单</B></font>");
	}


	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,ssfgs,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		dmdwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();

	if (sxhtsfysh.equals("N"))
	{
		out.println("<BR><strong><font color=\"#FF0000\">错误，手写合同未审核，不能确认！</font></strong>");
		return;
	}


	if (zczkl<10)
	{
		out.println("<B><font color=\"#FF0000\">提醒！已打折！折扣率＝"+zczkl+"</B></font><P>");
	}

	//家居预付款
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('62','63','64','65')";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yfkze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where ddbh='"+ddbh+"' and scbz='N' and fklxbm='23' and gysbh='"+ppbm+"'";//21:木门；22:橱柜；23:主材；24：家具
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	if ( zcfk < (hkze+zjhze-11))
	{
		if ( yfkze < (hkze+zjhze-11-zcfk))
		{
			mark="1";//预付款不足，退出
		}
		else{
			mark="2";//付款不足,需预付款转换
		}
	}
%>

<html>
<head>
<title>订单确认</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="" name="editform" >
<div align="center">订单确认（订单编号：<%=ddbh%>）（差11元以内可确认） </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right" bgcolor="#FFFFFF"><b>订单折扣</b></td>
      <td width="29%"><%=zczkl%> </td>
      <td width="21%" align="right">&nbsp;</td>
      <td width="29%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><b>打折原因</b></td>
      <td colspan="3"><%=dzyy%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><b>折前－合同额</b></td>
      <td width="29%"><%=wdzje%></td>
      <td width="21%" align="right"><b>折后－合同额</b></td>
      <td width="29%"><%=hkze%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><b>折前－增减项金额</b></td>
      <td width="29%"><%=zqzjhze%></td>
      <td width="21%" align="right"><b>折后－增减项金额</b></td>
      <td width="29%"><%=zjhze%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        <b>折前－增减后总额</b>
      </td>
      <td width="29%"><%=cf.formatDouble(wdzje+zqzjhze)%> </td>
      <td width="21%" align="right"> 
        <b>折后－增减后总额</b>
      </td>
      <td width="29%"><%=cf.formatDouble(hkze+zjhze)%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><b>合同计入促销活动金额</b></td>
      <td width="29%"><%=htcxhdje%></td>
      <td width="21%" align="right"><b>增减项计入促销活动金额</b></td>
      <td width="29%"><%=zjxcxhdje%></td>
    </tr>
  </TABLE>

<%
	  if (mark.equals("1") || mark.equals("2"))
	  {
%>
  
	<BR>	 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#FFFFCC" ><strong><font color="#FF0000">提醒！付款不足，需用预付款转出！</font></strong></td>
	</tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="2" rowspan="5" align="center" valign="top" >


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="10%">&nbsp;</td>
	<td  width="45%">可用预付款</td>
	<td  width="45%">可用金额</td>
  </tr>
  <%
	String fklxbm=null;
	String fklxmc=null;
	double fkje=0;

	ls_sql="SELECT cw_khfkjl.fklxbm,cw_fklxbm.fklxmc,sum(cw_khfkjl.fkje) fkje";
	ls_sql+=" FROM cw_khfkjl,cw_fklxbm";
	ls_sql+=" where cw_khfkjl.fklxbm=cw_fklxbm.fklxbm(+) ";
	ls_sql+=" and cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('62','63','64','65')";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ls_sql+=" group by cw_khfkjl.fklxbm,cw_fklxbm.fklxmc";
	ls_sql+=" having sum(cw_khfkjl.fkje)!=0 ";
	ls_sql+=" order by sum(cw_khfkjl.fkje) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fklxbm=rs.getString("fklxbm");
		fklxmc=cf.fillHtml(rs.getString("fklxmc"));
		fkje=rs.getDouble("fkje");

		yfksl++;

		%> 
		  <tr bgcolor="#FFFFFF"  align="center"> 
			<td>
				<input name="fklxbm" type="checkbox" value="<%=fklxbm%>">			</td>
			<td><%=fklxmc%></td>
			<td align="right"><%=cf.formatDouble(fkje)%>
				<input name="fkje" type="hidden" value="<%=fkje%>">			</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	%> 
</table>	  </td>
      <td width="21%" align="right" bgcolor="#FFFFCC"><b><font color="#0000FF">订货金额</font></b></td>
      <td width="29%" bgcolor="#FFFFCC"><%=cf.round(hkze+zjhze,2)%>（合同＋增减项）</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><b><font color="#0000FF">订单已付款</font></b></td>
      <td bgcolor="#FFFFCC"><%=zcfk%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><strong><font color="#0000FF">应补交货款</font></strong></td>
      <td bgcolor="#FFFFCC"><%=cf.round(hkze+zjhze-zcfk,2)%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><strong><font color="#0000FF">可用预付款</font></strong></td>
      <td bgcolor="#FFFFCC"><%=yfkze%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>预付款转出额</td>
      <td bgcolor="#FFFFCC"><input type="text" name="sfkje" size="20" maxlength="20" value="<%=cf.round(hkze+zjhze-zcfk,2)%>"></td>
    </tr>
  </TABLE>

<%
	}
	else{
		%>
	<BR>	 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="21%" align="right" bgcolor="#FFFFCC"><b><font color="#0000FF">订货金额</font></b></td>
      <td width="29%" bgcolor="#FFFFCC"><%=cf.round(hkze+zjhze,2)%>（合同＋增减项）</td>
      <td width="21%" align="right" bgcolor="#FFFFCC"><b><font color="#0000FF">订单已付款</font></b></td>
      <td width="29%" bgcolor="#FFFFCC"><%=zcfk%><input type="hidden" name="sfkje"  value="0"></td>
    </tr>
  </TABLE>
		<%
	}
		
%>

	<BR>	 

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>是否等待送货通知 </td>
      <td><%
	cf.radioToken(out, "ddshbz","1+不需等待通知&2+需等待通知",ddshbz);
%></td>
      <td align="right">合同送货时间</td>
      <td><input type="text" name="htshsj" size="20" maxlength="10"  value="<%=htshsj%>" onDblClick="JSCalendar(this)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">订单确认人</font> </td>
      <td><input type="text" name="ddqrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">订单确认时间</font> </td>
      <td><input type="text" name="ddqrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
	
    <tr> 
      <td width="100%" height="2" colspan="4" align="center">
          <input type="hidden" name="ddbh" value="<%=ddbh%>" >
          <input type="button" name="bc"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输" name="reset" onClick="bc.disabled=false">
          <input type="button" value="查看客户电话" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')">
          <input name="button" type="button" onClick="window.open('/jcjj/zcdd/Cw_khfkjlCxList.jsp?ddbh=<%=ddbh%>')" value="付款信息"></td>
    </tr>
  </table>
</form>

<%
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
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right" bgcolor="#CCCCFF"> 
      客户编号    </td>
    <td width="31%" bgcolor="#CCCCFF"> <%=khbh%> </td>
    <td width="19%" align="right" bgcolor="#CCCCFF"> 
      合同号    </td>
    <td width="31%" bgcolor="#CCCCFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">客户姓名</td>
    <td width="31%"><%=khxm%></td>
    <td width="19%" align="right">质检</td>
    <td width="31%"><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#CCCCFF" align="right">签约店面</td>
    <td width="31%" bgcolor="#CCCCFF"><%=dwmc%></td>
    <td width="19%" bgcolor="#CCCCFF" align="right">家装设计师</td>
    <td width="31%" bgcolor="#CCCCFF"><%=sjs%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      施工队    </td>
    <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td width="19%" align="right"> 
      班长    </td>
    <td width="31%"><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      家装签约日期    </td>
    <td width="31%"> <%=qyrq%> </td>
    <td width="19%" align="right"> 
      家装签约额    </td>
    <td width="31%"><%=qye%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">合同开工日期</td>
    <td width="31%"><%=kgrq%></td>
    <td width="19%" align="right">合同竣工日期</td>
    <td width="31%"><%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">参加促销活动</td>
    <td width="31%"> <%=cxhdbm%> </td>
    <td width="19%" align="right">品牌</td>
    <td width="31%"><%=ppbm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">客户交款性质</td>
    <td width="31%"><%
	cf.radioToken(out, "1+未付款&2+全款&3+材料商收余款&4+预付款减出&5+退货款减出",jkxz,true);
%></td>
    <td width="19%" align="right">交款地点</td>
    <td width="31%"><%
	cf.radioToken(out, "1+材料商现场收余款&2+店面收款&3+公司财务收款",jkdd,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"> 
      驻店家居顾问    </td>
    <td width="31%"> <%=clgw%> </td>
    <td width="19%" align="right"> 
      展厅家居顾问    </td>
    <td width="31%"><%=ztjjgw%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">项目专员</td>
    <td width="31%"><%=xmzy%></td>
    <td width="19%" align="right">&nbsp;</td>
    <td width="31%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">需测量标志</td>
    <td width="31%"><%
	cf.selectToken(out,"1+不需测量&2+等待测量通知&3+测量已通知&4+已测量",xclbz,true);
%></td>
    <td width="19%" align="right">计划测量时间</td>
    <td width="31%"><%=jhclsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"> 
      等待送货通知    </td>
    <td width="31%"><%
	cf.selectToken(out,"1+不需待电&2+待电未通知&3+待电已通知",ddshbz,true);
%> </td>
    <td width="19%" align="right"> 
      合同送货时间    </td>
    <td width="31%"><%=htshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"> 
      签合同时间    </td>
    <td width="31%"><%=qhtsj%> </td>
    <td width="19%" align="right"> 
      可减项截止时间    </td>
    <td width="31%"><%=kjxsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">备注</td>
    <td colspan="3"><%=bz%></td>
  </tr>
</table>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">类型</td>
	<td  width="5%">主材名称</td>
	<td  width="6%">系列</td>
	<td  width="5%">型号</td>
	<td  width="7%">规格</td>
	<td  width="5%" bgcolor="#CC99FF">铺装位置</td>
	<td  width="5%" bgcolor="#CC99FF">颜色</td>
	<td  width="5%" bgcolor="#CC99FF">选择价格</td>
	<td  width="3%">单价</td>
	<td  width="3%">单位</td>
	<td  width="4%">合同数量</td>
	<td  width="5%">合同材料费</td>
	<td  width="4%">合同远程费</td>
	<td  width="4%">合同其它费</td>
	<td  width="5%" bgcolor="#CC99FF">增减后数量</td>
	<td  width="5%" bgcolor="#CC99FF">增减后材料费</td>
	<td  width="4%" bgcolor="#CC99FF">增减后远程费</td>
	<td  width="4%" bgcolor="#CC99FF">增减后其它费</td>
	<td  width="4%">配件数</td>
	<td  width="4%" bgcolor="#CC99FF">计入活动比率</td>
	<td  width="5%">计入活动金额</td>
	<td  width="5%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql ="SELECT DECODE(jc_zcddmx.lx,'1','合同项','2','增项') lx,zcmc,zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm";
	ls_sql+=" ,jc_zcddmx.zcysbm,DECODE(xzjg,'1','销售价','2','<font color=\"#FF0000\">促销价</font>') xzjg,TO_CHAR(jc_zcddmx.dj) dj";
	ls_sql+=" ,jldwbm,jc_zcddmx.sl,jc_zcddmx.je,ycf,qtfyje,zjhsl,zjhje,zjhycf,zjhqtfy";
	ls_sql+=" ,jc_zcddmx.pjts*jc_zcddmx.zjhsl pjzs";
	ls_sql+=" ,cxhdbl||'%' cxhdbl,cxhdje,jc_zcddmx.bz  ";
	ls_sql+=" FROM jc_zcddmx";
    ls_sql+=" where jc_zcddmx.ddbh='"+ddbh+"' ";
    ls_sql+=" order by jc_zcddmx.lx,jc_zcddmx.zcdlbm,jc_zcddmx.dwbh,jc_zcddmx.zclbbm,jc_zcddmx.zcbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
<%
if (mark.equals("1") || mark.equals("2"))
{
	%>

	if(	javaTrim(FormName.sfkje)=="") {
		alert("付款不足，需用预付款转出！请输入[预付款转出额]！");
		FormName.sfkje.focus();
		return false;
	}
	if(!(isFloat(FormName.sfkje, "预付款转出额"))) {
		return false;
	}
	if (parseFloat(FormName.sfkje.value)< <%=(hkze+zjhze-zcfk-11)%> || parseFloat(FormName.sfkje.value)> <%=(hkze+zjhze-zcfk+11)%>)
	{
		if ( !confirm("提醒！[预付款转出额]小于[<%=cf.round(hkze+zjhze-zcfk-11,2)%>]，或大于[<%=cf.round(hkze+zjhze-zcfk+11,2)%>]，确实要继续吗?") )	
		{
			return false;
		}
	}

	
	
	var choo=0;
	var zkje=0;

	if (<%=yfksl%>==1)
	{
		if( FormName.fklxbm.checked )
		{
			choo=1;
			zkje=zkje+parseFloat(FormName.fkje.value);
		}
	} 
	else
	{ 
		for (var i=0;i <<%=yfksl%>;i++ )
		{
			if( FormName.fklxbm[i].checked )
			{
				choo=1;
				zkje=zkje+parseFloat(FormName.fkje[i].value);
			}
		} 
	} 

	if (zkje < parseFloat(FormName.sfkje.value) ){
		alert("转款不足，请在左侧选择转换款项，转款合计＝"+zkje+"，需转款＝"+parseFloat(FormName.sfkje.value));
		return false;
	}

	<%
}
%>
	
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	if(	!radioChecked(FormName.ddshbz)) {
		alert("请选择[是否等待送货通知]！");
		FormName.ddshbz[0].focus();
		return false;
	}
	if (FormName.ddshbz[0].checked)
	{
		if(	javaTrim(FormName.htshsj)=="") {
			alert("请选择[合同送货时间]！");
			FormName.htshsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.htshsj, "合同送货时间"))) {
			return false;
		}
	}

	if(	javaTrim(FormName.ddqrr)=="") {
		alert("请选择[订单确认人]！");
		FormName.ddqrr.focus();
		return false;
	}
	if(	javaTrim(FormName.ddqrsj)=="") {
		alert("请选择[订单确认时间]！");
		FormName.ddqrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ddqrsj, "订单确认时间"))) {
		return false;
	}


	FormName.action="SaveZkQrJc_zcdd.jsp";
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}

//-->
</SCRIPT>
