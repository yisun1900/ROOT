<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String wtbh=null;
	String dcqs=null;
	String wtmc=null;
	String sfkdx=null;
	String wtsfgq=null;
	String wtfl=null;
	String xwtsm=null;
	wtbh=request.getParameter("wtbh");
	if (wtbh!=null)
	{
		wtbh=cf.GB2Uni(wtbh);
		if (!(wtbh.equals("")))	wheresql+=" and  (wtbh='"+wtbh+"')";
	}
	dcqs=request.getParameter("dcqs");
	if (dcqs!=null)
	{
		dcqs=cf.GB2Uni(dcqs);
		if (!(dcqs.equals("")))	wheresql+=" and  (dcqs='"+dcqs+"')";
	}
	wtmc=request.getParameter("wtmc");
	if (wtmc!=null)
	{
		wtmc=cf.GB2Uni(wtmc);
		if (!(wtmc.equals("")))	wheresql+=" and  (wtmc='"+wtmc+"')";
	}
	sfkdx=request.getParameter("sfkdx");
	if (sfkdx!=null)
	{
		sfkdx=cf.GB2Uni(sfkdx);
		if (!(sfkdx.equals("")))	wheresql+=" and  (sfkdx='"+sfkdx+"')";
	}
	wtsfgq=request.getParameter("wtsfgq");
	if (wtsfgq!=null)
	{
		wtsfgq=cf.GB2Uni(wtsfgq);
		if (!(wtsfgq.equals("")))	wheresql+=" and  (wtsfgq='"+wtsfgq+"')";
	}
	wtfl=request.getParameter("wtfl");
	if (wtfl!=null)
	{
		wtfl=cf.GB2Uni(wtfl);
		if (!(wtfl.equals("")))	wheresql+=" and  (wtfl='"+wtfl+"')";
	}
	xwtsm=request.getParameter("xwtsm");
	if (xwtsm!=null)
	{
		xwtsm=cf.GB2Uni(xwtsm);
		if (!(xwtsm.equals("")))	wheresql+=" and  (xwtsm='"+xwtsm+"')";
	}
	ls_sql="SELECT wtbh,dcqs,wtmc, DECODE(sfkdx,'Y','可多选','N','单选'), DECODE(wtsfgq,'Y','过期','N','未过期'),wtfl,xwtsm  ";
	ls_sql+=" FROM hd_scdcwt  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditHd_scdcwt.jsp");
	pageObj.setPageRow(40000);
/*
//设置显示列
	String[] disColName={"wtbh","dcqs","wtmc","sfkdx","wtsfgq","wtfl","xwtsm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"wtbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteHd_scdcwtList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="12%">问题编号</td>
	<td  width="12%">调查期数</td>
	<td  width="12%">问题名称</td>
	<td  width="12%">是否可多选</td>
	<td  width="12%">问题是否过期</td>
	<td  width="12%">问题分类</td>
	<td  width="12%">问题说明</td>
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