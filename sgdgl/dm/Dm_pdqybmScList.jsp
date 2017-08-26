<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String dm_pdqybm_pdqybm=null;
	String dm_pdqybm_pdqymc=null;
	String dm_pdqybm_dqbm=null;
	dm_pdqybm_pdqybm=request.getParameter("dm_pdqybm_pdqybm");
	if (dm_pdqybm_pdqybm!=null)
	{
		dm_pdqybm_pdqybm=cf.GB2Uni(dm_pdqybm_pdqybm);
		if (!(dm_pdqybm_pdqybm.equals("")))	wheresql+=" and  (dm_pdqybm.pdqybm='"+dm_pdqybm_pdqybm+"')";
	}
	dm_pdqybm_pdqymc=request.getParameter("dm_pdqybm_pdqymc");
	if (dm_pdqybm_pdqymc!=null)
	{
		dm_pdqybm_pdqymc=cf.GB2Uni(dm_pdqybm_pdqymc);
		if (!(dm_pdqybm_pdqymc.equals("")))	wheresql+=" and  (dm_pdqybm.pdqymc='"+dm_pdqybm_pdqymc+"')";
	}
	dm_pdqybm_dqbm=request.getParameter("dm_pdqybm_dqbm");
	if (dm_pdqybm_dqbm!=null)
	{
		dm_pdqybm_dqbm=cf.GB2Uni(dm_pdqybm_dqbm);
		if (!(dm_pdqybm_dqbm.equals("")))	wheresql+=" and  (dm_pdqybm.dqbm='"+dm_pdqybm_dqbm+"')";
	}
	ls_sql="SELECT dm_pdqybm.pdqybm,dm_pdqybm.pdqymc,dm_dqbm.dqmc  ";
	ls_sql+=" FROM dm_dqbm,dm_pdqybm  ";
    ls_sql+=" where dm_pdqybm.dqbm=dm_dqbm.dqbm(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and dm_pdqybm.dqbm in( select dqbm from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' ))";
	}
	else
	{
		ls_sql+=" and dm_pdqybm.dqbm in( select dqbm from sq_dwxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' ))";
	}

    ls_sql+=wheresql;
    ls_sql+=" order by dm_pdqybm.dqbm,dm_pdqybm.pdqybm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_pdqybmScList.jsp","","","EditScDm_pdqybm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"pdqybm","dm_pdqybm_pdqymc","dm_dqbm_dqmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"pdqybm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_pdqybmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] pdqybm = request.getParameterValues("pdqybm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(pdqybm,"pdqybm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_pdqybm where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
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
	<td  width="8%">&nbsp;</td>
	<td  width="20%">派单区域编码</td>
	<td  width="52%">派单区域名称</td>
	<td  width="20%">地区</td>
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