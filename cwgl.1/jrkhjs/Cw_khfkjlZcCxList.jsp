<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;


	String khbh=request.getParameter("khbh");

	ls_sql="SELECT cw_khfkjl.fkxh,a.fklxmc fklxbm,DECODE(jc_zcdd.ddlx,'1','代销品','3','补录合同','4','有库存订单','5','标准套餐','6','家具健康套餐','7','温暖静音套餐','8','窗帘套餐','9','代购主材','A','顶配升级','B','顶配独立收费','C','选配主材','D','套餐外主材'),cw_khfkjl.ddbh,cw_khfkjl.gysbh,cw_khfkjl.fkje,zffsmc,b.fklxmc zklx,DECODE(dsksjbz,'N','未审核','Y',' 审核通过','M','审核未通过'),cw_khfkjl.sjbh,cw_khfkjl.sksj,cw_khfkjl.sjsj,cw_khfkjl.bz  ";
	ls_sql+=" FROM cw_khfkjl,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,jc_zcdd  ";
	ls_sql+=" where cw_khfkjl.fklxbm=a.fklxbm(+)";
	ls_sql+=" and cw_khfkjl.zckx=b.fklxbm(+)";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm(+) ";
	ls_sql+=" and cw_khfkjl.ddbh=jc_zcdd.ddbh(+) ";
	ls_sql+=" and cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";

	ls_sql+=" and ";
	ls_sql+=" ( ";
	ls_sql+=" ( ";
	ls_sql+=" cw_khfkjl.fklxbm in('62')";//62：主材预付款
	ls_sql+=" and ";
	ls_sql+=" ( ";
	ls_sql+=" cw_khfkjl.zffs not in('16','31')";//16：纸质材料券,31：转换款项
	ls_sql+=" OR ";
	ls_sql+=" (cw_khfkjl.zffs in('31') and cw_khfkjl.zckx not in('67','55'))";//67：增值储值卡,55：绿色电子礼券卡
	ls_sql+=" ) ";
	ls_sql+=" ) ";

	ls_sql+=" or ";

	ls_sql+=" ( ";
	ls_sql+=" cw_khfkjl.fklxbm in('23')";//23:主材
	ls_sql+=" and ";
	ls_sql+=" ( ";
	ls_sql+=" cw_khfkjl.zffs not in('16','31')";//16：纸质材料券,31：转换款项
	ls_sql+=" OR ";
	ls_sql+=" (cw_khfkjl.zffs in('31') and cw_khfkjl.zckx not in('67','55'))";//67：增值储值卡,55：绿色电子礼券卡
	ls_sql+=" ) ";
	ls_sql+=" ) ";
	ls_sql+=" ) ";

    ls_sql+=" order by fklxbm,zffs,zklx,jc_zcdd.ddlx,cw_khfkjl.ddbh,fkxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);
/*
//设置显示列
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","fkxh","cw_khfkjl_sjbh","cw_khfkjl_jsjlh","cw_khfkjl_fklx","cw_khfkjl_fkje","cw_khfkjl_skr","cw_khfkjl_sksj","cw_khfkjl_lrdw","cw_khfkjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"fkxh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"fkxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/cwgl/qyecx/ViewCw_khfkjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("fkxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"fkxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/cwgl/qyecx/ViewKhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">现金交主材款</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">收款序号</td>
	<td  width="7%">收款类型</td>
	<td  width="8%">订单类型</td>
	<td  width="7%">订单</td>
	<td  width="11%">收款品牌</td>
	<td  width="7%">实收款金额</td>
	<td  width="6%">支付方式</td>
	<td  width="7%">转款类型</td>
	<td  width="6%">审核标志</td>
	<td  width="8%">收据编号</td>
	<td  width="7%">收款时间</td>
	<td  width="7%">审核时间</td>
	<td  width="20%">备注</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.displayFoot();
%> 

</body>

</html>