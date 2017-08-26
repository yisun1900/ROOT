<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String yhjs=(String)session.getAttribute("yhjs");

String zjxbh=request.getParameter("zjxbh");
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
String tdsj=null;
String clgw=null;
String bjjbmc=null;

String ddbh=null;
double zjxze=0;
String htshsj=null;
String lrsj=null;
String zjxfssj=null;


String khbh=null;

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
	
	ls_sql="select ddbh,zjxze,jc_zczjx.htshsj,clzt,lrsj,zjxfssj,bz";
	ls_sql+=" from  jc_zczjx";
	ls_sql+=" where jc_zczjx.zjxbh='"+zjxbh+"'";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		zjxze=rs.getDouble("zjxze");
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		clzt=cf.fillNull(rs.getString("clzt"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));
		bz=cf.fillNull(rs.getString("bz"));
	 }
	 rs.close();
	 ps.close();
	
	ls_sql="select jc_zcdd.khbh,jc_zcdd.clgw,jc_zcdd.zqzjhze,jc_zcdd.zjhze,jc_zcdd.tdsj,jc_zcdd.clzt,jc_zcdd.ppbm,jc_zcdd.bz,crm_khxx.fgsbh,jc_zcdd.xmzy,crm_khxx.khxm,cxhdbm,qhtsj,dwmc,sjs,crm_khxx.sgd,sgbz,jc_zcdd.htshsj,crm_khxx.hth,jc_zcdd.zczkl,jc_zcdd.wdzje,jc_zcdd.hkze,sgdmc,sq_sgd.dh,fwdz,sgbz,lxfs";
	ls_sql+=" from  jc_zcdd,crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and  jc_zcdd.ddbh='"+ddbh+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";

	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
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
	 }
	 rs.close();
	 ps.close();

	ls_sql="select bjjbmc,sgdmc,'('||sq_sgd.dh||')' dh";
	ls_sql+=" from  crm_zxkhxx,bdm_bjjbbm,sq_sgd";
	ls_sql+=" where crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and  crm_zxkhxx.khbh='"+khbh+"'";
	ls_sql+=" and  crm_zxkhxx.sgd=sq_sgd.sgd(+)";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgddh=cf.fillNull(rs.getString("dh"));
	 }
	 rs.close();
	 ps.close();

	 if (clzt.equals("99"))
	 {
		 hkze=-1*(hkze+zjhze);
		 wdzje=-1*(wdzje+zqzjhze);
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

%>

<html>
<head>
<title>主材附件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="24%">&nbsp; </td>
		<td colspan="3"><strong>(<%=ppbm%>)主材合同附件---主材订货明细（<b>增减项编号：<%=zjxbh%></b>）</strong></td>
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
    <td colspan="4">施工队：<b><%=sgdmc%><%=sgddh%></b>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
<%
	 if (clzt.equals("99"))
	 {
		%>
		退单时间：<b><%=tdsj%></b>
		<%
	 }
	 else{
		%>
		合同送货日期：<b><%=htshsj%></b>
		<%
	 }

%>	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	材料顾问：<b><%=clgw%></b>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	报价级别：<b><%=bjjbmc%></b>

</td>
  </tr>
  <tr>
    <td colspan="4">
	</td>
  </tr>
</table> 

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="18%">名称；系列</td>
	<td  width="14%">型号</td>
	<td  width="14%">规格</td>

	<td  width="12%">放置位置；颜色</td>
	<td  width="7%">单价</td>
	<td  width="6%">增减数量</td>

	<td  width="7%">增减材料费</td>
	<td  width="8%">远程费+其它</td>
	<td  width="17%">备注</td>
</tr>
<%

	ls_sql ="SELECT zcmc||'；'||zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm||'；'||jc_zcddmx.zcysbm,jc_zcddmx.dj||'/'||jldwbm,jc_zczjxmx.zjsl,jc_zczjxmx.zjje,NVL(jc_zczjxmx.zjycf,0)+NVL(jc_zczjxmx.zjqtfy,0),jc_zcddmx.bz  ";

	ls_sql+=" FROM jc_zcddmx,jc_zczjxmx  ";
    ls_sql+=" where jc_zcddmx.xh=jc_zczjxmx.xh";
    ls_sql+=" and jc_zczjxmx.zjxbh='"+zjxbh+"'";

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
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="34%" height="2"><b>累计金额：<%=zjxze%>元（小写）</b></td>
    <td width="37%" height="2"><b>（大写）：<%=cf.NumToRMBStr(zjxze)%></b></td>
    <td width="29%" height="2"><b>实交款额：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元（小写）</b></td>
  </tr>
  
  <tr> 
    <td colspan="3"> 
      <p><b></b></p>    </td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <table width="100%" border="0" style='FONT-SIZE: 16px'>
        <tr> 
          <td colspan="3"> 客户签字：<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
          <td colspan="3"> 经 办 人：<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
        </tr>
        <tr> 
          <td colspan="3"> 签订日期：<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
          <td colspan="3"> 签订日期：<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
        </tr>
      </table>    </td>
</table>


</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception:" + e);
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


