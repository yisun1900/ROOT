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
	String hy_hyxfjlb_hybh=null;
	String hy_hyxfjlb_ywxh=null;
	String hy_hyxfjlb_dwbh=null;
	String hy_hyxfjlb_gmyy=null;
	String hy_hyxfjlb_gmrq=null;
	String hy_hyxfjlb_gmzje=null;
	String hy_hyxfjlb_gmyjbm=null;
	String hy_hyxfjlb_jbr=null;
	String hy_hyxxb_hykh=null;
	String hy_hyxxb_hyjb=null;
	hy_hyxfjlb_hybh=request.getParameter("hy_hyxfjlb_hybh");
	if (hy_hyxfjlb_hybh!=null)
	{
		hy_hyxfjlb_hybh=cf.GB2Uni(hy_hyxfjlb_hybh);
		if (!(hy_hyxfjlb_hybh.equals("")))	wheresql+=" and  (hy_hyxfjlb.hybh='"+hy_hyxfjlb_hybh+"')";
	}
	hy_hyxfjlb_ywxh=request.getParameter("hy_hyxfjlb_ywxh");
	if (hy_hyxfjlb_ywxh!=null)
	{
		hy_hyxfjlb_ywxh=cf.GB2Uni(hy_hyxfjlb_ywxh);
		if (!(hy_hyxfjlb_ywxh.equals("")))	wheresql+=" and  (hy_hyxfjlb.ywxh='"+hy_hyxfjlb_ywxh+"')";
	}
	hy_hyxfjlb_dwbh=request.getParameter("hy_hyxfjlb_dwbh");
	if (hy_hyxfjlb_dwbh!=null)
	{
		hy_hyxfjlb_dwbh=cf.GB2Uni(hy_hyxfjlb_dwbh);
		if (!(hy_hyxfjlb_dwbh.equals("")))	wheresql+=" and  (hy_hyxfjlb.dwbh='"+hy_hyxfjlb_dwbh+"')";
	}
	hy_hyxfjlb_gmyy=request.getParameter("hy_hyxfjlb_gmyy");
	if (hy_hyxfjlb_gmyy!=null)
	{
		hy_hyxfjlb_gmyy=cf.GB2Uni(hy_hyxfjlb_gmyy);
		if (!(hy_hyxfjlb_gmyy.equals("")))	wheresql+=" and  (hy_hyxfjlb.gmyy='"+hy_hyxfjlb_gmyy+"')";
	}
	hy_hyxfjlb_gmrq=request.getParameter("hy_hyxfjlb_gmrq");
	if (hy_hyxfjlb_gmrq!=null)
	{
		hy_hyxfjlb_gmrq=hy_hyxfjlb_gmrq.trim();
		if (!(hy_hyxfjlb_gmrq.equals("")))	wheresql+="  and (hy_hyxfjlb.gmrq>=TO_DATE('"+hy_hyxfjlb_gmrq+"','YYYY/MM/DD'))";
	}
	hy_hyxfjlb_gmrq=request.getParameter("hy_hyxfjlb_gmrq2");
	if (hy_hyxfjlb_gmrq!=null)
	{
		hy_hyxfjlb_gmrq=hy_hyxfjlb_gmrq.trim();
		if (!(hy_hyxfjlb_gmrq.equals("")))	wheresql+="  and (hy_hyxfjlb.gmrq<=TO_DATE('"+hy_hyxfjlb_gmrq+"','YYYY/MM/DD'))";
	}
	hy_hyxfjlb_gmzje=request.getParameter("hy_hyxfjlb_gmzje");
	if (hy_hyxfjlb_gmzje!=null)
	{
		hy_hyxfjlb_gmzje=hy_hyxfjlb_gmzje.trim();
		if (!(hy_hyxfjlb_gmzje.equals("")))	wheresql+=" and  (hy_hyxfjlb.gmzje="+hy_hyxfjlb_gmzje+") ";
	}
	hy_hyxfjlb_gmyjbm=request.getParameter("hy_hyxfjlb_gmyjbm");
	if (hy_hyxfjlb_gmyjbm!=null)
	{
		hy_hyxfjlb_gmyjbm=cf.GB2Uni(hy_hyxfjlb_gmyjbm);
		if (!(hy_hyxfjlb_gmyjbm.equals("")))	wheresql+=" and  (hy_hyxfjlb.gmyjbm='"+hy_hyxfjlb_gmyjbm+"')";
	}
	hy_hyxfjlb_jbr=request.getParameter("hy_hyxfjlb_jbr");
	if (hy_hyxfjlb_jbr!=null)
	{
		hy_hyxfjlb_jbr=cf.GB2Uni(hy_hyxfjlb_jbr);
		if (!(hy_hyxfjlb_jbr.equals("")))	wheresql+=" and  (hy_hyxfjlb.jbr='"+hy_hyxfjlb_jbr+"')";
	}
	hy_hyxxb_hykh=request.getParameter("hy_hyxxb_hykh");
	if (hy_hyxxb_hykh!=null)
	{
		hy_hyxxb_hykh=cf.GB2Uni(hy_hyxxb_hykh);
		if (!(hy_hyxxb_hykh.equals("")))	wheresql+=" and  (hy_hyxxb.hykh='"+hy_hyxxb_hykh+"')";
	}
	hy_hyxxb_hyjb=request.getParameter("hy_hyxxb_hyjb");
	if (hy_hyxxb_hyjb!=null)
	{
		hy_hyxxb_hyjb=cf.GB2Uni(hy_hyxxb_hyjb);
		if (!(hy_hyxxb_hyjb.equals("")))	wheresql+=" and  (hy_hyxxb.hyjb='"+hy_hyxxb_hyjb+"')";
	}
	ls_sql="SELECT hy_hyxfjlb.hybh as hybh,hy_hyxfjlb.ywxh as ywxh,hy_hyxfjlb.dwbh as hy_hyxfjlb_dwbh,hy_hyxfjlb.gmyy as hy_hyxfjlb_gmyy,hy_hyxfjlb.gmrq as hy_hyxfjlb_gmrq,hy_hyxfjlb.gmzje as hy_hyxfjlb_gmzje,hy_hyxfjlb.gmyjbm as hy_hyxfjlb_gmyjbm,hy_hyxfjlb.jbr as hy_hyxfjlb_jbr,hy_hyxxb.hykh as hy_hyxxb_hykh,hy_hyxxb.hyjb as hy_hyxxb_hyjb  ";
	ls_sql+=" FROM hy_hyxxb,hy_hyxfjlb  ";
    ls_sql+=" where hy_hyxfjlb.hybh=hy_hyxxb.hybh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Hy_hyxfjlbCxList.jsp","SelectCxHy_hyxfjlb.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hybh","ywxh","hy_hyxfjlb_dwbh","hy_hyxfjlb_gmyy","hy_hyxfjlb_gmrq","hy_hyxfjlb_gmzje","hy_hyxfjlb_gmyjbm","hy_hyxfjlb_jbr","hy_hyxxb_hykh","hy_hyxxb_hyjb"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hybh","ywxh"};
	pageObj.setKey(keyName);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">会员编号</td>
	<td  width="10%">业务序号</td>
	<td  width="10%">购买地点</td>
	<td  width="10%">购买原因</td>
	<td  width="10%">购买日期</td>
	<td  width="10%">购买总金额</td>
	<td  width="10%">购买意见</td>
	<td  width="10%">经办人</td>
	<td  width="10%">水质分析卡号</td>
	<td  width="10%">会员级别</td>
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