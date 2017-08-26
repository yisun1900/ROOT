<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=request.getParameter("khbh");

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmbh=null;
String dwmc=null;
String cxhdbm=null;
String zxdjbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;

String zje=null;
String clzt=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String shr=null;
String shsj=null;
String shyj=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select khxm,crm_khxx.xmzy,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dmbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();

	ls_sql="select zje,clzt,lrr,lrsj,lrbm,bz,shr,shsj,shyj ";
	ls_sql+=" from  jc_khzcgmxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zje=cf.fillNull(rs.getString("zje"));
		clzt=cf.fillNull(rs.getString("clzt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shyj=cf.fillNull(rs.getString("shyj"));
		bz=cf.fillNull(rs.getString("bz"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">客户主材购买信息</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF">
    <td width="15%" align="right" bgcolor="#CCCCFF"> 客户编号 </td>
    <td width="35%" bgcolor="#CCCCFF"><%=khbh%> </td>
    <td width="15%" align="right" bgcolor="#CCCCFF"> 合同号 </td>
    <td width="35%" bgcolor="#CCCCFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">客户姓名</td>
    <td><%=khxm%></td>
    <td align="right">质检</td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr>
    <td bgcolor="#CCCCFF" align="right">签约店面</td>
    <td bgcolor="#CCCCFF"><%=dwmc%></td>
    <td bgcolor="#CCCCFF" align="right">家装设计师</td>
    <td bgcolor="#CCCCFF"><%=sjs%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right"> 施工队 </td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"> 班长 </td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right"> 家装签约日期 </td>
    <td><%=qyrq%> </td>
    <td align="right"> 家装签约额 </td>
    <td><%=qye%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">合同开工日期</td>
    <td><%=kgrq%></td>
    <td align="right">合同竣工日期</td>
    <td><%=jgrq%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right">参加促销活动</td>
    <td colspan="3"><%=cxhdbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">录入人</td>
    <td><%=lrr%></td>
    <td align="right">录入时间</td>
    <td><%=lrsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">录入部门</td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>    </td>
    <td align="right">总金额</td>
    <td><%=zje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">备注</td>
    <td colspan="3"><%=bz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">审核人</span></td>
    <td><%=shr%></td>
    <td align="right"><span class="STYLE1">审核时间</span></td>
    <td><%=shsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">审核意见</td>
    <td colspan="3"><%=shyj%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">品牌供应商名称</td>
	<td  width="12%">主材大类</td>
	<td  width="10%">主材小类</td>
	<td  width="8%">原价</td>
	<td  width="8%">折后价</td>
	<td  width="7%">订金</td>
	<td  width="8%">实收款</td>
	<td  width="8%">日期</td>
	<td  width="24%">备注</td>
</tr>
<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();

	ls_sql="SELECT ppgys,zcdlbm,zcxlbm,yj,zhj,dj,ssk,rq,bz  ";
	ls_sql+=" FROM jc_khzcgmmx  ";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" order by ppgys";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(500);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>

</body>
</html>
