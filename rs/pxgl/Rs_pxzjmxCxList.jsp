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
	String pxjhbh=null;
	pxjhbh=request.getParameter("pxjhbh");
	if (pxjhbh!=null)
	{
		pxjhbh=cf.GB2Uni(pxjhbh);
		if (!(pxjhbh.equals("")))	wheresql+=" and  (rs_pxzjmx.pxjhbh='"+pxjhbh+"')";
	}
	ls_sql="SELECT rs_pxzjmx.pxjhbh pxjhbh,pxjhmc,pxmxbh,rs_pxskxsbm.skxsmc skxs,rs_pxkclxbm.lxmc kclx,pxcd,rs_pxzjmx.pxrs pxrs,rs_pxzjmx.pxfy pxfy,gcrs,zcrs,jcrs,pxjs,DECODE(pxjg,'0','未完成','1','完成','2','部分完成') pxjg,pxkssj,pxjssj,pxkc,kcnr,rs_pxzjmx.lrr lrr,rs_pxzjmx.lrsj lrsj,rs_pxzjmx.bz bz ";
	ls_sql+=" FROM rs_pxzjmx,rs_pxjh,rs_pxskxsbm,rs_pxkclxbm  ";
    ls_sql+=" where rs_pxzjmx.pxjhbh=rs_pxjh.pxjhbh and rs_pxskxsbm.skxs=rs_pxzjmx.skxs and rs_pxkclxbm.kclx=rs_pxzjmx.kclx";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_pxzjmxCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"pxmxbh","pxjhbh","skxs","kclx","pxkc","kcnr","pxcd","pxrs","pxfy","gcrs","zcrs","jcrs","pxjs","pxjg","pxkssj","pxjssj","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"pxmxbh"};
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
	pageObj.printPageLink(220);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">培训计划编号</td>
	<td  width="6%">培训计划名称</td>
	<td  width="5%">培训明细编号</td>
	<td  width="4%">授课形式</td>
	<td  width="4%">课程类型</td>
	<td  width="6%">培训场地</td>
	<td  width="3%">培训人数</td>
	<td  width="3%">培训费用</td>
	<td  width="3%">高层人数</td>
	<td  width="3%">中层人数</td>
	<td  width="3%">基层人数</td>
	<td  width="3%">培训讲师</td>
	<td  width="3%">明细结果</td>
	<td  width="4%">培训开始时间</td>
	<td  width="4%">培训结束时间</td>
	<td  width="11%">培训课程</td>
	<td  width="11%">课程内容</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="13%">备注</td>
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