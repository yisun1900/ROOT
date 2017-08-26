<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;


	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	String dwbh=request.getParameter("dwbh");

	ls_sql=" SELECT n.dwmc zxdm,DECODE(zxzt,'0','未分配店面','1','分配店面','2','飞单审核未通过','3','已签约','4','飞单','5','飞单审核未通过') zt,crm_zxkhxx.hth,crm_zxkhxx.khxm,crm_zxkhxx.sjs,crm_zxkhxx.fwdz,a.fklxmc fklxbm,cw_khfkjl.fkje,zffsmc,b.fklxmc zckx,cw_khfkjl.zcgysbh,cw_khfkjl.fkxh,NVL2(cw_khfkjl.yfkbl,cw_khfkjl.yfkbl||'%',''),cw_khfkjl.yfkje,DECODE(skdd,'1','财务收','2','非财务代收'),DECODE(dsksjbz,'N','未审核','Y','审核通过','M','审核未通过'),cw_khfkjl.sjbh,cw_khfkjl.skr,cw_khfkjl.sksj,m.dwmc,cw_khfkjl.sjr,cw_khfkjl.sjsj,DECODE(scbz,'N','未删除','Y','删除'),scr,scsj,DECODE(cw_khfkjl.gljlbz,'N','非关联','Y','关联'),cw_khfkjl.glxh,cw_khfkjl.bz  ";
	ls_sql+=" FROM cw_khfkjl,crm_zxkhxx,sq_dwxx m,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,sq_dwxx n  ";
	ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh(+) and cw_khfkjl.skdw=m.dwbh and cw_khfkjl.fklxbm=a.fklxbm";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.zckx=b.fklxbm(+)";
	ls_sql+=" and crm_zxkhxx.zxdm=n.dwbh ";

	ls_sql+=" and (cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')) ";
	ls_sql+=" and (cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')) ";
	ls_sql+=" and (cw_khfkjl.scbz='N') ";
	ls_sql+=" and (crm_zxkhxx.ssfgs='"+dwbh+"') ";
	ls_sql+=" and (cw_khfkjl.fklxbm='53') ";
	ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
	ls_sql+=" order by crm_zxkhxx.zxdm,crm_zxkhxx.zxzt,crm_zxkhxx.khxm";


//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);
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
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("zxdm","1");//列参数对象加入Hash表
	spanColHash.put("zt","1");//列参数对象加入Hash表
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("fklxbm","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">设计费付款明细<B><font color="#FF0000">（注意：若店面收费而未上缴财务不记入）</font></B></font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">所属店面</td>
	<td  width="3%">客户类型</td>
	<td  width="3%">合同号</td>
	<td  width="3%">客户姓名</td>
	<td  width="3%">设计师</td>
	<td  width="8%">房屋地址</td>
	<td  width="4%">收款类型</td>
	<td  width="4%">实收款金额</td>
	<td  width="2%">支付方式</td>
	<td  width="4%">转出款项</td>
	<td  width="6%">转出款品牌</td>
	<td  width="3%">收款序号</td>
	<td  width="2%">应收款率</td>
	<td  width="4%">应收款金额</td>
	<td  width="3%">是否财务收款</td>
	<td  width="2%">代收款上缴</td>
	<td  width="5%">收据编号</td>
	<td  width="2%">收款人</td>
	<td  width="3%">收款时间</td>
	<td  width="5%">收款单位</td>
	<td  width="2%">财务收款人</td>
	<td  width="3%">财务收款时间</td>
	<td  width="2%">删除标志</td>
	<td  width="2%">删除人</td>
	<td  width="3%">删除时间</td>
	<td  width="2%">关联记录标志</td>
	<td  width="2%">关联序号</td>
	<td  width="16%">备注</td>
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
