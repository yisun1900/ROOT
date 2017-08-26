<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_gcjddjjl_djjlh=null;
String crm_gcjddjjl_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_gcjddjjl_gcjdbm=null;
String crm_gcjddjjl_djsj=null;
String crm_gcjddjjl_zpsl=null;
String crm_gcjddjjl_sfszhf=null;
String crm_gcjddjjl_hfszjlh=null;
String crm_gcjddjjl_ygcjdbm=null;
String crm_gcjddjjl_ysfxhf=null;
String crm_gcjddjjl_yhfrq=null;
String crm_gcjddjjl_yhflxbm=null;
String crm_gcjddjjl_lrr=null;
String crm_gcjddjjl_lrsj=null;
String crm_gcjddjjl_lrdw=null;
String crm_gcjddjjl_bz=null;
String djjlh=null;
djjlh=cf.GB2Uni(request.getParameter("djjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_gcjddjjl.djjlh as crm_gcjddjjl_djjlh,crm_gcjddjjl.khbh as crm_gcjddjjl_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_gcjddjjl.gcjdbm as crm_gcjddjjl_gcjdbm,crm_gcjddjjl.djsj as crm_gcjddjjl_djsj,crm_gcjddjjl.zpsl as crm_gcjddjjl_zpsl,crm_gcjddjjl.sfszhf as crm_gcjddjjl_sfszhf,crm_gcjddjjl.hfszjlh as crm_gcjddjjl_hfszjlh,crm_gcjddjjl.ygcjdbm as crm_gcjddjjl_ygcjdbm,crm_gcjddjjl.ysfxhf as crm_gcjddjjl_ysfxhf,crm_gcjddjjl.yhfrq as crm_gcjddjjl_yhfrq,crm_gcjddjjl.yhflxbm as crm_gcjddjjl_yhflxbm,crm_gcjddjjl.lrr as crm_gcjddjjl_lrr,crm_gcjddjjl.lrsj as crm_gcjddjjl_lrsj,crm_gcjddjjl.lrdw as crm_gcjddjjl_lrdw,crm_gcjddjjl.bz as crm_gcjddjjl_bz ";
	ls_sql+=" from  crm_gcjddjjl,crm_khxx";
	ls_sql+=" where crm_gcjddjjl.khbh=crm_khxx.khbh(+) and  (crm_gcjddjjl.djjlh='"+djjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		crm_gcjddjjl_djjlh=cf.fillNull(rs.getString("crm_gcjddjjl_djjlh"));
		crm_gcjddjjl_khbh=cf.fillNull(rs.getString("crm_gcjddjjl_khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_gcjddjjl_gcjdbm=cf.fillNull(rs.getString("crm_gcjddjjl_gcjdbm"));
		crm_gcjddjjl_djsj=cf.fillNull(rs.getDate("crm_gcjddjjl_djsj"));
		crm_gcjddjjl_zpsl=cf.fillNull(rs.getString("crm_gcjddjjl_zpsl"));
		crm_gcjddjjl_sfszhf=cf.fillNull(rs.getString("crm_gcjddjjl_sfszhf"));
		crm_gcjddjjl_hfszjlh=cf.fillNull(rs.getString("crm_gcjddjjl_hfszjlh"));
		crm_gcjddjjl_ygcjdbm=cf.fillNull(rs.getString("crm_gcjddjjl_ygcjdbm"));
		crm_gcjddjjl_ysfxhf=cf.fillNull(rs.getString("crm_gcjddjjl_ysfxhf"));
		crm_gcjddjjl_yhfrq=cf.fillNull(rs.getDate("crm_gcjddjjl_yhfrq"));
		crm_gcjddjjl_yhflxbm=cf.fillNull(rs.getString("crm_gcjddjjl_yhflxbm"));
		crm_gcjddjjl_lrr=cf.fillNull(rs.getString("crm_gcjddjjl_lrr"));
		crm_gcjddjjl_lrsj=cf.fillNull(rs.getDate("crm_gcjddjjl_lrsj"));
		crm_gcjddjjl_lrdw=cf.fillNull(rs.getString("crm_gcjddjjl_lrdw"));
		crm_gcjddjjl_bz=cf.fillNull(rs.getString("crm_gcjddjjl_bz"));
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
    登记记录号
  </td>
  <td width="35%"> 
    <%=crm_gcjddjjl_djjlh%>
  </td>
  <td align="right" width="15%"> 
    客户编号
  </td>
  <td width="35%"> 
    <%=crm_gcjddjjl_khbh%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    客户姓名
  </td>
  <td width="35%"> 
    <%=crm_khxx_khxm%>
  </td>
  <td align="right" width="15%"> 
    房屋地址
  </td>
  <td width="35%"> 
    <%=crm_khxx_fwdz%>
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
    设计师
  </td>
  <td width="35%"> 
    <%=crm_khxx_sjs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    工程进度
  </td>
  <td width="35%"> 
<%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm",crm_gcjddjjl_gcjdbm,true);
%>
  </td>
  <td align="right" width="15%"> 
    工程进度时间
  </td>
  <td width="35%"> 
    <%=crm_gcjddjjl_djsj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    照片数量
  </td>
  <td width="35%"> 
    <%=crm_gcjddjjl_zpsl%>
  </td>
  <td align="right" width="15%"> 
    是否设置回访
  </td>
  <td width="35%"> 
<%
	cf.radioToken(out, "1+设置&0+不设置",crm_gcjddjjl_sfszhf,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    回访设置记录号
  </td>
  <td width="35%"> 
    <%=crm_gcjddjjl_hfszjlh%>
  </td>
  <td align="right" width="15%"> 
    原工程进度编码
  </td>
  <td width="35%"> 
<%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm",crm_gcjddjjl_ygcjdbm,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    原是否需回访
  </td>
  <td width="35%"> 
<%
	cf.radioToken(out, "Y+需回访&N+不需回访",crm_gcjddjjl_ysfxhf,true);
%>
  </td>
  <td align="right" width="15%"> 
    原应回访日期
  </td>
  <td width="35%"> 
    <%=crm_gcjddjjl_yhfrq%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    原回访类型编码
  </td>
  <td width="35%"> 
    <%=crm_gcjddjjl_yhflxbm%>
  </td>
  <td align="right" width="15%"> 
    录入人
  </td>
  <td width="35%"> 
    <%=crm_gcjddjjl_lrr%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    录入时间
  </td>
  <td width="35%"> 
    <%=crm_gcjddjjl_lrsj%>
  </td>
  <td align="right" width="15%"> 
    录入单位
  </td>
  <td width="35%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh",crm_gcjddjjl_lrdw,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    备注
  </td>
  <td width="35%"> 
    <%=crm_gcjddjjl_bz%>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
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
	ls_sql="SELECT yszpmc";
	ls_sql+=" FROM crm_gcyszp";
	ls_sql+=" where  ysjlh='"+djjlh+"'";
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
			<div align="center"><A HREF="/gcgl/gcjdgz/ViewImage.jsp?zhaopian=/gcgl/gcjdgz/images/<%=java.net.URLEncoder.encode(yszpmc,"UTF-8")%>" target="_blank"><img src="/gcgl/gcjdgz/images/<%=yszpmc%>" width="300"></A></div>
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
  out.print("Exception:" + e);
  out.print("<BR>SQL=" + ls_sql);
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
