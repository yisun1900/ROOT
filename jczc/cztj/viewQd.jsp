<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"050103")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%
String ckjgbz=(String)session.getAttribute("ckjgbz");
String kkbbz=(String)session.getAttribute("kkbbz");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

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
	
	String myxssl="30";
	


	if (ckjgbz.equals("Y"))
	{
		ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm,crm_khxx.hth,crm_khxx.smhtbh,DECODE(kgzbz,'Y','已出','N','<font color=\"#FF00FF\">未出</font>'),DECODE(zt,'2','家装','4','集成','5','设计','3','<font color=\"#FF00FF\">已退单</font>'),ysgcjdmc,DECODE(crm_khxx.jzbz,'1','家装','2','公装'),crm_khxx.fwdz,crm_khxx.sjs,sgdmc||'('||DECODE(sq_sgd.sgdlx,'S0','非直属','S1','直属') sgd,crm_khxx.zjxm,crm_khxx.cxhdbm,DECODE(NVL(tgbz,'W'),'W','正常','N','<font color=\"#00FF00\">复工</font>','Y','<font color=\"#FF0000\">已停工</font>'),c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,DECODE(crm_khxx.gcsfyq,'1','未延期','2','延期'),crm_khxx.yqts,zkl,crm_khxx.ywy,a.dwmc qydm,crm_khxx.qyrq,crm_khxx.pdsj,crm_khxx.kgrq,crm_khxx.sjkgrq,crm_khxx.jgrq,crm_khxx.sjjgrq,crm_khxx.wdzgce,crm_khxx.qye,crm_khxx.zqguanlif,crm_khxx.guanlif,crm_khxx.suijinbfb||'%' suijinbfb,crm_khxx.suijin,crm_khxx.wdzgce+crm_khxx.zqguanlif+crm_khxx.suijin as zqqyzj,crm_khxx.qye+crm_khxx.guanlif+crm_khxx.suijin as zhqyzj,crm_khxx.sjf,crm_khxx.zjxje,crm_khxx.zhzjxje,crm_khxx.zqzjxguanlif,crm_khxx.zjxguanlif,crm_khxx.zjxsuijin,crm_khxx.zjxje+crm_khxx.zqzjxguanlif+crm_khxx.zjxsuijin as zqzjxzj,crm_khxx.zhzjxje+crm_khxx.zjxguanlif+crm_khxx.zjxsuijin as zhzjxzj,crm_khxx.sgebfb||'%',crm_khxx.sge,crm_khxx.clf,DECODE(crm_khxx.sffj,'Y','是','N','否'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','是','N','否'),b.dwmc rzsc,khlxmc";
	}
	else{
		ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm,crm_khxx.hth,crm_khxx.smhtbh,DECODE(kgzbz,'Y','已出','N','<font color=\"#FF00FF\">未出</font>'),DECODE(zt,'2','家装','4','集成','5','设计','3','<font color=\"#FF00FF\">已退单</font>'),ysgcjdmc,DECODE(crm_khxx.jzbz,'1','家装','2','公装'),crm_khxx.fwdz,crm_khxx.sjs,sgdmc||'('||DECODE(sq_sgd.sgdlx,'S0','非直属','S1','直属') sgd,crm_khxx.zjxm,crm_khxx.cxhdbm,DECODE(NVL(tgbz,'W'),'W','正常','N','<font color=\"#00FF00\">复工</font>','Y','<font color=\"#FF0000\">已停工</font>'),c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,DECODE(crm_khxx.gcsfyq,'1','未延期','2','延期'),crm_khxx.yqts,zkl,crm_khxx.ywy,a.dwmc qydm,crm_khxx.qyrq,crm_khxx.pdsj,crm_khxx.kgrq,crm_khxx.sjkgrq,crm_khxx.jgrq,crm_khxx.sjjgrq,'' wdzgce,'' qye,'' zqguanlif,'' guanlif,'' suijinbfb,'' suijin,'' zqqyzj,'' zhqyzj,'' sjf,'' zjxje,'' zhzjxje,'' zqzjxguanlif,'' zjxguanlif,'' zjxsuijin,'' zqzjxzj,'' zhzjxzj,'' sgebfb,'' sge,'' clf,DECODE(crm_khxx.sffj,'Y','是','N','否'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','是','N','否'),b.dwmc rzsc,khlxmc";
	}
	ls_sql+=" FROM crm_khxx,crm_zxkhxx,sq_dwxx a,sq_dwxx b,sq_sgd,dm_gcjdbm,dm_gcyszxmbm c,dm_gcyszxmbm d,dm_khlxbm,jc_cxhd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.ybysxmbm=c.gcyszxmbm(+) and crm_khxx.zqysxmbm=d.gcyszxmbm(+) and crm_khxx.khlxbm=dm_khlxbm.khlxbm(+)";
 	ls_sql+=" and crm_khxx.khbh=crm_zxkhxx.khbh ";
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
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("viewQd.jsp","","","");
	if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
	{
		pageObj.setPageRow(Integer.parseInt(myxssl));
	}
	else{
		pageObj.setPageRow(25);
	}
/*
//设置显示列
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_xb","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qye","crm_khxx_jcjjqye","crm_khxx_qyrq","crm_khxx_jsje","crm_khxx_gcjdbm","sq_dwxx_dwmc","crm_khxx_sgd","crm_khxx_zjxm"};
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
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.alignStr[8]="align='left'";
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
  <B><font size="3">签单查询-快速检索（包括退单、非家装客户）</font></B>
</CENTER>

<div style="height:100%;width:100%;overflow:auto;">

<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(540,2,2);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="70px">客户编号</td>
	<td  width="150px">客户姓名</td>
	<td  width="130px">合同号</td>
	<td  width="100px">书面合同编号</td>
	<td  width="70px">开工证</td>
	<td  width="70px">客户类型</td>
	<td  width="90px">工程进度</td>
	<td  width="70px">家装标志 </td>
	<td  width="310px">房屋地址</td>
	<td  width="90px">设计师</td>
	<td  width="140px">施工队</td>
	<td  width="90px">质检</td>
	<td  width="280px">参加促销活动</td>
	<td  width="70px">停工</td>
	<td  width="200px">隐蔽工程验收</td>
	<td  width="90px">中期验收</td>
	<td  width="70px">是否延期</td>
	<td  width="70px">总延期天数</td>
	<td  width="70px">折扣率</td>
	<td  width="70px">业务员</td>
	<td  width="150px">签约店面</td>
	<td  width="90px">签约日期</td>
	<td  width="90px">派单时间</td>
	<td  width="90px">合同开工日期</td>
	<td  width="90px">实际开工日期</td>
	<td  width="90px">合同竣工日期</td>
	<td  width="90px">实际竣工日期</td>
	<td  width="120px">工程原报价</td>
	<td  width="120px">工程签约额</td>
	<td  width="120px">折前管理费</td>
	<td  width="120px">折后管理费</td>
	<td  width="60px">税金百分比</td>
	<td  width="120px">税金</td>
	<td  width="120px">签约额+管理费+税金(折前)</td>
	<td  width="120px">签约额+管理费+税金(折后)</td>
	<td  width="120px">设计费</td>
	<td  width="90px">折前增减项</td>
	<td  width="90px">折后增减项</td>
	<td  width="90px">折前增减项管理费</td>
	<td  width="90px">折后增减项管理费</td>
	<td  width="90px">增减项税金</td>
	<td  width="120px">增减项+增减项管理费+增减项税金(折前)</td>
	<td  width="120px">增减项+增减项管理费+增减项税金(折后)</td>
	<td  width="90px">施工额百分比</td>
	<td  width="90px">施工额</td>
	<td  width="90px">材料费</td>
	<td  width="70px">是否返卷</td>
	<td  width="90px">返卷总金额</td>
	<td  width="70px">公司承担返卷额</td>
	<td  width="70px">是否已认证</td>
	<td  width="150px">认证市场</td>
	<td  width="120px">关系客户</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 
</div>

</body>
<script  LANGUAGE="javascript">
<!--
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