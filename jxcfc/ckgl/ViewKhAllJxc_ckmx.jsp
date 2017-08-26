<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">出库单明细－查询 </font></B>
</CENTER>

<table border="1" width="340%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">客户编号</td>
	<td  width="3%">合同号</td>
	<td  width="3%">客户姓名</td>
	<td  width="2%">施工队</td>
	<td  width="7%">房屋地址</td>
	<td  width="3%">出库批号</td>
	<td  width="2%">序号</td>
	<td  width="3%">内部编码</td>
	<td  width="6%">材料名称</td>
	<td  width="3%">型号</td>
	<td  width="4%">规格</td>
	<td  width="4%">材料编码</td>
	<td  width="4%">材料大类</td>
	<td  width="4%">材料小类</td>
	<td  width="2%">计量单位</td>
	<td  width="3%">单价</td>
	<td  width="3%">出库数量</td>
	<td  width="4%">出库金额</td>
	<td  width="4%">品牌</td>
	<td  width="7%">供应商</td>
	<td  width="4%">出库仓库</td>
	<td  width="4%">出库货架</td>
	<td  width="3%">出库单状态</td>
	<td  width="3%">录入日期</td>
	<td  width="3%">出库时间</td>
	<td  width="3%">计划送货时间</td>
	<td  width="3%">来源单号</td>
	<td  width="4%">签单店面</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String wheresql="";

	String khbh=request.getParameter("khbh");

	ls_sql="SELECT jxc_ckd.khbh,crm_khxx.hth,crm_khxx.khxm,sq_sgd.sgdmc,crm_khxx.fwdz,jxc_ckmx.ckph,TO_CHAR(jxc_ckmx.ckxh),jxc_ckmx.nbbm,jxc_ckmx.clmc,jxc_ckmx.xh,jxc_ckmx.gg,jxc_ckmx.clbm,jxc_ckmx.cldlbm,jxc_ckmx.clxlbm,jxc_ckmx.jldwbm,TO_CHAR(jxc_ckmx.ckdj),jxc_ckmx.cksl,jxc_ckmx.ckje,jxc_ckmx.ppmc,jxc_ckmx.gysmc,ckmc,hjmc,DECODE(jxc_ckd.ckdzt,'0','未提交','1','等待报废审核','2','等待退货审核','3','等待调拨入库','4','已结算','5','退货审核通过','6','报废审核未通过','7','退货审核未通过','8','审核通过','9','提交'),jxc_ckd.lrsj,jxc_ckd.cksj,jxc_ckd.jhshsj,jxc_ckd.lydh,dwmc ";
	ls_sql+=" FROM jxc_ckd,jxc_ckmx,crm_khxx,sq_sgd,sq_dwxx,jxc_ckmc,jxc_hjmc  ";
	ls_sql+=" where jxc_ckmx.ckph=jxc_ckd.ckph(+) and jxc_ckd.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and jxc_ckmx.ckbh=jxc_ckmc.ckbh(+)";
	ls_sql+=" and jxc_ckmx.hjbh=jxc_hjmc.hjbh(+)";
	ls_sql+=" and jxc_ckd.ckdzt='9' ";//9：提交
	ls_sql+=" and jxc_ckd.cklx in('P','J') ";//P：材料单出库；J：代金券出库
	ls_sql+="  and jxc_ckd.khbh='"+khbh+"'";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ckph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJxc_ckd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ckph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>

</body>
</html>