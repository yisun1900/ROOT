<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String rs_yggzjl_xh=null;
String rs_yggzjl_fxrq=null;
String rs_yggzjl_ssfgs=null;
String rs_yggzjl_ksrq=null;
String rs_yggzjl_zzrq=null;
String rs_yggzjl_lrr=null;
String rs_yggzjl_lrsj=null;
String sq_dwxx_dwmc=null;
String rs_yggzjl_bz=null;
String wherers_yggzjl_xh=null;
wherers_yggzjl_xh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select rs_yggzjl.xh as rs_yggzjl_xh,rs_yggzjl.fxrq as rs_yggzjl_fxrq,rs_yggzjl.ssfgs as rs_yggzjl_ssfgs,rs_yggzjl.ksrq as rs_yggzjl_ksrq,rs_yggzjl.zzrq as rs_yggzjl_zzrq,rs_yggzjl.lrr as rs_yggzjl_lrr,rs_yggzjl.lrsj as rs_yggzjl_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,rs_yggzjl.bz as rs_yggzjl_bz ";
	ls_sql+=" from  sq_dwxx,rs_yggzjl";
	ls_sql+=" where rs_yggzjl.lrbm=sq_dwxx.dwbh and  (rs_yggzjl.xh='"+wherers_yggzjl_xh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rs_yggzjl_xh=cf.fillNull(rs.getString("rs_yggzjl_xh"));
		rs_yggzjl_fxrq=cf.fillNull(rs.getDate("rs_yggzjl_fxrq"));
		rs_yggzjl_ssfgs=cf.fillNull(rs.getString("rs_yggzjl_ssfgs"));
		rs_yggzjl_ksrq=cf.fillNull(rs.getDate("rs_yggzjl_ksrq"));
		rs_yggzjl_zzrq=cf.fillNull(rs.getDate("rs_yggzjl_zzrq"));
		rs_yggzjl_lrr=cf.fillNull(rs.getString("rs_yggzjl_lrr"));
		rs_yggzjl_lrsj=cf.fillNull(rs.getDate("rs_yggzjl_lrsj"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		rs_yggzjl_bz=cf.fillNull(rs.getString("rs_yggzjl_bz"));
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

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">员工工资 </div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">序号</div>
    </td>
    <td width="35%"> <%=rs_yggzjl_xh%> </td>
    <td width="15%"> 
      <div align="right">录入部门</div>
    </td>
    <td width="35%"><%=sq_dwxx_dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">发薪公司</div>
    </td>
    <td width="35%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh",rs_yggzjl_ssfgs,true);
%> </td>
    <td width="15%"> 
      <div align="right">发薪日期</div>
    </td>
    <td width="35%"><%=rs_yggzjl_fxrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">工资开始日期</td>
    <td width="35%"><%=rs_yggzjl_ksrq%></td>
    <td width="15%" align="right">工资终止日期</td>
    <td width="35%"><%=rs_yggzjl_zzrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">录入时间</div>
    </td>
    <td width="35%"><%=rs_yggzjl_lrsj%> </td>
    <td width="15%"> 
      <div align="right">录入人</div>
    </td>
    <td width="35%"> <%=rs_yggzjl_lrr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">备注</td>
    <td colspan="3"><%=rs_yggzjl_bz%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">所属部门</td>
	<td  width="5%">工号</td>
	<td  width="5%">员工姓名</td>
	<td  width="3%">出勤天数</td>
	<td  width="5%">工龄工资</td>
	<td  width="5%">岗位工资</td>
	<td  width="5%">底薪</td>
	<td  width="5%">交通补贴</td>
	<td  width="4%">餐补</td>
	<td  width="4%">电话补</td>
	<td  width="4%">扣保费</td>
	<td  width="5%">奖金</td>
	<td  width="5%">其它补贴</td>
	<td  width="5%">其它扣款</td>
	<td  width="5%">提成</td>
	<td  width="5%">税前工资</td>
	<td  width="5%">扣税款</td>
	<td  width="5%">税后工资</td>
	<td  width="12%">备注</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT dwmc,bianhao,yhmc,cqts,glgz,gwgz,jbgz,jtbt,cb,dhbt,yjsxe,jj,qtbt,qtkk,tc,sqgz,ksk,shgz,rs_yggzb.bz";
	ls_sql+=" FROM rs_yggzb,sq_dwxx  ";
    ls_sql+=" where rs_yggzb.dwbh=sq_dwxx.dwbh and xh='"+wherers_yggzjl_xh+"'";
    ls_sql+=" order by rs_yggzb.dwbh,yhmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(20000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
	pageObj.printSum();

%>
</table>

</body>
</html>
