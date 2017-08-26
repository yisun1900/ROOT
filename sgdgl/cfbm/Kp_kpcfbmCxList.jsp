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
	String kpcfbm=null;
	String kpcfmc=null;
	kpcfbm=request.getParameter("kpcfbm");
	if (kpcfbm!=null)
	{
		kpcfbm=cf.GB2Uni(kpcfbm);
		if (!(kpcfbm.equals("")))	wheresql+=" and  (kpcfbm='"+kpcfbm+"')";
	}
	kpcfmc=request.getParameter("kpcfmc");
	if (kpcfmc!=null)
	{
		kpcfmc=cf.GB2Uni(kpcfmc);
		if (!(kpcfmc.equals("")))	wheresql+=" and  (kpcfmc='"+kpcfmc+"')";
	}
	ls_sql="SELECT kpcfbm,kpcfmc  ";
	ls_sql+=" FROM kp_kpcfbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by kpcfbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_kpcfbmCxList.jsp","SelectCxKp_kpcfbm.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"kpcfbm","kpcfmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"kpcfbm"};
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
	<td  width="20%">违规处罚编码</td>
	<td  width="50%">违规处罚名称</td>
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