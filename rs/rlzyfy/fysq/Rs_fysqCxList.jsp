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
	String fysqbh=null;
	String fgs=null;
	String sqsj=null;
	String xqlx=null;
	String ytxs=null;
	String fy=null;
	String hzbh=null;
	String sfkg=null;
	String lrr=null;
	String lrsj=null;
	fysqbh=request.getParameter("fysqbh");
	if (fysqbh!=null)
	{
		fysqbh=cf.GB2Uni(fysqbh);
		if (!(fysqbh.equals("")))	wheresql+=" and  (fysqbh='"+fysqbh+"')";
	}
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (fgs='"+fgs+"')";
	}
	sqsj=request.getParameter("sqsj");
	if (sqsj!=null)
	{
		sqsj=sqsj.trim();
		if (!(sqsj.equals("")))	wheresql+="  and (sqsj>=TO_DATE('"+sqsj+"','YYYY/MM/DD'))";
	}
	sqsj=request.getParameter("sqsj2");
	if (sqsj!=null)
	{
		sqsj=sqsj.trim();
		if (!(sqsj.equals("")))	wheresql+="  and (sqsj<=TO_DATE('"+sqsj+"','YYYY/MM/DD'))";
	}
	xqlx=request.getParameter("xqlx");
	if (xqlx!=null)
	{
		xqlx=cf.GB2Uni(xqlx);
		if (!(xqlx.equals("")))	wheresql+=" and  (xqlx='"+xqlx+"')";
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
	hzbh=request.getParameter("hzbh");
	if (hzbh!=null)
	{
		hzbh=cf.GB2Uni(hzbh);
		if (!(hzbh.equals("")))	wheresql+=" and  (hzbh='"+hzbh+"')";
	}
	sfkg=request.getParameter("sfkg");
	if (sfkg!=null)
	{
		sfkg=cf.GB2Uni(sfkg);
		if (!(sfkg.equals("")))	wheresql+=" and  (sfkg='"+sfkg+"')";
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
	ls_sql="SELECT fysqbh,sq_dwxx.dwmc fgs,sqsj, DECODE(xqlx,'01','招聘费','02','培训费','03','福利费','04','奖励费','05','社会保险费','06','处罚费','07','其他费用') xqlx,ytxs,fy,hzbh,DECODE(sfkg,'Y','可改','N','不可改'),rs_fysq.lrr,rs_fysq.lrsj,rs_fysq.bz  ";
	ls_sql+=" FROM rs_fysq,sq_dwxx  ";
    ls_sql+=" where  rs_fysq.fgs=sq_dwxx.dwbh";
    ls_sql+=wheresql;
	ls_sql+=" order by sqsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_fysqCxList.jsp","SelectCxRs_fysq.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"fysqbh","fgs","sqsj","xqlx","ytxs","fy","bz","hzbh","sfkg","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"fysqbh"};
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
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">费用申请编号</td>
	<td  width="8%">申请分公司</td>
	<td  width="8%">申请时间</td>
	<td  width="7%">申请类型</td>
	<td  width="18%">用途形式</td>
	<td  width="6%">费用</td>
	<td  width="8%">汇总编号</td>
	<td  width="6%">是否可改</td>
	<td  width="6%">录入人</td>
	<td  width="8%">录入时间</td>
	<td  width="17%">备注</td>
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