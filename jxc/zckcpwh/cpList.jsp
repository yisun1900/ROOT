<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>主材展厅</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String clxlmc=cf.GB2Uni(cf.getParameter(request,"clxlmc"));
String ppmc=cf.GB2Uni(cf.getParameter(request,"ppmc"));
String cllbbm=cf.GB2Uni(cf.getParameter(request,"cllbbm"));
String dqbm=request.getParameter("dqbm");

String clbm=null;
String clmc=null;
String zcdlmc=null;
String xh=null;
String gg=null;
String clysbm=null;
String jldwbm=null;
String xsj=null;
String lsj=null;
String dwmc=null;
String bz=null;
String zp=null;
String sfycx=null;
String cxj=null;
String cxkssj=null;
String cxjzsj=null;
String sfyh=null;
String cpsm=null;
String gysmc=null;

double cxhdbl=0;
double lscxhdbl=0;
String cpjb=null;
String fgsx=null;
String cd=null;
double zcpzsl=0;
double dhsl=0;
double ycgsl=0;
String xsfs=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int row=0;
try {
	conn=cf.getConnection();

%>
<body bgcolor="#FFFFFF">
<div align="center">
  <p>产品明细（<%=clxlmc%>，子品牌：<%=ppmc%>） </p>
</div>
<table width="100%" border="0" style="FONT-SIZE:14"  cellpadding="2" cellspacing="2">
<%
	if (cllbbm.equals(""))//类别/系列
	{
		ls_sql="SELECT jxc_cljgb.zcpzsl,jxc_cljgb.dhsl,jxc_cljgb.ycgsl,DECODE(jxc_cljgb.xsfs,'1','代销品','2','现货销售','3','期货销售','4','虚拟出入库') xsfs,cpjb,fgsx,cd,lscxhdbl,cxhdbl,jxc_cljgb.gysmc,ppmc,jxc_clbm.clbm,clmc,cllbbm,xh,gg,clysbm,jldwbm,xsj,lsj,zp,jxc_cljgb.bz,sfycx,cxj,cxkssj,cxjzsj,DECODE(sfyh,'Y','有货','N','<font color=\"#FF0000\">无货</font>') sfyh,cpsm  ";
		ls_sql+=" from  jxc_clbm,jxc_cljgb";
		ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm ";
		ls_sql+=" and jxc_clbm.ppmc='"+ppmc+"' and jxc_clbm.clxlbm='"+clxlmc+"' and jxc_clbm.cllbbm is null and jxc_cljgb.dqbm='"+dqbm+"'";
		ls_sql+=" and jxc_clbm.cllb='2'";//0：代销品主材；1：辅材；2：库存品主材
		ls_sql+=" and jxc_cljgb.xsfs!='1'";//1：代销品；2：现货销售；3：期货销售；4：虚拟出入库
		ls_sql+=" order by jxc_clbm.clxlbm,jxc_clbm.ppmc,cllbbm,jxc_clbm.clbm";
	}
	else{
		ls_sql="SELECT jxc_cljgb.zcpzsl,jxc_cljgb.dhsl,jxc_cljgb.ycgsl,DECODE(jxc_cljgb.xsfs,'1','代销品','2','现货销售','3','期货销售','4','虚拟出入库') xsfs,cpjb,fgsx,cd,lscxhdbl,cxhdbl,jxc_cljgb.gysmc,ppmc,jxc_clbm.clbm,clmc,cllbbm,xh,gg,clysbm,jldwbm,xsj,lsj,zp,jxc_cljgb.bz,sfycx,cxj,cxkssj,cxjzsj,DECODE(sfyh,'Y','有货','N','<font color=\"#FF0000\">无货</font>') sfyh,cpsm  ";
		ls_sql+=" from  jxc_clbm,jxc_cljgb";
		ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm ";
		ls_sql+=" and jxc_clbm.ppmc='"+ppmc+"' and jxc_clbm.clxlbm='"+clxlmc+"' and jxc_clbm.cllbbm='"+cllbbm+"' and jxc_cljgb.dqbm='"+dqbm+"'";
		ls_sql+=" and jxc_clbm.cllb='2'";//0：代销品主材；1：辅材；2：库存品主材
		ls_sql+=" and jxc_cljgb.xsfs!='1'";//1：代销品；2：现货销售；3：期货销售；4：虚拟出入库
		ls_sql+=" order by jxc_clbm.clxlbm,jxc_clbm.ppmc,cllbbm,jxc_clbm.clbm";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zcpzsl=rs.getDouble("zcpzsl");
		dhsl=rs.getDouble("dhsl");
		ycgsl=rs.getDouble("ycgsl");
		xsfs=cf.fillNull(rs.getString("xsfs"));
		cpjb=cf.fillNull(rs.getString("cpjb"));
		fgsx=cf.fillNull(rs.getString("fgsx"));
		cd=cf.fillNull(rs.getString("cd"));
		lscxhdbl=rs.getDouble("lscxhdbl");
		cxhdbl=rs.getDouble("cxhdbl");
		gysmc=cf.fillNull(rs.getString("gysmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		cllbbm=cf.fillNull(rs.getString("cllbbm"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		clysbm=cf.fillNull(rs.getString("clysbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		xsj=cf.fillNull(rs.getString("xsj"));
		lsj=cf.fillNull(rs.getString("lsj"));
		bz=cf.fillNull(rs.getString("bz"));
		zp=cf.fillNull(rs.getString("zp"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		sfyh=cf.fillNull(rs.getString("sfyh"));
		cpsm=cf.fillNull(rs.getString("cpsm"));

		if (row==0)
		{
			out.println("<tr>");
		}
		else if (row%4==0)
		{
			out.println("</tr>");
			out.println("<tr>");
		}
		row++;

%>
    <td valign="top" >
      <A HREF="images/<%=zp%>" target="_blank"><IMG SRC="images/<%=zp%>" width="170" ></A><br>
      <font color="#0000CC">主材编码</font>：<%=clbm%> <br>
      <font color="#0000CC">主材名称</font>：<%=clmc%> <br>
      <font color="#0000CC">品&nbsp;&nbsp;&nbsp;&nbsp;牌</font>：<%=ppmc%> <br>
      <font color="#0000CC">供&nbsp;应&nbsp;商</font>：<%=gysmc%> <br>
      <font color="#0000CC">类别系列</font>：<%=cllbbm%> <br>
      <font color="#0000CC">型&nbsp;&nbsp;&nbsp;&nbsp;号</font>：<%=xh%><br>
      <font color="#0000CC">规&nbsp;&nbsp;&nbsp;&nbsp;格</font>：<%=gg%><br>
      <font color="#0000CC">颜&nbsp;&nbsp;&nbsp;&nbsp;色</font>：<%=clysbm%><br>
      <font color="#0000CC">市场标价</font>：￥<%=lsj%> /<%=jldwbm%><br>
      <font color="#0000CC">销售价</font>：￥<%=xsj%> /<%=jldwbm%><br>
      <font color="#0000CC">销售方式</font>：<%=xsfs%><br>
<%
	if (!xsfs.equals("代销品"))
	{
		%>
		  <font color="#0000CC">库存正常品</font>：<%=zcpzsl%><br>
		  <font color="#0000CC">客户订货数</font>：<%=dhsl%><br>
		  <font color="#0000CC">已采购数量</font>：<%=ycgsl%><br>
		<%
	}
%>
      <font color="#0000CC">计入活动比例</font>：<%=cxhdbl%>%<br>
<%
		if (sfycx.equals("Y"))
		{
%>
	  <font color="#0000CC">促 销 价</font>：<font color="#FF0000">￥<%=cxj%></font><br>
      <font color="#0000CC">开始时间</font>：<font color="#FF0000"><%=cxkssj%></font><br>
      <font color="#0000CC">结束时间</font>：<font color="#FF0000"><%=cxjzsj%></font><br>
      <font color="#0000CC">促销期计入活动比例</font>：<font color="#FF0000"><%=lscxhdbl%>%</font><br>
<%
		}
		else{
%>
	  <font color="#0000CC">有 促 销</font>：无<br>
<%
		}
%>
	  <font color="#0000CC">是否有货</font>：<%=sfyh%><br>
      <font color="#0000CC">产品级别</font>：<%=cpjb%><br>
      <font color="#0000CC">风格属性</font>：<%=fgsx%><br>
      <font color="#0000CC">产品说明</font>：<%=cpsm%><br>
      <font color="#0000CC">产&nbsp;&nbsp;&nbsp;&nbsp;地</font>：<%=cd%><br>
      <font color="#0000CC">备&nbsp;&nbsp;&nbsp;&nbsp;注</font>：<%=bz%>
    </td>
<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
</tr>
</table>
</body>
</html>
