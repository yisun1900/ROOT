<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String yhjs=(String)session.getAttribute("yhjs");

String ddbh=request.getParameter("ddbh");
String bzdh="";
String sgd="";
String clgwdh="";
String ssfgs="";

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
String tdsj=null;
String sxhtsfysh=null;
String xclbz=null;
String clgw="";
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double hkze=0;
double wdzje=0;
double zczkl=0;
double zqzjhze=0;
double zjhze=0;
try {
	conn=cf.getConnection();
	ls_sql="select xclbz,jc_zcdd.sxhtsfysh,jc_zcdd.zqzjhze,jc_zcdd.zjhze,jc_zcdd.tdsj,jc_zcdd.clzt,jc_zcdd.ppbm,jc_zcdd.bz,crm_khxx.fgsbh,jc_zcdd.xmzy,crm_khxx.khxm,cxhdbm,qhtsj,dwmc,sjs,crm_khxx.sgd,sgbz,jc_zcdd.htshsj,crm_khxx.hth,jc_zcdd.zczkl,jc_zcdd.wdzje,jc_zcdd.hkze,sgdmc,sq_sgd.dh,fwdz,sgbz,lxfs,jc_zcdd.clgw";
	ls_sql+=" from  jc_zcdd,crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and  jc_zcdd.ddbh='"+ddbh+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";

	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
		zqzjhze=rs.getDouble("zqzjhze");
		zjhze=rs.getDouble("zjhze");
		tdsj=cf.fillNull(rs.getDate("tdsj"));
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
		xclbz=cf.fillNull(rs.getString("xclbz"));
		clgw=cf.fillHtml(rs.getString("clgw"));
	 }
	 rs.close();
	 ps.close();


	//if (!xclbz.equals("2") )//1：非定制式产品；2：定制式产品
//	{
//		out.println("错误！非定制品，不需打印测量单");
//		return;
//	}

	

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
	
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+clgw+"' and zwbm='08'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clgwdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	if (yhjs.equals("G0"))
	{
		sjs="&nbsp;";
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
    <td colspan="3" align="center"><strong>测量通知单（<b>订单编号：<%=ddbh%></b>）</strong></td>
  </tr>
  <tr>
    <td height="20">品牌：<strong><%=ppbm%></strong></td>
    <td width="33%" height="20">通知日期：</td>
    <td width="34%" height="20">测量日期：</td>
  </tr>
  <tr>
    <td height="20">签约店面：<b><%=dwmc%></b></td>
    <td height="20">客户姓名：<b><%=khxm%></b></td>
    <td height="20">&nbsp;</td>
  </tr>
  
  <tr> 
    <td colspan="2">地址：<b><%=fwdz%></b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td>现场电话：<b><%=sgbz%> <%=bzdh%></b></td>
  </tr>
  <tr> 
    <td>材料顾问：<b><%=clgw%></b></td>
    <td>材料顾问电话：<b><%=clgwdh%></b></td>
    <td>&nbsp;</td>
  </tr>
</table> 

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 16px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="18%">名称</td>
	<td  width="12%">系列</td>
	<td  width="12%">型号</td>
	<td  width="11%">规格</td>

	<td  width="12%">放置位置</td>
	<td  width="8%">颜色</td>
	<td  width="5%">单位</td>
	<td  width="5%">数量</td>

	<td  width="17%">备注</td>
</tr>
<%

	ls_sql ="SELECT zcmc,zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm,jc_zcddmx.zcysbm,jldwbm,jc_zcddmx.sl,jc_zcddmx.bz  ";
	ls_sql+=" FROM jc_zcddmx";
	ls_sql+=" where jc_zcddmx.ddbh='"+ddbh+"' and lx='1'";
    ls_sql+=" order by jc_zcddmx.zcdlbm,jc_zcddmx.dwbh,jc_zcddmx.zclbbm,jc_zcddmx.zcbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 

</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 16px'>
  <tr valign="top"> 
    <td height="60"><b>备注：</b><%=bz%></td>
  </tr>
</table>


<tr>
 <td colspan="2"><p>&nbsp;</p>
   <p>&nbsp;</p>
   <table width="1233" border="0">
     <tr>
       <td width="430">材料顾问签字：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
       <td width="793">厂商签字:<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
     </tr>
   </table>
   <p>&nbsp;</p>
 <td colspan="2">&nbsp;</td>
</tr>


</body>
</html>

<%
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


