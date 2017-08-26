<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tzbh=null;
String bkbh=null;
String ftzt=null;
String ftr=null;
String ftsj=null;
String zhxgsj=null;
String djcs=null;
String hfcs=null;
String sfzd=null;
String sfyxhf=null;
String fjmc=null;
String fjym=null;
String ftnr=null;
String ytnr=null;
String zhhfr=null;
String zhhfsj=null;
String wheretzbh=null;
wheretzbh=cf.GB2Uni(request.getParameter("tzbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select tzbh,bkmc bkbh,ftzt,a.ltnc||'（'||m.yhmc||'）' ftr,ftsj,zhxgsj,djcs,hfcs,DeCODE(sfzd,'Y','<font color=red>置顶</font>','N','普通') sfzd,DECODE(sfyxhf,'Y','允许','N','不允许') sfyxhf,fjmc,fjym,ftnr,ytnr,ftzt,b.ltnc||'（'||n.yhmc||'）' zhhfr,zhhfsj ";
	ls_sql+=" from  nblt_ftgl,sq_yhxx m,sq_yhxx n,nblt_bkgl,nblt_grzl a,nblt_grzl b ";
	ls_sql+=" where a.ltid=nblt_ftgl.ftr and b.ltid=nblt_ftgl.zhhfr and m.ygbh=nblt_ftgl.ftr and n.ygbh=nblt_ftgl.zhhfr and nblt_bkgl.bkbh=nblt_ftgl.bkbh and  (tzbh='"+wheretzbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tzbh=cf.fillNull(rs.getString("tzbh"));
		bkbh=cf.fillNull(rs.getString("bkbh"));
		ftzt=cf.fillNull(rs.getString("ftzt"));
		ftr=cf.fillNull(rs.getString("ftr"));
		ftsj=cf.fillNull(rs.getDate("ftsj"));
		zhxgsj=cf.fillNull(rs.getDate("zhxgsj"));
		djcs=cf.fillNull(rs.getString("djcs"));
		hfcs=cf.fillNull(rs.getString("hfcs"));
		sfzd=cf.fillNull(rs.getString("sfzd"));
		sfyxhf=cf.fillNull(rs.getString("sfyxhf"));
		fjmc=cf.fillNull(rs.getString("fjmc"));
		fjym=cf.fillNull(rs.getString("fjym"));
		ftnr=cf.fillNull(rs.getString("ftnr"));
		ytnr=cf.fillNull(rs.getString("ytnr"));
		zhhfr=cf.fillNull(rs.getString("zhhfr"));
		zhhfsj=cf.fillNull(rs.getDate("zhhfsj"));
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
    贴子编号  </td>
  <td width="35%"> 
    <%=tzbh%>  </td>
  <td align="right" width="15%">板块编号</td>
  <td width="35%"><%=bkbh%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">发帖人</td>
  <td colspan="3"><%=ftr%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">发贴主题</td>
  <td colspan="3"><%=ftzt%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">发帖时间</td>
  <td width="35%"><%=ftsj%></td>
  <td align="right" width="15%"> 
    最后修改时间  </td>
  <td width="35%"> 
    <%=zhxgsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    点击次数  </td>
  <td width="35%"> 
    <%=djcs%>  </td>
  <td align="right" width="15%"> 
    回复次数  </td>
  <td width="35%"> 
    <%=hfcs%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    是否置顶  </td>
  <td width="35%"> 
    <%=sfzd%>  </td>
  <td align="right" width="15%"> 
    是否允许回复  </td>
  <td width="35%"> 
    <%=sfyxhf%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    附件名称  </td>
  <td width="35%"> 
  <%
  if (fjmc!=null && !(fjmc.equals("N")))
  {
	  %>
<!--     <a href="/nblt/fwlt/fj/<%=fjmc%>" target="_back">点击下载</a> 
 -->	 <%=fjmc%> <%
  }
  %>
  </td>
  <td align="right" width="15%"> 
    附件原名  </td>
  <td width="35%"> 
    <%=fjym%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">发贴内容</td>
  <td colspan="3"><%=ftnr%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">原贴内容</td>
  <td colspan="3"><%=ytnr%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    最后回复人  </td>
  <td width="35%"> 
    <%=zhhfr%>  </td>
  <td align="right" width="15%"> 
    最后回复时间  </td>
  <td width="35%"> 
    <%=zhhfsj%>  </td>
</tr>
</table>
</body>
</html>
