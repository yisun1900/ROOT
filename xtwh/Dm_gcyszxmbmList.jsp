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
	String gcyszxmbm=null;
	String gcyszxmmc=null;
	String gcjdbm=null;
	gcyszxmbm=request.getParameter("gcyszxmbm");
	if (gcyszxmbm!=null)
	{
		gcyszxmbm=cf.GB2Uni(gcyszxmbm);
		if (!(gcyszxmbm.equals("")))	wheresql+=" and  (dm_gcyszxmbm.gcyszxmbm='"+gcyszxmbm+"')";
	}
	gcyszxmmc=request.getParameter("gcyszxmmc");
	if (gcyszxmmc!=null)
	{
		gcyszxmmc=cf.GB2Uni(gcyszxmmc);
		if (!(gcyszxmmc.equals("")))	wheresql+=" and  (dm_gcyszxmbm.gcyszxmmc='"+gcyszxmmc+"')";
	}
	gcjdbm=request.getParameter("gcjdbm");
	if (gcjdbm!=null)
	{
		gcjdbm=cf.GB2Uni(gcjdbm);
		if (!(gcjdbm.equals("")))	wheresql+=" and  (dm_gcyszxmbm.gcjdbm='"+gcjdbm+"')";
	}
	String dygcjdbm=null;
	dygcjdbm=request.getParameter("dygcjdbm");
	if (dygcjdbm!=null)
	{
		dygcjdbm=cf.GB2Uni(dygcjdbm);
		if (!(dygcjdbm.equals("")))	wheresql+=" and  (dm_gcyszxmbm.dygcjdbm='"+dygcjdbm+"')";
	}
	String sfhf=null;
	sfhf=request.getParameter("sfhf");
	if (sfhf!=null)
	{
		sfhf=cf.GB2Uni(sfhf);
		if (!(sfhf.equals("")))	wheresql+=" and  (dm_gcyszxmbm.sfhf='"+sfhf+"')";
	}
	ls_sql="SELECT gcyszxmbm,gcyszxmmc, DECODE(dm_gcyszxmbm.gcjdbm,'2','材料进场验收','3','隐蔽工程验收','4','中期验收','5','完工验收'), DECODE(sfhf,'Y','回访','N','否'),gcjdmc  ";
	ls_sql+=" FROM dm_gcyszxmbm,dm_gcjdbm  ";
    ls_sql+=" where dm_gcyszxmbm.dygcjdbm=dm_gcjdbm.gcjdbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_gcyszxmbm.gcjdbm,gcyszxmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_gcyszxmbmList.jsp","","","EditDm_gcyszxmbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"gcyszxmbm","gcyszxmmc","gcjdbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"gcyszxmbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_gcyszxmbmList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] gcyszxmbm = request.getParameterValues("gcyszxmbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(gcyszxmbm,"gcyszxmbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_gcyszxmbm where "+chooseitem;
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
	<td  width="9%">&nbsp;</td>
	<td  width="12%">工程验收子项目编码</td>
	<td  width="35%">工程验收子项目名称</td>
	<td  width="18%">验收分类</td>
	<td  width="8%">是否回访</td>
	<td  width="18%">对应工程进度</td>
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