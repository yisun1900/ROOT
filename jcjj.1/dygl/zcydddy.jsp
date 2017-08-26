<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
  <%
	String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String xh=null;
String xmbh=null;
String xmmc=null;

String jgwzbm=null;
String jgwzmc=null;
String oldjgwzmc="";
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
double xjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;

String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgbz=null;
String cxhdbm=null;

String sjsdh="";
String bzdh="&nbsp;";

try {
	conn=cf.getConnection();
	ls_sql="SELECT cxhdbm,sgd,sgbz,crm_khxx.dwbh,dwmc,khxm,lxfs,fwdz,hth,sjs,kgrq,jyjdrq,jgrq,qye,DECODE(bjjb,'A','普通','B','精品','C','乐华梅兰') bjjb";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
		sgd=cf.fillHtml(rs.getString("sgd"));
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		dwbh=cf.fillHtml(rs.getString("dwbh"));
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		hth=cf.fillHtml(rs.getString("hth"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jyjdrq=cf.fillHtml(rs.getDate("jyjdrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		qye=rs.getDouble("qye");
		bjjb=cf.fillHtml(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();

	//设计师电话
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	//班长电话
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillHtml(rs.getString("dh"));
	}
	rs.close();
	ps.close();


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>

  <table width="100%" border="0" style='FONT-SIZE: 18px'>
    <tr> 
      <td width="35%"><span lang=EN-US><img src="../../images/tubiao111.jpg" v:shapes="_x0000_i1025"></span></td>
      <td width="65%"><b>全装修套餐合同附件—套餐外主材明细(<%=cf.today()%>)</b></td>
    </tr>
  </table>
  <table width="100%" border="0" style='FONT-SIZE: 15px'>
    <tr>
      <td width="63%">订购种类：
        <input type="checkbox" name="checkbox4" value="checkbox">
        主材
      </td>
      <td width="37%">&nbsp;</td>
    </tr>
  </table>

<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 15px'>
  <tr> 
    <td width="12%" height="29" align="center"> 
      客户姓名    </td>
    <td width="22%" height="29"><%=khxm%></td>
    <td width="12%" height="29" align="center"> 
      签约店面    </td>
    <td width="26%" height="29"><%=dwmc%></td>
    <td width="14%" height="29" align="center"> 
      合 同 号    </td>
    <td width="14%" height="29"><%=hth%></td>
  </tr>
  <tr height="29"> 
    <td width="12%" align="center"> 
      联系方式    </td>
    <td width="22%"><%=lxfs%></td>
    <td width="12%" align="center"> 
      家装设计师    </td>
    <td width="26%" style='FONT-SIZE: 14px'><%=sjs%>（<%=sjsdh%>）</td>
    <td width="14%" align="center"> 
      同开工日期    </td>
    <td width="14%"><%=kgrq%></td>
  </tr>
  <tr height="29"> 
    <td width="12%" align="center"> 
      施工地址    </td>
    <td colspan="3"><%=fwdz%> </td>
    <td width="14%" align="center"> 
      同完工日期    </td>
    <td width="14%"><%=jgrq%></td>
  </tr>
  <tr height="29"> 
    <td width="12%" align="center"> 
      <div align="center" style='FONT-SIZE: 14px'>家装签约额    </td>
    <td width="22%"><%=qye%>元</td>
    <td width="12%" align="center"> 
      促销活动    </td>
    <td width="26%"><%=cxhdbm%></td>
    <td width="14%" align="center"> 
      订金    </td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="12%" align="center"> 
      现场班长&nbsp;    </td>
    <td width="22%"><%=sgbz%></td>
    <td width="12%" align="center"> 
      联系电话    </td>
    <td colspan="3"><%=bzdh%> </td>
  </tr>
  <tr height="29"> 
    <td colspan="2" align="center"> 
      是否已订其它订制式产品    </td>
    <td colspan="2"> 
      <div align="left"> 
        <input type="checkbox" name="checkbox" value="checkbox">
        橱柜 
        <input type="checkbox" name="checkbox2" value="checkbox">
        木门 
        <input type="checkbox" name="checkbox3" value="checkbox">
        家具
    </td>
    <td width="14%" align="center" > 
      <div align="center" style='FONT-SIZE: 13px'>原派家居设计师    </td>
    <td width="14%">&nbsp;</td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 15px'>
  <tr height="39"> 
    <td colspan="9" align="center"> 
      <font size="4">订 购 意 向 及 说 明</font>    </td>
  </tr>
  <tr align="center" height="29"> 
    <td width="15%"> 
      主材名称    </td>
    <td width="12%"> 
      主要材料描述    </td>
    <td width="10%"> 
      规格    </td>
    <td width="13%"> 
      品牌/色号    </td>
    <td width="8%">单价</td>
    <td width="8%">数量</td>
    <td width="9%">金额</td>
    <td width="11%"> 
      <div align="center" style='FONT-SIZE: 14px'>是否包含配件    </td>
    <td width="14%"> 
      特殊说明    </td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr align="center" height="29"> 
    <td width="15%"> 
      家居设计师    </td>
    <td width="12%">&nbsp;</td>
    <td width="10%"> 
      派单人员    </td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">家居顾问</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr align="center" height="29"> 
    <td width="15%"> 
      联系电话    </td>
    <td width="12%">&nbsp;</td>
    <td width="10%"> 
      派单日期    </td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">拟测量日期</td>
    <td width="14%">&nbsp;</td>
  </tr>
</table>
</body>
</html>

<%
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>