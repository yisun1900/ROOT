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
	String shbh=null;
	String sqbh=null;
	String shjl=null;
	String shr=null;
	String shsj=null;
	shbh=request.getParameter("shbh");
	if (shbh!=null)
	{
		shbh=shbh.trim();
		if (!(shbh.equals("")))	wheresql+=" and (rs_ryzbsq.shbh="+shbh+") ";
	}
	sqbh=request.getParameter("sqbh");
	if (sqbh!=null)
	{
		sqbh=cf.GB2Uni(sqbh);
		if (!(sqbh.equals("")))	wheresql+=" and  (rs_ryzbsq.sqbh='"+sqbh+"')";
	}
	shjl=request.getParameter("shjl");
	if (shjl!=null)
	{
		shjl=cf.GB2Uni(shjl);
		if (!(shjl.equals("")))	wheresql+=" and  (rs_ryzbsq.shjl='"+shjl+"')";
	}
	shr=request.getParameter("shr");
	if (shr!=null)
	{
		shr=cf.GB2Uni(shr);
		if (!(shr.equals("")))	wheresql+=" and  (rs_ryzbsq.shr='"+shr+"')";
	}
	shsj=request.getParameter("shsj");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (rs_ryzbsq.shsj>=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	shsj=request.getParameter("shsj2");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (rs_ryzbsq.shsj<=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT rs_ryzbsq.shbh shbh,rs_ryzbsq.sqbh sqbh,rs_ryzbsqbm.shjlmc shjl,rs_ryzbsq.shr shr,rs_ryzbsq.shsj shsj,rs_ryzbsq.shyj shyj ";
	ls_sql+=" FROM rs_ryzbsq,rs_ryzbsqbm,rs_zpjh  ";
    ls_sql+=" where rs_ryzbsq.shjl=rs_ryzbsqbm.shjl and rs_zpjh.shbh=rs_ryzbsq.shbh and rs_zpjh.jhzt!='3'";
	ls_sql+=wheresql;

    ls_sql+=wheresql;
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("rs_ryzbsqList.jsp","Selectrs_ryzbsq.jsp","","Editrs_ryzbsq.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"shbh","sqbh","shjl","shr","shsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"shbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Rs_deleteSh.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
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
//	String[] shbh = request.getParameterValues("shbh");
//	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(shbh,"shbh"));
//	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
//	{
//		String[] sql=new String[1];//要执行的SQL
//		boolean needCommit=false;//不需要事务处理
//		sql[0]="delete from rs_ryzbsq where "+chooseitem;
//		pageObj.execDelete(sql,needCommit);
//	}
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
	<td  width="10%">审核编号</td>
	<td  width="12%">增补申请编号</td>
	<td  width="10%">审核结论</td>
	<td  width="10%">审核人</td>
	<td  width="10%">审核时间</td>
	<td  width="40%">审核意见</td>
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