<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kp_xjgdjl_xjjlh=null;
String kp_xjgdjl_khbh=null;
String kp_xjgdjl_xjr=null;
String kp_xjgdjl_xjsj=null;
String kp_xjgdjl_xjlxbm=null;
String dm_xjjgbm_xjjgmc=null;
String kp_xjgdjl_lrr=null;
String kp_xjgdjl_lrsj=null;
String kp_xjgdjl_bz=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_qyrq=null;
String crm_khxx_dwbh=null;
String sgd=null;
String crm_khxx_zjxm=null;
String cfspbz=null;
String spyj=null;
String spr=null;
String spsj=null;
String kpbz=null;
String kpjlh=null;
String jsbz=null;
String jsjlh=null;
double fkze=0;
double kfzs=0;
double kcjdebl=0;
double jlje=0;
String lrdw=null;
String xjjlh=null;
xjjlh=cf.GB2Uni(request.getParameter("xjjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select kp_xjgdjl.jlje,dm_xjjgbm.xjjgmc as dm_xjjgbm_xjjgmc,lrdw,fkze,kfzs,kcjdebl,jsbz,jsjlh,kp_xjgdjl.spsj,kp_xjgdjl.spr,kp_xjgdjl.spyj,kp_xjgdjl.kpjlh,kp_xjgdjl.cfspbz,kp_xjgdjl.kpbz,kp_xjgdjl.xjjlh as kp_xjgdjl_xjjlh,kp_xjgdjl.khbh as kp_xjgdjl_khbh,kp_xjgdjl.xjr as kp_xjgdjl_xjr,kp_xjgdjl.xjsj as kp_xjgdjl_xjsj,kp_xjgdjl.xjlxbm as kp_xjgdjl_xjlxbm,kp_xjgdjl.lrr as kp_xjgdjl_lrr,kp_xjgdjl.lrsj as kp_xjgdjl_lrsj,kp_xjgdjl.bz as kp_xjgdjl_bz,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.dwbh as crm_khxx_dwbh,kp_xjgdjl.sgd,crm_khxx.zjxm as crm_khxx_zjxm ";
	ls_sql+=" from  crm_khxx,kp_xjgdjl,dm_xjjgbm";
	ls_sql+=" where kp_xjgdjl.khbh=crm_khxx.khbh and  (kp_xjgdjl.xjjlh='"+xjjlh+"')  ";
	ls_sql+=" and kp_xjgdjl.xjjgbm=dm_xjjgbm.xjjgbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jlje=rs.getDouble("jlje");
		dm_xjjgbm_xjjgmc=cf.fillNull(rs.getString("dm_xjjgbm_xjjgmc"));
		lrdw=cf.fillNull(rs.getString("lrdw"));
		fkze=rs.getDouble("fkze");
		kfzs=rs.getDouble("kfzs");
		kcjdebl=rs.getDouble("kcjdebl");
		jsbz=cf.fillNull(rs.getString("jsbz"));
		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spr=cf.fillNull(rs.getString("spr"));
		spyj=cf.fillNull(rs.getString("spyj"));
		kpjlh=cf.fillNull(rs.getString("kpjlh"));
		cfspbz=cf.fillNull(rs.getString("cfspbz"));
		kpbz=cf.fillNull(rs.getString("kpbz"));
		kp_xjgdjl_xjjlh=cf.fillNull(rs.getString("kp_xjgdjl_xjjlh"));
		kp_xjgdjl_khbh=cf.fillNull(rs.getString("kp_xjgdjl_khbh"));
		kp_xjgdjl_xjr=cf.fillNull(rs.getString("kp_xjgdjl_xjr"));
		kp_xjgdjl_xjsj=cf.fillNull(rs.getDate("kp_xjgdjl_xjsj"));
		kp_xjgdjl_xjlxbm=cf.fillNull(rs.getString("kp_xjgdjl_xjlxbm"));
		kp_xjgdjl_lrr=cf.fillNull(rs.getString("kp_xjgdjl_lrr"));
		kp_xjgdjl_lrsj=cf.fillNull(rs.getDate("kp_xjgdjl_lrsj"));
		kp_xjgdjl_bz=cf.fillNull(rs.getString("kp_xjgdjl_bz"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
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
<div align="center">检查工地记录（检查记录号：<%=kp_xjgdjl_xjjlh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">客户姓名</td>
    <td width="32%"><%=crm_khxx_khxm%></td>
    <td width="18%" align="right">合同号</td>
    <td width="32%"><%=crm_khxx_hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">房屋地址</td>
    <td><%=crm_khxx_fwdz%></td>
    <td align="right">设计师 </td>
    <td><%=crm_khxx_sjs%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      施工队    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
    <td width="18%" align="right"> 
      质检    </td>
    <td width="32%"> <%=crm_khxx_zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      签约日期    </td>
    <td width="32%"> <%=crm_khxx_qyrq%> </td>
    <td width="18%" align="right"> 
      签约店面    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_khxx_dwbh+"'",crm_khxx_dwbh,true);
%> </td>
  </tr>
  <tr align="right" bgcolor="#FFFFFF"> 
    <td colspan="4">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      检查类型    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select xjlxbm,xjlxmc from kp_xjlxbm order by xjlxbm",kp_xjgdjl_xjlxbm,true);
%> </td>
    <td width="18%" align="right"> 
      检查结果    </td>
    <td width="32%"><%=dm_xjjgbm_xjjgmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">罚款总额</td>
    <td><%=fkze%></td>
    <td align="right">扣分总数</td>
    <td><%=kfzs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right">扣除接单额百分比</td>
    <td width="32%"><%=kcjdebl%>%</td>
    <td width="18%" align="right">奖励金额</td>
    <td width="32%"><%=jlje%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      检查人    </td>
    <td width="32%"> <%=kp_xjgdjl_xjr%> </td>
    <td width="18%" align="right"> 
      检查时间    </td>
    <td width="32%"> <%=kp_xjgdjl_xjsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      录入人    </td>
    <td width="32%"> <%=kp_xjgdjl_lrr%> </td>
    <td width="18%" align="right"> 
      录入时间    </td>
    <td width="32%"> <%=kp_xjgdjl_lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">审批标志</td>
    <td width="32%"><%
	cf.selectToken(out,"1+不需审批&2+未审批&3+审批通过&4+审批未通过",cfspbz,true);
%></td>
    <td width="18%" align="right">录入部门</td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'",lrdw,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">审批意见</td>
    <td colspan="3"><%=spyj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">审批人</td>
    <td width="32%"><%=spr%></td>
    <td width="18%" align="right">审批时间</td>
    <td width="32%"><%=spsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">考评标志</td>
    <td width="32%"><%
	cf.selectToken(out,"N+未考评&Y+已考评",kpbz,true);
%></td>
    <td width="18%" align="right">考评记录号</td>
    <td width="32%"><%=kpjlh%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">结算标志</td>
    <td width="32%"><%
	cf.selectToken(out,"N+未结算&Y+已结算",jsbz,true);
%></td>
    <td width="18%" align="right">结算记录号</td>
    <td width="32%"><%=jsjlh%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">备注</td>
    <td colspan="3"><%=kp_xjgdjl_bz%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="13%">项目大类</td>
	<td  width="15%">检查项目</td>
	<td  width="8%">违规分级</td>
	<td  width="7%">单次扣分</td>
	<td  width="8%">单次罚款</td>
	<td  width="7%">扣除接单额百分比</td>
	<td  width="14%">其它处罚</td>
	<td  width="7%">违章次数</td>
	<td  width="21%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql="SELECT kp_kpdlbm.kpdlmc,kp_gckpxm.kpxmmc,ydcdmc,kp_xjgdmx.kf,kp_xjgdmx.sgdfk,kp_xjgdmx.kcjdebl||'%',kp_kpcfbm.kpcfmc as kp_kpcfbm_kpcfmc,wzcs,kp_xjgdmx.bz  ";
	ls_sql+=" FROM kp_xjgdmx,kp_gckpxm,kp_kpdlbm,kp_kpcfbm,kp_sgdyzcdbm  ";
    ls_sql+=" where kp_xjgdmx.kpxmbm=kp_gckpxm.kpxmbm and kp_xjgdmx.kpjg=kp_gckpxm.kpjg and kp_gckpxm.kpdlbm=kp_kpdlbm.kpdlbm";
    ls_sql+=" and kp_xjgdmx.kpcfbm=kp_kpcfbm.kpcfbm(+) ";
    ls_sql+=" and kp_xjgdmx.kpjg=kp_sgdyzcdbm.yzcdbm(+) and kp_xjgdmx.xjjlh='"+xjjlh+"'";
    ls_sql+=" order by kp_gckpxm.kpdlbm,kp_xjgdmx.kpxmbm,kp_xjgdmx.kpjg";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("kp_kpdlbm_kpdlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="25%"><div align="center"><font color="#000099">文件名称</font></td>
    <td width="60%"><div align="center"><font color="#000099">照片</font></td>
  </tr>
  <%

	String yszpmc=null;
	ls_sql="SELECT xjzpmc";
	ls_sql+=" FROM kp_xjgdjlzp";
	ls_sql+=" where  xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yszpmc=rs.getString(1);

		%>
      <tr bgcolor="#FFFFFF"> 
		  <td width="25%"> 
			<div align="center"><%=yszpmc%>
		  </td>
		  <td width="60%"> 
			<div align="center"><img src="/sgdgl/xjgd/images/<%=yszpmc.toUpperCase() %>" width="300">
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
