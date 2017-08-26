<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_yglkgsjl_jlh=null;
String crm_yglkgsjl_ygbh=null;
String crm_yglkgsjl_yhmc=null;
String crm_yglkgsjl_ygbm=null;
String crm_yglkgsjl_rylx=null;
String crm_yglkgsjl_jhlkrq=null;
String crm_yglkgsjl_jhlksj=null;
String crm_yglkgsjl_jhfhsj=null;
String crm_yglkgsjl_lkgsmd=null;
String crm_yglkgsjl_lkgssm=null;
String crm_yglkgsjl_sjlksj=null;
String crm_yglkgsjl_lklrr=null;
String crm_yglkgsjl_lklrsj=null;
String crm_yglkgsjl_sjfhsj=null;
String crm_yglkgsjl_fhlrr=null;
String crm_yglkgsjl_fhlrsj=null;
String crm_yglkgsjl_qksfss=null;
String crm_yglkgsjl_shr=null;
String crm_yglkgsjl_shsj=null;
String crm_yglkgsjl_shsm=null;
String crm_yglkgsjl_zt=null;
String crm_yglkgsjl_lrr=null;
String crm_yglkgsjl_lrsj=null;
String crm_yglkgsjl_lrbm=null;
String sq_dwxx_dwmc=null;
String crm_yglkgsjl_bz=null;
String wherecrm_yglkgsjl_jlh=null;
wherecrm_yglkgsjl_jlh=cf.GB2Uni(request.getParameter("jlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_yglkgsjl.jlh as crm_yglkgsjl_jlh,crm_yglkgsjl.ygbh as crm_yglkgsjl_ygbh,crm_yglkgsjl.yhmc as crm_yglkgsjl_yhmc,crm_yglkgsjl.ygbm as crm_yglkgsjl_ygbm,crm_yglkgsjl.rylx as crm_yglkgsjl_rylx,crm_yglkgsjl.jhlkrq as crm_yglkgsjl_jhlkrq,crm_yglkgsjl.jhlksj as crm_yglkgsjl_jhlksj,crm_yglkgsjl.jhfhsj as crm_yglkgsjl_jhfhsj,crm_yglkgsjl.lkgsmd as crm_yglkgsjl_lkgsmd,crm_yglkgsjl.lkgssm as crm_yglkgsjl_lkgssm,crm_yglkgsjl.sjlksj as crm_yglkgsjl_sjlksj,crm_yglkgsjl.lklrr as crm_yglkgsjl_lklrr,crm_yglkgsjl.lklrsj as crm_yglkgsjl_lklrsj,crm_yglkgsjl.sjfhsj as crm_yglkgsjl_sjfhsj,crm_yglkgsjl.fhlrr as crm_yglkgsjl_fhlrr,crm_yglkgsjl.fhlrsj as crm_yglkgsjl_fhlrsj,crm_yglkgsjl.qksfss as crm_yglkgsjl_qksfss,crm_yglkgsjl.shr as crm_yglkgsjl_shr,crm_yglkgsjl.shsj as crm_yglkgsjl_shsj,crm_yglkgsjl.shsm as crm_yglkgsjl_shsm,crm_yglkgsjl.zt as crm_yglkgsjl_zt,crm_yglkgsjl.lrr as crm_yglkgsjl_lrr,crm_yglkgsjl.lrsj as crm_yglkgsjl_lrsj,crm_yglkgsjl.lrbm as crm_yglkgsjl_lrbm,sq_dwxx.dwmc as sq_dwxx_dwmc,crm_yglkgsjl.bz as crm_yglkgsjl_bz ";
	ls_sql+=" from  crm_yglkgsjl,sq_dwxx";
	ls_sql+=" where crm_yglkgsjl.ssfgs=sq_dwxx.dwbh(+) and  (crm_yglkgsjl.jlh="+wherecrm_yglkgsjl_jlh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		crm_yglkgsjl_jlh=cf.fillNull(rs.getString("crm_yglkgsjl_jlh"));
		crm_yglkgsjl_ygbh=cf.fillNull(rs.getString("crm_yglkgsjl_ygbh"));
		crm_yglkgsjl_yhmc=cf.fillNull(rs.getString("crm_yglkgsjl_yhmc"));
		crm_yglkgsjl_ygbm=cf.fillNull(rs.getString("crm_yglkgsjl_ygbm"));
		crm_yglkgsjl_rylx=cf.fillNull(rs.getString("crm_yglkgsjl_rylx"));
		crm_yglkgsjl_jhlkrq=cf.fillNull(rs.getDate("crm_yglkgsjl_jhlkrq"));
		crm_yglkgsjl_jhlksj=cf.fillNull(rs.getString("crm_yglkgsjl_jhlksj"));
		crm_yglkgsjl_jhfhsj=cf.fillNull(rs.getString("crm_yglkgsjl_jhfhsj"));
		crm_yglkgsjl_lkgsmd=cf.fillNull(rs.getString("crm_yglkgsjl_lkgsmd"));
		crm_yglkgsjl_lkgssm=cf.fillNull(rs.getString("crm_yglkgsjl_lkgssm"));
		crm_yglkgsjl_sjlksj=cf.fillNull(rs.getString("crm_yglkgsjl_sjlksj"));
		crm_yglkgsjl_lklrr=cf.fillNull(rs.getString("crm_yglkgsjl_lklrr"));
		crm_yglkgsjl_lklrsj=cf.fillNull(rs.getDate("crm_yglkgsjl_lklrsj"));
		crm_yglkgsjl_sjfhsj=cf.fillNull(rs.getString("crm_yglkgsjl_sjfhsj"));
		crm_yglkgsjl_fhlrr=cf.fillNull(rs.getString("crm_yglkgsjl_fhlrr"));
		crm_yglkgsjl_fhlrsj=cf.fillNull(rs.getDate("crm_yglkgsjl_fhlrsj"));
		crm_yglkgsjl_qksfss=cf.fillNull(rs.getString("crm_yglkgsjl_qksfss"));
		crm_yglkgsjl_shr=cf.fillNull(rs.getString("crm_yglkgsjl_shr"));
		crm_yglkgsjl_shsj=cf.fillNull(rs.getDate("crm_yglkgsjl_shsj"));
		crm_yglkgsjl_shsm=cf.fillNull(rs.getString("crm_yglkgsjl_shsm"));
		crm_yglkgsjl_zt=cf.fillNull(rs.getString("crm_yglkgsjl_zt"));
		crm_yglkgsjl_lrr=cf.fillNull(rs.getString("crm_yglkgsjl_lrr"));
		crm_yglkgsjl_lrsj=cf.fillNull(rs.getDate("crm_yglkgsjl_lrsj"));
		crm_yglkgsjl_lrbm=cf.fillNull(rs.getString("crm_yglkgsjl_lrbm"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		crm_yglkgsjl_bz=cf.fillNull(rs.getString("crm_yglkgsjl_bz"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">员工离开公司记录</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">所属公司</td>
  <td><%=sq_dwxx_dwmc%></td>
  <td align="right">员工部门</td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_yglkgsjl_ygbm+"'",crm_yglkgsjl_ygbm,true);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    记录号  </td>
  <td width="32%"> 
    <%=crm_yglkgsjl_jlh%>  </td>
  <td align="right" width="18%"> 
    员工编号  </td>
  <td width="32%"> 
    <%=crm_yglkgsjl_ygbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    员工名称  </td>
  <td width="32%"> 
    <%=crm_yglkgsjl_yhmc%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    人员类型  </td>
  <td width="32%"> 
<%=crm_yglkgsjl_rylx%>  </td>
  <td align="right" width="18%"> 
    计划离开日期  </td>
  <td width="32%"> 
    <%=crm_yglkgsjl_jhlkrq%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    计划离开时间  </td>
  <td width="32%"> 
    <%=crm_yglkgsjl_jhlksj%>  </td>
  <td align="right" width="18%"> 
    计划返回时间  </td>
  <td width="32%"> 
    <%=crm_yglkgsjl_jhfhsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    离开公司目的  </td>
  <td width="32%"> 
<%=crm_yglkgsjl_lkgsmd%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">离开公司说明</td>
  <td colspan="3"><%=crm_yglkgsjl_lkgssm%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    实际离开时间  </td>
  <td width="32%"> 
    <%=crm_yglkgsjl_sjlksj%>  </td>
  <td align="right" width="18%">实际返回时间</td>
  <td width="32%"><%=crm_yglkgsjl_sjfhsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">离开录入人 </td>
  <td><%=crm_yglkgsjl_lklrr%></td>
  <td align="right">离开录入时间</td>
  <td><%=crm_yglkgsjl_lklrsj%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    返回录入人  </td>
  <td width="32%"> 
    <%=crm_yglkgsjl_fhlrr%>  </td>
  <td align="right" width="18%"> 
    返回录入时间  </td>
  <td width="32%"> 
    <%=crm_yglkgsjl_fhlrsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    情况是否属实  </td>
  <td width="32%"> 
<%
	cf.selectToken(out,"Y+属实&N+不属实",crm_yglkgsjl_qksfss,true);
%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">审核说明</td>
  <td colspan="3"><%=crm_yglkgsjl_shsm%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">审核人 </td>
  <td><%=crm_yglkgsjl_shr%></td>
  <td align="right">审核时间</td>
  <td><%=crm_yglkgsjl_shsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td>
  <td width="32%"><%=crm_yglkgsjl_lrr%></td>
  <td align="right" width="18%">录入时间</td>
  <td width="32%"><%=crm_yglkgsjl_lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入部门</td>
  <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_yglkgsjl_lrbm+"'",crm_yglkgsjl_lrbm,true);
%></td>
  <td align="right" width="18%"><span class="STYLE1">状态</span></td>
  <td width="32%"><%
	cf.selectToken(out,"1+录入申请&2+离开公司&3+返回公司&4+已审核",crm_yglkgsjl_zt,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">备注 </td>
  <td colspan="3"><%=crm_yglkgsjl_bz%></td>
  </tr>
</table>
</body>
</html>
