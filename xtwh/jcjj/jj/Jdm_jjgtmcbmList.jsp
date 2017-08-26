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
	String jdm_jjgtmcbm_jjgtmcbm=null;
	String jdm_jjgtmcbm_jjgtmc=null;
	String jdm_jjgtmcbm_jjlbbm=null;
	jdm_jjgtmcbm_jjgtmcbm=request.getParameter("jdm_jjgtmcbm_jjgtmcbm");
	if (jdm_jjgtmcbm_jjgtmcbm!=null)
	{
		jdm_jjgtmcbm_jjgtmcbm=cf.GB2Uni(jdm_jjgtmcbm_jjgtmcbm);
		if (!(jdm_jjgtmcbm_jjgtmcbm.equals("")))	wheresql+=" and  (jdm_jjgtmcbm.jjgtmcbm='"+jdm_jjgtmcbm_jjgtmcbm+"')";
	}
	jdm_jjgtmcbm_jjgtmc=request.getParameter("jdm_jjgtmcbm_jjgtmc");
	if (jdm_jjgtmcbm_jjgtmc!=null)
	{
		jdm_jjgtmcbm_jjgtmc=cf.GB2Uni(jdm_jjgtmcbm_jjgtmc);
		if (!(jdm_jjgtmcbm_jjgtmc.equals("")))	wheresql+=" and  (jdm_jjgtmcbm.jjgtmc='"+jdm_jjgtmcbm_jjgtmc+"')";
	}
	jdm_jjgtmcbm_jjlbbm=request.getParameter("jdm_jjgtmcbm_jjlbbm");
	if (jdm_jjgtmcbm_jjlbbm!=null)
	{
		jdm_jjgtmcbm_jjlbbm=cf.GB2Uni(jdm_jjgtmcbm_jjlbbm);
		if (!(jdm_jjgtmcbm_jjlbbm.equals("")))	wheresql+=" and  (jdm_jjgtmcbm.jjlbbm='"+jdm_jjgtmcbm_jjlbbm+"')";
	}
	ls_sql="SELECT jdm_jjgtmcbm.jjgtmcbm,jdm_jjgtmcbm.jjgtmc,jdm_jjlbbm.jjlbmc  ";
	ls_sql+=" FROM jdm_jjlbbm,jdm_jjgtmcbm  ";
    ls_sql+=" where jdm_jjgtmcbm.jjlbbm=jdm_jjlbbm.jjlbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jdm_jjgtmcbm.jjlbbm,jjgtmcbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jdm_jjgtmcbmList.jsp","SelectJdm_jjgtmcbm.jsp","","EditJdm_jjgtmcbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jjgtmcbm","jdm_jjgtmcbm_jjgtmc","jdm_jjlbbm_jjlbmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jjgtmcbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jdm_jjgtmcbmList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] jjgtmcbm = request.getParameterValues("jjgtmcbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(jjgtmcbm,"jjgtmcbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jdm_jjgtmcbm where "+chooseitem;
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
	<td  width="19%">家具柜体名称编码</td>
	<td  width="29%">家具柜体名称</td>
	<td  width="29%">家具类别</td>
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