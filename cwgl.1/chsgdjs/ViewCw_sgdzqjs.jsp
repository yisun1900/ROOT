<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cw_chbgfjl_jsjlh=null;
String cw_chbgfjl_khbh=null;
String sq_sgd_sgdmc=null;
String cw_chbgfjl_sgbz=null;
String cw_chbgfjl_jsrq=null;
String cw_chbgfjl_jsbl=null;
String cw_chbgfjl_jsje=null;
String cw_chbgfjl_clf=null;
String cw_chbgfjl_gdyp=null;
String cw_chbgfjl_sjbk=null;
String cw_chbgfjl_lx=null;
String cw_chbgfjl_lrr=null;
String cw_chbgfjl_lrsj=null;
String cw_chbgfjl_lrbm=null;
String cw_chbgfjl_bz=null;
String cw_chbgfjl_jsjs=null;
String cw_chbgfjl_htje=null;
String cw_chbgfjl_zjxje=null;
String cw_chbgfjl_jsjsze=null;
String cw_chbgfjl_sfkclk=null;
String cw_chbgfjl_sfkgdyp=null;
String cw_chbgfjl_sfkyfgf=null;
String cw_chbgfjl_jzssk=null;
String cw_chbgfjl_yfgf=null;
String wherecw_chbgfjl_jsjlh=null;
wherecw_chbgfjl_jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select cw_chbgfjl.jsjlh as cw_chbgfjl_jsjlh,cw_chbgfjl.khbh as cw_chbgfjl_khbh,sq_sgd.sgdmc as sq_sgd_sgdmc,cw_chbgfjl.sgbz as cw_chbgfjl_sgbz,cw_chbgfjl.jsrq as cw_chbgfjl_jsrq,cw_chbgfjl.jsbl as cw_chbgfjl_jsbl,cw_chbgfjl.jsje as cw_chbgfjl_jsje,cw_chbgfjl.clf as cw_chbgfjl_clf,cw_chbgfjl.gdyp as cw_chbgfjl_gdyp,cw_chbgfjl.sjbk as cw_chbgfjl_sjbk,cw_chbgfjl.lx as cw_chbgfjl_lx,cw_chbgfjl.lrr as cw_chbgfjl_lrr,cw_chbgfjl.lrsj as cw_chbgfjl_lrsj,cw_chbgfjl.lrbm as cw_chbgfjl_lrbm,cw_chbgfjl.bz as cw_chbgfjl_bz,cw_chbgfjl.jsjs as cw_chbgfjl_jsjs,cw_chbgfjl.htje as cw_chbgfjl_htje,cw_chbgfjl.zjxje as cw_chbgfjl_zjxje,cw_chbgfjl.jsjsze as cw_chbgfjl_jsjsze,cw_chbgfjl.sfkclk as cw_chbgfjl_sfkclk,cw_chbgfjl.sfkgdyp as cw_chbgfjl_sfkgdyp,cw_chbgfjl.sfkyfgf as cw_chbgfjl_sfkyfgf,cw_chbgfjl.jzssk as cw_chbgfjl_jzssk,cw_chbgfjl.yfgf as cw_chbgfjl_yfgf ";
	ls_sql+=" from  cw_chbgfjl,sq_sgd";
	ls_sql+=" where cw_chbgfjl.sgd=sq_sgd.sgd(+) and  (cw_chbgfjl.jsjlh='"+wherecw_chbgfjl_jsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cw_chbgfjl_jsjlh=cf.fillNull(rs.getString("cw_chbgfjl_jsjlh"));
		cw_chbgfjl_khbh=cf.fillNull(rs.getString("cw_chbgfjl_khbh"));
		sq_sgd_sgdmc=cf.fillNull(rs.getString("sq_sgd_sgdmc"));
		cw_chbgfjl_sgbz=cf.fillNull(rs.getString("cw_chbgfjl_sgbz"));
		cw_chbgfjl_jsrq=cf.fillNull(rs.getDate("cw_chbgfjl_jsrq"));
		cw_chbgfjl_jsbl=cf.fillNull(rs.getString("cw_chbgfjl_jsbl"));
		cw_chbgfjl_jsje=cf.fillNull(rs.getString("cw_chbgfjl_jsje"));
		cw_chbgfjl_clf=cf.fillNull(rs.getString("cw_chbgfjl_clf"));
		cw_chbgfjl_gdyp=cf.fillNull(rs.getString("cw_chbgfjl_gdyp"));
		cw_chbgfjl_sjbk=cf.fillNull(rs.getString("cw_chbgfjl_sjbk"));
		cw_chbgfjl_lx=cf.fillNull(rs.getString("cw_chbgfjl_lx"));
		cw_chbgfjl_lrr=cf.fillNull(rs.getString("cw_chbgfjl_lrr"));
		cw_chbgfjl_lrsj=cf.fillNull(rs.getDate("cw_chbgfjl_lrsj"));
		cw_chbgfjl_lrbm=cf.fillNull(rs.getString("cw_chbgfjl_lrbm"));
		cw_chbgfjl_bz=cf.fillNull(rs.getString("cw_chbgfjl_bz"));
		cw_chbgfjl_jsjs=cf.fillNull(rs.getString("cw_chbgfjl_jsjs"));
		cw_chbgfjl_htje=cf.fillNull(rs.getString("cw_chbgfjl_htje"));
		cw_chbgfjl_zjxje=cf.fillNull(rs.getString("cw_chbgfjl_zjxje"));
		cw_chbgfjl_jsjsze=cf.fillNull(rs.getString("cw_chbgfjl_jsjsze"));
		cw_chbgfjl_sfkclk=cf.fillNull(rs.getString("cw_chbgfjl_sfkclk"));
		cw_chbgfjl_sfkgdyp=cf.fillNull(rs.getString("cw_chbgfjl_sfkgdyp"));
		cw_chbgfjl_sfkyfgf=cf.fillNull(rs.getString("cw_chbgfjl_sfkyfgf"));
		cw_chbgfjl_jzssk=cf.fillNull(rs.getString("cw_chbgfjl_jzssk"));
		cw_chbgfjl_yfgf=cf.fillNull(rs.getString("cw_chbgfjl_yfgf"));
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
<div align="center">施工队中期拨工费</div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    结算记录号  </td>
  <td width="32%"> 
    <%=cw_chbgfjl_jsjlh%>  </td>
  <td align="right" width="18%"> 
    客户编号  </td>
  <td width="32%"> 
    <%=cw_chbgfjl_khbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    施工队  </td>
  <td width="32%"> 
    <%=sq_sgd_sgdmc%>  </td>
  <td align="right" width="18%"> 
    现场负责人  </td>
  <td width="32%"> 
    <%=cw_chbgfjl_sgbz%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">类型</td>
  <td><%
	cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd order by gdjsjd",cw_chbgfjl_lx,true);
%></td>
  <td align="right">结算日期</td>
  <td><%=cw_chbgfjl_jsrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 合同基数 </td>
  <td><%=cw_chbgfjl_htje%> </td>
  <td align="right"> 增减项基数 </td>
  <td><%=cw_chbgfjl_zjxje%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">家装实收款 </td>
  <td><%=cw_chbgfjl_jzssk%></td>
  <td align="right">是否扣材料款</td>
  <td><%
	cf.radioToken(out, "Y+是&N+否",cw_chbgfjl_sfkclk,true);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"> 是否扣工地用品 </td>
  <td><%
	cf.radioToken(out, "Y+是&N+否",cw_chbgfjl_sfkgdyp,true);
%>  </td>
  <td align="right"> 是否扣已付工费 </td>
  <td><%
	cf.radioToken(out, "Y+是&N+否",cw_chbgfjl_sfkyfgf,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 工地用品 </td>
  <td><%=cw_chbgfjl_gdyp%> </td>
  <td align="right">材料费</td>
  <td><%=cw_chbgfjl_clf%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">结算基数</td>
  <td><%
	cf.selectToken(out,"1+工程费&2+工程费＋其它费&3+实收款总额&4+一期款&5+二期款&6+三期款&7+工程基础报价&8+工程基础报价＋其它费基础报价&9+工程施工成本价&A+工程施工成本价＋其它费施工成本&B+工程成本价&C+工程成本价＋其它费成本",cw_chbgfjl_jsjs,true);
%></td>
  <td align="right"> 已付工费 </td>
  <td><%=cw_chbgfjl_yfgf%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算基数总额</td>
  <td width="32%"><%=cw_chbgfjl_jsjsze%>（合同基数＋增减项基数）</td>
  <td align="right" width="18%"> 
    结算比例  </td>
  <td width="32%"> 
    <%=cw_chbgfjl_jsbl%>%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    结算金额  </td>
  <td width="32%"> 
    <%=cw_chbgfjl_jsje%>  </td>
  <td align="right" width="18%">实际拨款</td>
  <td width="32%"><%=cw_chbgfjl_sjbk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td>
  <td width="32%"><%=cw_chbgfjl_lrr%></td>
  <td align="right" width="18%">录入时间</td>
  <td width="32%"><%=cw_chbgfjl_lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入部门</td>
  <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+cw_chbgfjl_lrbm+"'",cw_chbgfjl_lrbm,true);
%></td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    备注  </td>
  <td colspan="3"> 
    <%=cw_chbgfjl_bz%>  </td>
  </tr>
</table>
</body>
</html>
