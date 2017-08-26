<%@ page contentType="text/html;charset=gb2312" %>
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
	String wheresql="where (yhzbh!='000000')";
	String yhzbh=null;
	String yhzmc=null;
	String yhzms=null;

	String jb=null;
	jb=request.getParameter("jb");
	if (jb!=null)
	{
		jb=cf.GB2Uni(jb);
		if (!(jb.equals("")))	wheresql+="  and (jb='"+jb+"')";
	}
	
	yhzbh=request.getParameter("yhzbh");
	if (yhzbh!=null)
	{
		yhzbh=cf.GB2Uni(yhzbh);
		if (!(yhzbh.equals("")))	wheresql+="  and (yhzbh='"+yhzbh+"')";
	}
	yhzmc=request.getParameter("yhzmc");
	if (yhzmc!=null)
	{
		yhzmc=cf.GB2Uni(yhzmc);
		if (!(yhzmc.equals("")))	wheresql+=" and  (yhzmc='"+yhzmc+"')";
	}
	yhzms=request.getParameter("yhzms");
	if (yhzms!=null)
	{
		yhzms=cf.GB2Uni(yhzms);
		if (!(yhzms.equals("")))	wheresql+=" and  (yhzms='"+yhzms+"')";
	}
	ls_sql="SELECT '查看' sq,yhzbh,yhzmc,DECODE(jb,'1','普通','9','特殊','2','供应商'),yhzms  ";
	ls_sql+=" FROM sq_yhz  ";
    ls_sql+=wheresql;
	ls_sql+=" order by yhzbh  ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Sq_yhzList.jsp","","","EditSq_yhz.jsp");
/*
//设置显示列
	String[] disColName={"yhzbh","yhzmc","yhzms"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"yhzbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Sq_yhzList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"yhzbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewUsertogroup.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("sq",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] yhzbh = request.getParameterValues("yhzbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(yhzbh,"yhzbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[3];//要执行的SQL
		boolean needCommit=true;//需要事务处理
		sql[0]="delete from sq_yhssz where yhzbh!='000001' and "+chooseitem;
		sql[1]="delete from sq_yhzqx where yhzbh!='000001' and "+chooseitem;
		sql[2]="delete from sq_yhz where yhzbh!='000001' and "+chooseitem;
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
	<td  width="10%" >&nbsp;</td>
	<td  width="6%">授权</td>
	<td  width="10%" >用户组编号</td>
	<td  width="24%" >用户组名称</td>
	<td  width="10%" >级别</td>
	<td  width="40%" >用户组描述</td>
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