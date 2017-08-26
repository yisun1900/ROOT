<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String jzrq=null;
	String jzr=null;
	String sqjzrq=null;
	jzrq=request.getParameter("jzrq");
	if (jzrq!=null)
	{
		jzrq=jzrq.trim();
		if (!(jzrq.equals("")))	wheresql+="  and (cw_qmjz.jzrq=TO_DATE('"+jzrq+"','YYYY/MM/DD'))";
	}
	jzr=request.getParameter("jzr");
	if (jzr!=null)
	{
		jzr=cf.GB2Uni(jzr);
		if (!(jzr.equals("")))	wheresql+=" and  (cw_qmjz.jzr='"+jzr+"')";
	}
	sqjzrq=request.getParameter("sqjzrq");
	if (sqjzrq!=null)
	{
		sqjzrq=sqjzrq.trim();
		if (!(sqjzrq.equals("")))	wheresql+="  and (sqjzrq=TO_DATE('"+sqjzrq+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT TO_CHAR(jzrq,'YYYY-MM-DD') jzrq,cw_qmjz.dwbh,dwmc,jzr,czsj,TO_CHAR(sqjzrq,'YYYY-MM-DD') sqjzrq,khzs,qyze,tdkhzs,tdqyze,qyze-tdqyze je";
	ls_sql+=" FROM cw_qmjz,sq_dwxx  ";
	ls_sql+=" where cw_qmjz.dwbh=sq_dwxx.dwbh  ";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_qmjz.dwbh,cw_qmjz.jzrq desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_qmjzCxList.jsp","","dmcztjb.jsp","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"jzrq","dwmc","jzr","czsj","sqjzrq","khzs","qyze","tdkhzs","tdqyze","je"};
	pageObj.setDisColName(disColName);

//设置主键
	String[] keyName={"jzrq","dwbh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("统计");
	pageObj.setDateType("long");

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jzrq","dwbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_qmjz.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jzrq",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">业绩期末结转</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="8%">业绩结转时间</td>
	<td  width="9%">分公司</td>
	<td  width="5%">结转人</td>
	<td  width="13%">操作时间</td>
	<td  width="8%">上期结转日期</td>
	<td  width="8%">签约总数</td>
	<td  width="13%">签约业绩总额</td>
	<td  width="8%">退单总数</td>
	<td  width="11%">退单业绩总额</td>
	<td  width="13%">业绩总额</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>