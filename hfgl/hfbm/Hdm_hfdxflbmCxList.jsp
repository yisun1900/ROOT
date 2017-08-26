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
	String hfdxflbm=null;
	String hfdxflmc=null;
	hfdxflbm=request.getParameter("hfdxflbm");
	if (hfdxflbm!=null)
	{
		hfdxflbm=cf.GB2Uni(hfdxflbm);
		if (!(hfdxflbm.equals("")))	wheresql+=" and  (hfdxflbm='"+hfdxflbm+"')";
	}
	hfdxflmc=request.getParameter("hfdxflmc");
	if (hfdxflmc!=null)
	{
		hfdxflmc=cf.GB2Uni(hfdxflmc);
		if (!(hfdxflmc.equals("")))	wheresql+=" and  (hfdxflmc='"+hfdxflmc+"')";
	}
	ls_sql="SELECT hfdxflbm,hfdxflmc  ";
	ls_sql+=" FROM hdm_hfdxflbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by hfdxflbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Hdm_hfdxflbmCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hfdxflbm","hfdxflmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hfdxflbm"};
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
	<td  width="30%">回访对象分类编码</td>
	<td  width="70%">回访对象分类名称</td>
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