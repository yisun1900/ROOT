<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


  <%
	String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String jlh=cf.GB2Uni(request.getParameter("jlh"));

String khbh=null;


String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String lrsj=null;

String qyrq=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String gdjsjd=null;
String bz=null;
String bjjb=null;
String bjjbmc=null;
double clf=0;
double sgebfb=0;
int fwmj=0;
String kgzsm=null;
String clfStr=null;
String sgebfbStr=null;

double zjxje=0;

double ysglk=0;
double cfje=0;
double zccz=0;
double fwmjcz=0;
double clfbfb=0;
String czkh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh,clfbfb,czkh,clf,cfje,fwmjcz,zccz,ysglk,lrsj";
	ls_sql+=" from cw_cflkjl";
	ls_sql+=" where jlh='"+jlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		clfbfb=rs.getDouble("clfbfb");
		czkh=cf.fillNull(rs.getString("czkh"));
		clf=rs.getDouble("clf");
		cfje=rs.getDouble("cfje");
		fwmjcz=rs.getDouble("fwmjcz");
		zccz=rs.getDouble("zccz");
		ysglk=rs.getDouble("ysglk");
		lrsj=cf.fillNull(rs.getDate("lrsj"));
	}
	rs.close();
	ps.close();

	ls_sql="select gdjsjd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sgd,sgbz,zjxm,crm_khxx.bz";
	ls_sql+=" ,zjxje,crm_khxx.bjjb,bjjbmc,clf,sgebfb,kgzsm,fwmj";
	ls_sql+=" from  crm_khxx,sq_dwxx,bdm_bjjbbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxje=rs.getDouble("zjxje");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		sgebfb=rs.getDouble("sgebfb");
		kgzsm=cf.fillNull(rs.getString("kgzsm"));
		fwmj=rs.getInt("fwmj");

		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));

		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		bz=cf.fillHtml(rs.getString("bz"));

	}
	rs.close();
	ps.close();

	
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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
<html>
<head>
<style type="text/css">
<!--
.STYLE1 {font-size: 16px}
body {
	margin-left: 1.5px;
	margin-top: 5px;
	margin-right: 1.5px;
	margin-bottom: 5px;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>

  <div align="center">
  <table width="98%" border="0" style='FONT-SIZE: 18px'>
    <tr> 
      <td width="35%"><span lang=EN-US><img src="../../images/tubiao111.jpg" v:shapes="_x0000_i1025"></span></td>
      <td width="65%"><strong>辅料卡充值申请单</strong></td>
    </tr>
  </table>
  <table width="98%" border="0" style='FONT-SIZE: 15px'>
    <tr>
      <td width="22%">店面：</td>
      <td width="41%"><%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
	%></td>
      <td width="18%">制表人：</td>
      <td width="19%"><%=yhmc%></td>
    </tr>
    </table>
  <table border="1" width="98%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 15px'>
    <tr> 
      <td width="12%" height="29" align="center"> 
        客户姓名    </td>
      <td width="22%" height="29"><%=khxm%></td>
      <td width="12%" height="29" align="center"> 
        合 同 号    </td>
      <td width="26%" height="29"><%=hth%></td>
      <td width="14%" height="29" align="center">充值日期</td>
      <td width="14%" height="29"><%=lrsj%></td>
    </tr>
    <tr height="29"> 
      <td width="12%" align="center"> 
        施工地址    </td>
      <td colspan="3"><%=fwdz%> </td>
      <td width="14%" align="center">工长名称</td>
      <td width="14%"><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','') from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    </tr>
    <tr height="29"> 
      <td width="12%" align="center"> 
        工料总金额    </td>
      <td width="22%"><%=ysglk%></td>
      <td width="12%" align="center"> 
        拆除项</td>
      <td width="26%"><%=cf.round(cfje,0)%></td>
      <td width="14%" align="center"> 
        辅料卡充值额    </td>
      <td width="14%"><%=cf.round((ysglk-cfje)*0.23,0)%></td>
    </tr>
    <tr height="29">
      <td align="center">面积</td>
      <td><%=fwmj%></td>
      <td align="center">地锢金额</td>
      <td><%=cf.round(fwmjcz,0)%></td>
      <td align="center">套餐超市辅料</td>
      <td><%=cf.round(zccz,0)%></td>
    </tr>
    <tr height="29"> 
      <td colspan="2" align="center">合计</td>
      <td colspan="4" align="left"><%=cf.round(cf.round((ysglk-cfje)*0.23,0)+fwmjcz+zccz,0)%></td>
    </tr>
  </table>
  <table width="926" border="0">
    <tr>
      <td width="88"><span class="STYLE1">开工日期：</span></td>
      <td width="146"><%=kgrq%></td>
      <td width="103"><span class="STYLE1">充值卡号：</span></td>
      <td width="132"><%=czkh%></td>
      <td width="107"><span class="STYLE1">工长签字：</span></td>
      <td width="324">&nbsp;</td>
    </tr>
  </table>
  </div>
<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
<div align="center">
  <table width="98%" border="0" style='FONT-SIZE: 18px'>
    <tr>
      <td width="35%"><span lang=EN-US><img src="../../images/tubiao111.jpg" v:shapes="_x0000_i1025"></span></td>
      <td width="65%"><strong>辅料卡充值申请单</strong></td>
    </tr>
  </table>
  <table width="98%" border="0" style='FONT-SIZE: 15px'>
    <tr>
      <td width="22%">店面：</td>
      <td width="41%"><%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
	%></td>
      <td width="18%">制表人：</td>
      <td width="19%"><%=yhmc%></td>
    </tr>
  </table>
  <table border="1" width="98%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 15px'>
    <tr>
      <td width="12%" height="29" align="center"> 客户姓名 </td>
      <td width="22%" height="29"><%=khxm%></td>
      <td width="12%" height="29" align="center"> 合 同 号 </td>
      <td width="26%" height="29"><%=hth%></td>
      <td width="14%" height="29" align="center">充值日期</td>
      <td width="14%" height="29"><%=lrsj%></td>
    </tr>
    <tr height="29">
      <td width="12%" align="center"> 施工地址 </td>
      <td colspan="3"><%=fwdz%> </td>
      <td width="14%" align="center">工长名称</td>
      <td width="14%"><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','') from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    </tr>
    <tr height="29">
      <td width="12%" align="center"> 工料总金额 </td>
      <td width="22%"><%=ysglk%></td>
      <td width="12%" align="center"> 拆除项</td>
      <td width="26%"><%=cf.round(cfje,0)%></td>
      <td width="14%" align="center"> 辅料卡充值额 </td>
      <td width="14%"><%=cf.round((ysglk-cfje)*0.23,0)%></td>
    </tr>
    <tr height="29">
      <td align="center">面积</td>
      <td><%=fwmj%></td>
      <td align="center">地锢金额</td>
      <td><%=cf.round(fwmjcz,0)%></td>
      <td align="center">套餐超市辅料</td>
      <td><%=cf.round(zccz,0)%></td>
    </tr>
    <tr height="29">
      <td colspan="2" align="center">合计</td>
      <td colspan="4" align="left"><%=cf.round(cf.round((ysglk-cfje)*0.23,0)+fwmjcz+zccz,0)%></td>
    </tr>
  </table>
  <table width="926" border="0">
    <tr>
      <td width="88"><span class="STYLE1">开工日期：</span></td>
      <td width="146"><%=kgrq%></td>
      <td width="103"><span class="STYLE1">充值卡号：</span></td>
      <td width="132"><%=czkh%></td>
      <td width="107"><span class="STYLE1">工长签字：</span></td>
      <td width="324">&nbsp;</td>
    </tr>
  </table>
</div>
<p align="center"></p>
<p align="center"></p>
<p align="center"></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div align="center">
  <table width="98%" border="0" style='FONT-SIZE: 18px'>
    <tr>
      <td width="35%"><span lang=EN-US><img src="../../images/tubiao111.jpg" v:shapes="_x0000_i1025"></span></td>
      <td width="65%"><strong>辅料卡充值申请单</strong></td>
    </tr>
  </table>
  <table width="98%" border="0" style='FONT-SIZE: 15px'>
    <tr>
      <td width="22%">店面：</td>
      <td width="41%"><%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
	%></td>
      <td width="18%">制表人：</td>
      <td width="19%"><%=yhmc%></td>
    </tr>
  </table>
  <table border="1" width="98%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 15px'>
    <tr>
      <td width="12%" height="29" align="center"> 客户姓名 </td>
      <td width="22%" height="29"><%=khxm%></td>
      <td width="12%" height="29" align="center"> 合 同 号 </td>
      <td width="26%" height="29"><%=hth%></td>
      <td width="14%" height="29" align="center">充值日期</td>
      <td width="14%" height="29"><%=lrsj%></td>
    </tr>
    <tr height="29">
      <td width="12%" align="center"> 施工地址 </td>
      <td colspan="3"><%=fwdz%> </td>
      <td width="14%" align="center">工长名称</td>
      <td width="14%"><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','') from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    </tr>
    <tr height="29">
      <td width="12%" align="center"> 工料总金额 </td>
      <td width="22%"><%=ysglk%></td>
      <td width="12%" align="center"> 拆除项</td>
      <td width="26%"><%=cf.round(cfje,0)%></td>
      <td width="14%" align="center"> 辅料卡充值额 </td>
      <td width="14%"><%=cf.round((ysglk-cfje)*0.23,0)%></td>
    </tr>
    <tr height="29">
      <td align="center">面积</td>
      <td><%=fwmj%></td>
      <td align="center">地锢金额</td>
      <td><%=cf.round(fwmjcz,0)%></td>
      <td align="center">套餐超市辅料</td>
      <td><%=cf.round(zccz,0)%></td>
    </tr>
    <tr height="29">
      <td colspan="2" align="center">合计</td>
      <td colspan="4" align="left"><%=cf.round(cf.round((ysglk-cfje)*0.23,0)+fwmjcz+zccz,0)%></td>
    </tr>
  </table>
  <table width="926" border="0">
    <tr>
      <td width="88"><span class="STYLE1">开工日期：</span></td>
      <td width="146"><%=kgrq%></td>
      <td width="103"><span class="STYLE1">充值卡号：</span></td>
      <td width="132"><%=czkh%></td>
      <td width="107"><span class="STYLE1">工长签字：</span></td>
      <td width="324">&nbsp;</td>
    </tr>
  </table>
</div>
<p align="center"></p>
<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
</body>
</html>

