<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<%

String cgjhmc=null;
String cgsqr=null;
String jhkssj=null;
String jhjssj=null;
String jhje=null;
String jhnr=null;
String jhdzt=null;
String ssfgs=null;
String lrr=null;
String lrsj=null;
String shr=null;
String shsj=null;
String shjg=null;
String shnr=null;
String bz=null;
String jhfkjd=null;
String cgjhph=null;
cgjhph=cf.GB2Uni(request.getParameter("cgjhph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	ls_sql="select cgjhmc,cgsqr,jhkssj,jhjssj,jhje,jhnr,DECODE(jhdzt,'0','录入未提交','1','等待审核','2','审核完成','9','计划完结') jhdzt,dwmc ssfgs,lrr,lrsj,shr,shsj,DECODE(shjg,'Y','审核通过','N','审核未通过','等待审核') shjg,shnr,jxc_clcgjh.bz bz,jxc_clcgjh.jhfkjd jhfkjd ";
	ls_sql+=" from  jxc_clcgjh,sq_dwxx ";
	ls_sql+=" where jxc_clcgjh.ssfgs=sq_dwxx.dwbh and  (cgjhph='"+cgjhph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgjhmc=cf.fillNull(rs.getString("cgjhmc"));
		cgsqr=cf.fillNull(rs.getString("cgsqr"));
		jhkssj=cf.fillNull(rs.getDate("jhkssj"));
		jhjssj=cf.fillNull(rs.getDate("jhjssj"));
		jhje=cf.fillNull(rs.getString("jhje"));
		jhnr=cf.fillNull(rs.getString("jhnr"));
		jhdzt=cf.fillNull(rs.getString("jhdzt"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shjg=cf.fillNull(rs.getString("shjg"));
		shnr=cf.fillNull(rs.getString("shnr"));
		bz=cf.fillNull(rs.getString("bz"));
		jhfkjd=cf.fillNull(rs.getString("jhfkjd"));
	}
	rs.close();
	ps.close();

	out.print("生成的供应商订单：");
	String gysddph="";
	ls_sql="select gysddph ";
	ls_sql+=" from  jxc_cgjhddb ";
	ls_sql+=" where cgjhph='"+cgjhph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		gysddph=cf.fillNull(rs.getString("gysddph"));

		out.print("<a href=\"/jxczc/gysddgl/ViewJxc_gysdd.jsp?gysddph="+gysddph+"\" target=\"_blank\">"+gysddph+"</a>&nbsp;&nbsp;&nbsp;");

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


<div align="center"> 采购计划</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    采购计划批号  </td>
  <td width="35%"> 
    <%=cgjhph%>  </td>
  <td align="right" width="15%"> 
    采购计划名称  </td>
  <td width="35%"> 
    <%=cgjhmc%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    采购申请人  </td>
  <td width="35%"> 
    <%=cgsqr%>  </td>
  <td align="right" width="15%">计划金额</td>
  <td width="35%"><%=jhje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    计划开始时间  </td>
  <td width="35%"><%=jhkssj%></td>
  <td align="right" width="15%">计划结束时间</td>
  <td width="35%"><%=jhjssj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td>
  <td width="35%"><%=lrr%></td>
  <td align="right" width="15%">录入时间</td>
  <td width="35%"><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    所属分公司  </td>
  <td width="35%"> 
    <%=ssfgs%>  </td>
  <td align="right" width="15%">计划单状态</td>
  <td width="35%"><%=jhdzt%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">审核人</td>
  <td><%=shr%></td>
  <td align="right">审核时间</td>
  <td><%=shsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">审核结果</td>
  <td><%=shjg%></td>
  <td align="right">审核内容</td>
  <td><%=shnr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">计划内容</td>
  <td colspan="3"><%=jhnr%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="15%">计划付款进度</td>
  <td colspan="3"><%=jhfkjd%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" height="22" align="right">备注</td>
  <td colspan="3"><%=bz%></td>
  </tr>
</table>


<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="8%">材料编码</td>
	<td  width="8%">内部编码</td>
	<td  width="12%">材料名称</td>
	<td  width="10%">型号</td>
	<td  width="9%">规格</td>
	<td  width="19%">供应商</td>
	<td  width="5%">计量单位</td>
	<td  width="6%">计划采购单价</td>
	<td  width="6%">计划采购数量</td>
	<td  width="8%">计划采购金额</td>
	<td  width="6%">实际采购数量</td>

</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT jhxh,clbm,nbbm,clmc,xh,gg,gysmc,jldwbm,TO_CHAR(jhcgdj),jhcgsl,jhcgje,sjcgsl";
	ls_sql+=" FROM jxc_cgjhmx ";
    ls_sql+=" where  jxc_cgjhmx.cgjhph='"+cgjhph+"'";
	ls_sql+=" order by jhxh ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
</html>