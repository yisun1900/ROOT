<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	
	ls_sql="SELECT '',crm_zxkhxx.lfdj,TO_CHAR(crm_zxkhxx.jlfdjsj,'YYYY-MM-DD') jlfdjsj,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,DECODE(crm_khxx.jzbz,'1','家装','2','公装') jzbz,crm_khxx.cxhdbm,crm_khxx.wdzgce,TO_CHAR(crm_khxx.zkl) zkl,crm_khxx.qye,crm_khxx.suijinbfb||'%' suijinbfb,crm_khxx.suijin,crm_khxx.sjf,crm_khxx.zjxje,crm_khxx.zhzjxje,crm_khxx.zjxsuijin,NVL(crm_khxx.zhzjxje,0)+crm_khxx.qye zjhze,NVL(crm_khxx.suijin,0)+NVL(crm_khxx.zjxsuijin,0) suijinze,DECODE(crm_khxx.sffj,'Y','返卷','N','否') sffj,crm_khxx.fjje,DECODE(crm_khxx.sfyrz,'Y','认证','N','否') sfyrz,b.dwmc rzsc,a.dwmc qydm,TO_CHAR(crm_khxx.lrsj,'YYYY-MM-DD HH24:MI') lrsj,TO_CHAR(crm_khxx.qyrq,'YYYY-MM-DD') qyrq,DECODE(TO_CHAR(crm_khxx.lrsj,'MM')-TO_CHAR(crm_khxx.qyrq,'MM'),0,'是','<font color=\"#FF0000\">跨月</font>') dylr,sgdmc sgd,crm_khxx.zjxm";
	ls_sql+=" FROM crm_khxx,crm_zxkhxx,sq_dwxx a,sq_dwxx b,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_khxx.khbh=crm_zxkhxx.khbh";
    ls_sql+=" and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt!='3'";
	ls_sql+=" and crm_zxkhxx.lfdjbz='Y' ";
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by crm_khxx.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数
	pageObj.setDateType("long");//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("fwdz",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">订金签单数 
  <BR>(统计时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">量房订金</td>
	<td  width="3%">交量房订金时间</td>
	<td  width="3%">合同号</td>
	<td  width="3%">姓名</td>
	<td  width="8%">房屋地址</td>
	<td  width="2%">家装标志</td>
	<td  width="4%">促销活动</td>
	<td  width="4%">未打折金额</td>
	<td  width="3%">折扣率</td>
	<td  width="4%">签约额（无税）</td>
	<td  width="3%">税率</td>
	<td  width="4%">税金</td>
	<td  width="4%">设计费</td>
	<td  width="4%">折前增减项</td>
	<td  width="4%">折后增减项（无税）</td>
	<td  width="4%">增减项税金</td>
	<td  width="4%">增减后总额 </td>
	<td  width="4%">增减后税金总额</td>
	<td  width="2%">是否返卷</td>
	<td  width="3%">返卷总金额</td>
	<td  width="2%">是否认证</td>
	<td  width="5%">认证市场</td>
	<td  width="6%">签约店面</td>
	<td  width="5%">录入时间</td>
	<td  width="3%">签约日期</td>
	<td  width="2%">当月录入</td>
	<td  width="2%">施工队</td>
	<td  width="2%">质检员</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>