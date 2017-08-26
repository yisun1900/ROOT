<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<%

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String fgs=cf.GB2Uni(request.getParameter("fgs"));

	String sjwjrq=request.getParameter("sjwjrq");
	String sjwjrq2=request.getParameter("sjwjrq2");

	String sfwj=request.getParameter("sfwj");//类型

	String myxssl=null;
	myxssl=request.getParameter("myxssl");

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	ls_sql="select '',crm_khxx.khbh khbh,crm_khxx.hth hth,crm_khxx.khxm khxm,crm_khxx.qye qye,sq_sgd.sgdmc sgdmc,cl_djjflmx.cldlmc,cl_djjflmx.ylqje,cl_djjflmx.sjje sjje,to_char(round((sjje/qye * 100), 2)) || '%',cl_djjflmx.jmyy,cl_djjflmx.ylqje-cl_djjflmx.sjje jmje";
	ls_sql+=" from cl_djjflmx,crm_khxx,sq_sgd  ";
	ls_sql+=" where cl_djjflmx.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+)";
	if(sfwj.equals("5")){
	ls_sql+=" and crm_khxx.fgsbh='"+fgs+"' and crm_khxx.gcjdbm='5' ";
	ls_sql+=" and crm_khxx.sjwjrq>=TO_DATE('"+sjwjrq+"','YYYY-MM-DD') and crm_khxx.sjwjrq<=TO_DATE('"+sjwjrq2+"','YYYY-MM-DD')";
	}
	else if(sfwj.equals("4")){
	ls_sql+=" and crm_khxx.fgsbh='"+fgs+"' and crm_khxx.gcjdbm='4' ";
	ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+sjwjrq+"','YYYY-MM-DD') and crm_khxx.sjjgrq<=TO_DATE('"+sjwjrq2+"','YYYY-MM-DD')";
	}
//		ls_sql+=" and cl_djjflmx.ylqje>cl_djjflmx.sjje ";
//		ls_sql+=" and cl_djjflmx.ylqje*0.98>cl_djjflmx.sjje ";
	ls_sql+=" order by  crm_khxx.fgsbh,crm_khxx.khxm,cl_djjflmx.cldlmc";
//out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("clfxKhList.jsp","","","");

	pageObj.setPageRow(Integer.parseInt(myxssl));

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="Cl_djjCxList.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置列超级连接

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="../../dzbj/zxbjmx/Bj_khbjmxDyList.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khbh","1");//列参数对象加入Hash表
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("qye","1");//列参数对象加入Hash表
	spanColHash.put("sgdmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表


}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<CENTER >
  <B><font size="3">材料统计</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>

<tr bgcolor="CCCCCC" align="center"> 
	<td width="4%"><B>序号</b></td>
	<td width="7%"><B>客户编号</b></td>
	<td width="7%"><B>合同号</b></td>
	<td width="7%"><B>客户姓名</b></td>
	<td width="8%"><B>工程签约额</b></td>
	<td width="7%"><B>项目经理</b></td>
	<td width="10%"><B>材料大类</b></td>
	<td width="9%"><B>应领取金额</b></td>
	<td width="8%"><B>实际金额</b></td>
	<td width="6%"><B>占比</b></td>
	<td width="14%"><B>减免原因</b></td>
	<td width="8%"><B>减免金额</b></td>

</tr>
<%
	pageObj.printDateSum(true);
	pageObj.displayFoot();
%> 
</body>
</html>

<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 

//-->
</script>


