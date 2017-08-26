<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String jzssk=null;
String cxhddj=null;
String jrhdje=null;
String ybkje=null;
String yfkje=null;
String lrr=null;
String lrsj=null;
String bz=null;
String blr=null;
String blsj=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));


String khxm=null;
String hth=null;
String lxfs=null;
String qtdh=null;
String sjs=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jzssk,cxhddj,jrhdje,ybkje,yfkje,lrr,lrsj,bz,blr,blsj ";
	ls_sql+=" from  cw_jcfkd";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jzssk=cf.fillNull(rs.getString("jzssk"));
		cxhddj=cf.fillNull(rs.getString("cxhddj"));
		jrhdje=cf.fillNull(rs.getString("jrhdje"));
		ybkje=cf.fillNull(rs.getString("ybkje"));
		yfkje=cf.fillNull(rs.getString("yfkje"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		blr=cf.fillNull(rs.getString("blr"));
		blsj=cf.fillNull(rs.getDate("blsj"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,hth,lxfs,qtdh,sjs";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		hth=cf.fillNull(rs.getString("hth"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		sjs=cf.fillNull(rs.getString("sjs"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<title>集成家居优惠活动返款单</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {
	font-size: 18px;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<table width="90%" border="0" style="FONT-SIZE:16" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="41%"><span lang=EN-US><img src="/images/tubiao.jpg" v:shapes="_x0000_i1025"></span></td>
    <td width="59%"><span class="STYLE1">集成家居优惠活动返款单</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>办理日期：<%=blsj%></td>
    <td align="right"> （一式两份）</td>
  </tr>
</table>

<table width="90%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr align="center" bgcolor="#FFFFFF">
    <td height="30"><strong>客户姓名</strong></td>
    <td width="16%"><%=khxm%></td>
    <td width="14%"><strong>合同号</strong></td>
    <td width="18%"><%=hth%></td>
    <td><strong>家装设计师</strong></td>
    <td><%=sjs%></td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF">
    <td><strong>联系电话</strong></td>
    <td colspan="3"><%=lxfs%>、<%=qtdh%></td>
    <td><p align="center"><strong>促销活动<BR>订金金额</strong></td>
    <td><%=cxhddj%></td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="18%" height="30"><strong>家装实收款</strong></td> 
  <td colspan="3"><%=jzssk%> </td>
  <td width="16%"><strong>经办人签字</strong></td> 
  <td width="18%">&nbsp;</td>
</tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="18%"><strong>集成家居可计入<BR>活动金额</strong></td> 
  <td colspan="3"><%=jrhdje%>  </td>
  <td><strong>经办人签字</strong></td>
  <td>&nbsp;</td>
</tr>
<tr align="center" bgcolor="#FFFFFF">
  <td height="30"><strong>应补（扣）款</strong></td>
  <td colspan="3"><%=ybkje%></td>
  <td><strong>审核人签字</strong></td>
  <td>&nbsp;</td>
</tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="18%" rowspan="2"><p align="center"><strong>最终应返款<BR>（大写金额）</strong></td>
  <td colspan="3"><%=yfkje%></td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr align="center" bgcolor="#FFFFFF">
  <td colspan="3"><%=yfkje%> </td>
  <td><strong>经办人签字</strong></td>
  <td>&nbsp;</td>
</tr>


<tr align="center" bgcolor="#FFFFFF">
  <td width="18%" align="center" valign="middle">
    &nbsp;<BR>
    <strong>备注</strong><BR>
    &nbsp;
    </td> 
  <td colspan="5" align="left"><%=bz%>  </td>
  </tr>
</table>
<BR>
<table width="90%" border="0" style="FONT-SIZE:16" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="25%">总经理：</td>
    <td width="25%">财务经理：</td>
    <td width="25%">录入人：<%=lrr%></td>
    <td width="25%">领款人：</td>
  </tr>
</table>

</body>
</html>

