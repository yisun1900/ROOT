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
	String bj_dzbjbb_dqbm=null;
	String bj_dzbjbb_bjbbh=null;
	String bj_dzbjbb_qysj=null;
	String bj_dzbjbb_sfzybb=null;
	bj_dzbjbb_dqbm=request.getParameter("bj_dzbjbb_dqbm");
	if (bj_dzbjbb_dqbm!=null)
	{
		bj_dzbjbb_dqbm=cf.GB2Uni(bj_dzbjbb_dqbm);
		if (!(bj_dzbjbb_dqbm.equals("")))	wheresql+=" and  (bj_dzbjbb.dqbm='"+bj_dzbjbb_dqbm+"')";
	}
	bj_dzbjbb_bjbbh=request.getParameter("bj_dzbjbb_bjbbh");
	if (bj_dzbjbb_bjbbh!=null)
	{
		bj_dzbjbb_bjbbh=cf.GB2Uni(bj_dzbjbb_bjbbh);
		if (!(bj_dzbjbb_bjbbh.equals("")))	wheresql+=" and  (bj_dzbjbb.bjbbh='"+bj_dzbjbb_bjbbh+"')";
	}
	bj_dzbjbb_qysj=request.getParameter("bj_dzbjbb_qysj");
	if (bj_dzbjbb_qysj!=null)
	{
		bj_dzbjbb_qysj=bj_dzbjbb_qysj.trim();
		if (!(bj_dzbjbb_qysj.equals("")))	wheresql+="  and (bj_dzbjbb.qysj>=TO_DATE('"+bj_dzbjbb_qysj+"','YYYY/MM/DD'))";
	}
	bj_dzbjbb_qysj=request.getParameter("bj_dzbjbb_qysj2");
	if (bj_dzbjbb_qysj!=null)
	{
		bj_dzbjbb_qysj=bj_dzbjbb_qysj.trim();
		if (!(bj_dzbjbb_qysj.equals("")))	wheresql+="  and (bj_dzbjbb.qysj<=TO_DATE('"+bj_dzbjbb_qysj+"','YYYY/MM/DD'))";
	}
	bj_dzbjbb_sfzybb=request.getParameter("bj_dzbjbb_sfzybb");
	if (bj_dzbjbb_sfzybb!=null)
	{
		bj_dzbjbb_sfzybb=cf.GB2Uni(bj_dzbjbb_sfzybb);
		if (!(bj_dzbjbb_sfzybb.equals("")))	wheresql+=" and  (bj_dzbjbb.sfzybb='"+bj_dzbjbb_sfzybb+"')";
	}
	ls_sql="SELECT bj_dzbjbb.dqbm,dm_dqbm.dqmc,bj_dzbjbb.bjbbh,bj_dzbjbb.qysj,bj_dzbjbb.yxq,DECODE(bj_dzbjbb.sfzybb,'1','未启用','2','当前版','3','可用版','4','停用'),bj_dzbjbb.bz  ";
	ls_sql+=" FROM dm_dqbm,bj_dzbjbb  ";
    ls_sql+=" where bj_dzbjbb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_dzbjbb.dqbm,bj_dzbjbb.qysj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_dzbjbbCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjbbh","bj_dzbjbb_qysj","bj_dzbjbb_sfyqy","bj_dzbjbb_sfzybb","bj_dzbjbb_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dqbm","bjbbh"};
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
  <B><font size="3">查询报价版本</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">地区编码</td>
	<td  width="10%">地区名称</td>
	<td  width="23%">报价版本号</td>
	<td  width="10%">启用时间</td>
	<td  width="10%">有效期</td>
	<td  width="7%">是否在用版本</td>
	<td  width="32%">备注</td>
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