<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>打印开工证</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
String zgsmc=null;

String khbh=request.getParameter("khbh");

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String qye=null;
String wdzgce=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;
String bzdh=null;
String cxhdmc=null;
String dwmc=null;
String kgrq=null;
String jgrq=null;
double clf=0;
double sge=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="SELECT clf,sge,khxm,lxfs,fwdz,hth,qye,wdzgce,sjs,zjxm,sq_dwxx.dwmc dm,crm_khxx.sgd,sgdmc,sgbz,cxhdmc,kgrq,jgrq";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,jc_cxhd";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clf=rs.getDouble("clf");
		sge=rs.getDouble("sge");
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		hth=cf.fillHtml(rs.getString("hth"));
		qye=cf.fillHtml(rs.getString("qye"));
		wdzgce=cf.fillHtml(rs.getString("wdzgce"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		dwmc=cf.fillHtml(rs.getString("dm"));
		sgd=cf.fillHtml(rs.getString("sgd"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		cxhdmc=cf.fillHtml(rs.getString("cxhdmc"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
	}
	rs.close();
	ps.close();

	bzdh="&nbsp;";
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+sgd+"' and yhmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillHtml(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select csz from sq_xtcsb";
	ls_sql+=" where csbm='gsmc' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zgsmc=cf.fillHtml(rs.getString(1));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr valign="top"> 
    <td colspan="3" height="27"> 
      <div align="center"><b><font size="5"><%=zgsmc%>工程开工证</font></b></div>
    </td>
  </tr>
  <tr> 
    <td width="25%"> 
      <div align="left"><%=cf.today("YYYY")%>年<%=cf.today("MM")%>月<%=cf.today("DD")%>日 </div>
    </td>
    <td width="43%">指定材料商： </td>
    <td width="32%"> 指定区域： </td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr> 
    <td width="11%" height="31" align="right"><b>姓名(电话)</b></td>
    <td colspan="2" height="31"><%=khxm%>(<%=lxfs%>)</td>
    <td width="10%" height="31" align="right"><b>工程地址</b></td>
    <td colspan="3" height="31"><%=fwdz%></td>
    <td width="8%" height="31" align="right"><b>优惠活动</b></td>
    <td colspan="2" height="31"><%=cxhdmc%></td>
  </tr>
  <tr> 
    <td width="11%" height="31" align="right"><b>合同工期</b></td>
    <td colspan="3" height="31"><%=kgrq%>(开工)<b> --- </b><%=jgrq%>(竣工)</td>
    <td width="10%" height="31" align="right"><b>档案号</b></td>
    <td width="9%" height="31"><%=hth%></td>
    <td width="10%" height="31" align="right"><b>原报价</b></td>
    <td width="8%" height="31"><%=wdzgce%></td>
    <td width="10%" height="31" align="right"><b>签约额</b></td>
    <td width="11%" height="31"><%=qye%></td>
  </tr>
  <tr> 
    <td width="11%" height="31" align="right"><b>店面(设计师)</b></td>
    <td colspan="3" height="31"><%=dwmc%>(<%=sjs%>)</td>
    <td width="10%" height="31" align="right"><b>质检员</b></td>
    <td width="9%" height="31"><%=zjxm%></td>
    <td width="10%" height="31" align="right"><b>施工额</b></td>
    <td width="8%" height="31"><%=sge%></td>
    <td width="10%" height="31" align="right"><b>可用材料款</b></td>
    <td width="11%" height="31"><%=clf%></td>
  </tr>
  <tr> 
    <td width="11%" height="31" align="right"><b>班长(电话)</b></td>
    <td colspan="3" height="31"><%=sgbz%>(<%=bzdh%>)</td>
    <td width="10%" height="31" align="right"><b>施工队长</b></td>
    <td width="9%" height="31"><%=sgdmc%></td>
    <td width="10%" height="31" align="right"><b>首期款情况</b></td>
    <td colspan="3" height="31">&nbsp;</td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr> 
    <td width="11%" height="29"> 
      <div align="center"><b>领料</b></div>
    </td>
    <td width="11%" height="29"> 
      <div align="center"><b>日期</b></div>
    </td>
    <td width="9%" height="29"> 
      <div align="center"><b>金额</b></div>
    </td>
    <td width="9%" height="29"> 
      <div align="center"><b>余额</b></div>
    </td>
    <td width="10%" height="29"> 
      <div align="center"><b>经办人签字</b></div>
    </td>
    <td width="11%" height="29"> 
      <div align="center"><b>领料</b></div>
    </td>
    <td width="11%" height="29"> 
      <div align="center"><b>日期</b></div>
    </td>
    <td width="9%" height="29"> 
      <div align="center"><b>金额</b></div>
    </td>
    <td width="9%" height="29"> 
      <div align="center"><b>余额</b></div>
    </td>
    <td width="10%" height="29"> 
      <div align="center"><b>经办人签字</b></div>
    </td>
  </tr>
  <tr> 
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
  </tr>
  <tr> 
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
  </tr>
  <tr> 
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
  </tr>
  <tr> 
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
  </tr>
  <tr> 
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="1" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr> 
    <td height="43"> 
      <div align="center">财务签字：</div>
    </td>
    <td height="43"> 
      <div align="center">制单人：</div>
    </td>
  </tr>
</table>

<P>&nbsp;</P>
<P>&nbsp;</P>

<table width="100%" border="0">
  <tr valign="top"> 
    <td colspan="3" height="27"> 
      <div align="center"><b><font size="5"><%=zgsmc%>公司工程开工证</font></b></div>
    </td>
  </tr>
  <tr> 
    <td width="25%"> 
      <div align="left"><%=cf.today("YYYY")%>年<%=cf.today("MM")%>月<%=cf.today("DD")%>日 </div>
    </td>
    <td width="43%">指定材料商： </td>
    <td width="32%"> 指定区域： </td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr> 
    <td width="11%" height="31" align="right"><b>姓名(电话)</b></td>
    <td colspan="2" height="31"><%=khxm%>(<%=lxfs%>)</td>
    <td width="10%" height="31" align="right"><b>工程地址</b></td>
    <td colspan="3" height="31"><%=fwdz%></td>
    <td width="8%" height="31" align="right"><b>优惠活动</b></td>
    <td colspan="2" height="31"><%=cxhdmc%></td>
  </tr>
  <tr> 
    <td width="11%" height="31" align="right"><b>合同工期</b></td>
    <td colspan="3" height="31"><%=kgrq%>(开工)<b> --- </b><%=jgrq%>(竣工)</td>
    <td width="10%" height="31" align="right"><b>档案号</b></td>
    <td width="9%" height="31"><%=hth%></td>
    <td width="10%" height="31" align="right"><b>原报价</b></td>
    <td width="8%" height="31"><%=wdzgce%></td>
    <td width="10%" height="31" align="right"><b>签约额</b></td>
    <td width="11%" height="31"><%=qye%></td>
  </tr>
  <tr> 
    <td width="11%" height="31" align="right"><b>店面(设计师)</b></td>
    <td colspan="3" height="31"><%=dwmc%>(<%=sjs%>)</td>
    <td width="10%" height="31" align="right"><b>质检员</b></td>
    <td width="9%" height="31"><%=zjxm%></td>
    <td width="10%" height="31" align="right"><b>施工额</b></td>
    <td width="8%" height="31"><%=sge%></td>
    <td width="10%" height="31" align="right"><b>可用材料款</b></td>
    <td width="11%" height="31"><%=clf%></td>
  </tr>
  <tr> 
    <td width="11%" height="31" align="right"><b>班长(电话)</b></td>
    <td colspan="3" height="31"><%=sgbz%>(<%=bzdh%>)</td>
    <td width="10%" height="31" align="right"><b>施工队长</b></td>
    <td width="9%" height="31"><%=sgdmc%></td>
    <td width="10%" height="31" align="right"><b>首期款情况</b></td>
    <td colspan="3" height="31">&nbsp;</td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr> 
    <td width="11%" height="29"> 
      <div align="center"><b>领料</b></div>
    </td>
    <td width="11%" height="29"> 
      <div align="center"><b>日期</b></div>
    </td>
    <td width="9%" height="29"> 
      <div align="center"><b>金额</b></div>
    </td>
    <td width="9%" height="29"> 
      <div align="center"><b>余额</b></div>
    </td>
    <td width="10%" height="29"> 
      <div align="center"><b>经办人签字</b></div>
    </td>
    <td width="11%" height="29"> 
      <div align="center"><b>领料</b></div>
    </td>
    <td width="11%" height="29"> 
      <div align="center"><b>日期</b></div>
    </td>
    <td width="9%" height="29"> 
      <div align="center"><b>金额</b></div>
    </td>
    <td width="9%" height="29"> 
      <div align="center"><b>余额</b></div>
    </td>
    <td width="10%" height="29"> 
      <div align="center"><b>经办人签字</b></div>
    </td>
  </tr>
  <tr> 
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
  </tr>
  <tr> 
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
  </tr>
  <tr> 
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
  </tr>
  <tr> 
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
  </tr>
  <tr> 
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
    <td width="11%" height="29"> 
      <div align="center">第 次领料</div>
    </td>
    <td width="11%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="10%" height="29">&nbsp;</td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="1" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr> 
    <td height="43"> 
      <div align="center">财务签字：</div>
    </td>
    <td height="43"> 
      <div align="center">制单人：</div>
    </td>
  </tr>
</table>

</body>
</html>
