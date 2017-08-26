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
	String wtbh=null;
	String wtmc=null;
	String sfkdx=null;
	String yxbz=null;
	String fbr=null;
	String fbsj=null;
	wtbh=request.getParameter("wtbh");
	if (wtbh!=null)
	{
		wtbh=wtbh.trim();
		if (!(wtbh.equals("")))	wheresql+=" and (wtbh="+wtbh+") ";
	}
	wtmc=request.getParameter("wtmc");
	if (wtmc!=null)
	{
		wtmc=cf.GB2Uni(wtmc);
		if (!(wtmc.equals("")))	wheresql+=" and  (wtmc='"+wtmc+"')";
	}
	sfkdx=request.getParameter("sfkdx");
	if (sfkdx!=null)
	{
		sfkdx=cf.GB2Uni(sfkdx);
		if (!(sfkdx.equals("")))	wheresql+=" and  (sfkdx='"+sfkdx+"')";
	}
	yxbz=request.getParameter("yxbz");
	if (yxbz!=null)
	{
		yxbz=cf.GB2Uni(yxbz);
		if (!(yxbz.equals("")))	wheresql+=" and  (yxbz='"+yxbz+"')";
	}
	fbr=request.getParameter("fbr");
	if (fbr!=null)
	{
		fbr=cf.GB2Uni(fbr);
		if (!(fbr.equals("")))	wheresql+=" and  (fbr='"+fbr+"')";
	}
	fbsj=request.getParameter("fbsj");
	if (fbsj!=null)
	{
		fbsj=fbsj.trim();
		if (!(fbsj.equals("")))	wheresql+="  and (fbsj>=TO_DATE('"+fbsj+"','YYYY/MM/DD'))";
	}
	fbsj=request.getParameter("fbsj2");
	if (fbsj!=null)
	{
		fbsj=fbsj.trim();
		if (!(fbsj.equals("")))	wheresql+="  and (fbsj<=TO_DATE('"+fbsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT wtbh,wtmc, DECODE(sfkdx,'1','多选','2','单选','3','写说明'), DECODE(yxbz,'Y','有效','N','无效'),fbr,fbsj  ";
	ls_sql+=" FROM crm_khdcwt  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by yxbz desc,wtbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khdcwtCxList.jsp","SelectCxCrm_khdcwt.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"wtbh","wtmc","sfkdx","yxbz","fbr","fbsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"wtbh"};
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
  <B><font size="3">客户调查问题－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">问题编号</td>
	<td  width="58%">问题名称</td>
	<td  width="8%">可多选</td>
	<td  width="8%">有效标志</td>
	<td  width="8%">发布人</td>
	<td  width="10%">发布时间</td>
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