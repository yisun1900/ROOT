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
	String cw_zjtcbl_xh=null;
	String cw_zjtcbl_fdmc=null;
	String cw_zjtcbl_qd=null;
	String cw_zjtcbl_zd=null;
	String cw_zjtcbl_tcbfb=null;
	String cw_zjtcbl_qdlx=null;
	String cw_zjtcbl_fgsbh=null;
	cw_zjtcbl_xh=request.getParameter("cw_zjtcbl_xh");
	if (cw_zjtcbl_xh!=null)
	{
		cw_zjtcbl_xh=cw_zjtcbl_xh.trim();
		if (!(cw_zjtcbl_xh.equals("")))	wheresql+=" and (cw_zjtcbl.xh="+cw_zjtcbl_xh+") ";
	}
	cw_zjtcbl_fdmc=request.getParameter("cw_zjtcbl_fdmc");
	if (cw_zjtcbl_fdmc!=null)
	{
		cw_zjtcbl_fdmc=cf.GB2Uni(cw_zjtcbl_fdmc);
		if (!(cw_zjtcbl_fdmc.equals("")))	wheresql+=" and  (cw_zjtcbl.fdmc='"+cw_zjtcbl_fdmc+"')";
	}
	cw_zjtcbl_qd=request.getParameter("cw_zjtcbl_qd");
	if (cw_zjtcbl_qd!=null)
	{
		cw_zjtcbl_qd=cw_zjtcbl_qd.trim();
		if (!(cw_zjtcbl_qd.equals("")))	wheresql+=" and  (cw_zjtcbl.qd="+cw_zjtcbl_qd+") ";
	}
	cw_zjtcbl_zd=request.getParameter("cw_zjtcbl_zd");
	if (cw_zjtcbl_zd!=null)
	{
		cw_zjtcbl_zd=cw_zjtcbl_zd.trim();
		if (!(cw_zjtcbl_zd.equals("")))	wheresql+=" and  (cw_zjtcbl.zd="+cw_zjtcbl_zd+") ";
	}
	cw_zjtcbl_tcbfb=request.getParameter("cw_zjtcbl_tcbfb");
	if (cw_zjtcbl_tcbfb!=null)
	{
		cw_zjtcbl_tcbfb=cw_zjtcbl_tcbfb.trim();
		if (!(cw_zjtcbl_tcbfb.equals("")))	wheresql+=" and  (cw_zjtcbl.tcbfb="+cw_zjtcbl_tcbfb+") ";
	}
	cw_zjtcbl_qdlx=request.getParameter("cw_zjtcbl_qdlx");
	if (cw_zjtcbl_qdlx!=null)
	{
		cw_zjtcbl_qdlx=cf.GB2Uni(cw_zjtcbl_qdlx);
		if (!(cw_zjtcbl_qdlx.equals("")))	wheresql+=" and  (cw_zjtcbl.qdlx='"+cw_zjtcbl_qdlx+"')";
	}
	cw_zjtcbl_fgsbh=request.getParameter("cw_zjtcbl_fgsbh");
	if (cw_zjtcbl_fgsbh!=null)
	{
		cw_zjtcbl_fgsbh=cf.GB2Uni(cw_zjtcbl_fgsbh);
		if (!(cw_zjtcbl_fgsbh.equals("")))	wheresql+=" and  (cw_zjtcbl.fgsbh='"+cw_zjtcbl_fgsbh+"')";
	}
	ls_sql="SELECT cw_zjtcbl.xh,cw_zjtcbl.fdmc,cw_zjtcbl.qd,cw_zjtcbl.zd,cw_zjtcbl.tcbfb, DECODE(cw_zjtcbl.qdlx,'1','主任监理','2','监理'),cw_zjtcbl.fgsbh,sq_dwxx.dwmc  ";
	ls_sql+=" FROM sq_dwxx,cw_zjtcbl  ";
    ls_sql+=" where cw_zjtcbl.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_zjtcblList.jsp","SelectCw_zjtcbl.jsp","","EditCw_zjtcbl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","cw_zjtcbl_fdmc","cw_zjtcbl_qd","cw_zjtcbl_zd","cw_zjtcbl_tcbfb","cw_zjtcbl_qdlx","cw_zjtcbl_fgsbh","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_zjtcblList.jsp?"};//按钮单击调用的网页，可以增加参数
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
		sql[0]="delete from cw_zjtcbl where "+chooseitem;
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
	<td  width="11%">质检类型</td>
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