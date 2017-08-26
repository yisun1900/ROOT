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
	String cw_jrkhzq_khzq=null;
	String cw_jrkhzq_fgsbh=null;
	cw_jrkhzq_khzq=request.getParameter("cw_jrkhzq_khzq");
	if (cw_jrkhzq_khzq!=null)
	{
		cw_jrkhzq_khzq=cf.GB2Uni(cw_jrkhzq_khzq);
		if (!(cw_jrkhzq_khzq.equals("")))	wheresql+=" and  (cw_jrkhzq.khzq='"+cw_jrkhzq_khzq+"')";
	}
	cw_jrkhzq_fgsbh=request.getParameter("cw_jrkhzq_fgsbh");
	if (cw_jrkhzq_fgsbh!=null)
	{
		cw_jrkhzq_fgsbh=cf.GB2Uni(cw_jrkhzq_fgsbh);
		if (!(cw_jrkhzq_fgsbh.equals("")))	wheresql+=" and  (cw_jrkhzq.fgsbh='"+cw_jrkhzq_fgsbh+"')";
	}
	ls_sql="SELECT cw_jrkhzq.khzq,cw_jrkhzq.fgsbh,sq_dwxx.dwmc,cw_jrkhzq.khqssj,cw_jrkhzq.khjzsj,cw_jrkhzq.qqts,DECODE(sfkh,'1','未考核','2','录入任务','3','考核','4','提成')  ";
	ls_sql+=" FROM cw_jrkhzq,sq_dwxx  ";
    ls_sql+=" where cw_jrkhzq.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrkhzq.fgsbh,cw_jrkhzq.khzq";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_jrkhzqList.jsp","","","EditCw_jrkhzq.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khzq","fgsbh","sq_dwxx_dwmc","cw_jrkhzq_khqssj","cw_jrkhzq_khjzsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khzq","fgsbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息","删除任务","删除考核"};//按钮的显示名称
	String[] buttonLink={"Cw_jrkhzqList.jsp?","DeleteRw.jsp?","DeleteKh.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0,1,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_jrkhzq where "+chooseitem;
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
	<td  width="8%">&nbsp;</td>
	<td  width="10%">考核周期</td>
	<td  width="10%">分公司</td>
	<td  width="25%">分公司</td>
	<td  width="13%">考核起始时间</td>
	<td  width="13%">考核截至时间</td>
	<td  width="10%">全勤天数</td>
	<td  width="10%">是否考核</td>
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