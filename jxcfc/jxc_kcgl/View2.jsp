<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

String clbm="";
String dqbm="";
String gysmc="";
String lsj="";
String xsj="";
String cxhdbl="";
String myqjf="";
String sfycx="";
String cxkssj="";
String cxjzsj="";
String cxj="";
String lscxhdbl="";
String cxmyqjf="";
String xsfs="";
double zcpzsl=0;
String dhsl="";
String ycgsl="";
String whereclbm="";
String wheredqbm="";
String clmc="";
String xh="";
String gg="";
String zp="";
String scsmc=""; 
String ppmc="";
String cldlbm=""; 
String clxlbm="";
String ccpzsl="";
String bfpzsl="";
String wheresql="";
whereclbm=cf.GB2Uni(request.getParameter("clbm"));
if (whereclbm!=null && !(whereclbm.equals("")))
{
	whereclbm=cf.addZero(whereclbm,13);
	wheresql+=" and jxc_cljgb.clbm='"+whereclbm+"' ";
	whereclbm=cf.addZero(whereclbm,13);}
wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
if (wheredqbm!=null && !(wheredqbm.equals("")))
{wheresql+=" and jxc_cljgb.dqbm='"+wheredqbm+"' ";}
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	ls_sql="select jxc_clbm.nbbm nbbm,dqmc dqbm,'' gysmc,lsj,xsj,cxhdbl,myqjf,DECODE(sfycx,'N','无','Y','有') sfycx,cxkssj,cxjzsj,cxj,lscxhdbl,cxmyqjf,DECODE(xsfs,'1','代销品','2','现货销售','3','期货销售') xsfs,zcpzsl,dhsl,ycgsl,clmc,xh,gg,'<img src=\"/jxc/jxc_clbm/clzp/'||jxc_clbm.zp||'\" width=\"100px\" height=\"100px\">' zp,scsmc,ppmc,cldlbm,clxlbm,ccpzsl,bfpzsl ";
	ls_sql+=" from  jxc_cljgb,dm_dqbm,jxc_clbm";
	ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm and jxc_cljgb.dqbm=dm_dqbm.dqbm"; 
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ccpzsl=cf.fillNull(rs.getString("ccpzsl"));
		bfpzsl=cf.fillNull(rs.getString("bfpzsl"));
		clbm=cf.fillNull(rs.getString("nbbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		lsj=cf.fillNull(rs.getString("lsj"));
		xsj=cf.fillNull(rs.getString("xsj"));
		cxhdbl=cf.fillNull(rs.getString("cxhdbl"));
		myqjf=cf.fillNull(rs.getString("myqjf"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		cxj=cf.fillNull(rs.getString("cxj"));
		lscxhdbl=cf.fillNull(rs.getString("lscxhdbl"));
		cxmyqjf=cf.fillNull(rs.getString("cxmyqjf"));
		xsfs=cf.fillNull(rs.getString("xsfs"));
		zcpzsl=rs.getDouble("zcpzsl");
		dhsl=cf.fillNull(rs.getString("dhsl"));
		ycgsl=cf.fillNull(rs.getString("ycgsl"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		zp=cf.fillNull(rs.getString("zp"));
		scsmc=cf.fillNull(rs.getString("scsmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		cldlbm=cf.fillNull(rs.getString("cldlbm"));
		clxlbm=cf.fillNull(rs.getString("clxlbm"));
	}
	else 
	{
		if (whereclbm!=null && !(whereclbm.equals("")))
		{
			%>
		<SCRIPT language=javascript >
		<!--
		alert("没有找到相应数据，请检查条码是否正确！");
		window.close();
		//-->
		</SCRIPT>
		<%
		}
	}
//	out.print(ls_sql);
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
<div align="center"> 材料信息</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">内部编码</td>
  <td bgcolor="#FFFFCC"><%=clbm%></td>
  <td width="15%" rowspan="4" align="right">照片</td>
  <td width="35%" rowspan="4"><%=zp%></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">材料名称</td>
  <td><%=clmc%></td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td align="right">供应商 </td>
  <td><%=gysmc%></td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td width="15%" align="right"><font color="red">销售价</font></td>
  <td width="35%"><%=xsj%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#99CCFF">材料大类</td>
  <td width="35%" bgcolor="#99CCFF"><%=cldlbm%></td>
  <td width="15%" align="right" bgcolor="#99CCFF">材料小类</td>
  <td width="35%" bgcolor="#99CCFF"><%=clxlbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="right" width="15%" bgcolor="#99CCFF"> 
    品牌</td>
  <td width="35%" bgcolor="#99CCFF"><%=scsmc%></td>
  <td width="15%" align="right" bgcolor="#99CCFF">子品牌</td>
  <td width="35%" bgcolor="#99CCFF"><%=ppmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#99CCFF">型号</td>
  <td bgcolor="#99CCFF"><%=xh%></td>
  <td align="right" bgcolor="#99CCFF">规格</td>
  <td bgcolor="#99CCFF"><%=gg%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#9999FF">地区编码 </td>
  <td width="35%" bgcolor="#9999FF"><%=dqbm%></td>
  <td width="15%" align="right" bgcolor="#9999FF"><font color=green>正常品总数量</font> </td>
  <td width="35%" bgcolor="#9999FF"><font color=green><%=zcpzsl%></font> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#9999FF"><font color=blue>残次品总数量</font> </td>
  <td width="35%" bgcolor="#9999FF"><font color=blue><%=ccpzsl%></font></td>
  <td width="15%" align="right" bgcolor="#9999FF"><font color=red>报废品总数量</font> </td>
  <td width="35%" bgcolor="#9999FF"><font color=red><%=bfpzsl%></font> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC">市场标价</td>
  <td width="35%" bgcolor="#CCFFCC"><%=lsj%></td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    计入活动比例  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=cxhdbl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    每元钱积分  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=myqjf%>  </td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    是否有促销  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=sfycx%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    促销开始时间  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=cxkssj%>  </td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    促销结束时间  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=cxjzsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    <font color="red">促销价</font>  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=cxj%>  </td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    促销期计入活动比例  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=lscxhdbl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    促销期每元钱积分  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=cxmyqjf%>  </td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    销售方式  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=xsfs%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC">已采购数量</td>
  <td width="35%" bgcolor="#CCFFCC"><%=ycgsl%></td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    客户订货数量  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=dhsl%>  </td>
</tr>
</table>
</body>
</html>
