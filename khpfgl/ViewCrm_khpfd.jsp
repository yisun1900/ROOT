<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tsjlh=null;
String khbh=null;
String pfzt=null;
String pfyy=null;
String xgdwbh=null;
String pfje=null;
String pfjecdf=null;
String zffs=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String shr=null;
String shsj=null;
String shrbm=null;
String zflrr=null;
String zfsj=null;
String zfrssbm=null;
String wheretsjlh=null;
wheretsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="SELECT crm_khpfd.tsjlh tsjlh,crm_khpfd.khbh khbh,khxm,DECODE(crm_khpfd.pfzt,'0','等待提交','1','等待审核','2','等待付款','3','赔付完成') pfzt,crm_khpfd.pfyy pfyy,crm_khpfd.xgdwbh xgdwbh,crm_khpfd.pfje pfje,crm_khpfd.pfjecdf pfjecdf,DECODE(crm_khpfd.zffs,'0','未支付','1','现金','2','转账') zffs,l.yhmc lrr,crm_khpfd.lrsj lrsj,a.dwmc lrbm,m.yhmc shr,shsj,b.dwmc shrbm,n.yhmc zflrr,zfsj,c.dwmc zfrssbm  ";
	ls_sql+=" FROM crm_khpfd,sq_dwxx a,sq_dwxx b,sq_dwxx c,sq_yhxx l,sq_yhxx m,sq_yhxx n,crm_khxx  ";
    ls_sql+=" where crm_khpfd.lrbm=a.dwbh(+) and crm_khpfd.shrbm=b.dwbh(+) and crm_khpfd.zfrssbm=c.dwbh(+) ";
	ls_sql+=" and crm_khpfd.lrr=l.ygbh(+) and crm_khpfd.shr=m.ygbh(+) and crm_khpfd.zflrr=n.ygbh(+) ";
	ls_sql+=" and crm_khpfd.khbh=crm_khxx.khbh ";
	ls_sql+=" and (crm_khpfd.tsjlh='"+wheretsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		pfzt=cf.fillNull(rs.getString("pfzt"));
		pfyy=cf.fillNull(rs.getString("pfyy"));
		xgdwbh=cf.fillNull(rs.getString("xgdwbh"));
		pfje=cf.fillNull(rs.getString("pfje"));
		pfjecdf=cf.fillNull(rs.getString("pfjecdf"));
		zffs=cf.fillNull(rs.getString("zffs"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shrbm=cf.fillNull(rs.getString("shrbm"));
		zflrr=cf.fillNull(rs.getString("zflrr"));
		zfsj=cf.fillNull(rs.getDate("zfsj"));
		zfrssbm=cf.fillNull(rs.getString("zfrssbm"));
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
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 查看信息</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    投诉报修记录号  </td>
  <td width="35%"> 
    <%=tsjlh%>  </td>
  <td align="right" width="15%"> 
    客户编号  </td>
  <td width="35%"> 
    <%=khbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    赔付单状态  </td>
  <td width="35%"> 
    <%=pfzt%>  </td>
  <td align="right" width="15%">&nbsp;</td>
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">赔付原因</td>
  <td colspan="3"><%=pfyy%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    相关责任部门  </td>
  <td width="35%"> 
    <%=xgdwbh%>  </td>
  <td align="right" width="15%"> 
    赔付金额  </td>
  <td width="35%"> 
    <%=pfje%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    赔付金额承担方  </td>
  <td width="35%"> 
    <%=pfjecdf%>  </td>
  <td align="right" width="15%"> 
    支付方式  </td>
  <td width="35%"> 
    <%=zffs%>  </td>
</tr>
<tr bgcolor="#99FFFF">
  <td align="right" width="15%"> 
    录入人  </td>
  <td width="35%"> 
    <%=lrr%>  </td>
  <td align="right" width="15%"> 
    录入时间  </td>
  <td width="35%"> 
    <%=lrsj%>  </td>
</tr>
<tr bgcolor="#99FFFF">
  <td align="right">录入人部门</td>
  <td><%=lrbm%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FF99FF">
  <td align="right" width="15%">审核人</td>
  <td width="35%"><%=shr%></td>
  <td align="right" width="15%">审核时间</td>
  <td width="35%"><%=shsj%></td>
</tr>
<tr bgcolor="#FF99FF">
  <td align="right">审核人部门</td>
  <td><%=shrbm%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFF99">
  <td align="right" width="15%"> 
    支付录入人  </td>
  <td width="35%"> 
    <%=zflrr%>  </td>
  <td align="right" width="15%"> 
    支付时间  </td>
  <td width="35%"> 
    <%=zfsj%>  </td>
</tr>
<tr bgcolor="#FFFF99">
  <td align="right" width="15%"> 
    支付人所属部门  </td>
  <td width="35%"> 
    <%=zfrssbm%>  </td>
  <td align="right" width="15%">&nbsp;  </td>
  <td width="35%">&nbsp;  </td>
</tr>
</table>
</body>
</html>
