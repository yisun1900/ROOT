<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String yhjs=(String)session.getAttribute("yhjs");
String zjxbh=request.getParameter("zjxbh");
String ddbh=null;
double zjxze=0;
String htshsj=null;

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
String clzt=null;
String lrsj=null;
String zjxfssj=null;
double hkze=0;
String bz=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
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

	ls_sql="select crm_khxx.fgsbh,jc_zcdd.xmzy,crm_khxx.khxm,cxhdbm,qhtsj,dwmc,sjs,crm_khxx.sgd,sgbz,jc_zcdd.htshsj,crm_khxx.hth,hkze,sgdmc,sq_sgd.dh,fwdz,sgbz,lxfs";
	ls_sql+=" from  jc_zcdd,crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and  jc_zcdd.ddbh='"+ddbh+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";

	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		xmzy=cf.fillHtml(rs.getString("xmzy"));
		khxm=cf.fillNull(rs.getString("khxm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
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
		if (!clzt.equals("02") && !clzt.equals("03") && !clzt.equals("04"))//02：已确认；03：已送货
		{
			out.println("错误！未确认的合同不能打印");
			return;
		}
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
<title>主材增减项附件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr align="right">
    <td>
      <div align="left">主材合同附件</div>
    </td>
  </tr>
  <tr align="right"> 
    <td>
      <div align="center"><strong>主材订货（增减项）明细（订单编号：<%=ddbh%>）</strong></div>
    </td>
  </tr>
  <tr align="right"> 
    <td width="34%" height="19"> 
        
      <table width="100%" border="0">
        <tr> 
          <td width="33%" align="right"> 
            <div align="left">客户姓名：<b><%=khxm%></b></div>
          </td>
          <td width="33%" align="right"> 
            <div align="left">联系方式：<b><%=lxfs%></b></div>
          </td>
          <td width="34%" align="right"> 
            <div align="left">合同号：<b><%=hth%></b></div>
          </td>
        </tr>
        <tr> 
          <td colspan="2">地址：<b><%=fwdz%></b></td>
          <td width="34%">签约店面/家装设计师：<b><%=dwmc%>/<%=sjs%></b></td>
        </tr>
        <tr> 
          <td colspan="2">施工班长：<b><%=sgbz%> <%=bzdh%></b></td>
          <td width="34%">参加促销活动：<b><%=cxhdbm%></b></td>
        </tr>
        <tr> 
          <td align="right" width="33%"> 
            <div align="left">项目专员：<b><%=xmzy%></b></div>
          </td>
          <td align="right" width="33%"> 
            <div align="left">项目专员电话：<b><%=xmzydh%></b></div>
          </td>
          <td align="right" width="34%"> 
            <div align="left">合同送货安装日期：<b><%=htshsj%></b></div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="8%">品牌</td>
	<td  width="7%">系列</td>
	<td  width="7%">型号</td>
	<td  width="8%">规格</td>
	<td  width="5%">放置位置</td>
	<td  width="5%">颜色</td>
	<td  width="5%">选择价格</td>
	<td  width="4%">单价</td>
	<td  width="4%">计量单位</td>
	<td  width="6%">增减数量</td>
	<td  width="8%">增减材料费</td>
	<td  width="6%">增减远程费</td>
	<td  width="5%">其它费用</td>
	<td  width="6%">增减其它费金额</td>
	<td  width="5%">是否参加活动</td>
	<td  width="4%" bgcolor="#CC99FF">计入比率</td>
	<td  width="6%">备注</td>
</tr>
<%

	ls_sql ="SELECT jc_zcddmx.dwbh,zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(xzjg,'1','销售价','2','<font color=\"#FF0000\">促销价</font>') xzjg,TO_CHAR(jc_zcddmx.dj) dj,jldwmc,jc_zczjxmx.zjsl,jc_zczjxmx.zjje,jc_zczjxmx.zjycf,DECODE(qtfy,'1','安装费','2','加工费','3','其它收费'),jc_zczjxmx.zjqtfy, DECODE(jc_zcddmx.cxhdbz,'Y','<font color=\"#FF0000\">参加</font>','N','不参加') cxhdbz,cxhdbl||'%' cxhdbl,jc_zczjxmx.bz  ";
	ls_sql+=" FROM jc_zcddmx,jdm_jldwbm,jc_zczjxmx  ";
    ls_sql+=" where jc_zcddmx.xh=jc_zczjxmx.xh";
    ls_sql+=" and jc_zczjxmx.zjxbh='"+zjxbh+"' and jc_zcddmx.jldwbm=jdm_jldwbm.jldwbm(+) ";
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
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr valign="top"> 
    <td height="60">备注：<%=bz%></td>
  </tr>
</table>
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="34%" height="2">合计金额（小写）：<%=zjxze%></td>
    <td width="37%" height="2">&nbsp;</td>
    <td width="29%" height="2"><b></b></td>
  </tr>
  <tr> 
    <td colspan="3">合计金额（大写）：<%=cf.NumToRMBStr(zjxze)%></td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <p><b></b></p>
    </td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <table width="100%" border="0" style='FONT-SIZE: 16px'>
        <tr> 
          <td colspan="2">客户签字：</td>
          <td width="544">经办人：</td>
        </tr>
        <tr> 
          <td colspan="2">签订日期：<%=zjxfssj%></td>
          <td width="544">签订日期：<%=zjxfssj%></td>
        </tr>
      </table>
    </td>
</table>
</body>
</html>



