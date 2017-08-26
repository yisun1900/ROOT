<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='050118'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[客户分类查询]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>

<%
String kkbbz=(String)session.getAttribute("kkbbz");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (!(dwbh.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+dwbh+"')";

	String sjfw=null;
	sjfw=request.getParameter("sjfw");
	if (sjfw!=null)
	{
		sjfw=sjfw.trim();
		if (!(sjfw.equals("")))	wheresql+="  and (crm_zxkhxx.lfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD'))";
	}
	sjfw=request.getParameter("sjfw2");
	if (sjfw!=null)
	{
		sjfw=sjfw.trim();
		if (!(sjfw.equals("")))	wheresql+="  and (crm_zxkhxx.lfsj<=TO_DATE('"+sjfw+"  23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}


	String myxssl=null;
	if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
	{
		String xsfg=request.getParameter("xsfg");
		if (xsfg.equals("2"))
		{
			pageObj.setType("EXCEL",response);
		}

		myxssl=request.getParameter("myxssl");
	}


	ls_sql="SELECT crm_zxkhxx.khbh as khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.lxfs,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','飞单审核未通过','3','已签约','4','飞单','5','飞单审核未通过') as crm_zxkhxx_zxzt,DECODE(shbz,'N','未审核','Y','审核'),DECODE(sfzdzbj,'N','未做','Y','已做') sfzdzbj,dzbjze,crm_zxkhxx.zcbjje,bjjbmc,DECODE(lfdjbz,'N','未交','Y','已交','T','退订金') lfdjbz,lfdj,jlfdjsj,cxhdbm,DECODE(hddjbz,'N','未交','Y','已交','T','退订金') hddjbz,hddj,jhddjsj,DECODE(sjfbz,'N','未交','Y','已交','T','退设计费') sjfbz,sjf,lfsj,DECODE(crm_zxkhxx.lfbz,'N','未量房','Y','已量房'),DECODE(crm_zxkhxx.ctbz,'N','未出图','Y','已出图'),DECODE(crm_zxkhxx.jzbz,'1','家装','2','公装'),b.dwmc as zxdm,sjs,ywy,sbyymc,lrsj,a.dwmc zxdjbm,fwlxmc as crm_zxkhxx_fwlxbm";
	ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b,dm_sbyybm,bdm_bjjbbm ";
	ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
	ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_zxkhxx.zxzt in('0','1','5')";
	ls_sql+=" and crm_zxkhxx.lfbz='Y'";
	ls_sql+=wheresql;
	ls_sql+=" order by crm_zxkhxx.lfsj";
//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_zxkhxxTypeLfList.jsp","SelectTypeCrm_khxx.jsp","","");
	if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
	{
		pageObj.setPageRow(Integer.parseInt(myxssl));
	}
	else{
		pageObj.setPageRow(25);
	}

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

}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
  <B><font size="3">量房客户（未签单）</font></B>
</CENTER>


<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">客户编号</td>
	<td  width="3%">姓名</td>
	<td  width="9%">房屋地址</td>
	<td  width="7%">联系方式</td>
	<td  width="3%">咨询状态</td>
	<td  width="2%">审核标志</td>
	<td  width="2%">电子报价</td>
	<td  width="3%">电子报价总额</td>
	<td  width="3%">主材报价</td>
	<td  width="3%">报价级别</td>
	<td  width="2%">量房订金标志</td>
	<td  width="3%">量房订金</td>
	<td  width="3%">交量房订金时间</td>
	<td  width="5%">参加促销活动</td>
	<td  width="2%">活动订金标志</td>
	<td  width="3%">活动订金</td>
	<td  width="3%">交活动订金时间</td>
	<td  width="2%">设计费标志</td>
	<td  width="3%">设计费</td>
	<td  width="3%">量房时间</td>
	<td  width="2%">量房标志</td>
	<td  width="2%">出图标志</td>
	<td  width="2%">家装标志</td>
	<td  width="5%">咨询店面</td>
	<td  width="3%">设计师</td>
	<td  width="3%">业务员</td>
	<td  width="6%">失败原因</td>
	<td  width="3%">录入时间</td>
	<td  width="5%">咨询登记部门</td>
	<td  width="3%">房屋类型</td>
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


//-->
</script>
</html>