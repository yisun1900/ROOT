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
	String ckbh=null;
	String ckmc=null;
	String dqbm=null;
	String cksslx=null;
	cksslx=request.getParameter("cksslx");
	if (cksslx!=null)
	{
		cksslx=cf.GB2Uni(cksslx);
		if (!(cksslx.equals("")))	wheresql+=" and  (cksslx='"+cksslx+"')";
	}
	ckbh=request.getParameter("ckbh");
	if (ckbh!=null)
	{
		ckbh=cf.GB2Uni(ckbh);
		if (!(ckbh.equals("")))	wheresql+=" and  (ckbh='"+ckbh+"')";
	}
	ckmc=request.getParameter("ckmc");
	if (ckmc!=null)
	{
		ckmc=cf.GB2Uni(ckmc);
		if (!(ckmc.equals("")))	wheresql+=" and  (ckmc='"+ckmc+"')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (jxc_ckmc.dqbm='"+dqbm+"')";
	}
	ls_sql="SELECT dqmc,ckmc,ckbh,DECODE(cksslx,'1','分公司仓库','0','总部仓库') cksslx  ";
	ls_sql+=" FROM jxc_ckmc,dm_dqbm  ";
    ls_sql+=" where jxc_ckmc.dqbm=dm_dqbm.dqbm";
    ls_sql+=wheresql;
	ls_sql+=" order by dqmc,ckmc,cksslx ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_ckmcCxList.jsp","SelectCxJxc_ckmc.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ckbh","ckmc","dqbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ckbh"};
	pageObj.setKey(keyName);


//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//列参数对象加入Hash表
	spanColHash.put("cksslx","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
	<td  width="25%">所属地区</td>
	<td  width="25%">仓库名称</td>
	<td  width="25%">仓库编号</td>
	<td  width="25%">仓库类型</td>
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