<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_tddj_tdxh=null;
String crm_tddj_khbh=null;
String crm_tddj_khxm=null;
String crm_tddj_fwdz=null;
String crm_tddj_dh=null;
String crm_tddj_sjs=null;
String crm_tddj_zjxm=null;
String crm_tddj_sgd=null;
String crm_tddj_sgbz=null;
String sq_dwxx_dwmc=null;
String dm_tdyybm_tdyymc=null;
String crm_tddj_tdyysm=null;
String crm_tddj_sffj=null;
String crm_tddj_sfyrz=null;
String crm_tddj_ytje=null;
String crm_tddj_stje=null;
String crm_tddj_lrdw=null;
String crm_tddj_lrr=null;
String crm_tddj_lrsj=null;
String crm_tddj_bz=null;
String sfthlp=null;
String tdsj=null;
String wherecrm_tddj_tdxh=null;
wherecrm_tddj_tdxh=cf.GB2Uni(request.getParameter("tdxh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select tdsj,DECODE(crm_tddj.sfthlp,'Y','退回','N','未退回','W','未领礼品') sfthlp,crm_tddj.tdxh as crm_tddj_tdxh,crm_tddj.khbh as crm_tddj_khbh,crm_tddj.khxm as crm_tddj_khxm,crm_tddj.fwdz as crm_tddj_fwdz,crm_tddj.dh as crm_tddj_dh,crm_tddj.sjs as crm_tddj_sjs,crm_tddj.zjxm as crm_tddj_zjxm,crm_tddj.sgd as crm_tddj_sgd,crm_tddj.sgbz as crm_tddj_sgbz,sq_dwxx.dwmc as sq_dwxx_dwmc,dm_tdyybm.tdyymc as dm_tdyybm_tdyymc,crm_tddj.tdyysm as crm_tddj_tdyysm,crm_tddj.sffj as crm_tddj_sffj,crm_tddj.sfyrz as crm_tddj_sfyrz,crm_tddj.ytje as crm_tddj_ytje,crm_tddj.stje as crm_tddj_stje,crm_tddj.lrdw as crm_tddj_lrdw,crm_tddj.lrr as crm_tddj_lrr,crm_tddj.lrsj as crm_tddj_lrsj,crm_tddj.bz as crm_tddj_bz ";
	ls_sql+=" from  sq_dwxx,dm_tdyybm,crm_tddj";
	ls_sql+=" where crm_tddj.dwbh=sq_dwxx.dwbh and crm_tddj.tdyybm=dm_tdyybm.tdyybm and  (crm_tddj.tdxh='"+wherecrm_tddj_tdxh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		sfthlp=cf.fillNull(rs.getString("sfthlp"));
		crm_tddj_tdxh=cf.fillNull(rs.getString("crm_tddj_tdxh"));
		crm_tddj_khbh=cf.fillNull(rs.getString("crm_tddj_khbh"));
		crm_tddj_khxm=cf.fillNull(rs.getString("crm_tddj_khxm"));
		crm_tddj_fwdz=cf.fillNull(rs.getString("crm_tddj_fwdz"));
		crm_tddj_dh=cf.fillNull(rs.getString("crm_tddj_dh"));
		crm_tddj_sjs=cf.fillNull(rs.getString("crm_tddj_sjs"));
		crm_tddj_zjxm=cf.fillNull(rs.getString("crm_tddj_zjxm"));
		crm_tddj_sgd=cf.fillNull(rs.getString("crm_tddj_sgd"));
		crm_tddj_sgbz=cf.fillNull(rs.getString("crm_tddj_sgbz"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		dm_tdyybm_tdyymc=cf.fillNull(rs.getString("dm_tdyybm_tdyymc"));
		crm_tddj_tdyysm=cf.fillNull(rs.getString("crm_tddj_tdyysm"));
		crm_tddj_sffj=cf.fillNull(rs.getString("crm_tddj_sffj"));
		crm_tddj_sfyrz=cf.fillNull(rs.getString("crm_tddj_sfyrz"));
		crm_tddj_ytje=cf.fillNull(rs.getString("crm_tddj_ytje"));
		crm_tddj_stje=cf.fillNull(rs.getString("crm_tddj_stje"));
		crm_tddj_lrdw=cf.fillNull(rs.getString("crm_tddj_lrdw"));
		crm_tddj_lrr=cf.fillNull(rs.getString("crm_tddj_lrr"));
		crm_tddj_lrsj=cf.fillNull(rs.getDate("crm_tddj_lrsj"));
		crm_tddj_bz=cf.fillNull(rs.getString("crm_tddj_bz"));
	}
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
<div align="center">退单登记信息 </div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">退单序号</div>
    </td>
    <td width="33%"> <%=crm_tddj_tdxh%> </td>
    <td width="18%"> 
      <div align="right">客户编号</div>
    </td>
    <td width="32%"> <%=crm_tddj_khbh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">客户姓名</div>
    </td>
    <td width="33%"> <%=crm_tddj_khxm%> </td>
    <td width="18%"> 
      <div align="right">电话</div>
    </td>
    <td width="32%"><%=crm_tddj_dh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">房屋地址</td>
    <td colspan="3"><%=crm_tddj_fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">设计师</div>
    </td>
    <td width="33%"><%=crm_tddj_sjs%> </td>
    <td width="18%"> 
      <div align="right">工程担当</div>
    </td>
    <td width="32%"><%=crm_tddj_zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">施工队</div>
    </td>
    <td width="33%"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+crm_tddj_sgd+"'",crm_tddj_sgd,true);
%> </td>
    <td width="18%"> 
      <div align="right">施工班组</div>
    </td>
    <td width="32%"><%=crm_tddj_sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">签单店面</div>
    </td>
    <td width="33%"><%=sq_dwxx_dwmc%> </td>
    <td width="18%"> 
      <div align="right">退单原因</div>
    </td>
    <td width="32%"><%=dm_tdyybm_tdyymc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="17%" align="right">退单时间</td>
    <td colspan="3"><%=tdsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">退单原因说明</td>
    <td colspan="3"><%=crm_tddj_tdyysm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">是否返券</div>
    </td>
    <td width="33%"> <%
	cf.selectToken(out,"Y+是&N+否",crm_tddj_sffj,true);
%> </td>
    <td width="18%"> 
      <div align="right">是否已认证</div>
    </td>
    <td width="32%"> <%
	cf.selectToken(out,"Y+是&N+否",crm_tddj_sfyrz,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">应退金额</div>
    </td>
    <td width="33%"> <%=crm_tddj_ytje%> </td>
    <td width="18%"> 
      <div align="right">实退金额</div>
    </td>
    <td width="32%"> <%=crm_tddj_stje%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">录入单位</div>
    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_tddj_lrdw+"'",crm_tddj_lrdw,true);
%> </td>
    <td width="18%"> 
      <div align="right">是否退回全部礼品</div>
    </td>
    <td width="32%"><%=sfthlp%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">录入时间</div>
    </td>
    <td width="33%"> <%=crm_tddj_lrsj%> </td>
    <td width="18%"> 
      <div align="right">录入人</div>
    </td>
    <td width="32%"><%=crm_tddj_lrr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">备注</td>
    <td colspan="3"><%=crm_tddj_bz%></td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">客户姓名</td>
	<td  width="22%">礼品名称</td>
	<td  width="8%">礼品数量</td>
	<td  width="10%">领取时间</td>
	<td  width="8%">是否退回</td>
	<td  width="10%">退回登记人</td>
	<td  width="10%">退回时间</td>
	<td  width="22%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT crm_khxx.khxm,yx_lqlpdj.lpmc,yx_lqlpdj.lpsl,yx_lqlpdj.lqsj,DECODE(yx_lqlpdj.shth,'1','领取','2','退回'),yx_lqlpdj.thdjr,yx_lqlpdj.thdjsj,yx_lqlpdj.bz";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,yx_lqlpdj  ";
	ls_sql+=" where yx_lqlpdj.khbh=crm_khxx.khbh and yx_lqlpdj.lrbm=a.dwbh ";
	ls_sql+=" and yx_lqlpdj.khbh='"+crm_tddj_khbh+"'";;
	ls_sql+=" order by yx_lqlpdj.lqsj,yx_lqlpdj.khbh";
	
	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>
</body>
</html>
