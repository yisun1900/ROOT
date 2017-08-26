<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kp_gdrcjcjl_jcjlh=null;
String kp_gdrcjcjl_khbh=null;
String kp_gdrcjcjl_sgd=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_sjs=null;
String crm_khxx_hth=null;
String kp_gdrcjcjl_jcr=null;
String kp_gdrcjcjl_jcsj=null;
String dm_rcjclxbm_rcjclxmc=null;
String dm_rcjcjgbm_rcjcjgmc=null;
String kp_gdrcjcjl_spbz=null;
String kp_gdrcjcjl_spr=null;
String kp_gdrcjcjl_spsj=null;
String kp_gdrcjcjl_lrr=null;
String kp_gdrcjcjl_lrsj=null;
String kp_gdrcjcjl_bz=null;
String kp_gdrcjcjl_lrbm=null;
String jcjlh=null;
jcjlh=cf.GB2Uni(request.getParameter("jcjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select kp_gdrcjcjl.jcjlh as kp_gdrcjcjl_jcjlh,kp_gdrcjcjl.khbh as kp_gdrcjcjl_khbh,kp_gdrcjcjl.sgd as kp_gdrcjcjl_sgd,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.hth as crm_khxx_hth,kp_gdrcjcjl.jcr as kp_gdrcjcjl_jcr,kp_gdrcjcjl.jcsj as kp_gdrcjcjl_jcsj,dm_rcjclxbm.rcjclxmc as dm_rcjclxbm_rcjclxmc,dm_rcjcjgbm.rcjcjgmc as dm_rcjcjgbm_rcjcjgmc,kp_gdrcjcjl.spbz as kp_gdrcjcjl_spbz,kp_gdrcjcjl.spr as kp_gdrcjcjl_spr,kp_gdrcjcjl.spsj as kp_gdrcjcjl_spsj,kp_gdrcjcjl.lrr as kp_gdrcjcjl_lrr,kp_gdrcjcjl.lrsj as kp_gdrcjcjl_lrsj,kp_gdrcjcjl.bz as kp_gdrcjcjl_bz,kp_gdrcjcjl.lrbm as kp_gdrcjcjl_lrbm ";
	ls_sql+=" from  crm_khxx,dm_rcjcjgbm,dm_rcjclxbm,kp_gdrcjcjl";
	ls_sql+=" where kp_gdrcjcjl.rcjcjgbm=dm_rcjcjgbm.rcjcjgbm(+) and kp_gdrcjcjl.rcjclxbm=dm_rcjclxbm.rcjclxbm(+) and kp_gdrcjcjl.khbh=crm_khxx.khbh(+) and  (kp_gdrcjcjl.jcjlh='"+jcjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kp_gdrcjcjl_jcjlh=cf.fillNull(rs.getString("kp_gdrcjcjl_jcjlh"));
		kp_gdrcjcjl_khbh=cf.fillNull(rs.getString("kp_gdrcjcjl_khbh"));
		kp_gdrcjcjl_sgd=cf.fillNull(rs.getString("kp_gdrcjcjl_sgd"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		kp_gdrcjcjl_jcr=cf.fillNull(rs.getString("kp_gdrcjcjl_jcr"));
		kp_gdrcjcjl_jcsj=cf.fillNull(rs.getDate("kp_gdrcjcjl_jcsj"));
		dm_rcjclxbm_rcjclxmc=cf.fillNull(rs.getString("dm_rcjclxbm_rcjclxmc"));
		dm_rcjcjgbm_rcjcjgmc=cf.fillNull(rs.getString("dm_rcjcjgbm_rcjcjgmc"));
		kp_gdrcjcjl_spbz=cf.fillNull(rs.getString("kp_gdrcjcjl_spbz"));
		kp_gdrcjcjl_spr=cf.fillNull(rs.getString("kp_gdrcjcjl_spr"));
		kp_gdrcjcjl_spsj=cf.fillNull(rs.getDate("kp_gdrcjcjl_spsj"));
		kp_gdrcjcjl_lrr=cf.fillNull(rs.getString("kp_gdrcjcjl_lrr"));
		kp_gdrcjcjl_lrsj=cf.fillNull(rs.getDate("kp_gdrcjcjl_lrsj"));
		kp_gdrcjcjl_bz=cf.fillNull(rs.getString("kp_gdrcjcjl_bz"));
		kp_gdrcjcjl_lrbm=cf.fillNull(rs.getString("kp_gdrcjcjl_lrbm"));
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
<div align="center"> 查看信息</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    检查记录号
  </td>
  <td width="35%"> 
    <%=kp_gdrcjcjl_jcjlh%>
  </td>
  <td align="right" width="15%"> 
    客户编号
  </td>
  <td width="35%"> 
    <%=kp_gdrcjcjl_khbh%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    施工队
  </td>
  <td width="35%"> 
    <%=kp_gdrcjcjl_sgd%>
  </td>
  <td align="right" width="15%"> 
    客户姓名
  </td>
  <td width="35%"> 
    <%=crm_khxx_khxm%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    房屋地址
  </td>
  <td width="35%"> 
    <%=crm_khxx_fwdz%>
  </td>
  <td align="right" width="15%"> 
    设计师
  </td>
  <td width="35%"> 
    <%=crm_khxx_sjs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    合同号
  </td>
  <td width="35%"> 
    <%=crm_khxx_hth%>
  </td>
  <td align="right" width="15%"> 
    检查人
  </td>
  <td width="35%"> 
    <%=kp_gdrcjcjl_jcr%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    检查时间
  </td>
  <td width="35%"> 
    <%=kp_gdrcjcjl_jcsj%>
  </td>
  <td align="right" width="15%"> 
    检查类型
  </td>
  <td width="35%"> 
    <%=dm_rcjclxbm_rcjclxmc%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    检查结果
  </td>
  <td width="35%"> 
    <%=dm_rcjcjgbm_rcjcjgmc%>
  </td>
  <td align="right" width="15%"> 
    审批标志
  </td>
  <td width="35%"> 
<%
	cf.radioToken(out, "1+未审批&2+审批",kp_gdrcjcjl_spbz,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    审批人
  </td>
  <td width="35%"> 
    <%=kp_gdrcjcjl_spr%>
  </td>
  <td align="right" width="15%"> 
    审批时间
  </td>
  <td width="35%"> 
    <%=kp_gdrcjcjl_spsj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    录入人
  </td>
  <td width="35%"> 
    <%=kp_gdrcjcjl_lrr%>
  </td>
  <td align="right" width="15%"> 
    录入时间
  </td>
  <td width="35%"> 
    <%=kp_gdrcjcjl_lrsj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    备注
  </td>
  <td width="35%"> 
    <%=kp_gdrcjcjl_bz%>
  </td>
  <td align="right" width="15%"> 
    录入部门
  </td>
  <td width="35%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+kp_gdrcjcjl_lrbm+"'",kp_gdrcjcjl_lrbm,true);
%>
  </td>
</tr>
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
	ls_sql="SELECT zpmc";
	ls_sql+=" FROM kp_gdrcjczp";
	ls_sql+=" where  jcjlh='"+jcjlh+"'";
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
			<div align="center"><img src="/sgdgl/gdrcjc/images/<%=yszpmc.toUpperCase() %>"></div>
		  </td>
		</tr>
<%
}
	rs.close();
	ps.close();

}
catch (Exception e) {
  out.print("上载版库照片失败，Exception:" + e);
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
