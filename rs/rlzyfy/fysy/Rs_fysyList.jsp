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
	String fysybh=null;
	String hzbh=null;
	String fgs=null;
	String sysj=null;
	String sylx=null;
	String ytxs=null;
	String fy=null;
	String lrr=null;
	String lrsj=null;
	fysybh=request.getParameter("fysybh");
	if (fysybh!=null)
	{
		fysybh=cf.GB2Uni(fysybh);
		if (!(fysybh.equals("")))	wheresql+=" and  (fysybh='"+fysybh+"')";
	}
	hzbh=request.getParameter("hzbh");
	if (hzbh!=null)
	{
		hzbh=cf.GB2Uni(hzbh);
		if (!(hzbh.equals("")))	wheresql+=" and  (hzbh='"+hzbh+"')";
	}
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (fgs='"+fgs+"')";
	}
	sysj=request.getParameter("sysj");
	if (sysj!=null)
	{
		sysj=sysj.trim();
		if (!(sysj.equals("")))	wheresql+="  and (sysj>=TO_DATE('"+sysj+"','YYYY/MM/DD'))";
	}
	sysj=request.getParameter("sysj2");
	if (sysj!=null)
	{
		sysj=sysj.trim();
		if (!(sysj.equals("")))	wheresql+="  and (sysj<=TO_DATE('"+sysj+"','YYYY/MM/DD'))";
	}
	sylx=request.getParameter("sylx");
	if (sylx!=null)
	{
		sylx=cf.GB2Uni(sylx);
		if (!(sylx.equals("")))	wheresql+=" and  (sylx='"+sylx+"')";
	}
	ytxs=request.getParameter("ytxs");
	if (ytxs!=null)
	{
		ytxs=cf.GB2Uni(ytxs);
		if (!(ytxs.equals("")))	wheresql+=" and  (ytxs='"+ytxs+"')";
	}
	fy=request.getParameter("fy");
	if (fy!=null)
	{
		fy=fy.trim();
		if (!(fy.equals("")))	wheresql+=" and  (fy="+fy+") ";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT fysybh,hzbh,fgs,sysj, DECODE(sylx,'01','招聘费','02','培训费','03','福利费','04','奖励费','05','社会保险费','06','处罚费','07','其他费用'),ytxs,fy,bz,lrr,lrsj  ";
	ls_sql+=" FROM rs_fysy  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_fysyList.jsp","SelectRs_fysy.jsp","","EditRs_fysy.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"fysybh","hzbh","fgs","sysj","sylx","ytxs","fy","bz","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"fysybh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Rs_fysyList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] fysybh = request.getParameterValues("fysybh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(fysybh,"fysybh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from rs_fysy where "+chooseitem;
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
	<td  width="12%">&nbsp;</td>
	<td  width="8%">费用使用编号</td>
	<td  width="8%">预算编号</td>
	<td  width="8%">分公司</td>
	<td  width="8%">使用时间</td>
	<td  width="8%">使用类型</td>
	<td  width="8%">用途形式</td>
	<td  width="8%">费用</td>
	<td  width="8%">备注</td>
	<td  width="8%">录入人</td>
	<td  width="8%">录入时间</td>
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