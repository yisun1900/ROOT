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
	String gdm_xmxlbm_xmxlbm=null;
	String gdm_xmxlbm_xmxlmc=null;
	String gdm_xmxlbm_xmdlbm=null;
	String gdm_xmdlbm_xmdlmc=null;
	gdm_xmxlbm_xmxlbm=request.getParameter("gdm_xmxlbm_xmxlbm");
	if (gdm_xmxlbm_xmxlbm!=null)
	{
		gdm_xmxlbm_xmxlbm=cf.GB2Uni(gdm_xmxlbm_xmxlbm);
		if (!(gdm_xmxlbm_xmxlbm.equals("")))	wheresql+=" and  (gdm_xmxlbm.xmxlbm='"+gdm_xmxlbm_xmxlbm+"')";
	}
	gdm_xmxlbm_xmxlmc=request.getParameter("gdm_xmxlbm_xmxlmc");
	if (gdm_xmxlbm_xmxlmc!=null)
	{
		gdm_xmxlbm_xmxlmc=cf.GB2Uni(gdm_xmxlbm_xmxlmc);
		if (!(gdm_xmxlbm_xmxlmc.equals("")))	wheresql+=" and  (gdm_xmxlbm.xmxlmc='"+gdm_xmxlbm_xmxlmc+"')";
	}
	gdm_xmxlbm_xmdlbm=request.getParameter("gdm_xmxlbm_xmdlbm");
	if (gdm_xmxlbm_xmdlbm!=null)
	{
		gdm_xmxlbm_xmdlbm=cf.GB2Uni(gdm_xmxlbm_xmdlbm);
		if (!(gdm_xmxlbm_xmdlbm.equals("")))	wheresql+=" and  (gdm_xmxlbm.xmdlbm='"+gdm_xmxlbm_xmdlbm+"')";
	}
	gdm_xmdlbm_xmdlmc=request.getParameter("gdm_xmdlbm_xmdlmc");
	if (gdm_xmdlbm_xmdlmc!=null)
	{
		gdm_xmdlbm_xmdlmc=cf.GB2Uni(gdm_xmdlbm_xmdlmc);
		if (!(gdm_xmdlbm_xmdlmc.equals("")))	wheresql+=" and  (gdm_xmdlbm.xmdlmc='"+gdm_xmdlbm_xmdlmc+"')";
	}
	ls_sql="SELECT gdm_xmxlbm.xmxlbm,gdm_xmxlbm.xmxlmc,gdm_xmxlbm.xmdlbm,gdm_xmdlbm.xmdlmc  ";
	ls_sql+=" FROM gdm_xmdlbm,gdm_xmxlbm  ";
    ls_sql+=" where gdm_xmxlbm.xmdlbm=gdm_xmdlbm.xmdlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by gdm_xmxlbm.xmdlbm,gdm_xmxlbm.xmxlbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Gdm_xmxlbmList.jsp","","","EditGdm_xmxlbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xmxlbm","gdm_xmxlbm_xmxlmc","gdm_xmxlbm_xmdlbm","gdm_xmdlbm_xmdlmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xmxlbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Gdm_xmxlbmList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] xmxlbm = request.getParameterValues("xmxlbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xmxlbm,"xmxlbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from gdm_xmxlbm where "+chooseitem;
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
	<td  width="22%">项目小类编码</td>
	<td  width="22%">项目小类名称</td>
	<td  width="22%">项目大类编码</td>
	<td  width="22%">项目大类名称</td>
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