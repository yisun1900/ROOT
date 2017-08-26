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

	ls_sql="SELECT sq_dwxx.dwbh,dwmc,(select dwmc from sq_dwxx a where a.dwbh=sq_dwxx.ssfgs) ssdwmc,DECODE(dwlx,'A0','总部','A1','总部部门','F0','分公司','F1','分公司部门','F2','店面','F3','部门小组','J0','加盟商') as dwlx,sq_dwxx.cwdm,sq_dwxx.hthqz,DECODE(sfjms,'Y','加盟商','N','否'),DECODE(sq_dwxx.cxbz,'Y','撤销','N',''),sq_dwxx.kdsj,sq_dwxx.gdsj";
	ls_sql+=" FROM sq_dwxx ";
    ls_sql+=" where sq_dwxx.dwlx in('F2') and sq_dwxx.cxbz='N'";

	ls_sql+=" order by sq_dwxx.ssfgs,sq_dwxx.cxbz,sq_dwxx.dwbh";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Sq_dwxxSqbmList.jsp","","","PlOneDmSq.jsp");

/*
//设置显示列
	String[] disColName={"dwbh","dwmc","dwfzr","dwdh","dwcz","email"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dwbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("店面授权");
	pageObj.setEditBolt("");

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"dwbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewSq_dwxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("dwbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

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
  <B><font size="3">按店面批量授权</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(105);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="7%">单位编号</td>
	<td  width="17%">单位名称</td>
	<td  width="13%">所属分公司</td>
	<td  width="7%">单位类型</td>
	<td  width="8%">财务代码</td>
	<td  width="8%">合同号前缀</td>
	<td  width="7%">是否加盟商</td>
	<td  width="7%">撤销标志</td>
	<td  width="9%">开店时间</td>
	<td  width="9%">关店时间</td>
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