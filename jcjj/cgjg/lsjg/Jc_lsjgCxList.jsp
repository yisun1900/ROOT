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
	String jc_lsjg_lsbm=null;
	String jc_lsjg_jg=null;
	jc_lsjg_lsbm=request.getParameter("jc_lsjg_lsbm");
	if (jc_lsjg_lsbm!=null)
	{
		jc_lsjg_lsbm=cf.GB2Uni(jc_lsjg_lsbm);
		if (!(jc_lsjg_lsbm.equals("")))	wheresql+=" and  (jc_lsjg.lsbm='"+jc_lsjg_lsbm+"')";
	}
	jc_lsjg_jg=request.getParameter("jc_lsjg_jg");
	if (jc_lsjg_jg!=null)
	{
		jc_lsjg_jg=jc_lsjg_jg.trim();
		if (!(jc_lsjg_jg.equals("")))	wheresql+=" and  (jc_lsjg.jg="+jc_lsjg_jg+") ";
	}
	ls_sql="SELECT jc_lsjg.lsbm,jdm_lsbm.lsmc,jc_lsjg.jg  ";
	ls_sql+=" FROM jdm_lsbm,jc_lsjg  ";
    ls_sql+=" where jc_lsjg.lsbm=jdm_lsbm.lsbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_lsjgCxList.jsp","SelectCxJc_lsjg.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"lsbm","jdm_lsbm_lsmc","jc_lsjg_jg"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"lsbm"};
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
	<td  width="33%">拉手</td>
	<td  width="33%">拉手</td>
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