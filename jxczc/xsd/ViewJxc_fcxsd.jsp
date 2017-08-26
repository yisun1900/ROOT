<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=null;
String sq_dwxx_dwmc=null;
String xsdlx=null;
String xszsl=null;
String xszje=null;
String sklx=null;
String sfqk=null;
String shfmc=null;
String shrlxfs=null;
String shfdz=null;
String xsy=null;
String xsrq=null;
String xsdzt=null;
String nian=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String cbzje=null;
String xsph=null;
xsph=cf.GB2Uni(request.getParameter("xsph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select jxc_fcxsd.dqbm as dqbm,sq_dwxx.dwmc as sq_dwxx_dwmc,jxc_fcxsd.xsdlx as xsdlx,jxc_fcxsd.xszsl as xszsl,jxc_fcxsd.xszje as xszje,jxc_fcxsd.sklx as sklx,jxc_fcxsd.sfqk as sfqk,jxc_fcxsd.shfmc as shfmc,jxc_fcxsd.shrlxfs as shrlxfs,jxc_fcxsd.shfdz as shfdz,jxc_fcxsd.xsy as xsy,jxc_fcxsd.xsrq as xsrq,jxc_fcxsd.xsdzt as xsdzt,jxc_fcxsd.nian as nian,jxc_fcxsd.lrr as lrr,jxc_fcxsd.lrsj as lrsj,jxc_fcxsd.lrbm as lrbm,jxc_fcxsd.bz as bz,jxc_fcxsd.cbzje as cbzje ";
	ls_sql+=" from  jxc_fcxsd,sq_dwxx";
	ls_sql+=" where jxc_fcxsd.ssfgs=sq_dwxx.dwbh(+) and  (jxc_fcxsd.xsph='"+xsph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		xsdlx=cf.fillNull(rs.getString("xsdlx"));
		xszsl=cf.fillNull(rs.getString("xszsl"));
		xszje=cf.fillNull(rs.getString("xszje"));
		sklx=cf.fillNull(rs.getString("sklx"));
		sfqk=cf.fillNull(rs.getString("sfqk"));
		shfmc=cf.fillNull(rs.getString("shfmc"));
		shrlxfs=cf.fillNull(rs.getString("shrlxfs"));
		shfdz=cf.fillNull(rs.getString("shfdz"));
		xsy=cf.fillNull(rs.getString("xsy"));
		xsrq=cf.fillNull(rs.getDate("xsrq"));
		xsdzt=cf.fillNull(rs.getString("xsdzt"));
		nian=cf.fillNull(rs.getString("nian"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		cbzje=cf.fillNull(rs.getString("cbzje"));
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
  <td align="right" width="18%"> 
    销售批号  </td>
  <td width="32%"> 
    <%=xsph%>  </td>
  <td align="right" width="18%">销售单类型 </td>
  <td width="32%"><%
	cf.selectToken(out,"1+公装销售&2+客户零售&3+物流赔偿&4+库存调整&9+其它",xsdlx,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    所属分公司  </td>
  <td width="32%"> 
    <%=sq_dwxx_dwmc%>  </td>
  <td align="right" width="18%">地区</td>
  <td width="32%"><%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm,true);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">销售总数量</td>
  <td><%=xszsl%></td>
  <td align="right">销售总金额 </td>
  <td><%=xszje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 成本总金额 </td>
  <td><%=cbzje%> </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">收款类型 </td>
  <td width="32%"><%
	cf.selectToken(out,"1+现金&2+转账&3+支票&9+其它",sklx,true);
%></td>
  <td align="right" width="18%">是否全款</td>
  <td width="32%"><%
	cf.radioToken(out, "1+全款&2+部分款&3+未付款",sfqk,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">收货方名称</td>
  <td colspan="3"><%=shfmc%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">收货人联系方式</td>
  <td colspan="3"><%=shrlxfs%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">收货方地址</td>
  <td colspan="3"><%=shfdz%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    销售员  </td>
  <td width="32%"> 
    <%=xsy%>  </td>
  <td align="right" width="18%"> 
    销售日期  </td>
  <td width="32%"> 
    <%=xsrq%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    销售单状态  </td>
  <td width="32%"> 
<%
	cf.selectToken(out,"0+等待提交&2+等待出库&3+已出库&4+部分出库",xsdzt,true);
%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    录入人  </td>
  <td width="32%"> 
    <%=lrr%>  </td>
  <td align="right" width="18%"> 
    录入时间  </td>
  <td width="32%"> 
    <%=lrsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入部门 </td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh",lrbm,true);
%></td>
  <td align="right">年</td>
  <td><%=nian%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td>
  <td colspan="3"><%=bz%></td>
  </tr>
</table>


<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">材料编码</td>
	<td  width="6%">内部编码</td>
	<td  width="10%">材料名称</td>
	<td  width="5%">型号</td>
	<td  width="6%">规格</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">销售价</td>
	<td  width="4%">销售数量</td>
	<td  width="5%">销售金额</td>
	<td  width="4%">出库数量</td>
	<td  width="4%">销售方式</td>
	<td  width="4%">最小起订量</td>
	<td  width="7%">子品牌</td>
	<td  width="11%">供应商</td>
	<td  width="7%">材料大类</td>
	<td  width="7%">材料小类</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT jxc_fcxsmx.xsxh,jxc_fcxsmx.clbm,jxc_fcxsmx.nbbm,jxc_fcxsmx.clmc,jxc_fcxsmx.xh,jxc_fcxsmx.gg,jxc_fcxsmx.jldwbm,TO_CHAR(jxc_fcxsmx.xsj),jxc_fcxsmx.xssl,jxc_fcxsmx.xsje,jxc_fcxsmx.cksl";
	ls_sql+=" ,DECODE(jxc_fcxsmx.xsfs,'1','代销品','2','现货','3','期货销售','4','可负库存') xsfsmc,TO_CHAR(zxqdl)";
	ls_sql+=" ,jxc_fcxsmx.ppmc,jxc_fcxsmx.gysmc,jxc_fcxsmx.cldlbm,jxc_fcxsmx.clxlbm";
	ls_sql+=" FROM jxc_fcxsmx,jxc_cljgb ";
	ls_sql+=" where jxc_fcxsmx.xsph='"+xsph+"' ";
	ls_sql+=" and jxc_fcxsmx.clbm=jxc_cljgb.clbm(+)";
	ls_sql+=" and  jxc_cljgb.dqbm='"+dqbm+"'";
	ls_sql+=" order by jxc_fcxsmx.xsxh ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>

</body>
</html>
