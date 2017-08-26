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
	String dm_bbjb_gcysbbh=null;
	String dm_bbjb_bjjbbm=null;
	String dm_bjjbbm_bjjbmc=null;
	dm_bbjb_gcysbbh=request.getParameter("dm_bbjb_gcysbbh");
	if (dm_bbjb_gcysbbh!=null)
	{
		dm_bbjb_gcysbbh=cf.GB2Uni(dm_bbjb_gcysbbh);
		if (!(dm_bbjb_gcysbbh.equals("")))	wheresql+=" and  (dm_bbjb.gcysbbh='"+dm_bbjb_gcysbbh+"')";
	}
	dm_bbjb_bjjbbm=request.getParameter("dm_bbjb_bjjbbm");
	if (dm_bbjb_bjjbbm!=null)
	{
		dm_bbjb_bjjbbm=cf.GB2Uni(dm_bbjb_bjjbbm);
		if (!(dm_bbjb_bjjbbm.equals("")))	wheresql+=" and  (dm_bbjb.bjjbbm='"+dm_bbjb_bjjbbm+"')";
	}
	dm_bjjbbm_bjjbmc=request.getParameter("dm_bjjbbm_bjjbmc");
	if (dm_bjjbbm_bjjbmc!=null)
	{
		dm_bjjbbm_bjjbmc=cf.GB2Uni(dm_bjjbbm_bjjbmc);
		if (!(dm_bjjbbm_bjjbmc.equals("")))	wheresql+=" and  (dm_bjjbbm.bjjbmc='"+dm_bjjbbm_bjjbmc+"')";
	}

	ls_sql="SELECT dm_bbjb.gcysbbh,gcysbbmc,dm_bbjb.bjjbbm,bdm_bjjbbm.bjjbmc  ";
	ls_sql+=" FROM dm_bbjb,bdm_bjjbbm,dm_hegcysbb  ";
    ls_sql+=" where dm_bbjb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and dm_bbjb.gcysbbh=dm_hegcysbb.gcysbbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_bbjb.gcysbbh,dm_bbjb.bjjbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_bbjbCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"gcysbbh","bjjbbm","dm_bjjbbm_bjjbmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"gcysbbh","bjjbbm"};
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
	<td  width="12%">验收版本号</td>
	<td  width="29%">验收版本名称</td>
	<td  width="12%">报价级别编码</td>
	<td  width="29%">报警级别名称</td>
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