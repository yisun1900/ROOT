<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
	String sjs=cf.GB2Uni(cf.getParameter(request,"sjs"));
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String jzbz=request.getParameter("jzbz");

	String wheresql="";

	wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	if (!jzbz.equals("0"))
	{
		wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
	}

	ls_sql="SELECT '',sjs,hth,khxm,fwdz,DECODE(crm_khxx.jzbz,'1','家装','2','公装'),cxhdbm,wdzgce,TO_CHAR(zkl),qye,suijinbfb||'%',suijin,guanlif,qye+NVL(suijin,0)+NVL(guanlif,0),TO_CHAR(jzkscsj,'YYYY-MM-DD'),TO_CHAR(cwjzkscsj,'YYYY-MM-DD'),sjf,glf,zjxje,zhzjxje,zjxsuijin,zjxguanlif,zhzjxje+NVL(zjxsuijin,0)+NVL(zjxguanlif,0),qye+NVL(suijin,0)+NVL(guanlif,0)+zhzjxje+NVL(zjxsuijin,0)+NVL(zjxguanlif,0),NVL(suijin,0)+NVL(zjxsuijin,0),DECODE(crm_khxx.sffj,'Y','返卷','N','否'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','认证','N','否'),b.dwmc rzsc,a.dwmc qydm,TO_CHAR(lrsj,'YYYY-MM-DD HH24:MI'),TO_CHAR(qyrq,'YYYY-MM-DD'),DECODE(TO_CHAR(lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'是','<font color=\"#FF0000\">跨月</font>'),sgdmc sgd,zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.sjs='"+sjs+"' and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt in('2','5')";
	ls_sql+=wheresql;
	ls_sql+=" order by lrsj";

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
  <B><font size="3">设计师签单明细（<%=sjs%>）
  <BR>(统计时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="350%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">设计师</td>
	<td  width="2%">合同号</td>
	<td  width="2%">姓名</td>
	<td  width="5%">房屋地址</td>
	<td  width="2%">家装标志</td>
	<td  width="7%">促销活动</td>
	<td  width="3%">未打折工程额(不含税金管理费)</td>
	<td  width="1%">折扣率</td>
	<td  width="3%">工程签约额(不含税金管理费)</td>
	<td  width="2%">税率</td>
	<td  width="3%">税金</td>
	<td  width="3%">管理费</td>
	<td  width="3%">家装业绩(工程+税金+管理费)</td>

	<td  width="3%">首次付家装款时间</td>
	<td  width="3%">财务首次收家装款时间</td>
	<td  width="3%">设计费</td>
	<td  width="3%">服务费</td>
	<td  width="3%">折前增减项(不含税金管理费)</td>
	<td  width="3%">折后工程增减项(不含税金管理费)</td>
	<td  width="3%">增减项税金(折后)</td>
	<td  width="3%">增减项管理费(折后)</td>
	<td  width="3%">增减项小计(工程+税金+管理费)</td>
	<td  width="3%">增减后总额(工程+税金+管理费) </td>
	<td  width="3%">增减后税金总额</td>
	<td  width="2%">是否返卷</td>
	<td  width="3%">返卷总金额</td>
	<td  width="3%">公司承担返卷额</td>
	<td  width="2%">是否认证</td>
	<td  width="3%">认证市场</td>
	<td  width="4%">签约店面</td>
	<td  width="4%">录入时间</td>
	<td  width="2%">签约日期</td>
	<td  width="1%">当月录入</td>
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