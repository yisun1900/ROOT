<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String dwbh=request.getParameter("dwbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	


//	ls_sql=" SELECT crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,'已签约' zt,a.fklxmc fklxbm,cw_khfkjl.fkje,zffsmc,cw_khfkjl.fkxh,DECODE(skdd,'1','财务收','2','非财务代收'),DECODE(dsksjbz,'N','未审核','Y','审核通过','M','审核未通过'),cw_khfkjl.sjbh,cw_khfkjl.skr,cw_khfkjl.sksj,dwmc,cw_khfkjl.sjr,cw_khfkjl.sjsj,DECODE(cw_khfkjl.gljlbz,'N','非关联','Y','关联'),cw_khfkjl.glxh,cw_khfkjl.bz  ";
//	ls_sql+=" FROM cw_khfkjl,crm_khxx,sq_dwxx,cw_fklxbm a,cw_zffsbm  ";
//	ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh(+) and cw_khfkjl.skdw=sq_dwxx.dwbh and cw_khfkjl.fklxbm=a.fklxbm";
//	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm ";
//	ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
//	ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//	ls_sql+=" and cw_khfkjl.scbz='N' ";//N：未删除；Y：已删除
//	ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
//	ls_sql+=" and crm_khxx.dwbh='"+dwbh+"'";
//
// 	ls_sql+=" UNION ALL ";

	ls_sql=" SELECT crm_zxkhxx.hth,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,DECODE(zxzt,'0','未分配店面','1','分配店面','2','飞单审核未通过','3','已签约','4','飞单','5','飞单审核未通过') zt,a.fklxmc fklxbm,cw_khfkjl.fkje,zffsmc,cw_khfkjl.fkxh,DECODE(skdd,'1','财务收','2','非财务代收'),DECODE(dsksjbz,'N','未审核','Y','审核通过','M','审核未通过'),cw_khfkjl.sjbh,cw_khfkjl.skr,cw_khfkjl.sksj,dwmc,cw_khfkjl.sjr,cw_khfkjl.sjsj,DECODE(cw_khfkjl.gljlbz,'N','非关联','Y','关联'),cw_khfkjl.glxh,cw_khfkjl.bz  ";
	ls_sql+=" FROM cw_khfkjl,crm_zxkhxx,sq_dwxx,cw_fklxbm a,cw_zffsbm  ";
	ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh(+) and cw_khfkjl.skdw=sq_dwxx.dwbh and cw_khfkjl.fklxbm=a.fklxbm";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm ";
	ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and cw_khfkjl.scbz='N' ";//N：未删除；Y：已删除
	ls_sql+=" and cw_khfkjl.fklxbm='53' ";
	//ls_sql+=" and crm_zxkhxx.zxzt!='3'  ";//53：设计费
	ls_sql+=" and crm_zxkhxx.zxdm='"+dwbh+"'";
 
	
	ls_sql+=" order by khxm,fklxbm,fkxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);

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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">合同号</td>
	<td  width="4%">客户姓名</td>
	<td  width="11%">房屋地址</td>
	<td  width="5%">客户类型</td>
	<td  width="3%">收款类型</td>
	<td  width="5%">实收款金额</td>
	<td  width="3%">支付方式</td>
	<td  width="4%">收款序号</td>
	<td  width="5%">是否财务收款</td>
	<td  width="3%">代收款上缴</td>
	<td  width="5%">收据编号</td>
	<td  width="3%">收款人</td>
	<td  width="5%">收款时间</td>
	<td  width="5%">收款单位</td>
	<td  width="3%">财务收款人</td>
	<td  width="5%">财务收款时间</td>
	<td  width="5%">关联记录标志</td>
	<td  width="3%">关联序号</td>
	<td  width="19%">备注</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printSum();
	pageObj.displayFoot();
%> 

</body>
</html>
