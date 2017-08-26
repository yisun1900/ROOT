<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ybj_cgsq_sqbh=null;
String sq_dwxx_dwmc=null;
String ybj_cgsq_sqr=null;
String ybj_cgsq_sqsj=null;
String ybj_cgsq_fgflbm=null;
String ybj_cgsq_zxjwbm=null;
String ybj_cgsq_hxbm=null;
String ybj_cgsq_hxmjbm=null;
String ybj_cgsq_ysbm=null;
String ybj_cgsq_sfyqd=null;
String ybj_cgsq_clzt=null;
String ybj_cgsq_khxm=null;
String ybj_cgsq_fwdz=null;
String ybj_cgsq_cqbm=null;
String ybj_cgsq_lxfs=null;
String ybj_cgsq_sjs=null;
String ybj_cgsq_bz=null;
String khbh=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql=" select ybj_cgsq.sqbh as ybj_cgsq_sqbh,sq_dwxx.dwmc as sq_dwxx_dwmc,ybj_cgsq.sqr as ybj_cgsq_sqr,ybj_cgsq.sqsj as ybj_cgsq_sqsj,ybj_cgsq.fgflbm as ybj_cgsq_fgflbm,ybj_cgsq.zxjwbm as ybj_cgsq_zxjwbm,ybj_cgsq.hxbm as ybj_cgsq_hxbm,ybj_cgsq.hxmjbm as ybj_cgsq_hxmjbm,ybj_cgsq.ysbm as ybj_cgsq_ysbm,ybj_cgsq.sfyqd as ybj_cgsq_sfyqd,ybj_cgsq.clzt as ybj_cgsq_clzt,khxm as ybj_cgsq_khxm,fwdz as ybj_cgsq_fwdz,cqbm as ybj_cgsq_cqbm,lxfs as ybj_cgsq_lxfs,sjs as ybj_cgsq_sjs,ybj_cgsq.bz as ybj_cgsq_bz ";
	ls_sql+=" from  sq_dwxx,ybj_cgsq,crm_zxkhxx";
	ls_sql+=" where ybj_cgsq.dwbh=sq_dwxx.dwbh and  (ybj_cgsq.khbh="+khbh+")  ";
	ls_sql+=" and ybj_cgsq.khbh=crm_zxkhxx.khbh and sfyqd='N'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ybj_cgsq_sqbh=cf.fillNull(rs.getString("ybj_cgsq_sqbh"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		ybj_cgsq_sqr=cf.fillNull(rs.getString("ybj_cgsq_sqr"));
		ybj_cgsq_sqsj=cf.fillNull(rs.getDate("ybj_cgsq_sqsj"));
		ybj_cgsq_fgflbm=cf.fillNull(rs.getString("ybj_cgsq_fgflbm"));
		ybj_cgsq_zxjwbm=cf.fillNull(rs.getString("ybj_cgsq_zxjwbm"));
		ybj_cgsq_hxbm=cf.fillNull(rs.getString("ybj_cgsq_hxbm"));
		ybj_cgsq_hxmjbm=cf.fillNull(rs.getString("ybj_cgsq_hxmjbm"));
		ybj_cgsq_ysbm=cf.fillNull(rs.getString("ybj_cgsq_ysbm"));
		ybj_cgsq_sfyqd=cf.fillNull(rs.getString("ybj_cgsq_sfyqd"));
		ybj_cgsq_clzt=cf.fillNull(rs.getString("ybj_cgsq_clzt"));
		ybj_cgsq_khxm=cf.fillNull(rs.getString("ybj_cgsq_khxm"));
		ybj_cgsq_fwdz=cf.fillNull(rs.getString("ybj_cgsq_fwdz"));
		ybj_cgsq_cqbm=cf.fillNull(rs.getString("ybj_cgsq_cqbm"));
		ybj_cgsq_lxfs=cf.fillNull(rs.getString("ybj_cgsq_lxfs"));
		ybj_cgsq_sjs=cf.fillNull(rs.getString("ybj_cgsq_sjs"));
		ybj_cgsq_bz=cf.fillNull(rs.getString("ybj_cgsq_bz"));
	}
	else{
		out.println("无参观申请");
		return;
	}
	rs.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
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
<div align="center">板间参观申请 </div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">申请编号</div>
    </td>
    <td width="35%"> <%=ybj_cgsq_sqbh%> </td>
    <td width="15%"> 
      <div align="right">申请店面</div>
    </td>
    <td width="35%"> <%=sq_dwxx_dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">客户姓名</td>
    <td width="35%"><%=ybj_cgsq_khxm%></td>
    <td width="15%" align="right">联系方式</td>
    <td width="35%"><%=ybj_cgsq_lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">房屋地址</div>
    </td>
    <td width="35%"> <%=ybj_cgsq_fwdz%> </td>
    <td width="15%"> 
      <div align="right">所属城区</div>
    </td>
    <td width="35%"> <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",ybj_cgsq_cqbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">设计师</div>
    </td>
    <td width="35%"><%=ybj_cgsq_sjs%> </td>
    <td width="15%"> 
      <div align="right">是否已签单</div>
    </td>
    <td width="35%"><%
	cf.selectToken(out,"Y+已签单&N+未签单",ybj_cgsq_sfyqd,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">申请人</div>
    </td>
    <td width="35%"> <%=ybj_cgsq_sqr%> </td>
    <td width="15%"> 
      <div align="right">申请时间</div>
    </td>
    <td width="35%"> <%=ybj_cgsq_sqsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">要求装修风格</div>
    </td>
    <td width="35%"> <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",ybj_cgsq_fgflbm,true);
%> </td>
    <td width="15%"> 
      <div align="right">要求装修价位</div>
    </td>
    <td width="35%"> <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",ybj_cgsq_zxjwbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">要求户型</div>
    </td>
    <td width="35%"> <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",ybj_cgsq_hxbm,true);
%> </td>
    <td width="15%"> 
      <div align="right">要求户型面积</div>
    </td>
    <td width="35%"> <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm",ybj_cgsq_hxmjbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">要求油色</div>
    </td>
    <td width="35%"> <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm",ybj_cgsq_ysbm,true);
%> </td>
    <td width="15%"> 
      <div align="right">处理状态</div>
    </td>
    <td width="35%"><%
	cf.selectToken(out,"1+发出申请&2+分配样板间&3+参观完成",ybj_cgsq_clzt,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">备注</div>
    </td>
    <td colspan="3"> <%=ybj_cgsq_bz%> </td>
  </tr>
</table>
<center>已分配样板间列表</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">施工队</td>
	<td  width="6%">样板间编号</td>
	<td  width="17%">样板间地址</td>
	<td  width="10%">样板间签约店面</td>
	<td  width="26%">样板间风格</td>
	<td  width="6%">状态</td>
	<td  width="6%">满意</td>
	<td  width="17%">失败原因</td>
	<td  width="6%">核实结果</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT sgdmc sgd,crm_khxx.khbh,crm_khxx.fwdz,a.dwmc sbdm,fgflmc||','||zxjwmc||','||hxmc||','||hxmjmc||','||ysmc,DECODE(clzt,'Y','已写回执','N','未写回执','H','已核实'),DECODE(cgmyd,'Y','满意','N','不满意'),sbyy,DECODE(hsjg,'Y','属实','N','不属实') ";
	ls_sql+=" FROM ybj_fpybj,crm_khxx,sq_dwxx a,sq_sgd";
	ls_sql+=" ,dm_fgflbm,dm_hxmjbm,dm_hxbm,dm_ysbm,dm_zxjwbm";
    ls_sql+=" where ybj_fpybj.khbh=crm_khxx.khbh and crm_khxx.dwbh=a.dwbh and crm_khxx.sgd=sq_sgd.sgd";
    ls_sql+=" and crm_khxx.ysbm=dm_ysbm.ysbm and crm_khxx.hxbm=dm_hxbm.hxbm";
    ls_sql+=" and crm_khxx.hxmjbm=dm_hxmjbm.hxmjbm and crm_khxx.zxjwbm=dm_zxjwbm.zxjwbm and crm_khxx.fgflbm=dm_fgflbm.fgflbm";
	ls_sql+=" and (ybj_fpybj.sqbh="+ybj_cgsq_sqbh+") ";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

</table>

</body>
</html>
