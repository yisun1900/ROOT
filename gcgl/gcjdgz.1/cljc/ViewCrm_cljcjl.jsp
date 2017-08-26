<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_cljcjl_ysjlh=null;
String crm_cljcjl_khbh=null;
String crm_cljcjl_yssj=null;
String crm_cljcjl_ysr=null;
String crm_cljcjl_lrr=null;
String crm_cljcjl_lrsj=null;
String sq_dwxx_dwmc=null;
String crm_cljcjl_bz=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_sjs=null;
String crm_khxx_hth=null;
String crm_khxx_qyrq=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;
String ysjlh=null;
ysjlh=cf.GB2Uni(request.getParameter("ysjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_cljcjl.ysjlh as crm_cljcjl_ysjlh,crm_cljcjl.khbh as crm_cljcjl_khbh,crm_cljcjl.yssj as crm_cljcjl_yssj,crm_cljcjl.ysr as crm_cljcjl_ysr,crm_cljcjl.lrr as crm_cljcjl_lrr,crm_cljcjl.lrsj as crm_cljcjl_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,crm_cljcjl.bz as crm_cljcjl_bz,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.hth as crm_khxx_hth,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm ";
	ls_sql+=" from  crm_cljcjl,crm_khxx,sq_dwxx";
	ls_sql+=" where crm_cljcjl.lrdw=sq_dwxx.dwbh and crm_cljcjl.khbh=crm_khxx.khbh and  (crm_cljcjl.ysjlh='"+ysjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		crm_cljcjl_ysjlh=cf.fillNull(rs.getString("crm_cljcjl_ysjlh"));
		crm_cljcjl_khbh=cf.fillNull(rs.getString("crm_cljcjl_khbh"));
		crm_cljcjl_yssj=cf.fillNull(rs.getDate("crm_cljcjl_yssj"));
		crm_cljcjl_ysr=cf.fillNull(rs.getString("crm_cljcjl_ysr"));
		crm_cljcjl_lrr=cf.fillNull(rs.getString("crm_cljcjl_lrr"));
		crm_cljcjl_lrsj=cf.fillNull(rs.getDate("crm_cljcjl_lrsj"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		crm_cljcjl_bz=cf.fillNull(rs.getString("crm_cljcjl_bz"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">材料进场记录（验收记录号：<%=crm_cljcjl_ysjlh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">客户编号</div>
    </td>
    <td width="32%"><%=crm_cljcjl_khbh%> </td>
    <td width="17%"> 
      <div align="right">合同号</div>
    </td>
    <td width="33%"><%=crm_khxx_hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">客户姓名</div>
    </td>
    <td width="32%"> <%=crm_khxx_khxm%>（<%=crm_khxx_lxfs%>） </td>
    <td width="17%"> 
      <div align="right">房屋地址</div>
    </td>
    <td width="33%"> <%=crm_khxx_fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">设计师</div>
    </td>
    <td width="32%"><%=crm_khxx_sjs%> </td>
    <td width="17%"> 
      <div align="right">签约日期</div>
    </td>
    <td width="33%"><%=crm_khxx_qyrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">施工队</div>
    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by cxbz,sgdmc",crm_khxx_sgd,true);
%> </td>
    <td width="17%"> 
      <div align="right">工程担当</div>
    </td>
    <td width="33%"> <%=crm_khxx_zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">验收时间</div>
    </td>
    <td width="32%"> <%=crm_cljcjl_yssj%> </td>
    <td width="17%"> 
      <div align="right">验收人</div>
    </td>
    <td width="33%"> <%=crm_cljcjl_ysr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">录入时间</div>
    </td>
    <td width="32%"><%=crm_cljcjl_lrsj%> </td>
    <td width="17%"> 
      <div align="right">录入人</div>
    </td>
    <td width="33%"> <%=crm_cljcjl_lrr%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">录入单位</div>
    </td>
    <td width="32%"> <%=sq_dwxx_dwmc%> </td>
    <td width="17%"> 
      <div align="right"></div>
    </td>
    <td width="33%">&nbsp; </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">备注</td>
    <td colspan="3"><%=crm_cljcjl_bz%></td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">序号</td>
	<td  width="9%">验收记录号</td>
	<td  width="9%">材料分类</td>
	<td  width="14%">品牌</td>
	<td  width="20%">规格</td>
	<td  width="8%">计量单位</td>
	<td  width="7%">数量</td>
	<td  width="19%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT TO_CHAR(crm_cljcmx.xh) xh,crm_cljcmx.ysjlh,dm_clflbm.clflmc,crm_cljcmx.pp,crm_cljcmx.gg,jdm_jldwbm.jldwmc,crm_cljcmx.sl,crm_cljcmx.bz  ";
	ls_sql+=" FROM jdm_jldwbm,dm_clflbm,crm_cljcmx  ";
    ls_sql+=" where crm_cljcmx.jldwbm=jdm_jldwbm.jldwbm and crm_cljcmx.clflbm=dm_clflbm.clflbm";
    ls_sql+=" and crm_cljcmx.ysjlh='"+ysjlh+"'";
    ls_sql+=" order by crm_cljcmx.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();

%>

</table>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF"> 
  <td width="25%"> 
	<div align="center"><font color="#000099">文件名称</font></div>
  </td>
  <td width="60%"> 
	<div align="center"><font color="#000099">照片</font></div>
  </td>
</tr>
<%

	String yszpmc=null;
	ls_sql="SELECT yszpmc";
	ls_sql+=" FROM crm_gcyszp";
	ls_sql+=" where  ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yszpmc=rs.getString(1);

		%>
		<tr bgcolor="#FFFFFF"> 
		  <td width="25%"> 
			<div align="center"><%=yszpmc%></div>
		  </td>
		  <td width="60%"> 
			<div align="center"><A HREF="/gcgl/gcjdgz/ViewImage.jsp?zhaopian=/gcgl/gcjdgz/images/<%=ysjlh+yszpmc.toUpperCase() %>" target="_blank"><img src="/gcgl/gcjdgz/images/<%=ysjlh+yszpmc.toUpperCase() %>" width="300"></A></div>
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
  out.print("Exception:" + e);
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</table>

</body>
</html>
