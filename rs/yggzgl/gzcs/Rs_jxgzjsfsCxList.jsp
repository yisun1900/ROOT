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
	String xh=null;
	String ssfgs=null;
	String jxfzxx=null;
	String jxfzsx=null;
	String jxgzbl=null;
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (xh="+xh+") ";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (ssfgs='"+ssfgs+"')";
	}
	jxfzxx=request.getParameter("jxfzxx");
	if (jxfzxx!=null)
	{
		jxfzxx=jxfzxx.trim();
		if (!(jxfzxx.equals("")))	wheresql+=" and  (jxfzxx="+jxfzxx+") ";
	}
	jxfzsx=request.getParameter("jxfzsx");
	if (jxfzsx!=null)
	{
		jxfzsx=jxfzsx.trim();
		if (!(jxfzsx.equals("")))	wheresql+=" and  (jxfzsx="+jxfzsx+") ";
	}
	jxgzbl=request.getParameter("jxgzbl");
	if (jxgzbl!=null)
	{
		jxgzbl=jxgzbl.trim();
		if (!(jxgzbl.equals("")))	wheresql+=" and  (jxgzbl="+jxgzbl+") ";
	}
	ls_sql="SELECT xh,ssfgs,jxfzxx,jxfzsx,jxgzbl  ";
	ls_sql+=" FROM rs_jxgzjsfs  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_jxgzjsfsCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","ssfgs","jxfzxx","jxfzsx","jxgzbl"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="20%">序号</td>
	<td  width="20%">分公司</td>
	<td  width="20%">绩效分值下限</td>
	<td  width="20%">绩效分值上限</td>
	<td  width="20%">绩效工资比例</td>
</tr>
<%
	pageObj.displayDate();
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