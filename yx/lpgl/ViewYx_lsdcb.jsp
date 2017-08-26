<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yx_lsdcb_xqbh=null;
String yx_lsdcb_xqmc=null;
String yx_lsdcb_dqbm=null;
String yx_lsdcb_cqbm=null;
String yx_lsdcb_dz=null;
String yx_lsdcb_cclx=null;
String yx_lsdcb_tjdm=null;
String yx_lsdcb_jw=null;
String yx_lsdcb_yzxfsp=null;
String yx_lsdcb_xz=null;
String yx_lsdcb_wyxs=null;
String yx_lsdcb_xqgm=null;
String yx_lsdcb_hxzl=null;
String yx_lsdcb_zlhx=null;
String yx_lsdcb_zlhxmj=null;
String yx_lsdcb_ywy=null;
String yx_lsdcb_dysfwc=null;
String yx_lsdcb_xqfzr=null;
String yx_lsdcb_xqfzrdh=null;
String yx_lsdcb_xqzhpj=null;
String yx_lsdcb_lxsj=null;
String yx_lsdcb_xsfs=null;
String yx_lsdcb_fyssj=null;
String yx_lsdcb_jfhs=null;
String yx_lsdcb_sfytg=null;
String yx_lsdcb_xszk=null;
String yx_lsdcb_khzlgmqk=null;
String yx_lsdcb_khmd=null;
String yx_lsdcb_ykfsgx=null;
String yx_lsdcb_sfjcxc=null;
String yx_lsdcb_khzyl=null;
String yx_lsdcb_yxxcfs=null;
String yx_lsdcb_kfjy=null;
String yx_lsdcb_kfs=null;
String yx_lsdcb_kfslxr=null;
String yx_lsdcb_kfslxrzw=null;
String yx_lsdcb_kfslxrdh=null;
String yx_lsdcb_jzs=null;
String yx_lsdcb_xss=null;
String yx_lsdcb_sldh=null;
String yx_lsdcb_ywzxgs=null;
String yx_lsdcb_zxgssl=null;
String yx_lsdcb_yzxhs=null;
String yx_lsdcb_sftizxq=null;
String yx_lsdcb_yjzxsj=null;
String yx_lsdcb_ywwygs=null;
String yx_lsdcb_wygsmc=null;
String yx_lsdcb_wyfzr=null;
String yx_lsdcb_wydh=null;
String yx_lsdcb_wylxr=null;
String yx_lsdcb_wylxrzw=null;
String yx_lsdcb_kfjd=null;
String yx_lsdcb_lrr=null;
String yx_lsdcb_lrsj=null;
String sq_dwxx_dwmc=null;
String xqbh=null;
xqbh=cf.GB2Uni(request.getParameter("xqbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select yx_lsdcb.xqbh as yx_lsdcb_xqbh,yx_lsdcb.xqmc as yx_lsdcb_xqmc,yx_lsdcb.dqbm as yx_lsdcb_dqbm,yx_lsdcb.cqbm as yx_lsdcb_cqbm,yx_lsdcb.dz as yx_lsdcb_dz,yx_lsdcb.cclx as yx_lsdcb_cclx,yx_lsdcb.tjdm as yx_lsdcb_tjdm,yx_lsdcb.jw as yx_lsdcb_jw,yx_lsdcb.yzxfsp as yx_lsdcb_yzxfsp,yx_lsdcb.xz as yx_lsdcb_xz,yx_lsdcb.wyxs as yx_lsdcb_wyxs,yx_lsdcb.xqgm as yx_lsdcb_xqgm,yx_lsdcb.hxzl as yx_lsdcb_hxzl,yx_lsdcb.zlhx as yx_lsdcb_zlhx,yx_lsdcb.zlhxmj as yx_lsdcb_zlhxmj,yx_lsdcb.ywy as yx_lsdcb_ywy,yx_lsdcb.dysfwc as yx_lsdcb_dysfwc,yx_lsdcb.xqfzr as yx_lsdcb_xqfzr,yx_lsdcb.xqfzrdh as yx_lsdcb_xqfzrdh,yx_lsdcb.xqzhpj as yx_lsdcb_xqzhpj,yx_lsdcb.lxsj as yx_lsdcb_lxsj,yx_lsdcb.xsfs as yx_lsdcb_xsfs,yx_lsdcb.fyssj as yx_lsdcb_fyssj,yx_lsdcb.jfhs as yx_lsdcb_jfhs,yx_lsdcb.sfytg as yx_lsdcb_sfytg,yx_lsdcb.xszk as yx_lsdcb_xszk,yx_lsdcb.khzlgmqk as yx_lsdcb_khzlgmqk,yx_lsdcb.khmd as yx_lsdcb_khmd,yx_lsdcb.ykfsgx as yx_lsdcb_ykfsgx,yx_lsdcb.sfjcxc as yx_lsdcb_sfjcxc,yx_lsdcb.khzyl as yx_lsdcb_khzyl,yx_lsdcb.yxxcfs as yx_lsdcb_yxxcfs,yx_lsdcb.kfjy as yx_lsdcb_kfjy,yx_lsdcb.kfs as yx_lsdcb_kfs,yx_lsdcb.kfslxr as yx_lsdcb_kfslxr,yx_lsdcb.kfslxrzw as yx_lsdcb_kfslxrzw,yx_lsdcb.kfslxrdh as yx_lsdcb_kfslxrdh,yx_lsdcb.jzs as yx_lsdcb_jzs,yx_lsdcb.xss as yx_lsdcb_xss,yx_lsdcb.sldh as yx_lsdcb_sldh,yx_lsdcb.ywzxgs as yx_lsdcb_ywzxgs,yx_lsdcb.zxgssl as yx_lsdcb_zxgssl,yx_lsdcb.yzxhs as yx_lsdcb_yzxhs,yx_lsdcb.sftizxq as yx_lsdcb_sftizxq,yx_lsdcb.yjzxsj as yx_lsdcb_yjzxsj,yx_lsdcb.ywwygs as yx_lsdcb_ywwygs,yx_lsdcb.wygsmc as yx_lsdcb_wygsmc,yx_lsdcb.wyfzr as yx_lsdcb_wyfzr,yx_lsdcb.wydh as yx_lsdcb_wydh,yx_lsdcb.wylxr as yx_lsdcb_wylxr,yx_lsdcb.wylxrzw as yx_lsdcb_wylxrzw,yx_lsdcb.kfjd as yx_lsdcb_kfjd,yx_lsdcb.lrr as yx_lsdcb_lrr,yx_lsdcb.lrsj as yx_lsdcb_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc ";
	ls_sql+=" from  sq_dwxx,yx_lsdcb";
	ls_sql+=" where yx_lsdcb.fgsbh=sq_dwxx.dwbh and  (yx_lsdcb.xqbh="+xqbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yx_lsdcb_xqbh=cf.fillNull(rs.getString("yx_lsdcb_xqbh"));
		yx_lsdcb_xqmc=cf.fillNull(rs.getString("yx_lsdcb_xqmc"));
		yx_lsdcb_dqbm=cf.fillNull(rs.getString("yx_lsdcb_dqbm"));
		yx_lsdcb_cqbm=cf.fillNull(rs.getString("yx_lsdcb_cqbm"));
		yx_lsdcb_dz=cf.fillNull(rs.getString("yx_lsdcb_dz"));
		yx_lsdcb_cclx=cf.fillNull(rs.getString("yx_lsdcb_cclx"));
		yx_lsdcb_tjdm=cf.fillNull(rs.getString("yx_lsdcb_tjdm"));
		yx_lsdcb_jw=cf.fillNull(rs.getString("yx_lsdcb_jw"));
		yx_lsdcb_yzxfsp=cf.fillNull(rs.getString("yx_lsdcb_yzxfsp"));
		yx_lsdcb_xz=cf.fillNull(rs.getString("yx_lsdcb_xz"));
		yx_lsdcb_wyxs=cf.fillNull(rs.getString("yx_lsdcb_wyxs"));
		yx_lsdcb_xqgm=cf.fillNull(rs.getString("yx_lsdcb_xqgm"));
		yx_lsdcb_hxzl=cf.fillNull(rs.getString("yx_lsdcb_hxzl"));
		yx_lsdcb_zlhx=cf.fillNull(rs.getString("yx_lsdcb_zlhx"));
		yx_lsdcb_zlhxmj=cf.fillNull(rs.getString("yx_lsdcb_zlhxmj"));
		yx_lsdcb_ywy=cf.fillNull(rs.getString("yx_lsdcb_ywy"));
		yx_lsdcb_dysfwc=cf.fillNull(rs.getString("yx_lsdcb_dysfwc"));
		yx_lsdcb_xqfzr=cf.fillNull(rs.getString("yx_lsdcb_xqfzr"));
		yx_lsdcb_xqfzrdh=cf.fillNull(rs.getString("yx_lsdcb_xqfzrdh"));
		yx_lsdcb_xqzhpj=cf.fillNull(rs.getString("yx_lsdcb_xqzhpj"));
		yx_lsdcb_lxsj=cf.fillNull(rs.getDate("yx_lsdcb_lxsj"));
		yx_lsdcb_xsfs=cf.fillNull(rs.getString("yx_lsdcb_xsfs"));
		yx_lsdcb_fyssj=cf.fillNull(rs.getDate("yx_lsdcb_fyssj"));
		yx_lsdcb_jfhs=cf.fillNull(rs.getString("yx_lsdcb_jfhs"));
		yx_lsdcb_sfytg=cf.fillNull(rs.getString("yx_lsdcb_sfytg"));
		yx_lsdcb_xszk=cf.fillNull(rs.getString("yx_lsdcb_xszk"));
		yx_lsdcb_khzlgmqk=cf.fillNull(rs.getString("yx_lsdcb_khzlgmqk"));
		yx_lsdcb_khmd=cf.fillNull(rs.getString("yx_lsdcb_khmd"));
		yx_lsdcb_ykfsgx=cf.fillNull(rs.getString("yx_lsdcb_ykfsgx"));
		yx_lsdcb_sfjcxc=cf.fillNull(rs.getString("yx_lsdcb_sfjcxc"));
		yx_lsdcb_khzyl=cf.fillNull(rs.getString("yx_lsdcb_khzyl"));
		yx_lsdcb_yxxcfs=cf.fillNull(rs.getString("yx_lsdcb_yxxcfs"));
		yx_lsdcb_kfjy=cf.fillNull(rs.getString("yx_lsdcb_kfjy"));
		yx_lsdcb_kfs=cf.fillNull(rs.getString("yx_lsdcb_kfs"));
		yx_lsdcb_kfslxr=cf.fillNull(rs.getString("yx_lsdcb_kfslxr"));
		yx_lsdcb_kfslxrzw=cf.fillNull(rs.getString("yx_lsdcb_kfslxrzw"));
		yx_lsdcb_kfslxrdh=cf.fillNull(rs.getString("yx_lsdcb_kfslxrdh"));
		yx_lsdcb_jzs=cf.fillNull(rs.getString("yx_lsdcb_jzs"));
		yx_lsdcb_xss=cf.fillNull(rs.getString("yx_lsdcb_xss"));
		yx_lsdcb_sldh=cf.fillNull(rs.getString("yx_lsdcb_sldh"));
		yx_lsdcb_ywzxgs=cf.fillNull(rs.getString("yx_lsdcb_ywzxgs"));
		yx_lsdcb_zxgssl=cf.fillNull(rs.getString("yx_lsdcb_zxgssl"));
		yx_lsdcb_yzxhs=cf.fillNull(rs.getString("yx_lsdcb_yzxhs"));
		yx_lsdcb_sftizxq=cf.fillNull(rs.getString("yx_lsdcb_sftizxq"));
		yx_lsdcb_yjzxsj=cf.fillNull(rs.getDate("yx_lsdcb_yjzxsj"));
		yx_lsdcb_ywwygs=cf.fillNull(rs.getString("yx_lsdcb_ywwygs"));
		yx_lsdcb_wygsmc=cf.fillNull(rs.getString("yx_lsdcb_wygsmc"));
		yx_lsdcb_wyfzr=cf.fillNull(rs.getString("yx_lsdcb_wyfzr"));
		yx_lsdcb_wydh=cf.fillNull(rs.getString("yx_lsdcb_wydh"));
		yx_lsdcb_wylxr=cf.fillNull(rs.getString("yx_lsdcb_wylxr"));
		yx_lsdcb_wylxrzw=cf.fillNull(rs.getString("yx_lsdcb_wylxrzw"));
		yx_lsdcb_kfjd=cf.fillNull(rs.getString("yx_lsdcb_kfjd"));
		yx_lsdcb_lrr=cf.fillNull(rs.getString("yx_lsdcb_lrr"));
		yx_lsdcb_lrsj=cf.fillNull(rs.getDate("yx_lsdcb_lrsj"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
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
<div align="center"> 查看信息</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    小区编号  </td>
  <td width="32%"> 
    <%=yx_lsdcb_xqbh%>
  </td>
  <td align="right" width="18%"> 
    小区名称  </td>
  <td width="32%"> 
    <%=yx_lsdcb_xqmc%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    地区  </td>
  <td width="32%"> 
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",yx_lsdcb_dqbm,true);
%>
  </td>
  <td align="right" width="18%"> 
    城区  </td>
  <td width="32%"> 
<%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",yx_lsdcb_cqbm,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    地址  </td>
  <td width="32%"> 
    <%=yx_lsdcb_dz%>
  </td>
  <td align="right" width="18%"> 
    周边环境及乘车路线  </td>
  <td width="32%"> 
    <%=yx_lsdcb_cclx%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    推荐店面  </td>
  <td width="32%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh",yx_lsdcb_tjdm,true);
%>
  </td>
  <td align="right" width="18%"> 
    价位  </td>
  <td width="32%"> 
    <%=yx_lsdcb_jw%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    楼盘定位  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "高档+高档&中高档+中高档&中档+中档&低档+低档",yx_lsdcb_yzxfsp,true);
%>
  </td>
  <td align="right" width="18%"> 
    楼盘性质  </td>
  <td width="32%"> 
<%
	cf.selectToken(out,"商品房+商品房&经济适用房+经济适用房&集资房+集资房&回迁房+回迁房&商住两用房+商住两用房&别墅+别墅",yx_lsdcb_xz,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    物业形式  </td>
  <td width="32%"> 
    <%=yx_lsdcb_wyxs%>
  </td>
  <td align="right" width="18%"> 
    小区规模  </td>
  <td width="32%"> 
    <%=yx_lsdcb_xqgm%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    户型种类  </td>
  <td width="32%"> 
    <%=yx_lsdcb_hxzl%>
  </td>
  <td align="right" width="18%"> 
    主力户型  </td>
  <td width="32%"> 
    <%=yx_lsdcb_zlhx%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    主力户型面积  </td>
  <td width="32%"> 
    <%=yx_lsdcb_zlhxmj%>
  </td>
  <td align="right" width="18%"> 
    业务员  </td>
  <td width="32%"> 
    <%=yx_lsdcb_ywy%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    小区调研是否完成  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "N+未完成&Y+完成",yx_lsdcb_dysfwc,true);
%>
  </td>
  <td align="right" width="18%"> 
    小区负责人  </td>
  <td width="32%"> 
    <%=yx_lsdcb_xqfzr%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    小区负责人电话  </td>
  <td width="32%"> 
    <%=yx_lsdcb_xqfzrdh%>
  </td>
  <td align="right" width="18%"> 
    小区综合评价  </td>
  <td width="32%"> 
    <%=yx_lsdcb_xqzhpj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    开盘时间  </td>
  <td width="32%"> 
    <%=yx_lsdcb_lxsj%>
  </td>
  <td align="right" width="18%"> 
    销售方式  </td>
  <td width="32%"> 
    <%=yx_lsdcb_xsfs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    交钥匙时间  </td>
  <td width="32%"> 
    <%=yx_lsdcb_fyssj%>
  </td>
  <td align="right" width="18%"> 
    交房户数  </td>
  <td width="32%"> 
    <%=yx_lsdcb_jfhs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    是否有团购  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "Y+有&N+无",yx_lsdcb_sfytg,true);
%>
  </td>
  <td align="right" width="18%"> 
    销售状况  </td>
  <td width="32%"> 
    <%=yx_lsdcb_xszk%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    客户资料购买情况  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "公司购买+公司购买&员工购买+员工购买",yx_lsdcb_khzlgmqk,true);
%>
  </td>
  <td align="right" width="18%"> 
    客户名单  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "一手+一手&二手+二手&专业名单+专业名单",yx_lsdcb_khmd,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    与开发商关系  </td>
  <td width="32%"> 
    <%=yx_lsdcb_ykfsgx%>
  </td>
  <td align="right" width="18%"> 
    是否进场宣传  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "Y+是&N+否",yx_lsdcb_sfjcxc,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    客户占有率  </td>
  <td width="32%"> 
    <%=yx_lsdcb_khzyl%>
  </td>
  <td align="right" width="18%"> 
    允许宣传方式  </td>
  <td width="32%"> 
    <%=yx_lsdcb_yxxcfs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    开发建议及进驻计划  </td>
  <td width="32%"> 
    <%=yx_lsdcb_kfjy%>
  </td>
  <td align="right" width="18%"> 
    开发商  </td>
  <td width="32%"> 
    <%=yx_lsdcb_kfs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    开发商联系人  </td>
  <td width="32%"> 
    <%=yx_lsdcb_kfslxr%>
  </td>
  <td align="right" width="18%"> 
    开发商联系人职务  </td>
  <td width="32%"> 
    <%=yx_lsdcb_kfslxrzw%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    开发商联系人电话  </td>
  <td width="32%"> 
    <%=yx_lsdcb_kfslxrdh%>
  </td>
  <td align="right" width="18%"> 
    建筑商  </td>
  <td width="32%"> 
    <%=yx_lsdcb_jzs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    销售商  </td>
  <td width="32%"> 
    <%=yx_lsdcb_xss%>
  </td>
  <td align="right" width="18%"> 
    售楼电话  </td>
  <td width="32%"> 
    <%=yx_lsdcb_sldh%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    有无装修公司  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "Y+有&N+无",yx_lsdcb_ywzxgs,true);
%>
  </td>
  <td align="right" width="18%"> 
    装修公司数量  </td>
  <td width="32%"> 
    <%=yx_lsdcb_zxgssl%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    已装修户数  </td>
  <td width="32%"> 
    <%=yx_lsdcb_yzxhs%>
  </td>
  <td align="right" width="18%"> 
    是否统一装修期  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "Y+是&N+否",yx_lsdcb_sftizxq,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    预计装修时间  </td>
  <td width="32%"> 
    <%=yx_lsdcb_yjzxsj%>
  </td>
  <td align="right" width="18%"> 
    有无物业公司  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "Y+有&N+无",yx_lsdcb_ywwygs,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    物业公司名称  </td>
  <td width="32%"> 
    <%=yx_lsdcb_wygsmc%>
  </td>
  <td align="right" width="18%"> 
    物业负责人  </td>
  <td width="32%"> 
    <%=yx_lsdcb_wyfzr%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    物业电话  </td>
  <td width="32%"> 
    <%=yx_lsdcb_wydh%>
  </td>
  <td align="right" width="18%"> 
    物业联系人  </td>
  <td width="32%"> 
    <%=yx_lsdcb_wylxr%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    物业联系人职务  </td>
  <td width="32%"> 
    <%=yx_lsdcb_wylxrzw%>
  </td>
  <td align="right" width="18%"> 
    开发进度  </td>
  <td width="32%"> 
<%
	cf.selectToken(out,"1+未开发&2+已申请&3+已批准&4+未批准&5+已完成",yx_lsdcb_kfjd,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    录入人  </td>
  <td width="32%"> 
    <%=yx_lsdcb_lrr%>
  </td>
  <td align="right" width="18%"> 
    录入时间  </td>
  <td width="32%"> 
    <%=yx_lsdcb_lrsj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    分公司  </td>
  <td width="32%"> 
    <%=sq_dwxx_dwmc%>
  </td>
  <td align="right" width="18%">&nbsp;  </td>
  <td width="32%">&nbsp;  </td>
</tr>
</table>
<P>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">团购单位</td>
	<td  width="8%">单位地址</td>
	<td  width="8%">单位电话</td>
	<td  width="8%">单位联系人</td>
	<td  width="8%">团购楼号</td>
	<td  width="8%">团购套数</td>
	<td  width="8%">录入人</td>
	<td  width="8%">录入时间</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql="SELECT ffdw,dwdz,dwdh,lxr,tglh,tgts,lrr,lrsj  ";
	ls_sql+=" FROM yx_lptgqk  ";
    ls_sql+=" where xqbh='"+xqbh+"'";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
 	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>
<P>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">竞争对手名称</td>
	<td  width="8%">广告投放形式</td>
	<td  width="8%">宣传卖点</td>
	<td  width="8%">广告投入金额</td>
	<td  width="8%">人力投入</td>
	<td  width="8%">客户掌握情况</td>
	<td  width="8%">占有率</td>
	<td  width="8%">与开发商关系</td>
	<td  width="8%">录入人</td>
	<td  width="8%">录入时间</td>
</tr>
<%
	ls_sql="SELECT jzdsmc,ggtfxs,xcmd,ggtrje,rltr,khzwqk,zyl,ykfsgx,lrr,lrsj  ";
	ls_sql+=" FROM yx_lpjzdsqk  ";
    ls_sql+=" where xqbh='"+xqbh+"'";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
 	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>
<P>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">广告投放形式</td>
	<td  width="9%">投放时间</td>
	<td  width="9%">广告费用</td>
	<td  width="9%">宣传卖点</td>
	<td  width="9%">宣传效果</td>
	<td  width="9%">录入人</td>
	<td  width="9%">录入时间</td>
</tr>
<%
	ls_sql="SELECT ggtfxs,tfsj,ggfy,xcmd,xcxg,lrr,lrsj  ";
	ls_sql+=" FROM yx_lpggxcqk  ";
    ls_sql+=" where xqbh='"+xqbh+"'";
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
