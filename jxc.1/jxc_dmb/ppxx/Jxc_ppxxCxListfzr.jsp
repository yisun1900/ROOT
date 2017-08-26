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
	String ppbm=null;
	String ppmc=null;
	String pplb=null;
	String clxl=null;
	String scsmc=null;
	String bz=null;
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=ppbm.trim();
		if (!(ppbm.equals("")))	wheresql+=" and (ppbm="+ppbm+") ";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (ppmc='"+ppmc+"')";
	}
	pplb=request.getParameter("pplb");
	if (pplb!=null)
	{
		pplb=cf.GB2Uni(pplb);
		if (!(pplb.equals("")))	wheresql+=" and  (pplb='"+pplb+"')";
	}
	clxl=request.getParameter("clxl");
	if (clxl!=null)
	{
		clxl=cf.GB2Uni(clxl);
		if (!(clxl.equals("")))	wheresql+=" and  (clxl='"+clxl+"')";
	}
	scsmc=request.getParameter("scsmc");
	if (scsmc!=null)
	{
		scsmc=cf.GB2Uni(scsmc);
		if (!(scsmc.equals("")))	wheresql+=" and  (scsmc='"+scsmc+"')";
	}
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (bz='"+bz+"')";
	}
	ls_sql="SELECT ppbm,ppmc,clxl,scsmc,bz  ";
	ls_sql+=" FROM jxc_ppxx  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
	 ls_sql+=" order by ppmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_ppxxCxList.jsp","SelectCxJxc_ppxx.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ppbm","ppmc","pplb","clxl","scsbm","scsmc","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ppbm"};
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">子品牌编码</td>
	<td  width="12%">子品牌名称</td>
	<td  width="12%">材料小类</td>
	<td  width="12%">品牌名称</td>
	<td  width="20%">备注</td>
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