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
	

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");



	ls_sql="SELECT '',sjs,hth,khxm,fwdz,bjjbmc,DECODE(crm_khxx.jzbz,'1','家装','2','公装'),yjjzsj,tdyjjzsj,wdzgce,TO_CHAR(zkl),qye,zhljzjx,zqgczjf,zhgczjf,suijinbfb||'%',zqsuijin,suijin,glfbfb||'%',zqguanlif,guanlif,zqqtsf,zhqtsf,zqwjrqyexm,zhwjrqyexm,NVL(zqsjf,0)+NVL(sjhtsjf,0),NVL(sjf,0)+NVL(sjhtsjf,0) ,cwsfke,TO_CHAR(jzkscsj,'YYYY-MM-DD'),TO_CHAR(cwjzkscsj,'YYYY-MM-DD'),crm_khxx.fjje,crm_khxx.gsfje,sgdmc,zjxm,cxhdbm,a.dwmc qydm,TO_CHAR(qyrq,'YYYY-MM-DD'),tdsj ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,bdm_bjjbbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bdm_bjjbbm.lx='1'";
    ls_sql+=" and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt in('2','3','5')";
	ls_sql+=" and yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT '',sjs,hth,khxm,fwdz,bjjbmc,'<B><font color=\"#FF0000\">已退单</font></B>',yjjzsj,tdyjjzsj,-1*wdzgce,TO_CHAR(zkl),-1*qye,0,zqgczjf,zhgczjf,suijinbfb||'%',zqsuijin,suijin,glfbfb||'%',zqguanlif,guanlif,zqqtsf,zhqtsf,zqwjrqyexm,zhwjrqyexm,NVL(zqsjf,0)+NVL(sjhtsjf,0),NVL(sjf,0)+NVL(sjhtsjf,0) ,cwsfke,TO_CHAR(jzkscsj,'YYYY-MM-DD'),TO_CHAR(cwjzkscsj,'YYYY-MM-DD'),crm_khxx.fjje,crm_khxx.gsfje,sgdmc,zjxm,cxhdbm,a.dwmc qydm,TO_CHAR(qyrq,'YYYY-MM-DD'),tdsj ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a ,sq_sgd,bdm_bjjbbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bdm_bjjbbm.lx='1'";
    ls_sql+=" and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='3'";//3：退单客户
	ls_sql+=" and yjjzsj is not null ";//首次付家装款时间
	ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by sjs,yjjzsj";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

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
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">店面业绩明细（<%=dwmc%>）
  <BR>(记入业绩时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="280%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">设计师</td>
	<td  width="2%">合同号</td>
	<td  width="2%">姓名</td>
	<td  width="6%">房屋地址</td>
	<td  width="2%">报价级别</td>
	<td  width="2%">家装标志</td>
	<td  width="3%">签单记入业绩时间</td>
	<td  width="3%">退单记入业绩时间</td>
	<td  width="3%">折前合同总额</td>
	<td  width="2%">折扣率</td>
	<td  width="3%">折后合同总额</td>
	<td  width="3%">增减项</td>
	<td  width="3%">折前工程费</td>
	<td  width="3%">折后工程费</td>
	<td  width="2%">税率</td>
	<td  width="3%">折前税金</td>
	<td  width="3%">税金</td>
	<td  width="2%">管理费百分比</td>
	<td  width="3%">折前管理费</td>
	<td  width="3%">折后管理费</td>
	<td  width="2%">折前记入业绩其它费</td>
	<td  width="2%">折后记入业绩其它费</td>
	<td  width="2%">折前不记业绩其它费</td>
	<td  width="2%">折后不记业绩其它费</td>
	<td  width="2%">折前设计费</td>
	<td  width="2%">折后设计费</td>


	<td  width="3%">财务实收款</td>
	<td  width="3%">首次收装款时间</td>
	<td  width="3%">财务首次审核时间</td>


	<td  width="2%">返券总金额</td>
	<td  width="2%">公司承担返券额</td>
	<td  width="2%">施工队</td>
	<td  width="2%">质检员</td>
	<td  width="5%">促销活动</td>
	<td  width="3%">签约店面</td>
	<td  width="3%">签约日期</td>
	<td  width="3%">退单时间</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
	pageObj.displayFoot();
%> 

</body>
</html>

