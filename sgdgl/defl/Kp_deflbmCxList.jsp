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
	String deflbm=null;
	String deflmc=null;
	String dedy=null;
	String dexy=null;
	String depjz=null;

	String fgsbh=null;
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		if (!(fgsbh.equals("")))	wheresql+=" and  (kp_deflbm.fgsbh='"+fgsbh+"')";
	}

	deflbm=request.getParameter("deflbm");
	if (deflbm!=null)
	{
		deflbm=cf.GB2Uni(deflbm);
		if (!(deflbm.equals("")))	wheresql+=" and  (kp_deflbm.deflbm='"+deflbm+"')";
	}
	deflmc=request.getParameter("deflmc");
	if (deflmc!=null)
	{
		deflmc=cf.GB2Uni(deflmc);
		if (!(deflmc.equals("")))	wheresql+=" and  (kp_deflbm.deflmc='"+deflmc+"')";
	}
	dedy=request.getParameter("dedy");
	if (dedy!=null)
	{
		dedy=dedy.trim();
		if (!(dedy.equals("")))	wheresql+=" and (kp_deflbm.dedy="+dedy+") ";
	}
	dexy=request.getParameter("dexy");
	if (dexy!=null)
	{
		dexy=dexy.trim();
		if (!(dexy.equals("")))	wheresql+=" and (kp_deflbm.dexy="+dexy+") ";
	}
	depjz=request.getParameter("depjz");
	if (depjz!=null)
	{
		depjz=depjz.trim();
		if (!(depjz.equals("")))	wheresql+=" and (kp_deflbm.depjz="+depjz+") ";
	}
	ls_sql="SELECT dwmc,deflbm,deflmc,dedy,dexy,depjz  ";
	ls_sql+=" FROM kp_deflbm,sq_dwxx  ";
    ls_sql+=" where kp_deflbm.fgsbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_deflbm.fgsbh,deflbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_deflbmCxList.jsp","SelectCxKp_deflbm.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"deflbm","deflmc","dedy","dexy","depjz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"deflbm"};
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
	<td  width="15%">分公司</td>
	<td  width="12%">大小单编码</td>
	<td  width="31%">大小单名称</td>
	<td  width="14%">单额起点(>=)</td>
	<td  width="14%">单额终点(<)</td>
	<td  width="14%">单额平均值</td>
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