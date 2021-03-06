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
	String cw_ywytcbl_xh=null;
	String cw_ywytcbl_fdmc=null;
	String cw_ywytcbl_qd=null;
	String cw_ywytcbl_zd=null;
	String cw_ywytcbl_tcbfb=null;
	String cw_ywytcbl_qdlx=null;
	String cw_ywytcbl_fgsbh=null;
	cw_ywytcbl_xh=request.getParameter("cw_ywytcbl_xh");
	if (cw_ywytcbl_xh!=null)
	{
		cw_ywytcbl_xh=cw_ywytcbl_xh.trim();
		if (!(cw_ywytcbl_xh.equals("")))	wheresql+=" and (cw_ywytcbl.xh="+cw_ywytcbl_xh+") ";
	}
	cw_ywytcbl_fdmc=request.getParameter("cw_ywytcbl_fdmc");
	if (cw_ywytcbl_fdmc!=null)
	{
		cw_ywytcbl_fdmc=cf.GB2Uni(cw_ywytcbl_fdmc);
		if (!(cw_ywytcbl_fdmc.equals("")))	wheresql+=" and  (cw_ywytcbl.fdmc='"+cw_ywytcbl_fdmc+"')";
	}
	cw_ywytcbl_qd=request.getParameter("cw_ywytcbl_qd");
	if (cw_ywytcbl_qd!=null)
	{
		cw_ywytcbl_qd=cw_ywytcbl_qd.trim();
		if (!(cw_ywytcbl_qd.equals("")))	wheresql+=" and  (cw_ywytcbl.qd="+cw_ywytcbl_qd+") ";
	}
	cw_ywytcbl_zd=request.getParameter("cw_ywytcbl_zd");
	if (cw_ywytcbl_zd!=null)
	{
		cw_ywytcbl_zd=cw_ywytcbl_zd.trim();
		if (!(cw_ywytcbl_zd.equals("")))	wheresql+=" and  (cw_ywytcbl.zd="+cw_ywytcbl_zd+") ";
	}
	cw_ywytcbl_tcbfb=request.getParameter("cw_ywytcbl_tcbfb");
	if (cw_ywytcbl_tcbfb!=null)
	{
		cw_ywytcbl_tcbfb=cw_ywytcbl_tcbfb.trim();
		if (!(cw_ywytcbl_tcbfb.equals("")))	wheresql+=" and  (cw_ywytcbl.tcbfb="+cw_ywytcbl_tcbfb+") ";
	}
	cw_ywytcbl_qdlx=request.getParameter("cw_ywytcbl_qdlx");
	if (cw_ywytcbl_qdlx!=null)
	{
		cw_ywytcbl_qdlx=cf.GB2Uni(cw_ywytcbl_qdlx);
		if (!(cw_ywytcbl_qdlx.equals("")))	wheresql+=" and  (cw_ywytcbl.qdlx='"+cw_ywytcbl_qdlx+"')";
	}
	cw_ywytcbl_fgsbh=request.getParameter("cw_ywytcbl_fgsbh");
	if (cw_ywytcbl_fgsbh!=null)
	{
		cw_ywytcbl_fgsbh=cf.GB2Uni(cw_ywytcbl_fgsbh);
		if (!(cw_ywytcbl_fgsbh.equals("")))	wheresql+=" and  (cw_ywytcbl.fgsbh='"+cw_ywytcbl_fgsbh+"')";
	}
	ls_sql="SELECT cw_ywytcbl.xh,cw_ywytcbl.fdmc,cw_ywytcbl.qd,cw_ywytcbl.zd,cw_ywytcbl.tcbfb, DECODE(cw_ywytcbl.qdlx,'1','家装','3','工装'),cw_ywytcbl.fgsbh,sq_dwxx.dwmc  ";
	ls_sql+=" FROM sq_dwxx,cw_ywytcbl  ";
    ls_sql+=" where cw_ywytcbl.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_ywytcblList.jsp","SelectCw_ywytcbl.jsp","","EditCw_ywytcbl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","cw_ywytcbl_fdmc","cw_ywytcbl_qd","cw_ywytcbl_zd","cw_ywytcbl_tcbfb","cw_ywytcbl_qdlx","cw_ywytcbl_fgsbh","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_ywytcblList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_ywytcbl where "+chooseitem;
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
	<td  width="11%">序号</td>
	<td  width="11%">分段名称</td>
	<td  width="11%">起点（>）</td>
	<td  width="11%">终点（<=）</td>
	<td  width="11%">提成百分比</td>
	<td  width="11%">签单类型</td>
	<td  width="11%">分公司</td>
	<td  width="11%">分公司</td>
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