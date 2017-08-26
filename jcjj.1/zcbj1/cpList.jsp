<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>主材展厅</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String zcdlbm=cf.GB2Uni(cf.getParameter(request,"zcdlbm"));
String dwbh=cf.GB2Uni(cf.getParameter(request,"dwbh"));
String zclbbm=cf.GB2Uni(cf.getParameter(request,"zclbbm"));
String dqbm=request.getParameter("dqbm");

String zcbm=null;
String zcmc=null;
String zcdlmc=null;
String xh=null;
String gg=null;
String zcysbm=null;
String jldwbm=null;
String lsj=null;
String yhj=null;
String dwmc=null;
String bz=null;
String zp=null;
String sfycx=null;
String cxj=null;
String cxkssj=null;
String cxjzsj=null;
String sfyh=null;
String cpsm=null;
String gys=null;
String ppmc=null;
double cxhdbl=0;
double lscxhdbl=0;
String cpjb=null;
String fgsx=null;
String cd=null;

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
  <p>产品明细（<%=zcdlbm%>，品牌供应商：<%=dwbh%>） </p>
</div>
<table width="100%" border="0" style="FONT-SIZE:14"  cellpadding="2" cellspacing="2">
<%
	if (zclbbm.equals(""))//类别/系列
	{
		ls_sql="SELECT cpjb,fgsx,cd,lscxhdbl,cxhdbl,gys,ppmc,zcbm,zcmc,zclbbm,xh,gg,zcysbm,jldwbm,lsj,yhj,zp,jc_zcjgb.bz,sfycx,cxj,cxkssj,cxjzsj,DECODE(sfyh,'Y','有货','N','<font color=\"#FF0000\">无货</font>') sfyh,cpsm  ";
		ls_sql+=" FROM jc_zcjgb  ";
		ls_sql+=" where jc_zcjgb.dwbh='"+dwbh+"' and jc_zcjgb.zcdlbm='"+zcdlbm+"' and jc_zcjgb.zclbbm is null and jc_zcjgb.dqbm='"+dqbm+"'";
		ls_sql+=" order by jc_zcjgb.zcdlbm,jc_zcjgb.dwbh,zclbbm,jc_zcjgb.zcbm";
	}
	else{
		ls_sql="SELECT cpjb,fgsx,cd,lscxhdbl,cxhdbl,gys,ppmc,zcbm,zcmc,zclbbm,xh,gg,zcysbm,jldwbm,lsj,yhj,zp,jc_zcjgb.bz,sfycx,cxj,cxkssj,cxjzsj,DECODE(sfyh,'Y','有货','N','<font color=\"#FF0000\">无货</font>') sfyh,cpsm  ";
		ls_sql+=" FROM jc_zcjgb  ";
		ls_sql+=" where jc_zcjgb.dwbh='"+dwbh+"' and jc_zcjgb.zcdlbm='"+zcdlbm+"' and jc_zcjgb.zclbbm='"+zclbbm+"' and jc_zcjgb.dqbm='"+dqbm+"'";
		ls_sql+=" order by jc_zcjgb.zcdlbm,jc_zcjgb.dwbh,zclbbm,jc_zcjgb.zcbm";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cpjb=cf.fillNull(rs.getString("cpjb"));
		fgsx=cf.fillNull(rs.getString("fgsx"));
		cd=cf.fillNull(rs.getString("cd"));
		lscxhdbl=rs.getDouble("lscxhdbl");
		cxhdbl=rs.getDouble("cxhdbl");
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zclbbm=cf.fillNull(rs.getString("zclbbm"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		zcysbm=cf.fillNull(rs.getString("zcysbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
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
      <A HREF="/jcjj/zcbj/dimages/<%=zp%>" target="_blank"><IMG SRC="/jcjj/zcbj/images/<%=zp%>" width="170" ></A><br>
      <font color="#0000CC">主材编码</font>：<%=zcbm%> <br>
      <font color="#0000CC">主材名称</font>：<%=zcmc%> <br>
      <font color="#0000CC">品&nbsp;&nbsp;&nbsp;&nbsp;牌</font>：<%=ppmc%> <br>
      <font color="#0000CC">供&nbsp;应&nbsp;商</font>：<%=gys%> <br>
      <font color="#0000CC">类别系列</font>：<%=zclbbm%> <br>
      <font color="#0000CC">型&nbsp;&nbsp;&nbsp;&nbsp;号</font>：<%=xh%><br>
      <font color="#0000CC">规&nbsp;&nbsp;&nbsp;&nbsp;格</font>：<%=gg%><br>
      <font color="#0000CC">颜&nbsp;&nbsp;&nbsp;&nbsp;色</font>：<%=zcysbm%><br>
      <font color="#0000CC">市场标价</font>：￥<%=lsj%> /<%=jldwbm%><br>
      <font color="#0000CC">销售限价</font>：￥<%=yhj%> /<%=jldwbm%><br>
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
