<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String dwmc=null;
String cgsjs=null;
String sjsdh=null;


String ddbh=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select jc_cgdd.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth,sq_dwxx.dwmc,jc_cgdd.cgsjs";
	ls_sql+=" from  jc_cgdd,crm_khxx,sq_dwxx";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.dwbh=sq_dwxx.dwbh and  (jc_cgdd.ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillHtml(rs.getString("hth"));
		cgsjs=cf.fillNull(rs.getString("cgsjs"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

	//家具设计师电话
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where yhmc ='"+cgsjs+"' and zwbm='12'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">橱柜订单 </div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right">      订单编号</td>
    <td width="29%"> <%=ddbh%> </td>
    <td width="20%">&nbsp;</td>
    <td width="30%">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right">客户编号</td>
    <td width="29%"><%=khbh%></td>
    <td width="20%" align="right">合同号</td>
    <td width="30%"><%=hth%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right" bgcolor="#CCCCFF">      客户姓名</td>
    <td width="29%"><%=khxm%> </td>
    <td width="20%" align="right">      联系方式</td>
    <td width="30%"><%=lxfs%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">类型</td>
	<td  width="10%">物品编号</td>
	<td  width="14%">名称</td>
	<td  width="10%">描述信息</td>
	<td  width="15%">风格</td>
	<td  width="10%">规格</td>
	<td  width="7%">单价</td>
	<td  width="6%">数量</td>
	<td  width="8%">总价</td>
	<td  width="14%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT jc_cgdtmx.type_name,usercode,name,msxx,style,spec,TO_CHAR(price),qty,total,note";
	ls_sql+=" FROM jc_cgdtmx";
    ls_sql+=" where jc_cgdtmx.ddbh='"+ddbh+"'";
    ls_sql+=" order by type_name,jc_cgdtmx.item_num";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//设置每页显示记录数

	
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("type_name","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
	
	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>

</body>
</html>
