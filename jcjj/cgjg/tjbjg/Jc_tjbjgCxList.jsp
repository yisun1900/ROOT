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
	String jc_tjbjg_tjbbm=null;
	String jc_tjbjg_jg=null;
	jc_tjbjg_tjbbm=request.getParameter("jc_tjbjg_tjbbm");
	if (jc_tjbjg_tjbbm!=null)
	{
		jc_tjbjg_tjbbm=cf.GB2Uni(jc_tjbjg_tjbbm);
		if (!(jc_tjbjg_tjbbm.equals("")))	wheresql+=" and  (jc_tjbjg.tjbbm='"+jc_tjbjg_tjbbm+"')";
	}
	jc_tjbjg_jg=request.getParameter("jc_tjbjg_jg");
	if (jc_tjbjg_jg!=null)
	{
		jc_tjbjg_jg=jc_tjbjg_jg.trim();
		if (!(jc_tjbjg_jg.equals("")))	wheresql+=" and  (jc_tjbjg.jg="+jc_tjbjg_jg+") ";
	}
	ls_sql="SELECT jc_tjbjg.tjbbm,jdm_tjbbm.tjbmc,jc_tjbjg.jg  ";
	ls_sql+=" FROM jdm_tjbbm,jc_tjbjg  ";
    ls_sql+=" where jc_tjbjg.tjbbm=jdm_tjbbm.tjbbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_tjbjgCxList.jsp","SelectCxJc_tjbjg.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"tjbbm","jdm_tjbbm_tjbmc","jc_tjbjg_jg"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"tjbbm"};
	pageObj.setKey(keyName);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
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
	<td  width="33%">踢脚板</td>
	<td  width="33%">踢脚板</td>
	<td  width="33%">价格</td>
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