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
	String jc_xtjg_xtbm=null;
	String jc_xtjg_jg=null;
	jc_xtjg_xtbm=request.getParameter("jc_xtjg_xtbm");
	if (jc_xtjg_xtbm!=null)
	{
		jc_xtjg_xtbm=cf.GB2Uni(jc_xtjg_xtbm);
		if (!(jc_xtjg_xtbm.equals("")))	wheresql+=" and  (jc_xtjg.xtbm='"+jc_xtjg_xtbm+"')";
	}
	jc_xtjg_jg=request.getParameter("jc_xtjg_jg");
	if (jc_xtjg_jg!=null)
	{
		jc_xtjg_jg=jc_xtjg_jg.trim();
		if (!(jc_xtjg_jg.equals("")))	wheresql+=" and  (jc_xtjg.jg="+jc_xtjg_jg+") ";
	}
	ls_sql="SELECT jc_xtjg.xtbm,jdm_xtbm.xtmc,jc_xtjg.jg  ";
	ls_sql+=" FROM jdm_xtbm,jc_xtjg  ";
    ls_sql+=" where jc_xtjg.xtbm=jdm_xtbm.xtbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_xtjgList.jsp","SelectJc_xtjg.jsp","","EditJc_xtjg.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xtbm","jdm_xtbm_xtmc","jc_xtjg_jg"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xtbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_xtjgList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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
	String[] xtbm = request.getParameterValues("xtbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xtbm,"xtbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jc_xtjg where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
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
	<td  width="12%">&nbsp;</td>
	<td  width="29%">箱体</td>
	<td  width="29%">箱体</td>
	<td  width="29%">价格</td>
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