<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cw_chsgdjs_jsjlh=null;
String cw_chsgdjs_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String cw_chsgdjs_sgd=null;
String cw_chsgdjs_sgbz=null;
String cw_chsgdjs_jsrq=null;
String cw_chsgdjs_qye=null;
String cw_chsgdjs_zjxje=null;
String cw_chsgdjs_zxje=null;
String cw_chsgdjs_jxje=null;
String cw_chsgdjs_htsgcb=null;
String cw_chsgdjs_zjxsgcb=null;
String cw_chsgdjs_zjcbglfbl=null;
String cw_chsgdjs_zjcbglf=null;
String cw_chsgdjs_sdlzxje=null;
String cw_chsgdjs_sdlcbfbl=null;
String cw_chsgdjs_sldzjcb=null;
String cw_chsgdjs_htwzjje=null;
String cw_chsgdjs_htwzjcbbl=null;
String cw_chsgdjs_htwzjcb=null;
String cw_chsgdjs_sgcb=null;
String cw_chsgdjs_sgcbclf=null;
String cw_chsgdjs_sgcbrgf=null;
String cw_chsgdjs_sssjf=null;
String cw_chsgdjs_sjfbl=null;
String cw_chsgdjs_sjftc=null;
String cw_chsgdjs_fwmj=null;
String cw_chsgdjs_kqzlf=null;
String cw_chsgdjs_bbjf=null;
String cw_chsgdjs_bqtf=null;
String cw_chsgdjs_bqtfsm=null;
String cw_chsgdjs_htnsdje=null;
String cw_chsgdjs_htnsdjebl=null;
String cw_chsgdjs_bsdcb=null;
String cw_chsgdjs_ycfje=null;
String cw_chsgdjs_ycfbl=null;
String cw_chsgdjs_bycf=null;
String cw_chsgdjs_cbhjje=null;
String cw_chsgdjs_kzbjbl=null;
String cw_chsgdjs_kzbj=null;
String cw_chsgdjs_kgcyz=null;
String cw_chsgdjs_kfxbzjbl=null;
String cw_chsgdjs_kfxbzj=null;
String cw_chsgdjs_xxfh=null;
String cw_chsgdjs_clcb=null;
String cw_chsgdjs_cldbbl=null;
String cw_chsgdjs_clbdbkk=null;
String cw_chsgdjs_kgjsje=null;
String cw_chsgdjs_kqtf=null;
String cw_chsgdjs_kqtfsm=null;
String cw_chsgdjs_kxcf=null;
String cw_chsgdjs_sjzfe=null;
String cw_chsgdjs_clzt=null;
String cw_chsgdjs_spr=null;
String cw_chsgdjs_spsj=null;
String cw_chsgdjs_spyj=null;
String cw_chsgdjs_lrr=null;
String cw_chsgdjs_lrsj=null;
String cw_chsgdjs_lrbm=null;
String cw_chsgdjs_bz=null;
String wherecw_chsgdjs_jsjlh=null;
wherecw_chsgdjs_jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select cw_chsgdjs.jsjlh as cw_chsgdjs_jsjlh,cw_chsgdjs.khbh as cw_chsgdjs_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,cw_chsgdjs.sgd as cw_chsgdjs_sgd,cw_chsgdjs.sgbz as cw_chsgdjs_sgbz,cw_chsgdjs.jsrq as cw_chsgdjs_jsrq,cw_chsgdjs.qye as cw_chsgdjs_qye,cw_chsgdjs.zjxje as cw_chsgdjs_zjxje,cw_chsgdjs.zxje as cw_chsgdjs_zxje,cw_chsgdjs.jxje as cw_chsgdjs_jxje,cw_chsgdjs.htsgcb as cw_chsgdjs_htsgcb,cw_chsgdjs.zjxsgcb as cw_chsgdjs_zjxsgcb,cw_chsgdjs.zjcbglfbl as cw_chsgdjs_zjcbglfbl,cw_chsgdjs.zjcbglf as cw_chsgdjs_zjcbglf,cw_chsgdjs.sdlzxje as cw_chsgdjs_sdlzxje,cw_chsgdjs.sdlcbfbl as cw_chsgdjs_sdlcbfbl,cw_chsgdjs.sldzjcb as cw_chsgdjs_sldzjcb,cw_chsgdjs.htwzjje as cw_chsgdjs_htwzjje,cw_chsgdjs.htwzjcbbl as cw_chsgdjs_htwzjcbbl,cw_chsgdjs.htwzjcb as cw_chsgdjs_htwzjcb,cw_chsgdjs.sgcb as cw_chsgdjs_sgcb,cw_chsgdjs.sgcbclf as cw_chsgdjs_sgcbclf,cw_chsgdjs.sgcbrgf as cw_chsgdjs_sgcbrgf,cw_chsgdjs.sssjf as cw_chsgdjs_sssjf,cw_chsgdjs.sjfbl as cw_chsgdjs_sjfbl,cw_chsgdjs.sjftc as cw_chsgdjs_sjftc,cw_chsgdjs.fwmj as cw_chsgdjs_fwmj,cw_chsgdjs.kqzlf as cw_chsgdjs_kqzlf,cw_chsgdjs.bbjf as cw_chsgdjs_bbjf,cw_chsgdjs.bqtf as cw_chsgdjs_bqtf,cw_chsgdjs.bqtfsm as cw_chsgdjs_bqtfsm,cw_chsgdjs.htnsdje as cw_chsgdjs_htnsdje,cw_chsgdjs.htnsdjebl as cw_chsgdjs_htnsdjebl,cw_chsgdjs.bsdcb as cw_chsgdjs_bsdcb,cw_chsgdjs.ycfje as cw_chsgdjs_ycfje,cw_chsgdjs.ycfbl as cw_chsgdjs_ycfbl,cw_chsgdjs.bycf as cw_chsgdjs_bycf,cw_chsgdjs.cbhjje as cw_chsgdjs_cbhjje,cw_chsgdjs.kzbjbl as cw_chsgdjs_kzbjbl,cw_chsgdjs.kzbj as cw_chsgdjs_kzbj,cw_chsgdjs.kgcyz as cw_chsgdjs_kgcyz,cw_chsgdjs.kfxbzjbl as cw_chsgdjs_kfxbzjbl,cw_chsgdjs.kfxbzj as cw_chsgdjs_kfxbzj,cw_chsgdjs.xxfh as cw_chsgdjs_xxfh,cw_chsgdjs.clcb as cw_chsgdjs_clcb,cw_chsgdjs.cldbbl as cw_chsgdjs_cldbbl,cw_chsgdjs.clbdbkk as cw_chsgdjs_clbdbkk,cw_chsgdjs.kgjsje as cw_chsgdjs_kgjsje,cw_chsgdjs.kqtf as cw_chsgdjs_kqtf,cw_chsgdjs.kqtfsm as cw_chsgdjs_kqtfsm,cw_chsgdjs.kxcf as cw_chsgdjs_kxcf,cw_chsgdjs.sjzfe as cw_chsgdjs_sjzfe,cw_chsgdjs.clzt as cw_chsgdjs_clzt,cw_chsgdjs.spr as cw_chsgdjs_spr,cw_chsgdjs.spsj as cw_chsgdjs_spsj,cw_chsgdjs.spyj as cw_chsgdjs_spyj,cw_chsgdjs.lrr as cw_chsgdjs_lrr,cw_chsgdjs.lrsj as cw_chsgdjs_lrsj,cw_chsgdjs.lrbm as cw_chsgdjs_lrbm,cw_chsgdjs.bz as cw_chsgdjs_bz ";
	ls_sql+=" from  crm_khxx,cw_chsgdjs";
	ls_sql+=" where cw_chsgdjs.khbh=crm_khxx.khbh(+) and  (cw_chsgdjs.jsjlh='"+wherecw_chsgdjs_jsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cw_chsgdjs_jsjlh=cf.fillNull(rs.getString("cw_chsgdjs_jsjlh"));
		cw_chsgdjs_khbh=cf.fillNull(rs.getString("cw_chsgdjs_khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		cw_chsgdjs_sgd=cf.fillNull(rs.getString("cw_chsgdjs_sgd"));
		cw_chsgdjs_sgbz=cf.fillNull(rs.getString("cw_chsgdjs_sgbz"));
		cw_chsgdjs_jsrq=cf.fillNull(rs.getDate("cw_chsgdjs_jsrq"));
		cw_chsgdjs_qye=cf.fillNull(rs.getString("cw_chsgdjs_qye"));
		cw_chsgdjs_zjxje=cf.fillNull(rs.getString("cw_chsgdjs_zjxje"));
		cw_chsgdjs_zxje=cf.fillNull(rs.getString("cw_chsgdjs_zxje"));
		cw_chsgdjs_jxje=cf.fillNull(rs.getString("cw_chsgdjs_jxje"));
		cw_chsgdjs_htsgcb=cf.fillNull(rs.getString("cw_chsgdjs_htsgcb"));
		cw_chsgdjs_zjxsgcb=cf.fillNull(rs.getString("cw_chsgdjs_zjxsgcb"));
		cw_chsgdjs_zjcbglfbl=cf.fillNull(rs.getString("cw_chsgdjs_zjcbglfbl"));
		cw_chsgdjs_zjcbglf=cf.fillNull(rs.getString("cw_chsgdjs_zjcbglf"));
		cw_chsgdjs_sdlzxje=cf.fillNull(rs.getString("cw_chsgdjs_sdlzxje"));
		cw_chsgdjs_sdlcbfbl=cf.fillNull(rs.getString("cw_chsgdjs_sdlcbfbl"));
		cw_chsgdjs_sldzjcb=cf.fillNull(rs.getString("cw_chsgdjs_sldzjcb"));
		cw_chsgdjs_htwzjje=cf.fillNull(rs.getString("cw_chsgdjs_htwzjje"));
		cw_chsgdjs_htwzjcbbl=cf.fillNull(rs.getString("cw_chsgdjs_htwzjcbbl"));
		cw_chsgdjs_htwzjcb=cf.fillNull(rs.getString("cw_chsgdjs_htwzjcb"));
		cw_chsgdjs_sgcb=cf.fillNull(rs.getString("cw_chsgdjs_sgcb"));
		cw_chsgdjs_sgcbclf=cf.fillNull(rs.getString("cw_chsgdjs_sgcbclf"));
		cw_chsgdjs_sgcbrgf=cf.fillNull(rs.getString("cw_chsgdjs_sgcbrgf"));
		cw_chsgdjs_sssjf=cf.fillNull(rs.getString("cw_chsgdjs_sssjf"));
		cw_chsgdjs_sjfbl=cf.fillNull(rs.getString("cw_chsgdjs_sjfbl"));
		cw_chsgdjs_sjftc=cf.fillNull(rs.getString("cw_chsgdjs_sjftc"));
		cw_chsgdjs_fwmj=cf.fillNull(rs.getString("cw_chsgdjs_fwmj"));
		cw_chsgdjs_kqzlf=cf.fillNull(rs.getString("cw_chsgdjs_kqzlf"));
		cw_chsgdjs_bbjf=cf.fillNull(rs.getString("cw_chsgdjs_bbjf"));
		cw_chsgdjs_bqtf=cf.fillNull(rs.getString("cw_chsgdjs_bqtf"));
		cw_chsgdjs_bqtfsm=cf.fillNull(rs.getString("cw_chsgdjs_bqtfsm"));
		cw_chsgdjs_htnsdje=cf.fillNull(rs.getString("cw_chsgdjs_htnsdje"));
		cw_chsgdjs_htnsdjebl=cf.fillNull(rs.getString("cw_chsgdjs_htnsdjebl"));
		cw_chsgdjs_bsdcb=cf.fillNull(rs.getString("cw_chsgdjs_bsdcb"));
		cw_chsgdjs_ycfje=cf.fillNull(rs.getString("cw_chsgdjs_ycfje"));
		cw_chsgdjs_ycfbl=cf.fillNull(rs.getString("cw_chsgdjs_ycfbl"));
		cw_chsgdjs_bycf=cf.fillNull(rs.getString("cw_chsgdjs_bycf"));
		cw_chsgdjs_cbhjje=cf.fillNull(rs.getString("cw_chsgdjs_cbhjje"));
		cw_chsgdjs_kzbjbl=cf.fillNull(rs.getString("cw_chsgdjs_kzbjbl"));
		cw_chsgdjs_kzbj=cf.fillNull(rs.getString("cw_chsgdjs_kzbj"));
		cw_chsgdjs_kgcyz=cf.fillNull(rs.getString("cw_chsgdjs_kgcyz"));
		cw_chsgdjs_kfxbzjbl=cf.fillNull(rs.getString("cw_chsgdjs_kfxbzjbl"));
		cw_chsgdjs_kfxbzj=cf.fillNull(rs.getString("cw_chsgdjs_kfxbzj"));
		cw_chsgdjs_xxfh=cf.fillNull(rs.getString("cw_chsgdjs_xxfh"));
		cw_chsgdjs_clcb=cf.fillNull(rs.getString("cw_chsgdjs_clcb"));
		cw_chsgdjs_cldbbl=cf.fillNull(rs.getString("cw_chsgdjs_cldbbl"));
		cw_chsgdjs_clbdbkk=cf.fillNull(rs.getString("cw_chsgdjs_clbdbkk"));
		cw_chsgdjs_kgjsje=cf.fillNull(rs.getString("cw_chsgdjs_kgjsje"));
		cw_chsgdjs_kqtf=cf.fillNull(rs.getString("cw_chsgdjs_kqtf"));
		cw_chsgdjs_kqtfsm=cf.fillNull(rs.getString("cw_chsgdjs_kqtfsm"));
		cw_chsgdjs_kxcf=cf.fillNull(rs.getString("cw_chsgdjs_kxcf"));
		cw_chsgdjs_sjzfe=cf.fillNull(rs.getString("cw_chsgdjs_sjzfe"));
		cw_chsgdjs_clzt=cf.fillNull(rs.getString("cw_chsgdjs_clzt"));
		cw_chsgdjs_spr=cf.fillNull(rs.getString("cw_chsgdjs_spr"));
		cw_chsgdjs_spsj=cf.fillNull(rs.getDate("cw_chsgdjs_spsj"));
		cw_chsgdjs_spyj=cf.fillNull(rs.getString("cw_chsgdjs_spyj"));
		cw_chsgdjs_lrr=cf.fillNull(rs.getString("cw_chsgdjs_lrr"));
		cw_chsgdjs_lrsj=cf.fillNull(rs.getDate("cw_chsgdjs_lrsj"));
		cw_chsgdjs_lrbm=cf.fillNull(rs.getString("cw_chsgdjs_lrbm"));
		cw_chsgdjs_bz=cf.fillNull(rs.getString("cw_chsgdjs_bz"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 查看信息</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    结算记录号  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_jsjlh%>  </td>
  <td align="right" width="20%"> 
    客户编号  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_khbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    客户姓名  </td>
  <td width="30%"> 
    <%=crm_khxx_khxm%>  </td>
  <td align="right" width="20%"> 
    房屋地址  </td>
  <td width="30%"> 
    <%=crm_khxx_fwdz%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    施工队  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_sgd%>  </td>
  <td align="right" width="20%"> 
    施工班长  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_sgbz%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    结算日期  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_jsrq%>  </td>
  <td align="right" width="20%"> 
    合同额  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_qye%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    增减项  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_zjxje%>  </td>
  <td align="right" width="20%"> 
    增项金额  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_zxje%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    减项金额  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_jxje%>  </td>
  <td align="right" width="20%"> 
    合同施工成本  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_htsgcb%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    增减项施工成本  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_zjxsgcb%>  </td>
  <td align="right" width="20%"> 
    直接成本管理费比例  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_zjcbglfbl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    直接成本管理费  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_zjcbglf%>  </td>
  <td align="right" width="20%"> 
    水电路增项金额  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_sdlzxje%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    水电路成本费比例  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_sdlcbfbl%>  </td>
  <td align="right" width="20%"> 
    水电路增加直接成本费  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_sldzjcb%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    合同外项目增加金额  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_htwzjje%>  </td>
  <td align="right" width="20%"> 
    合同外项目增加成本比例  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_htwzjcbbl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    合同外项目增加直接成本费  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_htwzjcb%>  </td>
  <td align="right" width="20%"> 
    施工成本人工费  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_sgcb%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    ①材料费  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_sgcbclf%>  </td>
  <td align="right" width="20%"> 
    ②人工费  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_sgcbrgf%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    实收设计费  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_sssjf%>  </td>
  <td align="right" width="20%"> 
    设计费提成比例  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_sjfbl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    补设计费提成  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_sjftc%>  </td>
  <td align="right" width="20%"> 
    房屋面积  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_fwmj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    空气治理协调费  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_kqzlf%>  </td>
  <td align="right" width="20%"> 
    补保洁费  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_bbjf%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    补其他费用  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_bqtf%>  </td>
  <td align="right" width="20%"> 
    补其他费用说明  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_bqtfsm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    合同内水电金额  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_htnsdje%>  </td>
  <td align="right" width="20%"> 
    合同内水电金额比例  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_htnsdjebl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    补施工组长水电成本  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_bsdcb%>  </td>
  <td align="right" width="20%"> 
    远程费金额  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_ycfje%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    远程费比例  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_ycfbl%>  </td>
  <td align="right" width="20%"> 
    补施工组长远程费  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_bycf%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    施工组长成本合计金额  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_cbhjje%>  </td>
  <td align="right" width="20%"> 
    扣工地质保金比例  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_kzbjbl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    扣工地质保金  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_kzbj%>  </td>
  <td align="right" width="20%"> 
    扣工程预支  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_kgcyz%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    扣风险保证金比例  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_kfxbzjbl%>  </td>
  <td align="right" width="20%"> 
    扣风险保证金  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_kfxbzj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    施工组长信息返回  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_xxfh%>  </td>
  <td align="right" width="20%"> 
    材料成本  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_clcb%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    材料达标比例  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_cldbbl%>  </td>
  <td align="right" width="20%"> 
    材料不达标扣款  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_clbdbkk%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    承担开工减少金额  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_kgjsje%>  </td>
  <td align="right" width="20%"> 
    扣施工组长其他费用  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_kqtf%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    扣施工组长其他费用说明  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_kqtfsm%>  </td>
  <td align="right" width="20%"> 
    扣物料宣传费  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_kxcf%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    实际支付施工组长金额  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_sjzfe%>  </td>
  <td align="right" width="20%"> 
    处理状态  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "1+结算&2+审批",cw_chsgdjs_clzt,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    审批人  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_spr%>  </td>
  <td align="right" width="20%"> 
    审批时间  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_spsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    审批意见  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_spyj%>  </td>
  <td align="right" width="20%"> 
    录入人  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_lrr%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    录入时间  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_lrsj%>  </td>
  <td align="right" width="20%"> 
    录入部门  </td>
  <td width="30%"> 
    <%=cw_chsgdjs_lrbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    备注  </td>
  <td colspan="3"> 
    <%=cw_chsgdjs_bz%>      </td>
  </tr>
</table>
</body>
</html>
