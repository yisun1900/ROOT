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
	String clgw=cf.GB2Uni(cf.getParameter(request,"clgw"));
	

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");



	ls_sql="SELECT '',hth,khxm,fwdz,bjjbmc,ysgcjdmc,crm_khxx.clgw,sjs,sgdmc,zjxm,wdzgce,TO_CHAR(zkl),qye,cxhdbm,zhljzjx,zqgczjf,zhgczjf,suijinbfb||'%',zqsuijin,suijin,glfbfb||'%',zqguanlif,guanlif,zqqtsf,zhqtsf,zqwjrqyexm,zhwjrqyexm,NVL(zqsjf,0)+NVL(sjhtsjf,0),NVL(sjf,0)+NVL(sjhtsjf,0) ,cwsfke,TO_CHAR(cwjzkscsj,'YYYY-MM-DD'),crm_khxx.fjje,crm_khxx.gsfje,a.dwmc qydm,yjjzsj,TO_CHAR(qyrq,'YYYY-MM-DD') ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd,bdm_bjjbbm,dm_gcjdbm  ,crm_tsjl,crm_tsbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm ";

			ls_sql+=" and crm_khxx.khbh=crm_tsjl.khbh ";
			ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh ";
			ls_sql+=" and crm_khxx.dwbh='"+dwbh+"' and crm_khxx.clgw='"+clgw+"'";
			ls_sql+=" and crm_tsjl.lx='1'";//1：投诉；2：报修
			ls_sql+=" and crm_tsjl.tsbxsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.tsbxsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_tsbm.tslxbm='23'";//23:家居投诉

	ls_sql+=" order by sjs,yjjzsj";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">材料员主材投诉（<%=dwmc%>:<%=clgw%>）
  <BR>(记入业绩时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="280%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">合同号</td>
	<td  width="2%">姓名</td>
	<td  width="6%">房屋地址</td>
	<td  width="2%">报价级别</td>
	<td  width="3%">工程进度</td>
	<td  width="2%">材料员</td>
	<td  width="2%">设计师</td>
	<td  width="2%">施工队</td>
	<td  width="2%">质检员</td>
	<td  width="3%">折前合同总额</td>
	<td  width="2%">折扣率</td>
	<td  width="3%">折后合同总额</td>
	<td  width="6%">促销活动</td>
	<td  width="3%">增减项</td>
	<td  width="3%">折前工程费</td>
	<td  width="3%">折后工程费</td>
	<td  width="2%">税率</td>
	<td  width="3%">折前税金</td>
	<td  width="3%">税金</td>
	<td  width="2%">管理费百分比</td>
	<td  width="3%">折前管理费</td>
	<td  width="3%">折后管理费</td>
	<td  width="3%">折前记入业绩其它费</td>
	<td  width="3%">折后记入业绩其它费</td>
	<td  width="3%">折前不记业绩其它费</td>
	<td  width="3%">折后不记业绩其它费</td>
	<td  width="3%">折前设计费</td>
	<td  width="3%">折后设计费</td>


	<td  width="3%">财务实收款</td>
	<td  width="3%">财务首次审核时间</td>


	<td  width="2%">返券总金额</td>
	<td  width="2%">公司承担返券额</td>
	<td  width="3%">签约店面</td>
	<td  width="3%">记入业绩时间</td>
	<td  width="3%">签约日期</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>