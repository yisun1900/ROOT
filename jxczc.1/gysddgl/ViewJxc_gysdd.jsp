<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sq_dwxx_dwmc=null;
String dqbm=null;
String gysbm=null;
String gysmc=null;
String cglb=null;
String cllb=null;
String dhzsl=null;
String dhzje=null;
String xdr=null;
String xdrq=null;
String psfs=null;
String yqdhsj=null;
String gysjsr=null;
String gysjsrq=null;
String fhsfwc=null;
String gysfhr=null;
String gysfhrq=null;
String sfjs=null;
String jsr=null;
String jsrq=null;
String sgph=null;
String ddzt=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String nian=null;
String bz=null;
String sfrksgdw=null;
String gysddph=null;
gysddph=cf.GB2Uni(request.getParameter("gysddph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select a.dwmc as sq_dwxx_dwmc,dqmc,jxc_gysdd.gysbm as gysbm,jxc_gysdd.gysmc as gysmc,jxc_gysdd.cglb as cglb,jxc_gysdd.cllb as cllb,jxc_gysdd.dhzsl as dhzsl,jxc_gysdd.dhzje as dhzje,jxc_gysdd.xdr as xdr,jxc_gysdd.xdrq as xdrq,jxc_gysdd.psfs as psfs,jxc_gysdd.yqdhsj as yqdhsj,jxc_gysdd.gysjsr as gysjsr,jxc_gysdd.gysjsrq as gysjsrq,jxc_gysdd.fhsfwc as fhsfwc,jxc_gysdd.gysfhr as gysfhr,jxc_gysdd.gysfhrq as gysfhrq,jxc_gysdd.sfjs as sfjs,jxc_gysdd.jsr as jsr,jxc_gysdd.jsrq as jsrq,jxc_gysdd.sgph as sgph,DECODE(jxc_gysdd.ddzt,'7','未提交','0','等待下单','1','已下单','2','已接受','3','部分发货','5','已完成发货','4','已入库','6','正在办理入库','9','已结算') as ddzt,jxc_gysdd.lrr as lrr,jxc_gysdd.lrsj as lrsj,b.dwmc as lrbm,jxc_gysdd.nian as nian,jxc_gysdd.bz as bz,jxc_gysdd.sfrksgdw as sfrksgdw ";
	ls_sql+=" from  jxc_gysdd,sq_dwxx a,sq_dwxx b,dm_dqbm";
    ls_sql+=" where jxc_gysdd.ssfgs=a.dwbh and jxc_gysdd.lrbm=b.dwbh and jxc_gysdd.dqbm=dm_dqbm.dqbm";
	ls_sql+=" and jxc_gysdd.gysddph='"+gysddph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		dqbm=cf.fillNull(rs.getString("dqmc"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		cglb=cf.fillNull(rs.getString("cglb"));
		cllb=cf.fillNull(rs.getString("cllb"));
		dhzsl=cf.fillNull(rs.getString("dhzsl"));
		dhzje=cf.fillNull(rs.getString("dhzje"));
		xdr=cf.fillNull(rs.getString("xdr"));
		xdrq=cf.fillNull(rs.getDate("xdrq"));
		psfs=cf.fillNull(rs.getString("psfs"));
		yqdhsj=cf.fillNull(rs.getDate("yqdhsj"));
		gysjsr=cf.fillNull(rs.getString("gysjsr"));
		gysjsrq=cf.fillNull(rs.getDate("gysjsrq"));
		fhsfwc=cf.fillNull(rs.getString("fhsfwc"));
		gysfhr=cf.fillNull(rs.getString("gysfhr"));
		gysfhrq=cf.fillNull(rs.getDate("gysfhrq"));
		sfjs=cf.fillNull(rs.getString("sfjs"));
		jsr=cf.fillNull(rs.getString("jsr"));
		jsrq=cf.fillNull(rs.getDate("jsrq"));
		sgph=cf.fillNull(rs.getString("sgph"));
		ddzt=cf.fillNull(rs.getString("ddzt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		nian=cf.fillNull(rs.getString("nian"));
		bz=cf.fillNull(rs.getString("bz"));
		sfrksgdw=cf.fillNull(rs.getString("sfrksgdw"));
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
<div align="center">供应商订单</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    供应商订单批号  </td>
  <td width="32%"> 
    <%=gysddph%>  </td>
  <td align="right" width="18%">订单状态</td>
  <td width="32%"><%=ddzt%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">地区</td>
  <td><%=dqbm%></td>
  <td align="right">下单公司</td>
  <td><%=sq_dwxx_dwmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商编码</td>
  <td width="32%"><%=gysbm%></td>
  <td align="right" width="18%">供应商名称</td>
  <td width="32%"><%=gysmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">采购类别</td>
  <td width="32%"><%
	cf.radioToken(out, "J+集团采购&D+地方采购",cglb,true);
%></td>
  <td align="right" width="18%">材料类别</td>
  <td width="32%"><%
	cf.radioToken(out, "0+主材&1+辅材",cllb,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">订货总数量</td>
  <td width="32%"><%=dhzsl%></td>
  <td align="right" width="18%">订货总金额</td>
  <td width="32%"><%=dhzje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">下单人 </td>
  <td width="32%"><%=xdr%></td>
  <td align="right" width="18%">下单日期</td>
  <td width="32%"><%=xdrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">配送方式</td>
  <td width="32%"><%
	cf.radioToken(out, "1+配送&2+自取&3+其他",psfs,true);
%></td>
  <td align="right" width="18%">要求到货时间</td>
  <td width="32%"><%=yqdhsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商接收人</td>
  <td width="32%"><%=gysjsr%></td>
  <td align="right" width="18%">供应商接收日期</td>
  <td width="32%"><%=gysjsrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否发货 </td>
  <td width="32%"><%
	cf.radioToken(out, "N+未发货&Y+已完成&M+部分发货",fhsfwc,true);
%></td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    供应商发货人  </td>
  <td width="32%"> 
    <%=gysfhr%>  </td>
  <td align="right" width="18%"> 
    供应商发货日期  </td>
  <td width="32%"> 
    <%=gysfhrq%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    是否结算  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "Y+已结算&N+未结算",sfjs,true);
%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">结算人 </td>
  <td><%=jsr%></td>
  <td align="right">结算日期 </td>
  <td><%=jsrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>是否直接入库申购单位</strong></td>
  <td width="32%"><%
	cf.radioToken(out, "Y+直接入库申购单位&N+否",sfrksgdw,true);
%></td>
  <td align="right" width="18%"> 
    <strong>申购批号</strong> </td>
  <td width="32%"> 
    <%=sgph%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人 </td>
  <td width="32%"><%=lrr%></td>
  <td align="right" width="18%">录入时间 </td>
  <td width="32%"><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入部门</td>
  <td width="32%"><%=lrbm%></td>
  <td align="right" width="18%">年</td>
  <td width="32%"><%=nian%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注 </td>
  <td colspan="3"><%=bz%></td>
  </tr>
</table>


<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="7%">材料编码</td>
	<td  width="6%">内部编码</td>
	<td  width="11%">材料名称</td>
	<td  width="10%">型号</td>
	<td  width="10%">规格</td>
	<td  width="4%">计量单位</td>
	<td  width="5%">采购单价</td>
	<td  width="5%">订货数量</td>
	<td  width="5%">订货金额</td>
	<td  width="5%">已配送数量</td>
	<td  width="8%">品牌</td>
	<td  width="14%">供应商</td>
	<td  width="7%">材料小类</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT dhxh,clbm,nbbm,clmc,xh,gg,jldwbm,TO_CHAR(cbj),dhsl,dhje,pssl,ppmc,gysmc,clxlbm ";
	ls_sql+=" FROM jxc_gysddmx ";
    ls_sql+=" where gysddph='"+gysddph+"'";
	ls_sql+=" order by dhxh";
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);


	pageObj.printDateSum();
%> 
</table>

</body>
</html>