<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
String yhdlm=(String)session.getAttribute("yhdlm");

if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;

	String ls_sql=null;

	ls_sql=" SELECT  ggbh,ck,ggmc,fbsj,fbr,dwmc";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT  xz_ggbgl.ggbh,'未阅读' ck,xz_ggbgl.ggmc,xz_ggbgl.fbsj,xz_ggbgl.fbr,dwmc";
	ls_sql+=" FROM xz_ggdx,xz_ggbgl,sq_dwxx  ";
    ls_sql+=" where xz_ggdx.ggbh=xz_ggbgl.ggbh and xz_ggbgl.fbbm=sq_dwxx.dwbh and xz_ggdx.yhdlm='"+yhdlm+"' and xz_ggbgl.lrsj>SYSDATE-30";

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT  xz_ggbgl.ggbh,'阅读' ck,xz_ggbgl.ggmc,xz_ggbgl.fbsj,xz_ggbgl.fbr,dwmc";
	ls_sql+=" FROM sq_dwxx,xz_ggbgl,xz_ggckjl  ";
    ls_sql+=" where xz_ggckjl.yhdlm='"+yhdlm+"' and xz_ggbgl.ggbh=xz_ggckjl.ggbh and xz_ggbgl.fbbm=sq_dwxx.dwbh ";
	ls_sql+=" ) ";
	ls_sql+=" order by ck,fbsj desc,ggbh";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Xz_OldggbglCxList.jsp","","","");
	pageObj.setViewBolt("");
	pageObj.setPageRow(60);//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ggbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewXz_ggbgl.jsp";//为列参数：coluParm.link设置超级链接
//	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ggbh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">公告板</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">公告编号</td>
	<td  width="7%">&nbsp;</td>
	<td  width="50%">标题</td>
	<td  width="10%">发布时间</td>
	<td  width="8%">发布人</td>
	<td  width="14%">发布部门</td>
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