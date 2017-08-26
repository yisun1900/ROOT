<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_zxhfjl_khbh=null;
String crm_zxkhxx_khxm=null;
String crm_zxkhxx_fwdz=null;
String crm_zxkhxx_lxfs=null;
String crm_zxhfjl_hfjlh=null;
String crm_zxhfjl_khhfqk=null;
String crm_zxhfjl_lfbz=null;
String crm_zxhfjl_lfsj=null;
String crm_zxhfjl_ctbz=null;
String crm_zxhfjl_ctsj=null;
String crm_zxhfjl_yqghdm=null;
String crm_zxhfjl_yqghsjs=null;
String crm_zxhfjl_sjszysp=null;
String crm_zxhfjl_sjsfw=null;
String crm_zxhfjl_qtryfw=null;
String crm_zxhfjl_gcbj=null;
String crm_zxhfjl_gsztyx=null;
String crm_zxhfjl_xwgjfm=null;
String crm_zxhfjl_sfjxhf=null;
String crm_zxhfjl_xchfrq=null;
String crm_zxhfjl_hfsj=null;
String crm_zxhfjl_hfr=null;
String crm_zxhfjl_clfs=null;
String crm_zxhfjl_dwbh=null;
String sq_dwxx_dwmc=null;
String crm_zxhfjl_ckr=null;
String crm_zxhfjl_cksj=null;
String crm_zxhfjl_zxdm=null;
String crm_zxhfjl_sjs=null;
String wherecrm_zxhfjl_hfjlh=null;
wherecrm_zxhfjl_hfjlh=cf.GB2Uni(request.getParameter("hfjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_zxhfjl.khbh as crm_zxhfjl_khbh,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,crm_zxhfjl.hfjlh as crm_zxhfjl_hfjlh,crm_zxhfjl.khhfqk as crm_zxhfjl_khhfqk,crm_zxhfjl.lfbz as crm_zxhfjl_lfbz,crm_zxhfjl.lfsj as crm_zxhfjl_lfsj,crm_zxhfjl.ctbz as crm_zxhfjl_ctbz,crm_zxhfjl.ctsj as crm_zxhfjl_ctsj,crm_zxhfjl.yqghdm as crm_zxhfjl_yqghdm,crm_zxhfjl.yqghsjs as crm_zxhfjl_yqghsjs,crm_zxhfjl.sjszysp as crm_zxhfjl_sjszysp,crm_zxhfjl.sjsfw as crm_zxhfjl_sjsfw,crm_zxhfjl.qtryfw as crm_zxhfjl_qtryfw,crm_zxhfjl.gcbj as crm_zxhfjl_gcbj,crm_zxhfjl.gsztyx as crm_zxhfjl_gsztyx,crm_zxhfjl.xwgjfm as crm_zxhfjl_xwgjfm,crm_zxhfjl.sfjxhf as crm_zxhfjl_sfjxhf,crm_zxhfjl.xchfrq as crm_zxhfjl_xchfrq,crm_zxhfjl.hfsj as crm_zxhfjl_hfsj,crm_zxhfjl.hfr as crm_zxhfjl_hfr,crm_zxhfjl.clfs as crm_zxhfjl_clfs,crm_zxhfjl.dwbh as crm_zxhfjl_dwbh,sq_dwxx.dwmc as sq_dwxx_dwmc,crm_zxhfjl.ckr as crm_zxhfjl_ckr,crm_zxhfjl.cksj as crm_zxhfjl_cksj,crm_zxhfjl.zxdm as crm_zxhfjl_zxdm,crm_zxhfjl.sjs as crm_zxhfjl_sjs ";
	ls_sql+=" from  crm_zxhfjl,crm_zxkhxx,sq_dwxx";
	ls_sql+=" where crm_zxhfjl.hfbm=sq_dwxx.dwbh and crm_zxhfjl.khbh=crm_zxkhxx.khbh and  (crm_zxhfjl.hfjlh='"+wherecrm_zxhfjl_hfjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		crm_zxhfjl_khbh=cf.fillNull(rs.getString("crm_zxhfjl_khbh"));
		crm_zxkhxx_khxm=cf.fillNull(rs.getString("crm_zxkhxx_khxm"));
		crm_zxkhxx_fwdz=cf.fillNull(rs.getString("crm_zxkhxx_fwdz"));
		crm_zxkhxx_lxfs=cf.fillNull(rs.getString("crm_zxkhxx_lxfs"));
		crm_zxhfjl_hfjlh=cf.fillNull(rs.getString("crm_zxhfjl_hfjlh"));
		crm_zxhfjl_khhfqk=cf.fillNull(rs.getString("crm_zxhfjl_khhfqk"));
		crm_zxhfjl_lfbz=cf.fillNull(rs.getString("crm_zxhfjl_lfbz"));
		crm_zxhfjl_lfsj=cf.fillNull(rs.getDate("crm_zxhfjl_lfsj"));
		crm_zxhfjl_ctbz=cf.fillNull(rs.getString("crm_zxhfjl_ctbz"));
		crm_zxhfjl_ctsj=cf.fillNull(rs.getDate("crm_zxhfjl_ctsj"));
		crm_zxhfjl_yqghdm=cf.fillNull(rs.getString("crm_zxhfjl_yqghdm"));
		crm_zxhfjl_yqghsjs=cf.fillNull(rs.getString("crm_zxhfjl_yqghsjs"));
		crm_zxhfjl_sjszysp=cf.fillNull(rs.getString("crm_zxhfjl_sjszysp"));
		crm_zxhfjl_sjsfw=cf.fillNull(rs.getString("crm_zxhfjl_sjsfw"));
		crm_zxhfjl_qtryfw=cf.fillNull(rs.getString("crm_zxhfjl_qtryfw"));
		crm_zxhfjl_gcbj=cf.fillNull(rs.getString("crm_zxhfjl_gcbj"));
		crm_zxhfjl_gsztyx=cf.fillNull(rs.getString("crm_zxhfjl_gsztyx"));
		crm_zxhfjl_xwgjfm=cf.fillNull(rs.getString("crm_zxhfjl_xwgjfm"));
		crm_zxhfjl_sfjxhf=cf.fillNull(rs.getString("crm_zxhfjl_sfjxhf"));
		crm_zxhfjl_xchfrq=cf.fillNull(rs.getDate("crm_zxhfjl_xchfrq"));
		crm_zxhfjl_hfsj=cf.fillNull(rs.getDate("crm_zxhfjl_hfsj"));
		crm_zxhfjl_hfr=cf.fillNull(rs.getString("crm_zxhfjl_hfr"));
		crm_zxhfjl_clfs=cf.fillNull(rs.getString("crm_zxhfjl_clfs"));
		crm_zxhfjl_dwbh=cf.fillNull(rs.getString("crm_zxhfjl_dwbh"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		crm_zxhfjl_ckr=cf.fillNull(rs.getString("crm_zxhfjl_ckr"));
		crm_zxhfjl_cksj=cf.fillNull(rs.getDate("crm_zxhfjl_cksj"));
		crm_zxhfjl_zxdm=cf.fillNull(rs.getString("crm_zxhfjl_zxdm"));
		crm_zxhfjl_sjs=cf.fillNull(rs.getString("crm_zxhfjl_sjs"));
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
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 咨询回访信息（回访记录号：<%=crm_zxhfjl_hfjlh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr> 
    <td align="center" colspan="4">
        <form method="post" action="SaveCkCrm_zxhfjl.jsp" name="selectform">
          <input type="hidden" name="hfjlh" value="<%=wherecrm_zxhfjl_hfjlh%>" >
          <input type="submit" name="Submit" value="查看完成后请点击此按钮，标识已查看">
      </form>
    </td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td align="right" width="20%"> 客户编号 </td>
    <td width="30%"> <%=crm_zxhfjl_khbh%> </td>
    <td align="right" width="20%"> 客户姓名 </td>
    <td width="30%"> <%=crm_zxkhxx_khxm%> </td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td align="right" width="20%"> 房屋地址 </td>
    <td width="30%"> <%=crm_zxkhxx_fwdz%> </td>
    <td align="right" width="20%"> 联系方式 </td>
    <td width="30%"> <%=crm_zxkhxx_lxfs%> </td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td align="right" width="20%">咨询店面</td>
    <td width="30%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_zxhfjl_zxdm+"'",crm_zxhfjl_zxdm,true);
%></td>
    <td align="right" width="20%">设计师</td>
    <td width="30%"><%=crm_zxhfjl_sjs%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" width="20%"> 量房标志 </td>
    <td width="30%"> <%
	cf.radioToken(out, "N+未量房&Y+已量房",crm_zxhfjl_lfbz,true);
%> </td>
    <td align="right" width="20%"> 量房时间 </td>
    <td width="30%"> <%=crm_zxhfjl_lfsj%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" width="20%"> 出平面图标志 </td>
    <td width="30%"> <%
	cf.radioToken(out, "N+未出图&Y+已出图",crm_zxhfjl_ctbz,true);
%> </td>
    <td align="right" width="20%"> 出平面图时间 </td>
    <td width="30%"> <%=crm_zxhfjl_ctsj%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" width="20%"> 要求更换店面 </td>
    <td width="30%"> <%
	cf.radioToken(out, "N+不要求&Y+要求更换",crm_zxhfjl_yqghdm,true);
%> </td>
    <td align="right" width="20%"> 要求更换设计师 </td>
    <td width="30%"> <%
	cf.radioToken(out, "N+不要求&Y+要求更换",crm_zxhfjl_yqghsjs,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" width="20%"> 设计师专业水平 </td>
    <td width="30%"> <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='3' order by hfjgbm",crm_zxhfjl_sjszysp,true);
%> </td>
    <td align="right" width="20%"> 设计师服务 </td>
    <td width="30%"> <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='4' order by hfjgbm",crm_zxhfjl_sjsfw,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" width="20%"> 其它人员服务 </td>
    <td width="30%"> <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='5' order by hfjgbm",crm_zxhfjl_qtryfw,true);
%> </td>
    <td align="right" width="20%"> 工程报价 </td>
    <td width="30%"> <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='6' order by hfjgbm",crm_zxhfjl_gcbj,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" width="20%"> 公司总体印象 </td>
    <td width="30%"> <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='7' order by hfjgbm",crm_zxhfjl_gsztyx,true);
%> </td>
    <td align="right" width="20%"> 希望改进方面 </td>
    <td width="30%"> <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='8' order by hfjgbm",crm_zxhfjl_xwgjfm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" width="20%">客户回访情况</td>
    <td colspan="3"><%=crm_zxhfjl_khhfqk%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" width="20%"> 是否继续回访 </td>
    <td width="30%"> <%
	cf.radioToken(out, "Y+继续回访&N+回访结束",crm_zxhfjl_sfjxhf,true);
%> </td>
    <td align="right" width="20%"> 下次回访日期 </td>
    <td width="30%"> <%=crm_zxhfjl_xchfrq%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" width="20%"> 回访时间 </td>
    <td width="30%"> <%=crm_zxhfjl_hfsj%> </td>
    <td align="right" width="20%"> 回访人 </td>
    <td width="30%"> <%=crm_zxhfjl_hfr%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" width="20%"> 回访部门 </td>
    <td width="30%"> <%=sq_dwxx_dwmc%> </td>
    <td align="right" width="20%">&nbsp; </td>
    <td width="30%">&nbsp; </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" width="20%" bgcolor="#CCFFCC"> 是否提醒责任人 </td>
    <td width="30%"> <%
	cf.radioToken(out, "0+不提醒&1+提醒店面&2+提醒设计师",crm_zxhfjl_clfs,true);
%> </td>
    <td align="right" width="20%"> 反馈部门 </td>
    <td width="30%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_zxhfjl_dwbh+"'",crm_zxhfjl_dwbh,true);
%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" width="20%"> 查看时间 </td>
    <td width="30%"> <%=crm_zxhfjl_cksj%> </td>
    <td align="right" width="20%">查看人 </td>
    <td width="30%"><%=crm_zxhfjl_ckr%> </td>
  </tr>
</table>
</body>
</html>
