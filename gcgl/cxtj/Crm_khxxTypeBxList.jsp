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
String ckjgbz=(String)session.getAttribute("ckjgbz");
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
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";

	String sjfw=null;
	sjfw=request.getParameter("sjfw");
	if (sjfw!=null)
	{
		sjfw=sjfw.trim();
		if (!(sjfw.equals("")))	wheresql+="  and (crm_khxx.bxjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD'))";
	}
	sjfw=request.getParameter("sjfw2");
	if (sjfw!=null)
	{
		sjfw=sjfw.trim();
		if (!(sjfw.equals("")))	wheresql+="  and (crm_khxx.bxjzsj<=TO_DATE('"+sjfw+"  23:59:59','YYYY-MM-DD hh24:mi:ss'))";
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



	if (ckjgbz.equals("Y"))
	{
		ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm,crm_khxx.hth,crm_khxx.lxfs,DECODE(kgzbz,'Y','已出','N','<font color=\"#FF00FF\">未出</font>'),DECODE(zt,'2','家装','4','集成','5','设计','3','<font color=\"#FF00FF\">已退单</font>'),ysgcjdmc,DECODE(crm_khxx.jzbz,'1','家装','2','公装'),crm_khxx.fwdz,crm_khxx.sjs,sgdmc||'('||DECODE(sq_sgd.sgdlx,'S0','非直属','S1','直属') sgd,crm_khxx.zjxm,crm_khxx.cxhdbm,DECODE(NVL(tgbz,'W'),'W','正常','N','<font color=\"#00FF00\">复工</font>','Y','<font color=\"#FF0000\">已停工</font>'),c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,DECODE(crm_khxx.gcsfyq,'1','未延期','2','延期'),crm_khxx.yqts,DECODE(czkbz,'0','','1','<font color=\"#FF0000\">未审核</font>','2','<font color=\"#00FF00\">已审核</font>'),zkl,ywy,a.dwmc qydm,sjjgrq,crm_khxx.bxkssj,crm_khxx.bxjzsj,crm_khxx.wdzgce,crm_khxx.qye,DECODE(crm_khxx.sffj,'Y','是','N','否'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','是','N','否'),b.dwmc rzsc,khlxmc";
	}
	else{
		ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm,crm_khxx.hth,crm_khxx.lxfs,DECODE(kgzbz,'Y','已出','N','<font color=\"#FF00FF\">未出</font>'),DECODE(zt,'2','家装','4','集成','5','设计','3','<font color=\"#FF00FF\">已退单</font>'),ysgcjdmc,DECODE(crm_khxx.jzbz,'1','家装','2','公装'),crm_khxx.fwdz,crm_khxx.sjs,sgdmc||'('||DECODE(sq_sgd.sgdlx,'S0','非直属','S1','直属') sgd,crm_khxx.zjxm,crm_khxx.cxhdbm,DECODE(NVL(tgbz,'W'),'W','正常','N','<font color=\"#00FF00\">复工</font>','Y','<font color=\"#FF0000\">已停工</font>'),c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,DECODE(crm_khxx.gcsfyq,'1','未延期','2','延期'),crm_khxx.yqts,DECODE(czkbz,'0','','1','<font color=\"#FF0000\">未审核</font>','2','<font color=\"#00FF00\">已审核</font>'),zkl,ywy,a.dwmc qydm,sjjgrq,crm_khxx.bxkssj,crm_khxx.bxjzsj,0,0,DECODE(crm_khxx.sffj,'Y','是','N','否'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','是','N','否'),b.dwmc rzsc,khlxmc";
	}
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd,dm_gcjdbm,dm_gcyszxmbm c,dm_gcyszxmbm d,dm_khlxbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.ybysxmbm=c.gcyszxmbm(+) and crm_khxx.zqysxmbm=d.gcyszxmbm(+) and crm_khxx.khlxbm=dm_khlxbm.khlxbm(+)";
	ls_sql+=" and crm_khxx.kbxbz='Y' ";
    ls_sql+=wheresql;
	ls_sql+=" order by crm_khxx.bxjzsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khxxTypeBxList.jsp","SelectTypeCrm_khxx.jsp","","");
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
  <B><font size="3">保修客户（售后）</font></B>
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(330);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">客户编号</td>
	<td  width="3%">客户姓名</td>
	<td  width="3%">合同号</td>
	<td  width="6%">联系方式</td>
	<td  width="2%">开工证</td>
	<td  width="2%">客户类型</td>
	<td  width="3%">工程进度</td>
	<td  width="2%">家装标志 </td>
	<td  width="8%">房屋地址</td>
	<td  width="3%">设计师</td>
	<td  width="4%">施工队</td>
	<td  width="2%">工程担当</td>
	<td  width="4%">参加促销活动</td>
	<td  width="2%">停工</td>
	<td  width="3%">隐蔽工程验收</td>
	<td  width="3%">中期验收</td>
	<td  width="2%">是否延期</td>
	<td  width="2%">总延期天数</td>
	<td  width="2%">超折扣审核</td>
	<td  width="2%">折扣率</td>
	<td  width="2%">业务员</td>
	<td  width="5%">签约店面</td>
	<td  width="3%">实际竣工日期</td>
	<td  width="3%">保修开始时间</td>
	<td  width="3%">保修截止时间</td>
	<td  width="4%">工程原报价</td>
	<td  width="4%">工程签约额</td>
	<td  width="2%">是否返卷</td>
	<td  width="3%">返卷总金额</td>
	<td  width="2%">公司承担返卷额</td>
	<td  width="2%">是否已认证</td>
	<td  width="4%">认证市场</td>
	<td  width="3%">关系客户</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

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

//-->
</script>
</html>