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
	String tsjlh=null;
	String xtdxh=null;
	String khbh=null;
	String xtyy=null;
	String xtrq=null;
	String xtfgs=null;
	String xtbm=null;
	String xtr=null;
	String xtfy=null;
	String lrr=null;
	String lrsj=null;
	String lrrbm=null;
	String bz=null;
	tsjlh=request.getParameter("tsjlh");
	if (tsjlh!=null)
	{
		tsjlh=cf.GB2Uni(tsjlh);
		if (!(tsjlh.equals("")))	wheresql+=" and  (crm_tsbxxtd.tsjlh='"+tsjlh+"')";
	}
	xtdxh=request.getParameter("xtdxh");
	if (xtdxh!=null)
	{
		xtdxh=xtdxh.trim();
		if (!(xtdxh.equals("")))	wheresql+=" and (crm_tsbxxtd.xtdxh="+xtdxh+") ";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_tsbxxtd.khbh='"+khbh+"')";
	}
	xtyy=request.getParameter("xtyy");
	if (xtyy!=null)
	{
		xtyy=cf.GB2Uni(xtyy);
		if (!(xtyy.equals("")))	wheresql+=" and  (crm_tsbxxtd.xtyy='"+xtyy+"')";
	}
	xtrq=request.getParameter("xtrq");
	if (xtrq!=null)
	{
		xtrq=xtrq.trim();
		if (!(xtrq.equals("")))	wheresql+="  and (crm_tsbxxtd.xtrq>=TO_DATE('"+xtrq+"','YYYY/MM/DD'))";
	}
	xtrq=request.getParameter("xtrq2");
	if (xtrq!=null)
	{
		xtrq=xtrq.trim();
		if (!(xtrq.equals("")))	wheresql+="  and (crm_tsbxxtd.xtrq<=TO_DATE('"+xtrq+"','YYYY/MM/DD'))";
	}
	xtfgs=request.getParameter("xtfgs");
	if (xtfgs!=null)
	{
		xtfgs=cf.GB2Uni(xtfgs);
		if (!(xtfgs.equals("")))	wheresql+=" and  (crm_tsbxxtd.xtfgs='"+xtfgs+"')";
	}
	xtbm=request.getParameter("xtbm");
	if (xtbm!=null)
	{
		xtbm=cf.GB2Uni(xtbm);
		if (!(xtbm.equals("")))	wheresql+=" and  (crm_tsbxxtd.xtbm='"+xtbm+"')";
	}
	xtr=request.getParameter("xtr");
	if (xtr!=null)
	{
		xtr=cf.GB2Uni(xtr);
		if (!(xtr.equals("")))	wheresql+=" and  (crm_tsbxxtd.xtr='"+xtr+"')";
	}
	xtfy=request.getParameter("xtfy");
	if (xtfy!=null)
	{
		xtfy=xtfy.trim();
		if (!(xtfy.equals("")))	wheresql+=" and  (crm_tsbxxtd.xtfy>="+xtfy+") ";
	}
	xtfy=request.getParameter("xtfy2");
	if (xtfy!=null)
	{
		xtfy=xtfy.trim();
		if (!(xtfy.equals("")))	wheresql+=" and  (crm_tsbxxtd.xtfy<="+xtfy+") ";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=lrr.trim();
		if (!(lrr.equals("")))	wheresql+=" and (crm_tsbxxtd.lrr="+lrr+") ";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_tsbxxtd.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_tsbxxtd.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrrbm=request.getParameter("lrrbm");
	if (lrrbm!=null)
	{
		lrrbm=cf.GB2Uni(lrrbm);
		if (!(lrrbm.equals("")))	wheresql+=" and  (crm_tsbxxtd.lrrbm='"+lrrbm+"')";
	}
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (crm_tsbxxtd.bz='"+bz+"')";
	}
	ls_sql="SELECT crm_tsbxxtd.tsjlh,crm_tsbxxtd.xtdxh,crm_tsbxxtd.khbh,crm_tsbxxtd.xtyy,crm_tsbxxtd.xtrq,a.dwmc xtfgs,b.dwmc xtbm,crm_tsbxxtd.xtr,crm_tsbxxtd.xtfy,yhmc lrr,crm_tsbxxtd.lrsj,c.dwmc lrrbm ";
	ls_sql+=" FROM crm_tsbxxtd,sq_dwxx a,sq_dwxx b,sq_dwxx c,sq_yhxx ";
    ls_sql+=" where crm_tsbxxtd.xtfgs=a.dwbh and crm_tsbxxtd.xtbm=b.dwbh and crm_tsbxxtd.lrrbm=c.dwbh and crm_tsbxxtd.lrr=sq_yhxx.ygbh ";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_tsbxxtdCxList.jsp","SelectCxCrm_tsbxxtd.jsp","ViewCrm_tsbxxtd.jsp","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"tsjlh","xtdxh","khbh","xtyy","xtrq","xtfgs","xtbm","xtr","xtfy","lrr","lrsj","lrrbm","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"tsjlh","xtdxh"};
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
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="6%">投诉报修记录号</td>
	<td  width="6%">协调单序号</td>
	<td  width="6%">客户编号</td>
	<td  width="20%">协调原因</td>
	<td  width="6%">协调日期</td>
	<td  width="6%">协调分公司</td>
	<td  width="6%">协调部门</td>
	<td  width="6%">协调人</td>
	<td  width="6%">协调费用</td>
	<td  width="6%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="6%">录入人部门</td>
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