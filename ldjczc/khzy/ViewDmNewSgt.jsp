<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

	String ls_sql=null;
	String wheresql="";
	
	String fgsbh=request.getParameter("fgsbh");
	String dwbh=request.getParameter("dwbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");




	ls_sql="SELECT crm_zxkhxx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,sjs,ywy,ysy,khjl,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过'),scsmsj,smcs,zjsmsj,zxhfsj,qdsj,crm_zxkhxx.sbsj,DECODE(ysshbz,'N','未审核','Y','通过','M','审核未通过'),zjzbjsj,dzbjze,bjjbmc,qsjhtsj,sjhtje,lfdj,jlfdjsj,cxhdbm,hddj,jhddjsj,sjf,jsjfsj,lfsj,ctsj,cxgtsj,csgtsj,DECODE(crm_zxkhxx.jzbz,'1','家装','2','公装'),b.dwmc as zxdm,sbyymc,lrsj,a.dwmc zxdjbm,fwlxmc,xxlysm";
	ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b,dm_sbyybm,bdm_bjjbbm ";
	ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
	ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";

	ls_sql+=" and crm_zxkhxx.ssfgs='"+fgsbh+"'";
	ls_sql+=" and crm_zxkhxx.zxdm='"+dwbh+"'";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息
	ls_sql+=" and crm_zxkhxx.zxzt!='6'";//6：散客

	ls_sql+=" and crm_zxkhxx.csgtbz='Y'";


	ls_sql+=" order by crm_zxkhxx.lrsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);


//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >

<CENTER >
  <B><font size="3">新客户（出施工图）</font></B>
</CENTER>


<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">客户编号</td>
	<td  width="2%">姓名</td>
	<td  width="5%">房屋地址</td>
	<td  width="2%">设计师</td>
	<td  width="2%">业务员</td>
	<td  width="2%">预算员</td>
	<td  width="2%">客户经理</td>
	<td  width="3%">咨询状态</td>

	<td  width="2%">首次上门时间</td>
	<td  width="1%">上门次数</td>
	<td  width="2%">最近上门时间</td>
	<td  width="2%">最新回访时间</td>
	<td  width="2%">签单时间</td>
	<td  width="2%">飞单时间</td>


	<td  width="2%">预算审核</td>
	<td  width="2%">做报价时间</td>
	<td  width="3%">电子报价总额</td>
	<td  width="2%">报价级别</td>
	<td  width="2%">签设计合同时间</td>
	<td  width="3%">设计合同金额</td>
	<td  width="2%">量房订金</td>
	<td  width="2%">交量房订金时间</td>
	<td  width="4%">参加促销活动</td>
	<td  width="2%">活动订金</td>
	<td  width="2%">交活动订金时间</td>
	<td  width="3%">实收设计费</td>
	<td  width="3%">交设计费时间</td>
	<td  width="3%">量房时间</td>
	<td  width="3%">出平面图时间</td>
	<td  width="3%">出效果图时间</td>
	<td  width="3%">出施工图时间</td>
	<td  width="2%">家装标志</td>
	<td  width="4%">咨询店面</td>
	<td  width="5%">失败原因</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">咨询登记部门</td>
	<td  width="3%">房屋类型</td>
	<td  width="34%">信息来源说明</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>