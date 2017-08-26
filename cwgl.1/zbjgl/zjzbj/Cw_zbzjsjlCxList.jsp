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
	String cw_zbzjsjl_xuhao=null;
	String cw_zbzjsjl_sgd=null;
	String cw_zbzjsjl_je=null;
	String cw_zbzjsjl_lrr=null;
	String cw_zbzjsjl_lrsj=null;
	cw_zbzjsjl_xuhao=request.getParameter("cw_zbzjsjl_xuhao");
	if (cw_zbzjsjl_xuhao!=null)
	{
		cw_zbzjsjl_xuhao=cw_zbzjsjl_xuhao.trim();
		if (!(cw_zbzjsjl_xuhao.equals("")))	wheresql+=" and (cw_zbzjsjl.xuhao="+cw_zbzjsjl_xuhao+") ";
	}
	cw_zbzjsjl_sgd=request.getParameter("cw_zbzjsjl_sgd");
	if (cw_zbzjsjl_sgd!=null)
	{
		cw_zbzjsjl_sgd=cf.GB2Uni(cw_zbzjsjl_sgd);
		if (!(cw_zbzjsjl_sgd.equals("")))	wheresql+=" and  (cw_zbzjsjl.sgd='"+cw_zbzjsjl_sgd+"')";
	}
	cw_zbzjsjl_je=request.getParameter("cw_zbzjsjl_je");
	if (cw_zbzjsjl_je!=null)
	{
		cw_zbzjsjl_je=cw_zbzjsjl_je.trim();
		if (!(cw_zbzjsjl_je.equals("")))	wheresql+=" and  (cw_zbzjsjl.je="+cw_zbzjsjl_je+") ";
	}
	cw_zbzjsjl_lrr=request.getParameter("cw_zbzjsjl_lrr");
	if (cw_zbzjsjl_lrr!=null)
	{
		cw_zbzjsjl_lrr=cf.GB2Uni(cw_zbzjsjl_lrr);
		if (!(cw_zbzjsjl_lrr.equals("")))	wheresql+=" and  (cw_zbzjsjl.lrr='"+cw_zbzjsjl_lrr+"')";
	}
	cw_zbzjsjl_lrsj=request.getParameter("cw_zbzjsjl_lrsj");
	if (cw_zbzjsjl_lrsj!=null)
	{
		cw_zbzjsjl_lrsj=cw_zbzjsjl_lrsj.trim();
		if (!(cw_zbzjsjl_lrsj.equals("")))	wheresql+="  and (cw_zbzjsjl.lrsj=TO_DATE('"+cw_zbzjsjl_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cw_zbzjsjl.xuhao,sq_sgd.sgdmc,cw_zbzjsjl.je,cw_zbzjsjl.lrr,cw_zbzjsjl.lrsj,cw_zbzjsjl.bz  ";
	ls_sql+=" FROM sq_sgd,cw_zbzjsjl  ";
    ls_sql+=" where cw_zbzjsjl.sgd=sq_sgd.sgd";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_zbzjsjl.xuhao desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_zbzjsjlCxList.jsp","SelectCxCw_zbzjsjl.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
	String myxssl=null;
	myxssl=request.getParameter("myxssl");
	pageObj.setPageRow(Integer.parseInt(myxssl));//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xuhao","sq_sgd_sgdmc","cw_zbzjsjl_je","cw_zbzjsjl_lrr","cw_zbzjsjl_lrsj","cw_zbzjsjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xuhao"};
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
	<td  width="8%">序号</td>
	<td  width="10%">施工队</td>
	<td  width="14%">金额</td>
	<td  width="8%">录入人</td>
	<td  width="10%">录入时间</td>
	<td  width="50%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
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