<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
double tcbzjg=0;
double tcmjzjje=0;
double tczcsjcj=0;
double tczccljj=0;
double tcxsfzc=0;
double tczcjm=0;
double tcdpsj=0;
double tcdpdlsf=0;
double tcxpx=0;
double tcwsgzj=0;
double tcwgccljj=0;
double tcwzjzc=0;
double tcsgze=0;
double tcqtsf=0;
double zctcje=0;
double wntcje=0;

double jytcje=0;
double sctcje=0;
double jktcje=0;

double tcbzjgzjx=0;
double tcmjzjjezjx=0;
double tczcsjcjzjx=0;
double tczccljjzjx=0;
double tcxsfzczjx=0;
double tczcjmzjx=0;
double tcdpsjzjx=0;
double tcdpdlsfzjx=0;
double tcxpxzjx=0;
double tcwsgzjzjx=0;
double tcwgccljjzjx=0;

double tcsgzezjx=0;
double tcqtsfzjx=0;
double zctcjezjx=0;
double wntcjezjx=0;

double jytcjezjx=0;
double sctcjezjx=0;
double jktcjezjx=0;

double tcwzjzczjx=0;


String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,tcwsgzj,tcwgccljj,tcwzjzc,tcsgze,tcqtsf      ,tcbzjgzjx,tcmjzjjezjx,tczcsjcjzjx,tczccljjzjx,tcxsfzczjx,tczcjmzjx,tcdpsjzjx,tcdpdlsfzjx,tcxpxzjx,tcwsgzjzjx,tcwgccljjzjx,tcsgzezjx,tcqtsfzjx ";
	ls_sql+=" ,zctcje,wntcje,zctcjezjx,wntcjezjx";
	ls_sql+=" ,jytcje,sctcje,jktcje,jytcjezjx,sctcjezjx,jktcjezjx,tcwzjzczjx";
	ls_sql+=" from  crm_tckhqye";
	ls_sql+=" where khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jytcje=rs.getDouble("jytcje");
		sctcje=rs.getDouble("sctcje");
		jktcje=rs.getDouble("jktcje");
		jytcjezjx=rs.getDouble("jytcjezjx");
		sctcjezjx=rs.getDouble("sctcjezjx");
		jktcjezjx=rs.getDouble("jktcjezjx");

		zctcje=rs.getDouble("zctcje");
		wntcje=rs.getDouble("wntcje");
		zctcjezjx=rs.getDouble("zctcjezjx");
		wntcjezjx=rs.getDouble("wntcjezjx");

		khbh=cf.fillNull(rs.getString("khbh"));
		tcbzjg=rs.getDouble("tcbzjg");
		tcmjzjje=rs.getDouble("tcmjzjje");
		tczcsjcj=rs.getDouble("tczcsjcj");
		tczccljj=rs.getDouble("tczccljj");
		tcxsfzc=rs.getDouble("tcxsfzc");
		tczcjm=rs.getDouble("tczcjm");
		tcdpsj=rs.getDouble("tcdpsj");
		tcdpdlsf=rs.getDouble("tcdpdlsf");
		tcxpx=rs.getDouble("tcxpx");
		tcwsgzj=rs.getDouble("tcwsgzj");
		tcwgccljj=rs.getDouble("tcwgccljj");
		tcwzjzc=rs.getDouble("tcwzjzc");
		tcsgze=rs.getDouble("tcsgze");
		tcqtsf=rs.getDouble("tcqtsf");

		tcbzjgzjx=rs.getDouble("tcbzjgzjx");
		tcmjzjjezjx=rs.getDouble("tcmjzjjezjx");
		tczcsjcjzjx=rs.getDouble("tczcsjcjzjx");
		tczccljjzjx=rs.getDouble("tczccljjzjx");
		tcxsfzczjx=rs.getDouble("tcxsfzczjx");
		tczcjmzjx=rs.getDouble("tczcjmzjx");
		tcdpsjzjx=rs.getDouble("tcdpsjzjx");
		tcdpdlsfzjx=rs.getDouble("tcdpdlsfzjx");
		tcxpxzjx=rs.getDouble("tcxpxzjx");
		tcwsgzjzjx=rs.getDouble("tcwsgzjzjx");
		tcwgccljjzjx=rs.getDouble("tcwgccljjzjx");
		tcsgzezjx=rs.getDouble("tcsgzezjx");
		tcqtsfzjx=rs.getDouble("tcqtsfzjx");
		tcwzjzczjx=rs.getDouble("tcwzjzczjx");
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
.STYLE2 {color: #0000CC}
.STYLE3 {
	color: #FF0000;
	font-weight: bold;
}
.STYLE4 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 套餐价格（客户编号：<%=khbh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr align="center" bgcolor="#FFFFFF">
  <td>&nbsp;</td>
  <td><strong>合同</strong></td>
  <td><strong>增减项</strong></td>
  <td><strong>合计</strong></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="31%">套餐－标准价格</td>
  <td width="23%" align="center"><%=tcbzjg%></td>
  <td align="center" width="23%"><%=tcbzjgzjx%></td>
  <td width="23%" align="center"><%=cf.round(tcbzjg+tcbzjgzjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="31%"> 
    套餐－面积增加金额  </td>
  <td width="23%" align="center"> 
    <%=tcmjzjje%>  </td>
  <td align="center" width="23%"><%=tcmjzjjezjx%></td>
  <td width="23%" align="center"><%=cf.round(tcmjzjje+tcmjzjjezjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">套餐－主材升级差价</td>
  <td align="center"><%=tczcsjcj%></td>
  <td align="center"><%=tczcsjcjzjx%></td>
  <td align="center"><%=cf.round(tczcsjcj+tczcsjcjzjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="31%"> 
    套餐－主材超量加价  </td>
  <td width="23%" align="center"> 
    <%=tczccljj%>  </td>
  <td align="center" width="23%"><%=tczccljjzjx%></td>
  <td width="23%" align="center"><%=cf.round(tczccljj+tczccljjzjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">套餐－需收费主材</td>
  <td align="center"><%=tcxsfzc%></td>
  <td align="center"><%=tcxsfzczjx%></td>
  <td align="center"><%=cf.round(tcxsfzc+tcxsfzczjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="31%"> 
    套餐－主材减免  </td>
  <td width="23%" align="center"><%=-1*tczcjm%>  </td>
  <td align="center" width="23%"><%=-1*tczcjmzjx%></td>
  <td width="23%" align="center"><%=-1*cf.round(tczcjm+tczcjmzjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">套餐－顶配升级</td>
  <td align="center"><%=tcdpsj%></td>
  <td align="center"><%=tcdpsjzjx%></td>
  <td align="center"><%=cf.round(tcdpsj+tcdpsjzjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="31%"> 
    套餐外施工项造价  </td>
  <td width="23%" align="center"> 
    <%=tcwsgzj%>  </td>
  <td align="center" width="23%"><%=tcwsgzjzjx%></td>
  <td width="23%" align="center"><%=cf.round(tcwsgzj+tcwsgzjzjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">套餐－工程超量加价</td>
  <td align="center"><%=tcwgccljj%></td>
  <td align="center"><%=tcwgccljjzjx%></td>
  <td align="center"><%=cf.round(tcwgccljj+tcwgccljjzjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">套餐－其它收费</td>
  <td align="center"><%=tcqtsf%></td>
  <td align="center"><%=tcqtsfzjx%></td>
  <td align="center"><%=cf.round(tcqtsf+tcqtsfzjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>套餐总价</strong></td>
  <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf,2)%></td>
  <td align="center"><%=cf.round(tcbzjgzjx+tcmjzjjezjx+tczcsjcjzjx+tczccljjzjx+tcxsfzczjx-tczcjmzjx+tcdpsjzjx+tcwsgzjzjx+tcwgccljjzjx+tcqtsfzjx,2)%></td>
  <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf+tcbzjgzjx+tcmjzjjezjx+tczcsjcjzjx+tczccljjzjx+tcxsfzczjx-tczcjmzjx+tcdpsjzjx+tcwsgzjzjx+tcwgccljjzjx+tcqtsfzjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 套餐外增加主材 </td>
  <td align="center"><%=tcwzjzc%> </td>
  <td align="center">&nbsp;</td>
  <td align="center"><%=tcwzjzc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>记入合同金额</strong></td>
  <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf+tcwzjzc,2)%></td>
  <td align="center"><%=cf.round(tcbzjgzjx+tcmjzjjezjx+tczcsjcjzjx+tczccljjzjx+tcxsfzczjx-tczcjmzjx+tcdpsjzjx+tcwsgzjzjx+tcwgccljjzjx+tcqtsfzjx,2)%></td>
  <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf+tcwzjzc+tcbzjgzjx+tcmjzjjezjx+tczcsjcjzjx+tczccljjzjx+tcxsfzczjx-tczcjmzjx+tcdpsjzjx+tcwsgzjzjx+tcwgccljjzjx+tcqtsfzjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 套餐－顶配独立收费 </td>
  <td align="center"><%=tcdpdlsf%></td>
  <td align="center"><%=tcdpdlsfzjx%></td>
  <td align="center"><%=cf.round(tcdpdlsf+tcdpdlsfzjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">套餐－选配项</td>
  <td align="center"><%=tcxpx%></td>
  <td align="center"><%=tcxpxzjx%></td>
  <td align="center"><%=cf.round(tcxpx+tcxpxzjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>小计</strong></td>
  <td align="center"><%=cf.round(tcdpdlsf+tcxpx,2)%></td>
  <td align="center"><%=cf.round(tcdpdlsfzjx+tcxpxzjx,2)%></td>
  <td align="center"><%=cf.round(tcwzjzczjx+tcdpdlsf+tcxpx+tcdpdlsfzjx+tcxpxzjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2"><strong>套餐合计</strong></span></td>
  <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf+tcwzjzc+tcdpdlsf+tcxpx,2)%></td>
  <td align="center"><%=cf.round(tcbzjgzjx+tcmjzjjezjx+tczcsjcjzjx+tczccljjzjx+tcxsfzczjx-tczcjmzjx+tcdpsjzjx+tcwsgzjzjx+tcwgccljjzjx+tcqtsfzjx+tcdpdlsfzjx+tcxpxzjx,2)%></td>
  <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf+tcwzjzc+tcdpdlsf+tcxpx+tcbzjgzjx+tcmjzjjezjx+tczcsjcjzjx+tczccljjzjx+tcxsfzczjx-tczcjmzjx+tcdpsjzjx+tcwsgzjzjx+tcwgccljjzjx+tcqtsfzjx+tcdpdlsfzjx+tcxpxzjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">家具套餐金额</td>
  <td align="center"><%=zctcje%> </td>
  <td align="center">&nbsp;</td>
  <td align="center"><%=zctcjezjx%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">健康套餐金额</td>
  <td align="center"><%=jktcje%></td>
  <td align="center">&nbsp;</td>
  <td align="center"><%=jktcjezjx%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">温暖套餐金额</td>
  <td align="center"><%=wntcje%> </td>
  <td align="center">&nbsp;</td>
  <td align="center"><%=wntcjezjx%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">静音套餐金额</td>
  <td align="center"><%=jytcje%></td>
  <td align="center">&nbsp;</td>
  <td align="center"><%=jytcjezjx%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">色彩套餐金额</td>
  <td align="center"><%=sctcje%></td>
  <td align="center">&nbsp;</td>
  <td align="center"><%=sctcjezjx%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>小计</strong></td>
  <td align="center"><%=cf.round(zctcje+wntcje+jytcje+sctcje+jktcje,2)%></td>
  <td align="center">&nbsp;</td>
  <td align="center"><%=cf.round(zctcjezjx+wntcjezjx+jytcjezjx+sctcjezjx+jktcjezjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">总计</span></td>
  <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf+tcwzjzc+tcdpdlsf+tcxpx+zctcje+wntcje+jytcje+sctcje+jktcje,2)%></td>
  <td align="center"><span class="STYLE4"></span></td>
  <td align="center"><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcwsgzj+tcwgccljj+tcqtsf+tcwzjzc+tcdpdlsf+tcxpx+tcbzjgzjx+tcmjzjjezjx+tczcsjcjzjx+tczccljjzjx+tcxsfzczjx-tczcjmzjx+tcdpsjzjx+tcwsgzjzjx+tcwgccljjzjx+tcqtsfzjx+tcdpdlsfzjx+tcxpxzjx+zctcjezjx+wntcjezjx+jytcjezjx+sctcjezjx+jktcjezjx,2)%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">套餐－施工总额 </span></td>
  <td align="center"><span class="STYLE1"><%=tcsgze%></span></td>
  <td align="center"><span class="STYLE2"><span class="STYLE1"><%=tcsgzezjx%></span></span></td>
  <td align="center"><%=cf.round(tcsgze+tcsgzezjx,2)%></td>
</tr>
</table>
</body>
</html>
