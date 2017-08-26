<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";
	String wheresql1="";
	String wheresql2="";

	String dwbh=request.getParameter("fgsbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String dm=request.getParameter("dwbh");
//out.println(dm);

	String jzbz=request.getParameter("jzbz");
	if (!jzbz.equals("0"))
	{
		wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
	}
	if (dm!=null)
	{
		wheresql1+=" and  crm_khxx.dwbh='"+dm+"'";
		wheresql2+=" and  crm_khxx.dwbh='"+dm+"'";
	}

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");

	wheresql+=" and cwjzkscsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and cwjzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


	ls_sql="SELECT '',sjs,hth,khxm,fwdz,DECODE(crm_khxx.jzbz,'1','家装','2','工装'),cxhdbm,wdzgce,TO_CHAR(zkl),qye,zjxje,NVL(zjxje,0)+qye,sjf,DECODE(crm_khxx.sffj,'Y','返卷','N','否'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','认证','N','否'),b.dwmc rzsc,a.dwmc qydm,TO_CHAR(lrsj,'YYYY-MM-DD HH24:MI'),TO_CHAR(qyrq,'YYYY-MM-DD'),DECODE(TO_CHAR(lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'是','<font color=\"#FF0000\">跨月</font>'),sgdmc sgd,zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and a.cxbz='N'";
	ls_sql+=wheresql1;
	ls_sql+=" and crm_khxx.zt in ('2','3') ";
	ls_sql+=wheresql;
	ls_sql+=" order by sjs,lrsj";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数
	pageObj.setDateType("long");//设置每页显示记录数

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
  <B><font size="3">分公司签约明细（<%=dwmc%>）
  <BR>(时间范围：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">设计师</td>
	<td  width="4%">合同号</td>
	<td  width="3%">姓名</td>
	<td  width="10%">房屋地址</td>
	<td  width="3%">家装标志</td>
	<td  width="5%">促销活动</td>
	<td  width="6%">未打折金额</td>
	<td  width="3%">折扣率</td>
	<td  width="6%">工程签约额</td>
	<td  width="5%">增减项</td>
	<td  width="6%">增减后总额 </td>
	<td  width="5%">设计费</td>
	<td  width="2%">是否返卷</td>
	<td  width="4%">返卷总金额</td>
	<td  width="4%">公司承担返卷额</td>
	<td  width="2%">是否认证</td>
	<td  width="5%">认证市场</td>
	<td  width="6%">签约店面</td>
	<td  width="4%">录入时间</td>
	<td  width="4%">签约日期</td>
	<td  width="2%">当月录入</td>
	<td  width="3%">施工队</td>
	<td  width="3%">质检员</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
	pageObj.printSum();
%> 
</table>


<%
	ybl.common.PageObject pageObj1=new ybl.common.PageObject();

	ls_sql="SELECT '',crm_khxx.sjs,hth,crm_khxx.khxm,crm_khxx.fwdz,DECODE(crm_khxx.jzbz,'1','家装','2','工装'),cxhdbm,wdzgce,TO_CHAR(zkl),qye,zjxje,NVL(zjxje,0)+qye,sjf,DECODE(crm_khxx.sffj,'Y','返卷','N','否'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','认证','N','否'),b.dwmc rzsc,a.dwmc qydm,TO_CHAR(crm_khxx.lrsj,'YYYY-MM-DD HH24:MI'),TO_CHAR(qyrq,'YYYY-MM-DD'),DECODE(TO_CHAR(crm_khxx.lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'是','<font color=\"#FF0000\">跨月</font>'),sgdmc sgd,crm_khxx.zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd,crm_tddj";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and a.cxbz='N'";
	ls_sql+=wheresql1;
	ls_sql+=" and crm_khxx.zt='3' ";
	ls_sql+=" and crm_tddj.tdxh=crm_khxx.tdxh and crm_tddj.lrsj<=TO_DATE('"+sjfw+"','YYYY-MM-DD')  and crm_tddj.lrsj>=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=wheresql;
	ls_sql+=" order by crm_khxx.sjs,crm_khxx.lrsj";

//	out.println(ls_sql);

    pageObj1.sql=ls_sql;
//进行对象初始化
	pageObj1.initPage("","","","");
	pageObj1.setPageRow(50000);//设置每页显示记录数
	pageObj1.setDateType("long");//设置每页显示记录数

//设置显示合并列
	Hashtable spanColHash1=new Hashtable();
	spanColHash1.put("sjs","1");//列参数对象加入Hash表
	pageObj1.setSpanCol(spanColHash1);//列参数对象加入Hash表
//设置列超级连接
	Hashtable coluParmHash1=new Hashtable();
	ColuParm coluParm1=null;

	coluParm1=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"hth"};//设置列参数：coluParm.key的主键
	coluParm1.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm1.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm1.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash1.put("fwdz",coluParm1);//列参数对象加入Hash表
	pageObj1.setColuLink(coluParmHash1);//列参数对象加入Hash表


%>
<CENTER >
  <B><font size="3">非本时间段退单客户（<%=dwmc%>）<font color=red>+</font>
  <BR>(时间范围：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">设计师</td>
	<td  width="4%">合同号</td>
	<td  width="3%">姓名</td>
	<td  width="10%">房屋地址</td>
	<td  width="3%">家装标志</td>
	<td  width="5%">促销活动</td>
	<td  width="6%">未打折金额</td>
	<td  width="3%">折扣率</td>
	<td  width="6%">工程签约额</td>
	<td  width="5%">增减项</td>
	<td  width="6%">增减后总额 </td>
	<td  width="5%">设计费</td>
	<td  width="2%">是否返卷</td>
	<td  width="4%">返卷总金额</td>
	<td  width="4%">公司承担返卷额</td>
	<td  width="2%">是否认证</td>
	<td  width="5%">认证市场</td>
	<td  width="6%">签约店面</td>
	<td  width="4%">录入时间</td>
	<td  width="4%">签约日期</td>
	<td  width="2%">当月录入</td>
	<td  width="3%">施工队</td>
	<td  width="3%">质检员</td>
</tr>
<%
	pageObj1.out=out;
	pageObj1.getDate(1);
	pageObj1.printDate(true);
	pageObj1.printSum();
%> 
</table>

<%
	ybl.common.PageObject pageObj2=new ybl.common.PageObject();

	ls_sql="SELECT '',crm_khxx.sjs,hth,crm_khxx.khxm,crm_khxx.fwdz,DECODE(crm_khxx.jzbz,'1','家装','2','工装'),cxhdbm,wdzgce,TO_CHAR(zkl),qye,zjxje,NVL(zjxje,0)+qye,sjf,DECODE(crm_khxx.sffj,'Y','返卷','N','否'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','认证','N','否'),b.dwmc rzsc,a.dwmc qydm,TO_CHAR(crm_khxx.lrsj,'YYYY-MM-DD HH24:MI'),TO_CHAR(qyrq,'YYYY-MM-DD'),DECODE(TO_CHAR(crm_khxx.lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'是','<font color=\"#FF0000\">跨月</font>'),sgdmc sgd,crm_khxx.zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd,crm_tddj";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and a.cxbz='N' and crm_khxx.cwjzkscsj is not null ";
	ls_sql+=wheresql1;
	ls_sql+=" and crm_khxx.zt='3' and (crm_khxx.khbh in (select khbh from cw_khfkjl where skdd='1' or (skdd='2' and   dsksjbz='Y') and cw_khfkjl.fgsbh='"+dwbh+"' ))";
	ls_sql+=" and crm_tddj.tdxh=crm_khxx.tdxh and crm_tddj.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  and crm_tddj.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=wheresql2;
	ls_sql+=" order by crm_khxx.sjs,crm_khxx.lrsj";

//	out.println(ls_sql);

    pageObj2.sql=ls_sql;
//进行对象初始化
	pageObj2.initPage("","","","");
	pageObj2.setPageRow(50000);//设置每页显示记录数
	pageObj2.setDateType("long");//设置每页显示记录数

//设置显示合并列
	Hashtable spanColHash2=new Hashtable();
	spanColHash2.put("sjs","1");//列参数对象加入Hash表
	pageObj2.setSpanCol(spanColHash2);//列参数对象加入Hash表
//设置列超级连接
	Hashtable coluParmHash2=new Hashtable();
	ColuParm coluParm2=null;

	coluParm2=new ColuParm();//生成一个列参数对象
	String[] coluKey2={"hth"};//设置列参数：coluParm.key的主键
	coluParm2.key=coluKey2;//设置列参数：coluParm.key的主键
	coluParm2.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm2.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash2.put("fwdz",coluParm2);//列参数对象加入Hash表
	pageObj2.setColuLink(coluParmHash2);//列参数对象加入Hash表


%>
<CENTER >
  <B><font size="3">非本时间段退单客户（<%=dwmc%>）<font color=red>&nbsp;&nbsp;-</font>
  <BR>(时间范围：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">设计师</td>
	<td  width="4%">合同号</td>
	<td  width="3%">姓名</td>
	<td  width="10%">房屋地址</td>
	<td  width="3%">家装标志</td>
	<td  width="5%">促销活动</td>
	<td  width="6%">未打折金额</td>
	<td  width="3%">折扣率</td>
	<td  width="6%">工程签约额</td>
	<td  width="5%">增减项</td>
	<td  width="6%">增减后总额 </td>
	<td  width="5%">设计费</td>
	<td  width="2%">是否返卷</td>
	<td  width="4%">返卷总金额</td>
	<td  width="4%">公司承担返卷额</td>
	<td  width="2%">是否认证</td>
	<td  width="5%">认证市场</td>
	<td  width="6%">签约店面</td>
	<td  width="4%">录入时间</td>
	<td  width="4%">签约日期</td>
	<td  width="2%">当月录入</td>
	<td  width="3%">施工队</td>
	<td  width="3%">质检员</td>
</tr>
<%
	pageObj2.out=out;
	pageObj2.getDate(1);
	pageObj2.printDate(true);
	pageObj2.printSum();
%> 
</table>
</body>
</html>
