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
	String mbbm=null;
	String mbmc=null;
	String rwbm=null;
	String rwmc=null;
	String rwsfsj=null;
	String rwxh=null;
	mbbm=request.getParameter("mbbm");
	if (mbbm!=null)
	{
		mbbm=cf.GB2Uni(mbbm);
		if (!(mbbm.equals("")))	wheresql+=" and  (gdm_mbsjjd.mbbm='"+mbbm+"')";
	}
	mbmc=request.getParameter("mbmc");
	if (mbmc!=null)
	{
		mbmc=cf.GB2Uni(mbmc);
		if (!(mbmc.equals("")))	wheresql+=" and  (gdm_sgjdmb.mbmc='"+mbmc+"')";
	}
	rwbm=request.getParameter("rwbm");
	if (rwbm!=null)
	{
		rwbm=cf.GB2Uni(rwbm);
		if (!(rwbm.equals("")))	wheresql+=" and  (gdm_mbsjjd.rwbm='"+rwbm+"')";
	}
	rwmc=request.getParameter("rwmc");
	if (rwmc!=null)
	{
		rwmc=cf.GB2Uni(rwmc);
		if (!(rwmc.equals("")))	wheresql+=" and  (gdm_rwbm.rwmc='"+rwmc+"')";
	}
	rwsfsj=request.getParameter("rwsfsj");
	if (rwsfsj!=null)
	{
		rwsfsj=rwsfsj.trim();
		if (!(rwsfsj.equals("")))	wheresql+=" and (gdm_mbsjjd.rwsfsj="+rwsfsj+") ";
	}
	rwxh=request.getParameter("rwxh");
	if (rwxh!=null)
	{
		rwxh=rwxh.trim();
		if (!(rwxh.equals("")))	wheresql+=" and (gdm_mbsjjd.rwxh="+rwxh+") ";
	}
	ls_sql="SELECT gdm_mbsjjd.rwxh,gdm_mbsjjd.mbbm,gdm_sgjdmb.mbmc,gdm_mbsjjd.rwbm,gdm_rwbm.rwmc,gdm_mbsjjd.rwsfsj,gdm_mbsjjd.rwts  ";
	ls_sql+=" FROM gdm_mbsjjd,gdm_rwbm,gdm_sgjdmb  ";
    ls_sql+=" where gdm_mbsjjd.rwbm=gdm_rwbm.rwbm and gdm_mbsjjd.mbbm=gdm_sgjdmb.mbbm";
    ls_sql+=wheresql;
    ls_sql+=" order by gdm_mbsjjd.mbbm,gdm_mbsjjd.rwxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Gdm_mbsjjdCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"mbbm","mbmc","rwbm","rwmc","rwsfsj","rwxh"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"mbbm","rwbm"};
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
	<td  width="8%">任务序号</td>
	<td  width="10%">模版编码</td>
	<td  width="20%">模版名称</td>
	<td  width="10%">任务编码</td>
	<td  width="37%">任务名称</td>
	<td  width="8%">任务发生时间</td>
	<td  width="8%">任务天数</td>
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