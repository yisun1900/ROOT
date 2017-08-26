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
	String cw_jrzjyjkh_khzq=null;
	String cw_jrzjyjkh_fgsbh=null;
	String cw_jrzjyjkh_dwbh=null;
	String cw_jrzjyjkh_yhmc=null;
	cw_jrzjyjkh_khzq=request.getParameter("cw_jrzjyjkh_khzq");
	if (cw_jrzjyjkh_khzq!=null)
	{
		cw_jrzjyjkh_khzq=cf.GB2Uni(cw_jrzjyjkh_khzq);
		if (!(cw_jrzjyjkh_khzq.equals("")))	wheresql+=" and  (cw_jrzjyjkh.khzq='"+cw_jrzjyjkh_khzq+"')";
	}
	cw_jrzjyjkh_fgsbh=request.getParameter("cw_jrzjyjkh_fgsbh");
	if (cw_jrzjyjkh_fgsbh!=null)
	{
		cw_jrzjyjkh_fgsbh=cf.GB2Uni(cw_jrzjyjkh_fgsbh);
		if (!(cw_jrzjyjkh_fgsbh.equals("")))	wheresql+=" and  (cw_jrzjyjkh.fgsbh='"+cw_jrzjyjkh_fgsbh+"')";
	}
	cw_jrzjyjkh_dwbh=request.getParameter("cw_jrzjyjkh_dwbh");
	if (cw_jrzjyjkh_dwbh!=null)
	{
		cw_jrzjyjkh_dwbh=cf.GB2Uni(cw_jrzjyjkh_dwbh);
		if (!(cw_jrzjyjkh_dwbh.equals("")))	wheresql+=" and  (cw_jrzjyjkh.dwbh='"+cw_jrzjyjkh_dwbh+"')";
	}
	cw_jrzjyjkh_yhmc=request.getParameter("cw_jrzjyjkh_yhmc");
	if (cw_jrzjyjkh_yhmc!=null)
	{
		cw_jrzjyjkh_yhmc=cf.GB2Uni(cw_jrzjyjkh_yhmc);
		if (!(cw_jrzjyjkh_yhmc.equals("")))	wheresql+=" and  (cw_jrzjyjkh.yhmc='"+cw_jrzjyjkh_yhmc+"')";
	}
	ls_sql="SELECT cw_jrzjyjkh.khzq,cw_jrzjyjkh.khqssj,cw_jrzjyjkh.khjzsj,a.dwmc fgsbh,cw_jrzjyjkh.dwbh,b.dwmc,cw_jrzjyjkh.yhmc,cw_jrzjyjkh.khfs,cw_jrzjyjkh.lrr,cw_jrzjyjkh.lrsj,cw_jrzjyjkh.bz  ";
	ls_sql+=" FROM cw_jrzjyjkh,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where cw_jrzjyjkh.fgsbh=a.dwbh(+)";
    ls_sql+=" and cw_jrzjyjkh.dwbh=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrzjyjkh.khzq,cw_jrzjyjkh.fgsbh,cw_jrzjyjkh.dwbh,cw_jrzjyjkh.yhmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_jrzjyjkhList.jsp","","","EditCw_jrzjyjkh.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khzq","cw_jrzjyjkh_khqssj","cw_jrzjyjkh_khjzsj","cw_jrzjyjkh_fgsbh","dwbh","sq_dwxx_dwmc","yhmc","cw_jrzjyjkh_khfs","cw_jrzjyjkh_lrr","cw_jrzjyjkh_lrsj","cw_jrzjyjkh_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khzq","dwbh","yhmc"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_jrzjyjkhList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_jrzjyjkh where "+chooseitem;
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
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="8%">考核周期</td>
	<td  width="8%">考核起始时间</td>
	<td  width="8%">考核截至时间</td>
	<td  width="10%">分公司</td>
	<td  width="8%">所属部门</td>
	<td  width="9%">所属部门</td>
	<td  width="6%">姓名</td>
	<td  width="8%">考核分数</td>
	<td  width="6%">录入人</td>
	<td  width="8%">录入时间</td>
	<td  width="58%">备注</td>
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