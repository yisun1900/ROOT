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
String txry=null;
String sq_dwxx_dwmc=null;
String crm_zxhfjl_zxdm=null;
String crm_zxhfjl_sjs=null;
String cxgtbz=null;
String cxgtsj=null;
String csgtbz=null;
String csgtsj=null;
String zxkhyxbm=null;
String yylfsj=null;
String xclfsj=null;
String sjsgtnl=null;


String hfjlh=null;
hfjlh=cf.GB2Uni(request.getParameter("hfjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_zxhfjl.sjsgtnl,crm_zxhfjl.zxkhyxbm,crm_zxhfjl.yylfsj,crm_zxhfjl.xclfsj,crm_zxhfjl.khbh as crm_zxhfjl_khbh,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,crm_zxhfjl.hfjlh as crm_zxhfjl_hfjlh,crm_zxhfjl.khhfqk as crm_zxhfjl_khhfqk,crm_zxhfjl.lfbz as crm_zxhfjl_lfbz,crm_zxhfjl.lfsj as crm_zxhfjl_lfsj,crm_zxhfjl.ctbz as crm_zxhfjl_ctbz,crm_zxhfjl.ctsj as crm_zxhfjl_ctsj,crm_zxhfjl.yqghdm as crm_zxhfjl_yqghdm,crm_zxhfjl.yqghsjs as crm_zxhfjl_yqghsjs,crm_zxhfjl.sjszysp as crm_zxhfjl_sjszysp,crm_zxhfjl.sjsfw as crm_zxhfjl_sjsfw,crm_zxhfjl.qtryfw as crm_zxhfjl_qtryfw,crm_zxhfjl.gcbj as crm_zxhfjl_gcbj,crm_zxhfjl.gsztyx as crm_zxhfjl_gsztyx,crm_zxhfjl.xwgjfm as crm_zxhfjl_xwgjfm,crm_zxhfjl.sfjxhf as crm_zxhfjl_sfjxhf,crm_zxhfjl.xchfrq as crm_zxhfjl_xchfrq,crm_zxhfjl.hfsj as crm_zxhfjl_hfsj,crm_zxhfjl.hfr as crm_zxhfjl_hfr,crm_zxhfjl.clfs as crm_zxhfjl_clfs,crm_zxhfjl.txry,sq_dwxx.dwmc as sq_dwxx_dwmc,crm_zxhfjl.zxdm as crm_zxhfjl_zxdm,crm_zxhfjl.sjs as crm_zxhfjl_sjs ";
	ls_sql+=" ,crm_zxhfjl.cxgtbz,crm_zxhfjl.cxgtsj,crm_zxhfjl.csgtbz,crm_zxhfjl.csgtsj";
	ls_sql+=" from  crm_zxhfjl,crm_zxkhxx,sq_dwxx";
	ls_sql+=" where crm_zxhfjl.hfbm=sq_dwxx.dwbh and crm_zxhfjl.khbh=crm_zxkhxx.khbh and  (crm_zxhfjl.hfjlh='"+hfjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsgtnl=cf.fillNull(rs.getString("sjsgtnl"));
		zxkhyxbm=cf.fillNull(rs.getString("zxkhyxbm"));
		yylfsj=cf.fillNull(rs.getDate("yylfsj"));
		xclfsj=cf.fillNull(rs.getDate("xclfsj"));
		cxgtbz=cf.fillNull(rs.getString("cxgtbz"));
		cxgtsj=cf.fillNull(rs.getDate("cxgtsj"));
		csgtbz=cf.fillNull(rs.getString("csgtbz"));
		csgtsj=cf.fillNull(rs.getDate("csgtsj"));

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
		txry=cf.fillNull(rs.getString("txry"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
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
  <tr bgcolor="#E8E8FF"> 
    <td align="right" width="18%"> 客户编号 </td>
    <td width="32%"> <%=crm_zxhfjl_khbh%> </td>
    <td align="right" width="19%"> 客户姓名 </td>
    <td width="31%"> <%=crm_zxkhxx_khxm%> </td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td align="right" width="18%"> 房屋地址 </td>
    <td width="32%"> <%=crm_zxkhxx_fwdz%> </td>
    <td align="right" width="19%"> 联系方式 </td>
    <td width="31%"> <%=crm_zxkhxx_lxfs%> </td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td align="right" width="18%">咨询店面</td>
    <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_zxhfjl_zxdm+"'",crm_zxhfjl_zxdm,true);
%></td>
    <td align="right" width="19%">设计师</td>
    <td width="31%"><%=crm_zxhfjl_sjs%></td>
  </tr>
  <tr bgcolor="#E8E8FF">
    <td colspan="4" align="center">客户跟单进度</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 量房标志 </td>
    <td width="32%"> <%
	cf.radioToken(out, "N+未量房&Y+已量房",crm_zxhfjl_lfbz,true);
%> </td>
    <td width="19%" align="right"> 量房时间 </td>
    <td width="31%"> <%=crm_zxhfjl_lfsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 出平面图标志 </td>
    <td width="32%"> <%
	cf.radioToken(out, "N+未出图&Y+已出图",crm_zxhfjl_ctbz,true);
%> </td>
    <td width="19%" align="right"> 出平面图时间 </td>
    <td width="31%"> <%=crm_zxhfjl_ctsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">出效果图标志</td>
    <td><%
	cf.selectToken(out,"N+未出图&Y+已出图",cxgtbz,true);
%></td>
    <td align="right">出效果图时间</td>
    <td><%=cxgtsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">出施工图标志</td>
    <td><%
	cf.selectToken(out,"N+未出图&Y+已出图",csgtbz,true);
%></td>
    <td align="right">出施工图时间</td>
    <td><%=csgtsj%></td>
  </tr>
  <tr bgcolor="#E8E8FF">
    <td colspan="4" align="center">回访指标</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 设计方案是否满意</td>
    <td width="32%"> <%
	cf.selectItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm order by hfxmbm ",crm_zxhfjl_sjszysp,true);
%> </td>
    <td width="19%" align="right">设计师沟通能力</td>
    <td width="31%"><%
	cf.selectItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm order by hfxmbm ",sjsgtnl,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">设计师服务</td>
    <td><%
	cf.selectItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm order by hfxmbm ",crm_zxhfjl_sjsfw,true);
%></td>
    <td align="right">工程报价</td>
    <td><%
	cf.selectItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm order by hfxmbm  ",crm_zxhfjl_gcbj,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 其它人员服务 </td>
    <td width="32%"> <%
	cf.selectItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm order by hfxmbm ",crm_zxhfjl_qtryfw,true);
%> </td>
    <td width="19%" align="right">公司总体印象</td>
    <td width="31%"><%
	cf.selectItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm order by hfxmbm ",crm_zxhfjl_gsztyx,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">希望改进方面 </td>
    <td colspan="3"><%
	cf.selectItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm order by hfxmbm ",crm_zxhfjl_xwgjfm,true);
%></td>
  </tr>
  <tr bgcolor="#E8E8FF">
    <td colspan="4" align="center">回访结果</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">回访意向</td>
    <td>
        <%
		cf.selectItem(out,"select zxkhyxbm,zxkhyxmc from dm_zxkhyxbm where zxkhyxbm='"+zxkhyxbm+"'",zxkhyxbm,true);
%>
    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">预约量房时间</td>
    <td><%=yylfsj%></td>
    <td align="right">预约到店时间</td>
    <td><%=xclfsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 是否继续回访 </td>
    <td width="32%"> <%
	cf.radioToken(out, "Y+继续回访&N+回访结束",crm_zxhfjl_sfjxhf,true);
%> </td>
    <td width="19%" align="right"> 下次回访日期 </td>
    <td width="31%"> <%=crm_zxhfjl_xchfrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 要求更换店面 </td>
    <td><%
	cf.radioToken(out, "N+不要求&Y+要求更换",crm_zxhfjl_yqghdm,true);
%>    </td>
    <td align="right"> 要求更换设计师 </td>
    <td><%
	cf.radioToken(out, "N+不要求&Y+要求更换",crm_zxhfjl_yqghsjs,true);
%>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 是否提醒责任人 </td>
    <td><%
	cf.radioToken(out, "0+不提醒&1+提醒店面&2+提醒设计师",crm_zxhfjl_clfs,true);
%>    </td>
    <td align="right"> 提醒人员 </td>
    <td><%=txry%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">客户回访情况</td>
    <td colspan="3"><%=crm_zxhfjl_khhfqk%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 回访时间 </td>
    <td width="32%"> <%=crm_zxhfjl_hfsj%> </td>
    <td width="19%" align="right"> 回访人 </td>
    <td width="31%"> <%=crm_zxhfjl_hfr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 回访部门 </td>
    <td width="32%"> <%=sq_dwxx_dwmc%> </td>
    <td width="19%" align="right">&nbsp; </td>
    <td width="31%">&nbsp; </td>
  </tr>
</table>

<table border="1" bgcolor="#E8E8FF" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="4%">编号</td>
	<td  width="6%">名称</td>
	<td  width="5%">方式</td>
	<td  width="7%">提醒类型</td>
	<td  width="7%">提醒关键字</td>
	<td  width="44%">提醒内容</td>
	<td  width="5%">状态</td>
	<td  width="7%">查看时间</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT xh,ygbh,yhmc,DECODE(txfs,'1','系统','2','电话','3','传真','4','短信','9','全部'),DECODE(txlx,'01','咨询回访','02','在施工程回访','03','投诉报修回访','04','投诉报修'),txgjz,txnr,DECODE(ckzt,'1','未查看','2','查看'),cksj,lrr,lrsj";
	ls_sql+=" FROM sq_txxxb ";
    ls_sql+=" where txfs='1' and txlx='01' and txgjz='"+hfjlh.trim()+"'";
	ls_sql+=" order by xh";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);
	pageObj.alignStr[6]="align='left'";
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

</table>

</body>
</html>
