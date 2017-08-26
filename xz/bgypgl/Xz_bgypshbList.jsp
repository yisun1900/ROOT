<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String xz_bgypshb_sqxh=null;
	String xz_bgypshb_dwbh=null;
	String xz_bgypshb_sqrq=null;
	String xz_bgypshb_sqr=null;
	String xz_bgypshb_bgypbh=null;
	xz_bgypshb_sqxh=request.getParameter("xz_bgypshb_sqxh");
	if (xz_bgypshb_sqxh!=null)
	{
		xz_bgypshb_sqxh=cf.GB2Uni(xz_bgypshb_sqxh);
		if (!(xz_bgypshb_sqxh.equals("")))	wheresql+=" and  (xz_bgypshb.sqxh='"+xz_bgypshb_sqxh+"')";
	}
	xz_bgypshb_dwbh=request.getParameter("xz_bgypshb_dwbh");
	if (xz_bgypshb_dwbh!=null)
	{
		xz_bgypshb_dwbh=cf.GB2Uni(xz_bgypshb_dwbh);
		if (!(xz_bgypshb_dwbh.equals("")))	wheresql+=" and  (xz_bgypshb.dwbh='"+xz_bgypshb_dwbh+"')";
	}
	xz_bgypshb_sqrq=request.getParameter("xz_bgypshb_sqrq");
	if (xz_bgypshb_sqrq!=null)
	{
		xz_bgypshb_sqrq=xz_bgypshb_sqrq.trim();
		if (!(xz_bgypshb_sqrq.equals("")))	wheresql+="  and (xz_bgypshb.sqrq>=TO_DATE('"+xz_bgypshb_sqrq+"','YYYY/MM/DD'))";
	}
	xz_bgypshb_sqrq=request.getParameter("xz_bgypshb_sqrq2");
	if (xz_bgypshb_sqrq!=null)
	{
		xz_bgypshb_sqrq=xz_bgypshb_sqrq.trim();
		if (!(xz_bgypshb_sqrq.equals("")))	wheresql+="  and (xz_bgypshb.sqrq<=TO_DATE('"+xz_bgypshb_sqrq+"','YYYY/MM/DD'))";
	}
	xz_bgypshb_sqr=request.getParameter("xz_bgypshb_sqr");
	if (xz_bgypshb_sqr!=null)
	{
		xz_bgypshb_sqr=cf.GB2Uni(xz_bgypshb_sqr);
		if (!(xz_bgypshb_sqr.equals("")))	wheresql+=" and  (xz_bgypshb.sqr='"+xz_bgypshb_sqr+"')";
	}
	xz_bgypshb_bgypbh=request.getParameter("xz_bgypshb_bgypbh");
	if (xz_bgypshb_bgypbh!=null)
	{
		xz_bgypshb_bgypbh=cf.GB2Uni(xz_bgypshb_bgypbh);
		if (!(xz_bgypshb_bgypbh.equals("")))	wheresql+=" and  (xz_bgypshb.bgypbh='"+xz_bgypshb_bgypbh+"')";
	}
		if (yhjs.equals("A0")||yhjs.equals("A1"))
	{

		wheresql+=" and (1=1) ";
	}
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="  and ssdw='"+ssfgs+"' ";
	}
	else
	{
		wheresql+=" and (sq_dwxx.dwbh='"+dwbh+"') ";
	}


	ls_sql="SELECT xz_bgypshb.sqxh as sqxh,sq_dwxx.dwmc as xz_bgypshb_dwbh,xz_bgypshb.sqrq as xz_bgypshb_sqrq,xz_bgypshb.sqr as xz_bgypshb_sqr,xz_bgypbm.bgypmc as xz_bgypshb_bgypbh,xz_bgypshb.sqsl as xz_bgypshb_sqsl,xz_bgypshb.pzsl as xz_bgypshb_pzsl,xz_bgypshb.syjcsl as xz_bgypshb_syjcsl,xz_bgypshb.bz as xz_bgypshb_bz  ";
	ls_sql+=" FROM xz_bgypbm,xz_bgypshb,sq_dwxx  ";
    ls_sql+=" where xz_bgypshb.bgypbh=xz_bgypbm.bgypbh and xz_bgypshb.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Xz_bgypshbList.jsp","SelectXz_bgypshb.jsp","ViewXz_bgypshb.jsp","EditXz_bgypshb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sqxh","xz_bgypshb_dwbh","xz_bgypshb_sqrq","xz_bgypshb_sqr","xz_bgypshb_bgypbh","xz_bgypshb_sqsl","xz_bgypshb_pzsl","xz_bgypshb_syjcsl","xz_bgypshb_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Xz_bgypshbList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] sqxh = request.getParameterValues("sqxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(sqxh,"sqxh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from xz_bgypshb where "+chooseitem;
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
	<td  width="12%">&nbsp;</td>
	<td  width="7%">申请序号</td>
	<td  width="8%">申请部门</td>
	<td  width="8%">申请日期</td>
	<td  width="6%">申请人</td>
	<td  width="9%">办公用品</td>
	<td  width="5%">申请数量</td>
	<td  width="5%">批准数量</td>
	<td  width="5%">上月结存数量</td>
	<td  width="14%">备注</td>
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