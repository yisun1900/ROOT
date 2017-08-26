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

String khxm=null;
String cxhdbm=null;
String sjs="";
String dwmc="";
String sgbz=null;
String hth=null;
String lxfs=null;
String fwdz=null;
String sgdmc=null;
String sgddh=null;
String fgsbh=null;
String bz=null;
String ppbm=null;
String clzt=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double hkze=0;
double wdzje=0;
double zczkl=0;
try {
	conn=cf.getConnection();

	ls_sql="select jc_zcysd.clzt,jc_zcysd.ppbm,jc_zcysd.bz,crm_khxx.fgsbh ,crm_khxx.khxm,cxhdbm,dwmc,sjs,crm_khxx.sgd,sgbz,crm_khxx.hth,jc_zcysd.wdzje,jc_zcysd.hkze,sgdmc,sq_sgd.dh,fwdz,sgbz,lxfs";
	ls_sql+=" from  jc_zcysd,crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where jc_zcysd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and  jc_zcysd.ddbh='"+ddbh+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";

	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		ppbm=cf.fillHtml(rs.getString("ppbm"));
		bz=cf.fillHtml(rs.getString("bz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
 		khxm=cf.fillNull(rs.getString("khxm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
 		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgddh=cf.fillNull(rs.getString("dh"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
 		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
	 }
	 rs.close();
	 ps.close();

	 if (clzt.equals("99"))
	 {
		 hkze=-1*hkze;
	 }

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
    <td width="24%"> <img src="/images/tubiao.jpg"> </td>
    <td colspan="3"><strong>(<%=ppbm%>)主材合同附件---主材订货明细（<b>订单编号：<%=ddbh%></b>）</strong></td>
  </tr>
  <tr> 
    <td height="20" align="right" colspan="2"> 
      <div align="left">客户姓名：<b><%=khxm%></b></div>    </td>
    <td width="33%" align="right" height="20"> 
      <div align="left">联系方式：<b><%=lxfs%></b></div>    </td>
    <td width="34%" align="right" height="20"> 
      <div align="left">合同号：<b><%=hth%></b></div>    </td>
  </tr>
  <tr> 
    <td colspan="4">地址：<b><%=fwdz%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;签约店面/家装设计师：<b><%=dwmc%>/<%=sjs%></b></td>
  </tr>
  <tr> 
    <td colspan="4">施工班长：<b><%=sgbz%> <%=bzdh%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;参加促销活动：<b><%=cxhdbm%></b></td>
  </tr>
</table> 

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="18%">名称；系列</td>
	<td  width="13%">型号；规格</td>

	<td  width="11%">放置位置；颜色</td>
	<td  width="5%">价格</td>
	<td  width="6%">单价</td>
	<td  width="4%">数量</td>

	<td  width="7%">材料费</td>
	<td  width="8%">远程费+其它</td>
	<td  width="4%" bgcolor="#CC99FF">比率</td>
	<td  width="6%">计入金额</td>
	<td  width="18%">备注</td>
</tr>
<%

	if (clzt.equals("99"))
	{
		ls_sql ="SELECT zcmc||'；'||zclbbm,jc_zcysdmx.xinghao||'；'||jc_zcysdmx.gg,zcpzwzbm||'；'||jc_zcysdmx.zcysbm,DECODE(xzjg,'1','销售价','2','<font color=\"#FF0000\">促销价</font>') xzjg,jc_zcysdmx.dj||'/'||jldwbm,-1*jc_zcysdmx.sl,-1*jc_zcysdmx.je,DECODE(ycf+qtfyje,0,'0',DECODE(ycf,0,'',ycf||'+')||DECODE(qtfy,'1','安装费','2','加工费','3','其它收费')||qtfyje),cxhdbl||'%' cxhdbl,-1*ROUND(jc_zcysdmx.je*cxhdbl/100,2)  cxhdje,jc_zcysdmx.bz  ";
	}
	else{
		ls_sql ="SELECT zcmc||'；'||zclbbm,jc_zcysdmx.xinghao||'；'||jc_zcysdmx.gg,zcpzwzbm||'；'||jc_zcysdmx.zcysbm,DECODE(xzjg,'1','销售价','2','<font color=\"#FF0000\">促销价</font>') xzjg,jc_zcysdmx.dj||'/'||jldwbm,jc_zcysdmx.sl,jc_zcysdmx.je,DECODE(ycf+qtfyje,0,'0',DECODE(ycf,0,'',ycf||'+')||DECODE(qtfy,'1','安装费','2','加工费','3','其它收费')||qtfyje),cxhdbl||'%' cxhdbl,ROUND(jc_zcysdmx.je*cxhdbl/100,2)  cxhdje,jc_zcysdmx.bz  ";
	}
	ls_sql+=" FROM jc_zcysdmx";
    ls_sql+=" where jc_zcysdmx.ddbh='"+ddbh+"' and lx='1'";
    ls_sql+=" order by jc_zcysdmx.zcdlbm,jc_zcysdmx.dwbh,jc_zcysdmx.zclbbm,jc_zcysdmx.zcbm";
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
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="34%" height="2"><b>累计金额：<%=hkze%>元（小写）</b></td>
    <td width="37%" height="2"><b>折前金额：<%=wdzje%>元 </b></td>
    <td width="29%" height="2">&nbsp;</td>
  </tr>
</table>


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


