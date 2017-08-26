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
	String damxbm=null;
	String damxmc=null;
	String gdbz=null;
	damxbm=request.getParameter("damxbm");
	if (damxbm!=null)
	{
		damxbm=cf.GB2Uni(damxbm);
		if (!(damxbm.equals("")))	wheresql+=" and  (damxbm='"+damxbm+"')";
	}
	damxmc=request.getParameter("damxmc");
	if (damxmc!=null)
	{
		damxmc=cf.GB2Uni(damxmc);
		if (!(damxmc.equals("")))	wheresql+=" and  (damxmc='"+damxmc+"')";
	}
	gdbz=request.getParameter("gdbz");
	if (gdbz!=null)
	{
		gdbz=cf.GB2Uni(gdbz);
		if (!(gdbz.equals("")))	wheresql+=" and  (gdbz='"+gdbz+"')";
	}
	ls_sql="SELECT damxbm,damxmc, DECODE(gdbz,'Y','必须归档','N','可不归')  ";
	ls_sql+=" FROM dm_damxbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by damxbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_damxbmCxList.jsp","SelectCxDm_damxbm.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"damxbm","damxmc","gdbz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"damxbm"};
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
	<td  width="20%">档案明细编码</td>
	<td  width="60%">档案明细名称</td>
	<td  width="20%">归档标志</td>
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