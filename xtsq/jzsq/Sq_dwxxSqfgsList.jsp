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

	ls_sql="SELECT sq_dwxx.dwbh,dwmc,ssdqmc,(select dwmc from sq_dwxx a where a.dwbh=sq_dwxx.ssdw) ssdwmc,DECODE(dwlx,'A0','总部','A1','总部部门','F0','分公司','F1','分公司部门','F2','店面','F3','部门小组','J0','加盟商') as dwlx,sq_dwxx.bianma,DECODE(sfjms,'Y','加盟商','N','否'),DECODE(sq_dwxx.cxbz,'Y','撤销','N','')";
	ls_sql+=" FROM sq_dwxx,sq_ssdqbm";
    ls_sql+=" where sq_dwxx.ssdqbm=sq_ssdqbm.ssdqbm(+) ";
    ls_sql+=" and sq_dwxx.dwlx in('A0','F0') and sq_dwxx.cxbz='N'";

	ls_sql+=" order by sq_dwxx.ssdqbm,sq_dwxx.dwbh";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","PlOneFgsSq.jsp");
	pageObj.setPageRow(500);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dwbh","dwmc","dwfzr","dwdh","dwcz","email"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dwbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("分公司授权");
	pageObj.setEditBolt("");
//设置按钮参数
	String[] buttonName={"多公司批量授权"};//按钮的显示名称
	String[] buttonLink={"PlFgsSq.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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
  <B><font size="3">按分公司批量授权</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="14%">&nbsp;</td>
	<td  width="8%">单位编号</td>
	<td  width="15%">单位名称</td>
	<td  width="10%">所属大区</td>
	<td  width="15%">上级单位</td>
	<td  width="10%">单位类型</td>
	<td  width="10%">编码</td>
	<td  width="8%">是否加盟商</td>
	<td  width="10%">撤销标志</td>
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