<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";

	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String dwbh=request.getParameter("dwbh");



	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,DECODE(zt,'2','家装客户','3','退单客户','4','非家装客户','5','设计客户') zt,cw_khfkjl.fkxh,a.fklxmc fklxbm,cw_khfkjl.gysbh,cw_khfkjl.ddbh,cw_khfkjl.fkje,zffsmc,b.fklxmc zckx,cw_khfkjl.zcgysbh,cw_khfkjl.zcddbh,DECODE(skdd,'1','不需审核','2','需审核'),DECODE(dsksjbz,'N','未审核','Y',' 审核通过','M','审核未通过'),cw_khfkjl.sjbh,cw_khfkjl.skr,cw_khfkjl.sksj,dwmc,cw_khfkjl.sjr,cw_khfkjl.sjsj,DECODE(scbz,'N','未删除','Y','删除'),scr,scsj,DECODE(cw_khfkjl.gljlbz,'N','非关联','Y','关联'),cw_khfkjl.glxh,cw_khfkjl.bz  ";
	ls_sql+=" FROM cw_khfkjl,crm_khxx,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm  ";
	ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh(+) and cw_khfkjl.skdw=sq_dwxx.dwbh and cw_khfkjl.fklxbm=a.fklxbm";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.zckx=b.fklxbm(+)";
	ls_sql+=" and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and (cw_khfkjl.skdd='1' OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y'))  ";
	ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and cw_khfkjl.fklxbm='23'  ";
	ls_sql+=" and cw_khfkjl.scbz='N'  ";
    ls_sql+=" order by fklxbm,fkxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);


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
  <B><font size="3">主材实收款</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">合同号</td>
	<td  width="3%">客户姓名</td>
	<td  width="8%">房屋地址</td>
	<td  width="3%">客户类型</td>
	<td  width="3%">收款序号</td>
	<td  width="3%">收款类型</td>
	<td  width="6%">收款品牌</td>
	<td  width="3%">收款订单</td>
	<td  width="4%">实收款金额</td>
	<td  width="3%">支付方式</td>
	<td  width="4%">转帐款项</td>
	<td  width="6%">转帐品牌</td>
	<td  width="3%">转帐订单</td>
	<td  width="3%">是否需审核</td>
	<td  width="2%">审核标志</td>
	<td  width="5%">收据编号</td>
	<td  width="2%">收款人</td>
	<td  width="3%">收款时间</td>
	<td  width="5%">收款单位</td>
	<td  width="2%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="2%">删除标志</td>
	<td  width="2%">删除人</td>
	<td  width="3%">删除时间</td>
	<td  width="2%">关联记录标志</td>
	<td  width="3%">关联序号</td>
	<td  width="11%">备注</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>