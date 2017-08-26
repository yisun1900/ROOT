<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj =new ybl.common.PageObject();

	String ls_sql=null;

	String fgsbh=request.getParameter("fgsbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String ppbm=cf.GB2Uni(cf.getParameter(request,"ppbm"));
	String zcdlbm=request.getParameter("zcdlbm");

	ls_sql="SELECT bjjbmc,bj_khzcxm.khbh,crm_khxx.khxm,NVL(bj_khzcxm.fjddbh,'&nbsp;') ddbh,bj_khzcxm.cpmc,bj_khzcxm.xh,bj_khzcxm.gg,bj_khzcxm.xdjldw,TO_CHAR(bj_khzcxm.jsj),bj_khzcxm.xdsl,ROUND(bj_khzcxm.jsj*bj_khzcxm.xdsl,2),bj_khzcxm.gysmc  ";
	ls_sql+=" FROM bj_khzcxm,crm_khxx,bdm_bjjbbm  ";
    ls_sql+=" where bj_khzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_khzcxm.khbh=crm_khxx.khbh";
	ls_sql+=" and bj_khzcxm.ddcljjfs in('0','1')";//0：套餐主材；1：顶配升级主材；2：顶配独立收费主材；3：套餐选配主材
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";
	ls_sql+=" and bj_khzcxm.ppmc='"+ppbm+"'";
	ls_sql+=" and bj_khzcxm.tccpdlbm='"+zcdlbm+"'";
    ls_sql+=" order by bj_khzcxm.tccpdlbm,bj_khzcxm.ppmc,bj_khzcxm.bjjbbm,bj_khzcxm.khbh,bj_khzcxm.fjddbh ";
    pageObj.sql=ls_sql;

//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("bjjbmc","1");//列参数对象加入Hash表
	spanColHash.put("khbh","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("fjddbh","1");//列参数对象加入Hash表
	spanColHash.put("gysmc","2");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
    
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">供应商销售报表（品牌:<%=ppbm%>）</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">报价级别</td>
	<td  width="6%">客户编号</td>
	<td  width="6%">客户姓名</td>
	<td  width="7%">订单</td>
	<td  width="13%">产品名称</td>
	<td  width="13%">型号</td>
	<td  width="13%">规格</td>
	<td  width="5%">计量单位</td>
	<td  width="5%">单价</td>
	<td  width="6%">数量</td>
	<td  width="7%">金额</td>
	<td  width="16%">供应商</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 
</table>
</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>