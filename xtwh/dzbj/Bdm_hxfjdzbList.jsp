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
	String bdm_hxfjdzb_hxbm=null;
	String bdm_hxfjdzb_jgwzmc=null;
	String bdm_hxfjdzb_fjlx=null;
	bdm_hxfjdzb_hxbm=request.getParameter("bdm_hxfjdzb_hxbm");
	if (bdm_hxfjdzb_hxbm!=null)
	{
		bdm_hxfjdzb_hxbm=cf.GB2Uni(bdm_hxfjdzb_hxbm);
		if (!(bdm_hxfjdzb_hxbm.equals("")))	wheresql+=" and  (bdm_hxfjdzb.hxbm='"+bdm_hxfjdzb_hxbm+"')";
	}
	bdm_hxfjdzb_jgwzmc=request.getParameter("bdm_hxfjdzb_jgwzmc");
	if (bdm_hxfjdzb_jgwzmc!=null)
	{
		bdm_hxfjdzb_jgwzmc=cf.GB2Uni(bdm_hxfjdzb_jgwzmc);
		if (!(bdm_hxfjdzb_jgwzmc.equals("")))	wheresql+=" and  (bdm_hxfjdzb.jgwzmc='"+bdm_hxfjdzb_jgwzmc+"')";
	}
	bdm_hxfjdzb_fjlx=request.getParameter("bdm_hxfjdzb_fjlx");
	if (bdm_hxfjdzb_fjlx!=null)
	{
		bdm_hxfjdzb_fjlx=bdm_hxfjdzb_fjlx.trim();
		if (!(bdm_hxfjdzb_fjlx.equals("")))	wheresql+=" and (bdm_hxfjdzb.fjlx="+bdm_hxfjdzb_fjlx+") ";
	}
	ls_sql="SELECT bdm_hxfjdzb.hxbm,dm_hxbm.hxmc,bdm_hxfjdzb.jgwzmc,bdm_hxfjdzb.fjmj, DECODE(bdm_hxfjdzb.fjlx,'1','厨房','2','卫生间','3','卧室','4','客厅','5','餐厅','6','阳台'),bdm_hxfjdzb.xuhao  ";
	ls_sql+=" FROM dm_hxbm,bdm_hxfjdzb  ";
    ls_sql+=" where bdm_hxfjdzb.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bdm_hxfjdzb.hxbm,bdm_hxfjdzb.xuhao";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bdm_hxfjdzbList.jsp","","","EditBdm_hxfjdzb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hxbm","dm_hxbm_hxmc","jgwzmc","bdm_hxfjdzb_fjmj","bdm_hxfjdzb_fjlx"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hxbm","jgwzmc"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Bdm_hxfjdzbList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from bdm_hxfjdzb where "+chooseitem;
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
	<td  width="8%">户型</td>
	<td  width="20%">户型</td>
	<td  width="25%">房间名称</td>
	<td  width="15%">房间面积</td>
	<td  width="15%">房间类型</td>
	<td  width="15%">序号</td>
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