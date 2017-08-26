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
	String clxlbm=null;
	String clxlmc=null;
	String cldlmc=null;
	clxlbm=request.getParameter("clxlbm");
	if (clxlbm!=null)
	{
		clxlbm=cf.GB2Uni(clxlbm);
		if (!(clxlbm.equals("")))	wheresql+=" and  (jxc_clxlbm.clxlbm='"+clxlbm+"')";
	}
	clxlmc=request.getParameter("clxlmc");
	if (clxlmc!=null)
	{
		clxlmc=cf.GB2Uni(clxlmc);
		if (!(clxlmc.equals("")))	wheresql+=" and  (jxc_clxlbm.clxlmc='"+clxlmc+"')";
	}
	cldlmc=request.getParameter("cldlmc");
	if (cldlmc!=null)
	{
		cldlmc=cf.GB2Uni(cldlmc);
		if (!(cldlmc.equals("")))	wheresql+=" and  (jxc_clxlbm.cldlmc='"+cldlmc+"')";
	}

	String cldllb=null;
	cldllb=request.getParameter("cldllb");
	if (cldllb!=null)
	{
		cldllb=cf.GB2Uni(cldllb);
		if (!(cldllb.equals("")))	wheresql+=" and  (jxc_cldlbm.cldllb='"+cldllb+"')";
	}
	
	ls_sql="SELECT clxlbm,clxlmc,tcslxz,ccbfjj,jxc_clxlbm.cldlmc,decode(jxc_cldlbm.cldllb,'1','主材','2','辅材类','3','通用类') ";
	ls_sql+=" FROM jxc_clxlbm,jxc_cldlbm ";
    ls_sql+=" where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by jxc_cldlbm.cldllb,jxc_clxlbm.cldlmc,clxlbm ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_clxlbmCxList.jsp","SelectCxJxc_clxlbm.jsp","","");
	pageObj.setPageRow(200);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"clxlbm","clxlmc","cldlmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"clxlbm"};
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
	<td  width="10%">材料小类编码</td>
	<td  width="32%">材料小类名称</td>
	<td  width="10%">套餐数量限制</td>
	<td  width="10%">超出部分加价</td>
	<td  width="22%">材料大类名称</td>
	<td  width="8%">类别</td>
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