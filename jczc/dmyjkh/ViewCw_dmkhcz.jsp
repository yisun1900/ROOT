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
	String dwbh=request.getParameter("dwbh");

	ls_sql="SELECT cw_dmkhcz.dwbh,sq_dwxx.dwmc,dm_dwjb.dwjbmc,dm_dmxs.dmxsmc,dm_ssfw.ssfwmc,sq_dwxx.dwdz,sq_dwxx.dwfzr,sq_dwxx.dwdh,cw_dmkhcz.nian,cw_dmkhcz.yue,cw_dmkhcz.khcz,cw_dmkhcz.lrr,cw_dmkhcz.lrsj  ";
	ls_sql+=" FROM dm_ssfw,dm_dmxs,dm_dwjb,sq_dwxx,cw_dmkhcz  ";
    ls_sql+=" where sq_dwxx.ssfw=dm_ssfw.ssfw(+) and sq_dwxx.dmxs=dm_dmxs.dmxs(+) and sq_dwxx.dwjb=dm_dwjb.dwjb(+) and cw_dmkhcz.dwbh=sq_dwxx.dwbh";
    ls_sql+=" and cw_dmkhcz.dwbh='"+dwbh+"'";
    ls_sql+=" order by cw_dmkhcz.dwbh,cw_dmkhcz.nian desc,cw_dmkhcz.yue";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"nian","yue","khcz","lrr","lrsj","dwmc","dwjbmc","dmxsmc","ssfwmc"};
	pageObj.setDisColName(disColName);

//设置主键
	String[] keyName={"dwbh","nian","yue"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("nian","1");//列参数对象加入Hash表
	spanColHash.put("dwmc","1");//列参数对象加入Hash表
	spanColHash.put("dwjbmc","1");//列参数对象加入Hash表
	spanColHash.put("dmxsmc","1");//列参数对象加入Hash表
	spanColHash.put("ssfwmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"dwbh","nian","yue"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_dmkhjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("yue",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">店面考核产值</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">年</td>
	<td  width="7%">月</td>
	<td  width="15%">考核产值</td>
	<td  width="8%">录入人</td>
	<td  width="10%">录入时间</td>
	<td  width="18%">单位名称</td>
	<td  width="10%">单位级别</td>
	<td  width="12%">店面形式</td>
	<td  width="12%">所属方位</td>
</tr>
<%
	pageObj.printDateSum();
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