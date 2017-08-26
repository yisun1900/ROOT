<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"030103")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%
String kkbbz=(String)session.getAttribute("kkbbz");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

String myxssl="30";
	

String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String cxhdbm=request.getParameter("cxhdbm");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	


	ls_sql="SELECT crm_zxkhxx.khbh as khbh,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,sjs,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','飞单审核未通过','3','已签约','4','飞单','5','飞单审核未通过') as crm_zxkhxx_zxzt,DECODE(shbz,'N','未审核','Y','审核'),DECODE(ysshbz,'N','未审核','Y','通过','M','审核未通过'),zjzbjsj,dzbjze,bjjbmc,qsjhtsj,sjhtje,lfdj,jlfdjsj,crm_zxkhxx.cxhdbm,hddj,jhddjsj,sjf,jsjfsj,lfsj,ctsj,cxgtsj,csgtsj,DECODE(crm_zxkhxx.jzbz,'1','家装','2','公装'),b.dwmc as zxdm,ywy,sbyymc,lrsj,a.dwmc zxdjbm,fwlxmc as crm_zxkhxx_fwlxbm";
	ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b,dm_sbyybm,bdm_bjjbbm,jc_cxhd ";
	ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
	ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and jc_cxhd.cxhdbm='"+cxhdbm+"' ";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and (crm_zxkhxx.cxhdbm=jc_cxhd.cxhdmc or crm_zxkhxx.cxhdbmxq=jc_cxhd.cxhdmc or crm_zxkhxx.cxhdbmzh=jc_cxhd.cxhdmc)";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	
		{
			ls_sql+=" and  (crm_zxkhxx.fgsbh='"+fgs+"')";
			//wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))
		{
			ls_sql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
			//wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
	}
	
	//ls_sql+=wheresql;
	//ls_sql+=ordersql;

	//out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("viewZxkhxx.jsp","","","");
	if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
	{
		pageObj.setPageRow(Integer.parseInt(myxssl));
	}
	else{
		pageObj.setPageRow(25);
	}
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
  <B><font size="3">咨询客户--查询</font></B>
</CENTER>

<div style="height:100%;width:100%;overflow:auto;">

<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320,2,2);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">客户编号</td>
	<td  width="3%">姓名</td>
	<td  width="8%">房屋地址</td>
	<td  width="3%">设计师</td>
	<td  width="4%">咨询状态</td>
	<td  width="2%">信息审核</td>
	<td  width="2%">预算审核</td>
	<td  width="3%">做报价时间</td>
	<td  width="3%">电子报价总额</td>
	<td  width="3%">报价级别</td>
	<td  width="3%">签设计合同时间</td>
	<td  width="3%">设计合同金额</td>
	<td  width="3%">量房订金</td>
	<td  width="3%">交量房订金时间</td>
	<td  width="5%">参加促销活动</td>
	<td  width="3%">活动订金</td>
	<td  width="3%">交活动订金时间</td>
	<td  width="3%">实收设计费</td>
	<td  width="3%">交设计费时间</td>
	<td  width="3%">量房时间</td>
	<td  width="3%">出平面图时间</td>
	<td  width="3%">出效果图时间</td>
	<td  width="3%">出施工图时间</td>
	<td  width="2%">家装标志</td>
	<td  width="5%">咨询店面</td>
	<td  width="3%">业务员</td>
	<td  width="5%">失败原因</td>
	<td  width="3%">录入时间</td>
	<td  width="5%">咨询登记部门</td>
	<td  width="3%">房屋类型</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 
</div>

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