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
	String dxpjzbbm=null;
	String pfbm=null;
	String pfmc=null;
	String df=null;
	String xh=null;
	dxpjzbbm=request.getParameter("dxpjzbbm");
	if (dxpjzbbm!=null)
	{
		dxpjzbbm=cf.GB2Uni(dxpjzbbm);
		if (!(dxpjzbbm.equals("")))	wheresql+=" and  (hdm_pjzbpf.dxpjzbbm='"+dxpjzbbm+"')";
	}
	pfbm=request.getParameter("pfbm");
	if (pfbm!=null)
	{
		pfbm=cf.GB2Uni(pfbm);
		if (!(pfbm.equals("")))	wheresql+=" and  (hdm_pjzbpf.pfbm='"+pfbm+"')";
	}
	pfmc=request.getParameter("pfmc");
	if (pfmc!=null)
	{
		pfmc=cf.GB2Uni(pfmc);
		if (!(pfmc.equals("")))	wheresql+=" and  (hdm_pjzbpf.pfmc='"+pfmc+"')";
	}
	df=request.getParameter("df");
	if (df!=null)
	{
		df=df.trim();
		if (!(df.equals("")))	wheresql+=" and  (hdm_pjzbpf.df="+df+") ";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (hdm_pjzbpf.xh="+xh+") ";
	}
	ls_sql="SELECT hdm_pjzbpf.dxpjzbbm,dxpjzb,hfdxmc,hdm_pjzbpf.xh,hdm_pjzbpf.pfbm,hdm_pjzbpf.pfmc,hdm_pjzbpf.df  ";
	ls_sql+=" FROM hdm_pjzbpf,hdm_dxpjzb,hdm_hfdxbm  ";
    ls_sql+=" where hdm_pjzbpf.dxpjzbbm=hdm_dxpjzb.dxpjzbbm(+)";
    ls_sql+=" and hdm_dxpjzb.hfdxbm=hdm_hfdxbm.hfdxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by hdm_pjzbpf.dxpjzbbm,hdm_pjzbpf.xh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Hdm_pjzbpfList.jsp","","","EditHdm_pjzbpf.jsp");
	pageObj.setPageRow(500);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dxpjzbbm","pfbm","pfmc","df","xh"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dxpjzbbm","pfbm"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dxpjzbbm","1");//列参数对象加入Hash表
	spanColHash.put("dxpjzb","1");//列参数对象加入Hash表
	spanColHash.put("hfdxmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Hdm_pjzbpfList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
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
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem =cf.GB2Uni( request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from hdm_pjzbpf where "+chooseitem;
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
  <B><font size="3">评价指标评分－－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="12%">评价指标编码</td>
	<td  width="22%">评价指标</td>
	<td  width="22%">回访对象</td>
	<td  width="8%">序号</td>
	<td  width="8%">评分编码</td>
	<td  width="12%">评分名称</td>
	<td  width="8%">得分</td>
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