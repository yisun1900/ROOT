<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cw_sgdwgjsty_jsjlh=null;
String cw_sgdwgjsty_khbh=null;
String sq_sgd_sgdmc=null;
String cw_sgdwgjsty_sgbz=null;
String cw_sgdwgjsty_jsjs=null;
String cw_sgdwgjsty_jsbl=null;
String cw_sgdwgjsty_tzjsbl=null;
String cw_sgdwgjsty_sdlje=null;
String cw_sgdwgjsty_sdljsbl=null;
String cw_sgdwgjsty_jsje=null;
String cw_sgdwgjsty_clf=null;
String cw_sgdwgjsty_clyf=null;
String cw_sgdwgjsty_gdyp=null;
String cw_sgdwgjsty_yfgck=null;
String cw_sgdwgjsty_kzbjbl=null;
String cw_sgdwgjsty_clfk=null;
String cw_sgdwgjsty_yfje=null;
String cw_sgdwgjsty_jsrq=null;
String cw_sgdwgjsty_clzt=null;
String cw_sgdwgjsty_lrr=null;
String cw_sgdwgjsty_lrsj=null;
String cw_sgdwgjsty_lrbm=null;
String cw_sgdwgjsty_bz=null;
String cw_sgdwgjsty_kzbj=null;
String cw_sgdwgjsty_htje=null;
String cw_sgdwgjsty_zjxje=null;
String cw_sgdwgjsty_qtf=null;
String cw_sgdwgjsty_qtfsm=null;
String cw_sgdwgjsty_ssk=null;
String cw_sgdwgjsty_jsjsze=null;
String cw_sgdwgjsty_sdljsfs=null;
String cw_sgdwgjsty_sfkclk=null;
String cw_sgdwgjsty_sfkgdyp=null;
String cw_sgdwgjsty_sfkyfgf=null;
String cw_sgdwgjsty_sfkzbj=null;
String cw_sgdwgjsty_kzbjjs=null;
String cw_sgdwgjsty_fkje=null;
String cw_sgdwgjsty_jlje=null;
String cw_sgdwgjsty_qtje=null;
String cw_sgdwgjsty_sdljsje=null;

double khpck=0;
double yqf=0;
double jsyh=0;
double khqk=0;

String wherecw_sgdwgjsty_jsjlh=null;
wherecw_sgdwgjsty_jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select cw_sgdwgjsty.jsjlh as cw_sgdwgjsty_jsjlh,cw_sgdwgjsty.khbh as cw_sgdwgjsty_khbh,sq_sgd.sgdmc as sq_sgd_sgdmc,cw_sgdwgjsty.sgbz as cw_sgdwgjsty_sgbz,cw_sgdwgjsty.jsjs as cw_sgdwgjsty_jsjs,cw_sgdwgjsty.jsbl as cw_sgdwgjsty_jsbl,cw_sgdwgjsty.tzjsbl as cw_sgdwgjsty_tzjsbl,cw_sgdwgjsty.sdlje as cw_sgdwgjsty_sdlje,cw_sgdwgjsty.sdljsbl as cw_sgdwgjsty_sdljsbl,cw_sgdwgjsty.jsje as cw_sgdwgjsty_jsje,cw_sgdwgjsty.clf as cw_sgdwgjsty_clf,cw_sgdwgjsty.clyf as cw_sgdwgjsty_clyf,cw_sgdwgjsty.gdyp as cw_sgdwgjsty_gdyp,cw_sgdwgjsty.yfgck as cw_sgdwgjsty_yfgck,cw_sgdwgjsty.kzbjbl as cw_sgdwgjsty_kzbjbl,cw_sgdwgjsty.clfk as cw_sgdwgjsty_clfk,cw_sgdwgjsty.yfje as cw_sgdwgjsty_yfje,cw_sgdwgjsty.jsrq as cw_sgdwgjsty_jsrq,cw_sgdwgjsty.clzt as cw_sgdwgjsty_clzt,cw_sgdwgjsty.lrr as cw_sgdwgjsty_lrr,cw_sgdwgjsty.lrsj as cw_sgdwgjsty_lrsj,cw_sgdwgjsty.lrbm as cw_sgdwgjsty_lrbm,cw_sgdwgjsty.bz as cw_sgdwgjsty_bz,cw_sgdwgjsty.kzbj as cw_sgdwgjsty_kzbj,cw_sgdwgjsty.htje as cw_sgdwgjsty_htje,cw_sgdwgjsty.zjxje as cw_sgdwgjsty_zjxje,cw_sgdwgjsty.qtf as cw_sgdwgjsty_qtf,cw_sgdwgjsty.qtfsm as cw_sgdwgjsty_qtfsm,cw_sgdwgjsty.ssk as cw_sgdwgjsty_ssk,cw_sgdwgjsty.jsjsze as cw_sgdwgjsty_jsjsze,cw_sgdwgjsty.sdljsfs as cw_sgdwgjsty_sdljsfs,cw_sgdwgjsty.sfkclk as cw_sgdwgjsty_sfkclk,cw_sgdwgjsty.sfkgdyp as cw_sgdwgjsty_sfkgdyp,cw_sgdwgjsty.sfkyfgf as cw_sgdwgjsty_sfkyfgf,cw_sgdwgjsty.sfkzbj as cw_sgdwgjsty_sfkzbj,cw_sgdwgjsty.kzbjjs as cw_sgdwgjsty_kzbjjs,cw_sgdwgjsty.fkje as cw_sgdwgjsty_fkje,cw_sgdwgjsty.jlje as cw_sgdwgjsty_jlje,cw_sgdwgjsty.qtje as cw_sgdwgjsty_qtje,cw_sgdwgjsty.sdljsje as cw_sgdwgjsty_sdljsje ";
	ls_sql+=" ,khpck,yqf,jsyh,khqk";
	ls_sql+=" from  cw_sgdwgjsty,sq_sgd";
	ls_sql+=" where cw_sgdwgjsty.sgd=sq_sgd.sgd(+) and  (cw_sgdwgjsty.jsjlh='"+wherecw_sgdwgjsty_jsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khpck=rs.getDouble("khpck");
		yqf=rs.getDouble("yqf");
		jsyh=rs.getDouble("jsyh");
		khqk=rs.getDouble("khqk");
		cw_sgdwgjsty_jsjlh=cf.fillNull(rs.getString("cw_sgdwgjsty_jsjlh"));
		cw_sgdwgjsty_khbh=cf.fillNull(rs.getString("cw_sgdwgjsty_khbh"));
		sq_sgd_sgdmc=cf.fillNull(rs.getString("sq_sgd_sgdmc"));
		cw_sgdwgjsty_sgbz=cf.fillNull(rs.getString("cw_sgdwgjsty_sgbz"));
		cw_sgdwgjsty_jsjs=cf.fillNull(rs.getString("cw_sgdwgjsty_jsjs"));
		cw_sgdwgjsty_jsbl=cf.fillNull(rs.getString("cw_sgdwgjsty_jsbl"));
		cw_sgdwgjsty_tzjsbl=cf.fillNull(rs.getString("cw_sgdwgjsty_tzjsbl"));
		cw_sgdwgjsty_sdlje=cf.fillNull(rs.getString("cw_sgdwgjsty_sdlje"));
		cw_sgdwgjsty_sdljsbl=cf.fillNull(rs.getString("cw_sgdwgjsty_sdljsbl"));
		cw_sgdwgjsty_jsje=cf.fillNull(rs.getString("cw_sgdwgjsty_jsje"));
		cw_sgdwgjsty_clf=cf.fillNull(rs.getString("cw_sgdwgjsty_clf"));
		cw_sgdwgjsty_clyf=cf.fillNull(rs.getString("cw_sgdwgjsty_clyf"));
		cw_sgdwgjsty_gdyp=cf.fillNull(rs.getString("cw_sgdwgjsty_gdyp"));
		cw_sgdwgjsty_yfgck=cf.fillNull(rs.getString("cw_sgdwgjsty_yfgck"));
		cw_sgdwgjsty_kzbjbl=cf.fillNull(rs.getString("cw_sgdwgjsty_kzbjbl"));
		cw_sgdwgjsty_clfk=cf.fillNull(rs.getString("cw_sgdwgjsty_clfk"));
		cw_sgdwgjsty_yfje=cf.fillNull(rs.getString("cw_sgdwgjsty_yfje"));
		cw_sgdwgjsty_jsrq=cf.fillNull(rs.getDate("cw_sgdwgjsty_jsrq"));
		cw_sgdwgjsty_clzt=cf.fillNull(rs.getString("cw_sgdwgjsty_clzt"));
		cw_sgdwgjsty_lrr=cf.fillNull(rs.getString("cw_sgdwgjsty_lrr"));
		cw_sgdwgjsty_lrsj=cf.fillNull(rs.getDate("cw_sgdwgjsty_lrsj"));
		cw_sgdwgjsty_lrbm=cf.fillNull(rs.getString("cw_sgdwgjsty_lrbm"));
		cw_sgdwgjsty_bz=cf.fillNull(rs.getString("cw_sgdwgjsty_bz"));
		cw_sgdwgjsty_kzbj=cf.fillNull(rs.getString("cw_sgdwgjsty_kzbj"));
		cw_sgdwgjsty_htje=cf.fillNull(rs.getString("cw_sgdwgjsty_htje"));
		cw_sgdwgjsty_zjxje=cf.fillNull(rs.getString("cw_sgdwgjsty_zjxje"));
		cw_sgdwgjsty_qtf=cf.fillNull(rs.getString("cw_sgdwgjsty_qtf"));
		cw_sgdwgjsty_qtfsm=cf.fillNull(rs.getString("cw_sgdwgjsty_qtfsm"));
		cw_sgdwgjsty_ssk=cf.fillNull(rs.getString("cw_sgdwgjsty_ssk"));
		cw_sgdwgjsty_jsjsze=cf.fillNull(rs.getString("cw_sgdwgjsty_jsjsze"));
		cw_sgdwgjsty_sdljsfs=cf.fillNull(rs.getString("cw_sgdwgjsty_sdljsfs"));
		cw_sgdwgjsty_sfkclk=cf.fillNull(rs.getString("cw_sgdwgjsty_sfkclk"));
		cw_sgdwgjsty_sfkgdyp=cf.fillNull(rs.getString("cw_sgdwgjsty_sfkgdyp"));
		cw_sgdwgjsty_sfkyfgf=cf.fillNull(rs.getString("cw_sgdwgjsty_sfkyfgf"));
		cw_sgdwgjsty_sfkzbj=cf.fillNull(rs.getString("cw_sgdwgjsty_sfkzbj"));
		cw_sgdwgjsty_kzbjjs=cf.fillNull(rs.getString("cw_sgdwgjsty_kzbjjs"));
		cw_sgdwgjsty_fkje=cf.fillNull(rs.getString("cw_sgdwgjsty_fkje"));
		cw_sgdwgjsty_jlje=cf.fillNull(rs.getString("cw_sgdwgjsty_jlje"));
		cw_sgdwgjsty_qtje=cf.fillNull(rs.getString("cw_sgdwgjsty_qtje"));
		cw_sgdwgjsty_sdljsje=cf.fillNull(rs.getString("cw_sgdwgjsty_sdljsje"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">施工队完工结算</div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    结算记录号  </td>
  <td width="32%"> 
    <%=cw_sgdwgjsty_jsjlh%>  </td>
  <td align="right" width="18%"> 
    客户编号  </td>
  <td width="32%"> 
    <%=cw_sgdwgjsty_khbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    施工队  </td>
  <td width="32%"> 
    <%=sq_sgd_sgdmc%>  </td>
  <td align="right" width="18%"> 
    现场负责人  </td>
  <td width="32%"> 
    <%=cw_sgdwgjsty_sgbz%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 工程合同额 </td>
  <td><%=cw_sgdwgjsty_htje%> </td>
  <td align="right"> 工程增减项 </td>
  <td><%=cw_sgdwgjsty_zjxje%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 其它费 </td>
  <td><%=cw_sgdwgjsty_qtf%> </td>
  <td align="right">实收款</td>
  <td><%=cw_sgdwgjsty_ssk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">其它费说明</td>
  <td colspan="3"><%=cw_sgdwgjsty_qtfsm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">结算优惠</td>
  <td><%=jsyh%></td>
  <td align="right">客户赔偿款</td>
  <td><%=khpck%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">客户欠款</td>
  <td><%=khqk%></td>
  <td align="right">延期费</td>
  <td><%=yqf%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    结算基数  </td>
  <td width="32%"> 
<%
	cf.selectToken(out,"1+工程费&2+工程费＋其它费&3+实收款总额&4+一期款&5+二期款&6+三期款&7+工程基础报价&8+工程基础报价＋其它费基础报价&9+工程施工成本价&A+工程施工成本价＋其它费施工成本&B+工程成本价&C+工程成本价＋其它费成本",cw_sgdwgjsty_jsjs,true);
%>  </td>
  <td align="right" width="18%">结算基数总额</td>
  <td width="32%"><%=cw_sgdwgjsty_jsjsze%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">结算比例</td>
  <td><%=cw_sgdwgjsty_jsbl%>%</td>
  <td align="right">调整结算比例 </td>
  <td><%=cw_sgdwgjsty_tzjsbl%>%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">水电路结算方式 </td>
  <td><%
	cf.radioToken(out, "1+统一比例结算&2+独立比例结算&3+不结算",cw_sgdwgjsty_sdljsfs,true);
%></td>
  <td align="right">水电路金额</td>
  <td><%=cw_sgdwgjsty_sdlje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">水电路结算比例</td>
  <td width="32%"><%=cw_sgdwgjsty_sdljsbl%></td>
  <td align="right" width="18%">水电路结算金额</td>
  <td width="32%"><%=cw_sgdwgjsty_sdljsje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算总额</td>
  <td width="32%"><%=cw_sgdwgjsty_jsje%></td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否扣材料款 </td>
  <td><%
	cf.radioToken(out, "Y+是&N+否",cw_sgdwgjsty_sfkclk,true);
%></td>
  <td align="right">材料罚款</td>
  <td><%=cw_sgdwgjsty_clfk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    材料费  </td>
  <td width="32%"> 
    <%=cw_sgdwgjsty_clf%>  </td>
  <td align="right" width="18%"> 
    材料运费  </td>
  <td width="32%"> 
    <%=cw_sgdwgjsty_clyf%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否扣工地用品</td>
  <td><%
	cf.radioToken(out, "Y+是&N+否",cw_sgdwgjsty_sfkgdyp,true);
%></td>
  <td align="right">工地用品</td>
  <td><%=cw_sgdwgjsty_gdyp%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否扣已付工费</td>
  <td width="32%"><%
	cf.radioToken(out, "Y+是&N+否",cw_sgdwgjsty_sfkyfgf,true);
%></td>
  <td align="right" width="18%"> 
    已付工程款  </td>
  <td width="32%"> 
    <%=cw_sgdwgjsty_yfgck%>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"> 是否扣质保金 </td>
  <td><%
	cf.radioToken(out, "Y+是&N+否",cw_sgdwgjsty_sfkzbj,true);
%>  </td>
  <td align="right"> 扣质保金基数 </td>
  <td><%
	cf.radioToken(out, "1+结算基数&2+结算总额",cw_sgdwgjsty_kzbjjs,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    应扣质保金比例  </td>
  <td width="32%"> 
    <%=cw_sgdwgjsty_kzbjbl%>%  </td>
  <td align="right" width="18%">扣质保金</td>
  <td width="32%"><%=cw_sgdwgjsty_kzbj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    罚款金额  </td>
  <td width="32%"> 
    <%=cw_sgdwgjsty_fkje%>  </td>
  <td align="right" width="18%"> 
    奖励金额  </td>
  <td width="32%"> 
    <%=cw_sgdwgjsty_jlje%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 其它金额 </td>
  <td><%=cw_sgdwgjsty_qtje%> </td>
  <td align="right">应付金额</td>
  <td><%=cw_sgdwgjsty_yfje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">结算日期</td>
  <td><%=cw_sgdwgjsty_jsrq%></td>
  <td align="right">处理状态 </td>
  <td><%
	cf.radioToken(out, "1+未审批&2+审批",cw_sgdwgjsty_clzt,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入人</td>
  <td><%=cw_sgdwgjsty_lrr%></td>
  <td align="right">录入时间 </td>
  <td><%=cw_sgdwgjsty_lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入部门</td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+cw_sgdwgjsty_lrbm+"'",cw_sgdwgjsty_lrbm,true);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 备注 </td>
  <td colspan="3"><%=cw_sgdwgjsty_bz%> </td>
  </tr>
</table>
</body>
</html>
