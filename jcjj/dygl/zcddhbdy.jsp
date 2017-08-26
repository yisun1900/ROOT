<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String yhjs=(String)session.getAttribute("yhjs");

String[] ddbh=request.getParameterValues("ddbh");
String bzdh="";
String sgd="";
String khxm=null;
String cxhdbm=null;
String sjs="";
String dwmc="";
String sgbz=null;
String hth=null;
String jc_mmydd_jhazsj=null;
String qhtsj=null;
String lxfs=null;
String fwdz=null;
String sgdmc=null;
String sgddh=null;
String fgsbh=null;
String xmzy=null;
String xmzydh=null;
String bz=null;
String ppbm=null;
String clzt=null;
String sxhtshr=null;
String clgw=null;
String bjjb="";
String sxhtsfysh=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double hkze=0;
double wdzje=0;
double zczkl=0;


	
try {
	conn=cf.getConnection();
	ls_sql="select jc_zcdd.sxhtshr,jc_zcdd.clzt,jc_zcdd.ppbm,jc_zcdd.bz,crm_khxx.fgsbh,jc_zcdd.xmzy,crm_khxx.khxm,cxhdbm,qhtsj,dwmc,sjs,crm_khxx.sgd,sgbz,jc_zcdd.htshsj,crm_khxx.hth,jc_zcdd.zczkl,jc_zcdd.wdzje,jc_zcdd.hkze,sgdmc,sq_sgd.dh,fwdz,sgbz,lxfs,jc_zcdd.clgw,crm_khxx.bjjb,sxhtsfysh";
	ls_sql+=" from  jc_zcdd,crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and  jc_zcdd.ddbh='"+ddbh[0]+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";

	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sxhtshr=cf.fillNull(rs.getString("sxhtshr"));
		clzt=cf.fillNull(rs.getString("clzt"));
		ppbm=cf.fillHtml(rs.getString("ppbm"));
		bz=cf.fillHtml(rs.getString("bz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		xmzy=cf.fillHtml(rs.getString("xmzy"));
		khxm=cf.fillNull(rs.getString("khxm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		zczkl=rs.getDouble("zczkl");
		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgddh=cf.fillNull(rs.getString("dh"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		jc_mmydd_jhazsj=cf.fillNull(rs.getDate("htshsj"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		clgw=cf.fillNull(rs.getString("clgw"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
	 }
	 rs.close();
	 ps.close();
 
//String sxhtsfysh=cf.executeQuery("select sxhtsfysh from jc_zcdd where ddbh='"+ddbh+"'"); 

	if (sxhtsfysh!=null && sxhtsfysh.equals("N"))//M：非手写合同；Y：已审核；N：未审核
	{
		out.println("错误！手写合同未审核，不能打印");
		return;
	}

	 if (clzt.equals("99"))
	 {
		 hkze=-1*hkze;
	 }
	
	//out.println(ls_sql);

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select bgdh from sq_yhxx";
	ls_sql+=" where yhmc='"+xmzy+"' and ssfgs ='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmzydh=cf.fillHtml(rs.getString("bgdh"));
	}
	rs.close();
	ps.close();

	if (yhjs.equals("G0"))
	{
		sjs="&nbsp;";
	}
}
catch (Exception e) {
	out.print("Exception:2 " + e);
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
<title>主材附件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="24%"> <img src="/images/tubiao111.jpg"> </td>
	  <div align="center"><strong>全装修套餐合同附件—套餐外主材明细</strong></div>
  </tr>
  <tr> 
    <td height="20" align="right" colspan="2"> 
      <div align="left">客户姓名：<b><%=khxm%></b></div>
    </td>
    <td width="33%" align="right" height="20"> 
      <div align="left">联系方式：<b><%=lxfs%></b></div>
    </td>
    <td width="34%" align="right" height="20"> 
      <div align="left">合同号：<b><%=hth%></b></div>
    </td>
  </tr>
  <tr> 
    <td colspan="4">地址：<b><%=fwdz%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;签约店面/家装设计师：<b><%=dwmc%>/<%=sjs%></b></td>
  </tr>
  <tr> 
    <td colspan="4">施工班长：<b><%=sgbz%> <%=bzdh%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;参加促销活动：<b><%=cxhdbm%></b></td>
  </tr>
  <tr> 
    <td align="right" colspan="2"> 
      <div align="left">项目专员：<b><%=xmzy%></b></div>
    </td>
    <td align="right" width="33%"> 
      <div align="left">项目专员电话：<b><%=xmzydh%></b></div>
    </td>
    <td align="right" width="34%"> 
		<div align="left">审核人：<b><%=sxhtshr%></b></div>
    </td>
  </tr>
    <tr> 
    <td align="right" colspan="2"> 
      <div align="left">材料顾问：<b><%=clgw%></b></div>
    </td>
    <td align="right" width="33%"> 
      <div align="left">套餐级别：<b><%=bjjb%></b></div>
    </td>
  </tr>
</table> 



<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="8%">品牌</td>
	<td  width="10%">名称</td>
	<td  width="8%">系列</td>
	<td  width="7%">型号</td>
	<td  width="8%">规格</td>

	<td  width="6%">放置位置</td>
	<td  width="7%">颜色</td>
	<td  width="5%">价格</td>
	<td  width="6%">单价</td>
	<td  width="4%">数量</td>

	<td  width="7%">材料费</td>
	<td  width="8%">远程费+其它</td>
	<td  width="8%">材料费+远程费+其它</td>
	<td  width="4%" bgcolor="#CC99FF">比率</td>
	<td  width="6%">计入金额</td>
	<td  width="6%">备注</td>
</tr>
<%
	ls_sql ="SELECT dwbh,zcmc,zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(xzjg,'1','销售价','2','<font color=\"#FF0000\">促销价</font>') xzjg,jc_zcddmx.dj||'/'||jldwbm,jc_zcddmx.sl,jc_zcddmx.je,qtfyje+ycf,je+qtfyje+ycf,cxhdbl||'%' cxhdbl,cxhdje,jc_zcddmx.bz  ";
	ls_sql+=" FROM jc_zcddmx";
    ls_sql+=" where lx='1' and "+cf.GB2Uni(cf.arrayToInSQL(ddbh,"ddbh"));
    ls_sql+=" order by jc_zcddmx.zcdlbm,jc_zcddmx.dwbh,jc_zcddmx.zclbbm,jc_zcddmx.ddbh,jc_zcddmx.zcbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
	
	
%> 
</table>

<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td colspan="4"><p>客户签字:<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 设计师签字:<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></p>
      <p>&nbsp;</p></td>
  </tr>
  <tr> 
    <td colspan="4"><p>材料顾问签字:<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 店长签字：<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></p></td>
  </tr>
</table>

</body>
</html>


