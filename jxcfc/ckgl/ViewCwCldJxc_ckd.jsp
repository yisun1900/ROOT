<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%

String ckph=null;
String dqbm=null;
String ckbh=null;
String ckzje=null;
String cklx=null;
String cklxmc=null;
String ckcllx=null;
String ckdzt=null;
String ddbh=null;
String thdbh=null;
String sgph=null;
String psph=null;
String dbph=null;
String czxh=null;
String xsph=null;
String rkph=null;
String fgsbh=null;
String jsr=null;
String sfth=null;
String sfjz=null;
String psfs=null;
String jhshsj=null;
String ckr=null;
String cksj=null;
String bz=null;
String khbh=null;
String lydh=null;
String sfyfkc=null;
String ckjxz=null;

String khxm=null;
String fwdz=null;
String lxfs=null;

String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String kgrq=null;
String jgrq=null;
String qye=null;
String dwbh=null;
String ckzcb=null;

String whereckph=null;
whereckph=cf.GB2Uni(request.getParameter("ckph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select ckzcb,ckph,dqmc dqbm,ckmc ckbh,DECODE(cklx,'D','订单出库','B','报废出库','T','退货出库','Q','调拨出库','S','申购出库','P','材料单出库','J','代金券出库','X','销售出库','R','调拨出库') cklxmc,DECODE(ckdzt,'0','未提交',' 1','等待报废审核','2','等待退货审核','3','等待调拨入库','4','报废审核通过','5','退货审核通过','6','报废审核未通过','7','退货审核未通过','8','审核通过','9','提交') ckdzt,dwmc fgsbh,jsr,ckr,to_char(cksj,'YYYY-MM-DD')cksj,jxc_ckd.bz bz,ckzje,DECODE(psfs,'0','厂家配送','1','公司送货','2','客户自取') psfs,to_char(jhshsj,'YYYY-MM-DD') jhshsj";
	ls_sql+=",ddbh,thdbh,sgph,psph,dbph,czxh,xsph,rkph,cklx,jxc_ckd.khbh,jxc_ckd.lydh,DECODE(jxc_ckd.sfyfkc,'1','无负库存','2','负库存未入库','3','负库存入库') sfyfkc,DECODE(jxc_ckd.ckjxz,'1','取价格表','2','取入库时销售价','3','取材料单价格') ckjxz";
	ls_sql+=" from  jxc_ckd,dm_dqbm,jxc_ckmc,sq_dwxx ";
	ls_sql+=" where jxc_ckd.ckbh=jxc_ckmc.ckbh(+) and jxc_ckd.dqbm=dm_dqbm.dqbm ";
	ls_sql+=" and jxc_ckd.fgsbh=sq_dwxx.dwbh ";
	ls_sql+=" and  (ckph='"+whereckph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ckzcb=cf.fillNull(rs.getString("ckzcb"));
		khbh=cf.fillNull(rs.getString("khbh"));
		lydh=cf.fillNull(rs.getString("lydh"));
		sfyfkc=cf.fillNull(rs.getString("sfyfkc"));
		ckjxz=cf.fillNull(rs.getString("ckjxz"));

		ckph=cf.fillNull(rs.getString("ckph"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		cklxmc=cf.fillNull(rs.getString("cklxmc"));
		ckdzt=cf.fillNull(rs.getString("ckdzt"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		jsr=cf.fillNull(rs.getString("jsr"));
		ckr=cf.fillNull(rs.getString("ckr"));
		cksj=cf.fillNull(rs.getDate("cksj"));
		bz=cf.fillNull(rs.getString("bz"));
		ckzje=cf.fillNull(rs.getString("ckzje"));
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillNull(rs.getString("jhshsj"));

		ddbh=cf.fillNull(rs.getString("ddbh"));
		thdbh=cf.fillNull(rs.getString("thdbh"));
		sgph=cf.fillNull(rs.getString("sgph"));
		psph=cf.fillNull(rs.getString("psph"));
		dbph=cf.fillNull(rs.getString("dbph"));
		czxh=cf.fillNull(rs.getString("czxh"));
		xsph=cf.fillNull(rs.getString("xsph"));
		rkph=cf.fillNull(rs.getString("rkph"));
		cklx=cf.fillNull(rs.getString("cklx"));
	}
	rs.close();
	ps.close();

	ls_sql="select khbh,khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,kgrq,jgrq,sgbz,qye";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));

		sgbz=cf.fillNull(rs.getString("sgbz"));
		qye=cf.fillNull(rs.getString("qye"));
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
<title>出库单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">出库单</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">客户编号</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000CC">合同号</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000CC">质检员</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">房屋地址</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">签约店面</font></td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
    <td align="right"><font color="#0000CC">设计师</font></td>
    <td><%=sjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">施工队</font> </td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>    </td>
    <td align="right"><font color="#0000CC">施工班组</font> </td>
    <td><%=sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">合同开工日期</font></td>
    <td bgcolor="#FFFFFF"><%=kgrq%> </td>
    <td align="right"><font color="#0000CC">合同交工日期</font></td>
    <td><%=jgrq%> </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    出库批号  </td>
  <td width="32%"> 
    <%=ckph%>  </td>
  <td align="right" width="18%">出库单状态 </td>
  <td width="32%"><%=ckdzt%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">分公司</td>
  <td><%=fgsbh%></td>
  <td align="right">地区 </td>
  <td><%=dqbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">出库仓库</td>
  <td width="32%"><%=ckbh%></td>
  <td align="right" width="18%">出库类型</td>
  <td width="32%"><%=cklxmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">出库价选择</td>
  <td><%=ckjxz%></td>
  <td align="right">是否有负库存</td>
  <td><%=sfyfkc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">出库总数量</td>
  <td width="32%"><%=ckzje%></td>
  <td align="right" width="18%">出库总金额 </td>
  <td width="32%"><%=ckzje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">成本金额</td>
  <td><%=ckzcb%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">出库人</td>
  <td width="32%"><%=ckr%></td>
  <td align="right" width="18%">出库时间</td>
  <td width="32%"><%=cksj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">经手人</td>
  <td width="32%"><%=jsr%></td>
  <td align="right" width="18%">来源单号</td>
  <td width="32%"><%=lydh%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">配送方式 </td>
  <td><%=psfs%></td>
  <td align="right">计划送货时间</td>
  <td><%=jhshsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入人</td>
  <td><%=jsr%></td>
  <td align="right">录入时间</td>
  <td><%=jsr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入部门</td>
  <td><%=jsr%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td>
  <td colspan="3"><%=bz%></td>
  </tr>
</table>


<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">内部编码</td>
	<td  width="8%">材料名称</td>
	<td  width="7%">型号</td>
	<td  width="7%">规格</td>
	<td  width="11%">供应商</td>
	<td  width="3%">计量单位</td>
	<td  width="4%">出库数量</td>
	<td  width="4%">出库单价</td>
	<td  width="5%">出库金额</td>
	<td  width="4%">成本单价</td>
	<td  width="5%">成本金额</td>
	<td  width="3%">是否有负库存</td>
	<td  width="5%">负库存数</td>
	<td  width="6%">出库仓库</td>
	<td  width="7%">出库货架</td>
	<td  width="6%">材料编码</td>
	<td  width="7%">品牌</td>
	<td  width="3%">质量级别</td>
</tr>
<%	
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT nbbm,clmc,xh,gg,gysmc,jldwbm,jxc_ckmx.cksl,TO_CHAR(jxc_ckmx.ckdj),jxc_ckmx.ckje,TO_CHAR(jxc_ckmx.cbdj),jxc_ckmx.cbje,DECODE(jxc_ckmx.sfyfkc,'1','无','2','有负库存'),jxc_ckmx.fkcs,jxc_ckmc.ckmc,jxc_hjmc.hjmc,clbm,ppmc,DECODE(zljb,'1','<font color=green>正常品</font>','2','<font color=blue>残次品</font>','3','<font color=red>报废品</font>')";
	ls_sql+=" FROM jxc_ckmx,jxc_ckmc,jxc_hjmc  ";
    ls_sql+=" where jxc_ckmx.ckbh=jxc_ckmc.ckbh(+) and jxc_ckmx.hjbh=jxc_hjmc.hjbh(+) and ckph='"+ckph+"'";
	ls_sql+=" order by ckxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(100000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>

</body>
</html>