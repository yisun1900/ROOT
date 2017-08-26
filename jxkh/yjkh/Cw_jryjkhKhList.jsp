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
	String cw_jryjkh_khzq=null;
	String cw_jryjkh_fgsbh=null;
	String cw_jryjkh_dwbh=null;
	String cw_jryjkh_yhmc=null;
	cw_jryjkh_khzq=request.getParameter("cw_jryjkh_khzq");
	if (cw_jryjkh_khzq!=null)
	{
		cw_jryjkh_khzq=cf.GB2Uni(cw_jryjkh_khzq);
		if (!(cw_jryjkh_khzq.equals("")))	wheresql+=" and  (cw_jryjkh.khzq='"+cw_jryjkh_khzq+"')";
	}
	cw_jryjkh_fgsbh=request.getParameter("cw_jryjkh_fgsbh");
	if (cw_jryjkh_fgsbh!=null)
	{
		cw_jryjkh_fgsbh=cf.GB2Uni(cw_jryjkh_fgsbh);
		if (!(cw_jryjkh_fgsbh.equals("")))	wheresql+=" and  (cw_jryjkh.fgsbh='"+cw_jryjkh_fgsbh+"')";
	}
	cw_jryjkh_dwbh=request.getParameter("cw_jryjkh_dwbh");
	if (cw_jryjkh_dwbh!=null)
	{
		cw_jryjkh_dwbh=cf.GB2Uni(cw_jryjkh_dwbh);
		if (!(cw_jryjkh_dwbh.equals("")))	wheresql+=" and  (cw_jryjkh.dwbh='"+cw_jryjkh_dwbh+"')";
	}
	cw_jryjkh_yhmc=request.getParameter("cw_jryjkh_yhmc");
	if (cw_jryjkh_yhmc!=null)
	{
		cw_jryjkh_yhmc=cf.GB2Uni(cw_jryjkh_yhmc);
		if (!(cw_jryjkh_yhmc.equals("")))	wheresql+=" and  (cw_jryjkh.yhmc='"+cw_jryjkh_yhmc+"')";
	}
	ls_sql="SELECT cw_jryjkh.khzq,cw_jryjkh.khqssj,cw_jryjkh.khjzsj,a.dwmc fgs,cw_jryjkh.dwbh,b.dwmc,cw_jryjkh.yhmc,zwmc,cw_jryjkh.byrw,cw_jryjkh.lrr,cw_jryjkh.lrsj,cw_jryjkh.bz  ";
	ls_sql+=" FROM cw_jryjkh,sq_dwxx a,sq_dwxx b,dm_zwbm  ";
    ls_sql+=" where cw_jryjkh.fgsbh=a.dwbh(+)";
    ls_sql+=" and cw_jryjkh.dwbh=b.dwbh(+)";
    ls_sql+=" and cw_jryjkh.zw=dm_zwbm.zwbm(+)";
    ls_sql+=" and cw_jryjkh.sfkh='N'";//N：未考核；Y：考核
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jryjkh.khzq,cw_jryjkh.fgsbh,cw_jryjkh.dwbh,cw_jryjkh.zw,cw_jryjkh.yhmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_jryjkhList.jsp","","","EditCw_jryjkh.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khzq","cw_jryjkh_khqssj","cw_jryjkh_khjzsj","cw_jryjkh_fgsbh","dwbh","sq_dwxx_dwmc","yhmc","cw_jryjkh_zw","cw_jryjkh_byrw","cw_jryjkh_byqds","cw_jryjkh_byyj","cw_jryjkh_dzkhbl","cw_jryjkh_lrr","cw_jryjkh_lrsj","cw_jryjkh_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khzq","dwbh","yhmc"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_jryjkhList.jsp?"};//按钮单击调用的网页，可以增加参数
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
		sql[0]="delete from cw_jryjkh where "+chooseitem;
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
  <B><font size="3">业绩考核</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">考核周期</td>
	<td  width="6%">考核起始时间</td>
	<td  width="6%">考核截至时间</td>
	<td  width="8%">分公司</td>
	<td  width="5%">所属部门</td>
	<td  width="8%">所属部门</td>
	<td  width="5%">姓名</td>
	<td  width="6%">职务</td>
	<td  width="7%">本月任务</td>
	<td  width="5%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="65%">备注</td>
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