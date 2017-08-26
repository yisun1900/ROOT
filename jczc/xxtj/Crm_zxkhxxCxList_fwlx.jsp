<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
String kkbbz=(String)session.getAttribute("kkbbz");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String zxdm=null;
	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";

	zxdm=request.getParameter("zxdm");
	if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";

	
	String sjfw=null;
	sjfw=request.getParameter("sjfw");
	if (sjfw!=null)
	{
		sjfw=sjfw.trim();
		if (!(sjfw.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY/MM/DD'))";
	}
	String sjfw2=null;
	sjfw2=request.getParameter("sjfw2");
	if (sjfw2!=null)
	{
		sjfw2=sjfw2.trim();
		if (!(sjfw2.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+"','YYYY/MM/DD'))";
	}


	ls_sql="SELECT crm_zxkhxx.khbh as khbh,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','飞单审核未通过','3','已签约','4','飞单','5','飞单审核未通过') as crm_zxkhxx_zxzt,DECODE(shbz,'N','未审核','Y','审核'),DECODE(sfzdzbj,'N','未做','Y','已做') sfzdzbj,dzbjze,crm_zxkhxx.zcbjje,bjjbmc,DECODE(lfdjbz,'N','未交','Y','已交','T','退订金') lfdjbz,lfdj,jlfdjsj,cxhdbm,DECODE(hddjbz,'N','未交','Y','已交','T','退订金') hddjbz,hddj,jhddjsj,DECODE(sjfbz,'N','未交','Y','已交','T','退设计费') sjfbz,sjf,jsjfsj,DECODE(crm_zxkhxx.jzbz,'1','家装','2','公装'),crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,b.dwmc as zxdm,sjs,ywy,sbyymc,lrsj,a.dwmc zxdjbm,fwlxmc as crm_zxkhxx_fwlxbm,crm_zxkhxx.hfrq as crm_zxkhxx_hfrq,DECODE(crm_zxkhxx.hdbz,'1','非回单','2','设计师回单','3','施工队回单','4','老客户回单','5','员工回单') as crm_zxkhxx_hdbz,crm_zxkhxx.bz  ";
	ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b,dm_sbyybm,bdm_bjjbbm ";
	ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
	ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";
	ls_sql+=wheresql;

	ls_sql+=" and crm_zxkhxx.fwlxbm is null";	
	ls_sql+=" order by crm_zxkhxx.lrsj";	

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_zxkhxxCxList_fj.jsp","","","");
	pageObj.setPageRow(40);

/*
//设置显示列
	String[] disColName={"khbh","crm_zxkhxx_khxm","crm_zxkhxx_xb","crm_zxkhxx_fwdz","crm_zxkhxx_lxfs","crm_zxkhxx_fwlxbm","crm_zxkhxx_sfxhf","crm_zxkhxx_hfrq","crm_zxkhxx_hflxbm","crm_zxkhxx_hdbz","crm_zxkhxx_zxzt","crm_zxkhxx_khlxbm"};
	pageObj.setDisColName(disColName);
*/

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
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>

</head>
<%
if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
{
	%>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
	<%
}
else{
	%>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
	<noscript><iframe scr="*.htm"></iframe></noscript>
	<%
}
%>

<CENTER >
  <B><font size="3">房屋类型空缺</font></B>
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">客户编号</td>
	<td  width="3%">姓名</td>
	<td  width="8%">房屋地址</td>
	<td  width="3%">咨询状态</td>
	<td  width="2%">审核标志</td>
	<td  width="2%">电子报价</td>
	<td  width="3%">电子报价总额</td>
	<td  width="3%">主材报价</td>
	<td  width="3%">报价级别</td>
	<td  width="2%">量房订金标志</td>
	<td  width="3%">量房订金</td>
	<td  width="3%">交量房订金时间</td>
	<td  width="4%">参加促销活动</td>
	<td  width="2%">活动订金标志</td>
	<td  width="3%">活动订金</td>
	<td  width="3%">交活动订金时间</td>
	<td  width="2%">设计费标志</td>
	<td  width="3%">设计费</td>
	<td  width="3%">交设计费时间</td>
	<td  width="2%">家装标志</td>
	<td  width="6%">联系方式</td>
	<td  width="5%">咨询店面</td>
	<td  width="3%">设计师</td>
	<td  width="3%">业务员</td>
	<td  width="4%">失败原因</td>
	<td  width="3%">录入时间</td>
	<td  width="5%">咨询登记部门</td>
	<td  width="3%">房屋类型</td>
	<td  width="3%">回访日期</td>
	<td  width="2%">回单标志</td>
	<td  width="6%">备注</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">

function KeyDown()
{ 

	if ((event.ctrlKey))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}

<%
	pageObj.printScript();
%> 

//-->
</script>
</html>