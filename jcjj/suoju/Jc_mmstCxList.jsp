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
	String jc_mmst_wjjbm=null;
	String jc_mmst_mmstbm=null;
	String jc_mmst_bm=null;
	jc_mmst_wjjbm=request.getParameter("jc_mmst_wjjbm");
	if (jc_mmst_wjjbm!=null)
	{
		jc_mmst_wjjbm=cf.GB2Uni(jc_mmst_wjjbm);
		if (!(jc_mmst_wjjbm.equals("")))	wheresql+=" and  (jc_mmst.wjjbm='"+jc_mmst_wjjbm+"')";
	}
	jc_mmst_mmstbm=request.getParameter("jc_mmst_mmstbm");
	if (jc_mmst_mmstbm!=null)
	{
		jc_mmst_mmstbm=cf.GB2Uni(jc_mmst_mmstbm);
		if (!(jc_mmst_mmstbm.equals("")))	wheresql+=" and  (jc_mmst.mmstbm='"+jc_mmst_mmstbm+"')";
	}
	jc_mmst_bm=request.getParameter("jc_mmst_bm");
	if (jc_mmst_bm!=null)
	{
		jc_mmst_bm=cf.GB2Uni(jc_mmst_bm);
		if (!(jc_mmst_bm.equals("")))	wheresql+=" and  (jc_mmst.bm='"+jc_mmst_bm+"')";
	}
	ls_sql="SELECT jc_mmst.wjjbm as wjjbm,jdm_wjjbm.wjjmc as jdm_wjjbm_wjjmc,jc_mmst.mmstbm as mmstbm,jdm_mmstbm.mmstmc as jdm_mmstbm_mmstmc,jc_mmst.bm as jc_mmst_bm  ";
	ls_sql+=" FROM jdm_wjjbm,jdm_mmstbm,jc_mmst  ";
    ls_sql+=" where jc_mmst.wjjbm=jdm_wjjbm.wjjbm and jc_mmst.mmstbm=jdm_mmstbm.mmstbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_mmst.wjjbm,jc_mmst.mmstbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_mmstCxList.jsp","SelectCxJc_mmst.jsp","","");
	pageObj.setPageRow(200);//设置每页显示记录数
//设置显示列
	String[] disColName={"jdm_wjjbm_wjjmc","jdm_mmstbm_mmstmc","jc_mmst_bm"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"wjjbm","mmstbm"};
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
	<td  width="20%">五金件</td>
	<td  width="20%">锁体</td>
	<td  width="20%">编码</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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