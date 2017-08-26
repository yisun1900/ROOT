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
	String hzbh=null;
	String yshz=null;
	String shjl=null;
	String shr=null;
	String shsj=null;
	String spjl=null;
	String spr=null;
	String spsj=null;
	String fgs=null;
	String nian=null;
	String yue=null;
	hzbh=request.getParameter("hzbh");
	if (hzbh!=null)
	{
		hzbh=cf.GB2Uni(hzbh);
		if (!(hzbh.equals("")))	wheresql+=" and  (hzbh='"+hzbh+"')";
	}
	yshz=request.getParameter("yshz");
	if (yshz!=null)
	{
		yshz=cf.GB2Uni(yshz);
		if (!(yshz.equals("")))	wheresql+=" and  (yshz='"+yshz+"')";
	}
	shjl=request.getParameter("shjl");
	if (shjl!=null)
	{
		shjl=cf.GB2Uni(shjl);
		if (!(shjl.equals("")))	wheresql+=" and  (shjl='"+shjl+"')";
	}
	shr=request.getParameter("shr");
	if (shr!=null)
	{
		shr=cf.GB2Uni(shr);
		if (!(shr.equals("")))	wheresql+=" and  (shr='"+shr+"')";
	}
	shsj=request.getParameter("shsj");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (shsj>=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	shsj=request.getParameter("shsj2");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (shsj<=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	spjl=request.getParameter("spjl");
	if (spjl!=null)
	{
		spjl=cf.GB2Uni(spjl);
		if (!(spjl.equals("")))	wheresql+=" and  (spjl='"+spjl+"')";
	}
	spr=request.getParameter("spr");
	if (spr!=null)
	{
		spr=cf.GB2Uni(spr);
		if (!(spr.equals("")))	wheresql+=" and  (spr='"+spr+"')";
	}
	spsj=request.getParameter("spsj");
	if (spsj!=null)
	{
		spsj=spsj.trim();
		if (!(spsj.equals("")))	wheresql+="  and (spsj>=TO_DATE('"+spsj+"','YYYY/MM/DD'))";
	}
	spsj=request.getParameter("spsj2");
	if (spsj!=null)
	{
		spsj=spsj.trim();
		if (!(spsj.equals("")))	wheresql+="  and (spsj<=TO_DATE('"+spsj+"','YYYY/MM/DD'))";
	}
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (fgs='"+fgs+"')";
	}
	nian=request.getParameter("nian");
	if (nian!=null)
	{
		nian=cf.GB2Uni(nian);
		if (!(nian.equals("")))	wheresql+=" and  (nian='"+nian+"')";
	}
	yue=request.getParameter("yue");
	if (yue!=null)
	{
		yue=cf.GB2Uni(yue);
		if (!(yue.equals("")))	wheresql+=" and  (yue='"+yue+"')";
	}
	ls_sql="SELECT hzbh,sq_dwxx.dwmc fgs,nian,yue, DECODE(yshz,'01','等待审核','02','等待审批','03','审批完成','04','修改','05','取消申请') yshz,DECODE(shjl,'0','取消审核','1','审核通过','2','返回修改') shjl,shyj,shr,shsj,DECODE(spjl,'0','审批取消','1','审批通过','2','返回审核') spjl,spyj,spr,spsj  ";
	ls_sql+=" FROM rs_fysh,sq_dwxx  ";
    ls_sql+=" where rs_fysh.fgs=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_fyshCxList.jsp","EnterSqbb0.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hzbh","yshz","shjl","shyj","shr","shsj","spjl","spyj","spr","spsj","fgs","nian","yue"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hzbh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"hzbh","fgs","shr","spr","yshz"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="fyhzbb.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hzbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
/*	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">预算编号</td>
	<td  width="9%">申请分公司</td>
	<td  width="6%">年</td>
	<td  width="5%">月</td>
	<td  width="7%">预算状态</td>
	<td  width="6%">审核结论</td>
	<td  width="11%">审核意见</td>
	<td  width="6%">审核人</td>
	<td  width="11%">审核时间</td>
	<td  width="6%">审批结论</td>
	<td  width="10%">审批意见</td>
	<td  width="6%">审批人</td>
	<td  width="10%">审批时间</td>

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