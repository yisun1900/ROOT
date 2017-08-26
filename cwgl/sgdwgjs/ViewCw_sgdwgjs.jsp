<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cw_sgdwgjs_jsjlh=null;
String cw_sgdwgjs_khbh=null;
String sq_sgd_sgdmc=null;
String cw_sgdwgjs_sgbz=null;
String cw_sgdwgjs_jsjs=null;
String cw_sgdwgjs_jsbl=null;
String cw_sgdwgjs_tzjsbl=null;
String cw_sgdwgjs_sdlje=null;
String cw_sgdwgjs_sdljsbl=null;
String cw_sgdwgjs_jsje=null;
String cw_sgdwgjs_clf=null;
String cw_sgdwgjs_clyf=null;
String cw_sgdwgjs_gdyp=null;
String cw_sgdwgjs_yfgck=null;
String cw_sgdwgjs_kzbjbl=null;
String cw_sgdwgjs_clfk=null;
String cw_sgdwgjs_yfje=null;
String cw_sgdwgjs_jsrq=null;
String cw_sgdwgjs_clzt=null;
String cw_sgdwgjs_lrr=null;
String cw_sgdwgjs_lrsj=null;
String cw_sgdwgjs_lrbm=null;
String cw_sgdwgjs_bz=null;
String cw_sgdwgjs_kzbj=null;
String cw_sgdwgjs_htje=null;
String cw_sgdwgjs_zjxje=null;
String cw_sgdwgjs_qtf=null;
String cw_sgdwgjs_qtfsm=null;
String cw_sgdwgjs_ssk=null;
String cw_sgdwgjs_jsjsze=null;
String cw_sgdwgjs_sdljsfs=null;
String cw_sgdwgjs_sfkclk=null;
String cw_sgdwgjs_sfkgdyp=null;
String cw_sgdwgjs_sfkyfgf=null;
String cw_sgdwgjs_sfkzbj=null;
String cw_sgdwgjs_kzbjjs=null;
String cw_sgdwgjs_fkje=null;
String cw_sgdwgjs_jlje=null;
String cw_sgdwgjs_qtje=null;
String cw_sgdwgjs_sdljsje=null;
String wherecw_sgdwgjs_jsjlh=null;
wherecw_sgdwgjs_jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select cw_sgdwgjs.jsjlh as cw_sgdwgjs_jsjlh,cw_sgdwgjs.khbh as cw_sgdwgjs_khbh,sq_sgd.sgdmc as sq_sgd_sgdmc,cw_sgdwgjs.sgbz as cw_sgdwgjs_sgbz,cw_sgdwgjs.jsjs as cw_sgdwgjs_jsjs,cw_sgdwgjs.jsbl as cw_sgdwgjs_jsbl,cw_sgdwgjs.tzjsbl as cw_sgdwgjs_tzjsbl,cw_sgdwgjs.sdlje as cw_sgdwgjs_sdlje,cw_sgdwgjs.sdljsbl as cw_sgdwgjs_sdljsbl,cw_sgdwgjs.jsje as cw_sgdwgjs_jsje,cw_sgdwgjs.clf as cw_sgdwgjs_clf,cw_sgdwgjs.clyf as cw_sgdwgjs_clyf,cw_sgdwgjs.gdyp as cw_sgdwgjs_gdyp,cw_sgdwgjs.yfgck as cw_sgdwgjs_yfgck,cw_sgdwgjs.kzbjbl as cw_sgdwgjs_kzbjbl,cw_sgdwgjs.clfk as cw_sgdwgjs_clfk,cw_sgdwgjs.yfje as cw_sgdwgjs_yfje,cw_sgdwgjs.jsrq as cw_sgdwgjs_jsrq,cw_sgdwgjs.clzt as cw_sgdwgjs_clzt,cw_sgdwgjs.lrr as cw_sgdwgjs_lrr,cw_sgdwgjs.lrsj as cw_sgdwgjs_lrsj,cw_sgdwgjs.lrbm as cw_sgdwgjs_lrbm,cw_sgdwgjs.bz as cw_sgdwgjs_bz,cw_sgdwgjs.kzbj as cw_sgdwgjs_kzbj,cw_sgdwgjs.htje as cw_sgdwgjs_htje,cw_sgdwgjs.zjxje as cw_sgdwgjs_zjxje,cw_sgdwgjs.qtf as cw_sgdwgjs_qtf,cw_sgdwgjs.qtfsm as cw_sgdwgjs_qtfsm,cw_sgdwgjs.ssk as cw_sgdwgjs_ssk,cw_sgdwgjs.jsjsze as cw_sgdwgjs_jsjsze,cw_sgdwgjs.sdljsfs as cw_sgdwgjs_sdljsfs,cw_sgdwgjs.sfkclk as cw_sgdwgjs_sfkclk,cw_sgdwgjs.sfkgdyp as cw_sgdwgjs_sfkgdyp,cw_sgdwgjs.sfkyfgf as cw_sgdwgjs_sfkyfgf,cw_sgdwgjs.sfkzbj as cw_sgdwgjs_sfkzbj,cw_sgdwgjs.kzbjjs as cw_sgdwgjs_kzbjjs,cw_sgdwgjs.fkje as cw_sgdwgjs_fkje,cw_sgdwgjs.jlje as cw_sgdwgjs_jlje,cw_sgdwgjs.qtje as cw_sgdwgjs_qtje,cw_sgdwgjs.sdljsje as cw_sgdwgjs_sdljsje ";
	ls_sql+=" from  cw_sgdwgjs,sq_sgd";
	ls_sql+=" where cw_sgdwgjs.sgd=sq_sgd.sgd(+) and  (cw_sgdwgjs.jsjlh='"+wherecw_sgdwgjs_jsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cw_sgdwgjs_jsjlh=cf.fillNull(rs.getString("cw_sgdwgjs_jsjlh"));
		cw_sgdwgjs_khbh=cf.fillNull(rs.getString("cw_sgdwgjs_khbh"));
		sq_sgd_sgdmc=cf.fillNull(rs.getString("sq_sgd_sgdmc"));
		cw_sgdwgjs_sgbz=cf.fillNull(rs.getString("cw_sgdwgjs_sgbz"));
		cw_sgdwgjs_jsjs=cf.fillNull(rs.getString("cw_sgdwgjs_jsjs"));
		cw_sgdwgjs_jsbl=cf.fillNull(rs.getString("cw_sgdwgjs_jsbl"));
		cw_sgdwgjs_tzjsbl=cf.fillNull(rs.getString("cw_sgdwgjs_tzjsbl"));
		cw_sgdwgjs_sdlje=cf.fillNull(rs.getString("cw_sgdwgjs_sdlje"));
		cw_sgdwgjs_sdljsbl=cf.fillNull(rs.getString("cw_sgdwgjs_sdljsbl"));
		cw_sgdwgjs_jsje=cf.fillNull(rs.getString("cw_sgdwgjs_jsje"));
		cw_sgdwgjs_clf=cf.fillNull(rs.getString("cw_sgdwgjs_clf"));
		cw_sgdwgjs_clyf=cf.fillNull(rs.getString("cw_sgdwgjs_clyf"));
		cw_sgdwgjs_gdyp=cf.fillNull(rs.getString("cw_sgdwgjs_gdyp"));
		cw_sgdwgjs_yfgck=cf.fillNull(rs.getString("cw_sgdwgjs_yfgck"));
		cw_sgdwgjs_kzbjbl=cf.fillNull(rs.getString("cw_sgdwgjs_kzbjbl"));
		cw_sgdwgjs_clfk=cf.fillNull(rs.getString("cw_sgdwgjs_clfk"));
		cw_sgdwgjs_yfje=cf.fillNull(rs.getString("cw_sgdwgjs_yfje"));
		cw_sgdwgjs_jsrq=cf.fillNull(rs.getDate("cw_sgdwgjs_jsrq"));
		cw_sgdwgjs_clzt=cf.fillNull(rs.getString("cw_sgdwgjs_clzt"));
		cw_sgdwgjs_lrr=cf.fillNull(rs.getString("cw_sgdwgjs_lrr"));
		cw_sgdwgjs_lrsj=cf.fillNull(rs.getDate("cw_sgdwgjs_lrsj"));
		cw_sgdwgjs_lrbm=cf.fillNull(rs.getString("cw_sgdwgjs_lrbm"));
		cw_sgdwgjs_bz=cf.fillNull(rs.getString("cw_sgdwgjs_bz"));
		cw_sgdwgjs_kzbj=cf.fillNull(rs.getString("cw_sgdwgjs_kzbj"));
		cw_sgdwgjs_htje=cf.fillNull(rs.getString("cw_sgdwgjs_htje"));
		cw_sgdwgjs_zjxje=cf.fillNull(rs.getString("cw_sgdwgjs_zjxje"));
		cw_sgdwgjs_qtf=cf.fillNull(rs.getString("cw_sgdwgjs_qtf"));
		cw_sgdwgjs_qtfsm=cf.fillNull(rs.getString("cw_sgdwgjs_qtfsm"));
		cw_sgdwgjs_ssk=cf.fillNull(rs.getString("cw_sgdwgjs_ssk"));
		cw_sgdwgjs_jsjsze=cf.fillNull(rs.getString("cw_sgdwgjs_jsjsze"));
		cw_sgdwgjs_sdljsfs=cf.fillNull(rs.getString("cw_sgdwgjs_sdljsfs"));
		cw_sgdwgjs_sfkclk=cf.fillNull(rs.getString("cw_sgdwgjs_sfkclk"));
		cw_sgdwgjs_sfkgdyp=cf.fillNull(rs.getString("cw_sgdwgjs_sfkgdyp"));
		cw_sgdwgjs_sfkyfgf=cf.fillNull(rs.getString("cw_sgdwgjs_sfkyfgf"));
		cw_sgdwgjs_sfkzbj=cf.fillNull(rs.getString("cw_sgdwgjs_sfkzbj"));
		cw_sgdwgjs_kzbjjs=cf.fillNull(rs.getString("cw_sgdwgjs_kzbjjs"));
		cw_sgdwgjs_fkje=cf.fillNull(rs.getString("cw_sgdwgjs_fkje"));
		cw_sgdwgjs_jlje=cf.fillNull(rs.getString("cw_sgdwgjs_jlje"));
		cw_sgdwgjs_qtje=cf.fillNull(rs.getString("cw_sgdwgjs_qtje"));
		cw_sgdwgjs_sdljsje=cf.fillNull(rs.getString("cw_sgdwgjs_sdljsje"));
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
<title>施工队完工结算</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">施工队完工结算</div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    结算记录号  </td>
  <td width="32%"> 
    <%=cw_sgdwgjs_jsjlh%>  </td>
  <td align="right" width="18%"> 
    客户编号  </td>
  <td width="32%"> 
    <%=cw_sgdwgjs_khbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    施工队  </td>
  <td width="32%"> 
    <%=sq_sgd_sgdmc%>  </td>
  <td align="right" width="18%"> 
    现场负责人  </td>
  <td width="32%"> 
    <%=cw_sgdwgjs_sgbz%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 工程合同额 </td>
  <td><%=cw_sgdwgjs_htje%> </td>
  <td align="right"> 工程增减项 </td>
  <td><%=cw_sgdwgjs_zjxje%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 其它费 </td>
  <td><%=cw_sgdwgjs_qtf%> </td>
  <td align="right">实收款</td>
  <td><%=cw_sgdwgjs_ssk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">其它费说明</td>
  <td colspan="3"><%=cw_sgdwgjs_qtfsm%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    结算基数  </td>
  <td width="32%"> 
<%
	cf.selectToken(out,"1+工程费&2+工程费＋其它费&3+实收款总额&4+一期款&5+二期款&6+三期款&7+工程基础报价&8+工程基础报价＋其它费基础报价&9+工程施工成本价&A+工程施工成本价＋其它费施工成本&B+工程成本价&C+工程成本价＋其它费成本",cw_sgdwgjs_jsjs,true);
%>  </td>
  <td align="right" width="18%">结算基数总额</td>
  <td width="32%"><%=cw_sgdwgjs_jsjsze%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">结算比例</td>
  <td><%=cw_sgdwgjs_jsbl%>%</td>
  <td align="right">调整结算比例 </td>
  <td><%=cw_sgdwgjs_tzjsbl%>%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">水电路结算方式 </td>
  <td><%
	cf.radioToken(out, "1+统一比例结算&2+独立比例结算&3+不结算",cw_sgdwgjs_sdljsfs,true);
%></td>
  <td align="right">水电路金额</td>
  <td><%=cw_sgdwgjs_sdlje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">水电路结算比例</td>
  <td width="32%"><%=cw_sgdwgjs_sdljsbl%></td>
  <td align="right" width="18%">水电路结算金额</td>
  <td width="32%"><%=cw_sgdwgjs_sdljsje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算总额</td>
  <td width="32%"><%=cw_sgdwgjs_jsje%></td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否扣材料款 </td>
  <td><%
	cf.radioToken(out, "Y+是&N+否",cw_sgdwgjs_sfkclk,true);
%></td>
  <td align="right">材料罚款</td>
  <td><%=cw_sgdwgjs_clfk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    材料费  </td>
  <td width="32%"> 
    <%=cw_sgdwgjs_clf%>  </td>
  <td align="right" width="18%"> 
    材料运费  </td>
  <td width="32%"> 
    <%=cw_sgdwgjs_clyf%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否扣工地用品</td>
  <td><%
	cf.radioToken(out, "Y+是&N+否",cw_sgdwgjs_sfkgdyp,true);
%></td>
  <td align="right">工地用品</td>
  <td><%=cw_sgdwgjs_gdyp%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否扣已付工费</td>
  <td width="32%"><%
	cf.radioToken(out, "Y+是&N+否",cw_sgdwgjs_sfkyfgf,true);
%></td>
  <td align="right" width="18%"> 
    已付工程款  </td>
  <td width="32%"> 
    <%=cw_sgdwgjs_yfgck%>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"> 是否扣质保金 </td>
  <td><%
	cf.radioToken(out, "Y+是&N+否",cw_sgdwgjs_sfkzbj,true);
%>  </td>
  <td align="right"> 扣质保金基数 </td>
  <td><%
	cf.radioToken(out, "1+结算基数&2+结算总额",cw_sgdwgjs_kzbjjs,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    应扣质保金比例  </td>
  <td width="32%"> 
    <%=cw_sgdwgjs_kzbjbl%>%  </td>
  <td align="right" width="18%">扣质保金</td>
  <td width="32%"><%=cw_sgdwgjs_kzbj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    罚款金额  </td>
  <td width="32%"> 
    <%=cw_sgdwgjs_fkje%>  </td>
  <td align="right" width="18%"> 
    奖励金额  </td>
  <td width="32%"> 
    <%=cw_sgdwgjs_jlje%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 其它金额 </td>
  <td><%=cw_sgdwgjs_qtje%> </td>
  <td align="right">应付金额</td>
  <td><%=cw_sgdwgjs_yfje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">结算日期</td>
  <td><%=cw_sgdwgjs_jsrq%></td>
  <td align="right">处理状态 </td>
  <td><%
	cf.radioToken(out, "1+未审批&2+审批",cw_sgdwgjs_clzt,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入人</td>
  <td><%=cw_sgdwgjs_lrr%></td>
  <td align="right">录入时间 </td>
  <td><%=cw_sgdwgjs_lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入部门</td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+cw_sgdwgjs_lrbm+"'",cw_sgdwgjs_lrbm,true);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 备注 </td>
  <td colspan="3"><%=cw_sgdwgjs_bz%> </td>
  </tr>
</table>
</body>
</html>
