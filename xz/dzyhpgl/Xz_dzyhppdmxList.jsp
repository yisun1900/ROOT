<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
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
	String xz_dzyhppdmx_mc=null;
	String xz_dzyhppdmx_grsj=null;
	String xz_dzyhppdmx_dwbh=null;
	String xz_dzyhppdmx_pdsj=null;
	String pdr=null;
	xz_dzyhppdmx_mc=request.getParameter("xz_dzyhppdmx_mc");
	if (xz_dzyhppdmx_mc!=null)
	{
		xz_dzyhppdmx_mc=cf.GB2Uni(xz_dzyhppdmx_mc);
		if (!(xz_dzyhppdmx_mc.equals("")))	wheresql+=" and  (xz_dzyhppdmx.mc='"+xz_dzyhppdmx_mc+"')";
	}
	pdr=request.getParameter("pdr");

	if (pdr!=null)
	{
		pdr=cf.GB2Uni(pdr);
		if (!(pdr.equals("")))	wheresql+=" and  (xz_dzyhppdmx.pdr='"+pdr+"')";
	}

	xz_dzyhppdmx_grsj=request.getParameter("xz_dzyhppdmx_grsj");
	if (xz_dzyhppdmx_grsj!=null)
	{
		xz_dzyhppdmx_grsj=xz_dzyhppdmx_grsj.trim();
		if (!(xz_dzyhppdmx_grsj.equals("")))	wheresql+="  and (xz_dzyhppdmx.grsj>=TO_DATE('"+xz_dzyhppdmx_grsj+"','YYYY/MM/DD'))";
	}
	xz_dzyhppdmx_grsj=request.getParameter("xz_dzyhppdmx_grsj2");
	if (xz_dzyhppdmx_grsj!=null)
	{
		xz_dzyhppdmx_grsj=xz_dzyhppdmx_grsj.trim();
		if (!(xz_dzyhppdmx_grsj.equals("")))	wheresql+="  and (xz_dzyhppdmx.grsj<=TO_DATE('"+xz_dzyhppdmx_grsj+"','YYYY/MM/DD'))";
	}
	xz_dzyhppdmx_dwbh=request.getParameter("xz_dzyhppdmx_dwbh");
	if (xz_dzyhppdmx_dwbh!=null)
	{
		xz_dzyhppdmx_dwbh=cf.GB2Uni(xz_dzyhppdmx_dwbh);
		if (!(xz_dzyhppdmx_dwbh.equals("")))	wheresql+=" and  (xz_dzyhppdmx.dwbh='"+xz_dzyhppdmx_dwbh+"')";
	}
	xz_dzyhppdmx_pdsj=request.getParameter("xz_dzyhppdmx_pdsj");
	if (xz_dzyhppdmx_pdsj!=null)
	{
		xz_dzyhppdmx_pdsj=xz_dzyhppdmx_pdsj.trim();
		if (!(xz_dzyhppdmx_pdsj.equals("")))	wheresql+="  and (xz_dzyhppdmx.pdsj>=TO_DATE('"+xz_dzyhppdmx_pdsj+"','YYYY/MM/DD'))";
	}
	xz_dzyhppdmx_pdsj=request.getParameter("xz_dzyhppdmx_pdsj2");
	if (xz_dzyhppdmx_pdsj!=null)
	{
		xz_dzyhppdmx_pdsj=xz_dzyhppdmx_pdsj.trim();
		if (!(xz_dzyhppdmx_pdsj.equals("")))	wheresql+="  and (xz_dzyhppdmx.pdsj<=TO_DATE('"+xz_dzyhppdmx_pdsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT xz_dzyhppdmx.pdxh as pdxh,xz_dzyhppdmx.bh as xz_dzyhppdmx_bh,xz_dzyhppdmx.mc as xz_dzyhppdmx_mc,xz_dzyhppdmx.dw as xz_dzyhppdmx_dw,xz_dzyhppdmx.sl as xz_dzyhppdmx_sl,xz_dzyhppdmx.xhjgg as xz_dzyhppdmx_xhjgg,xz_dzyhppdmx.grsj as xz_dzyhppdmx_grsj,xz_dzyhppdmx.gryz as xz_dzyhppdmx_gryz,xz_dzyhppdmx.zrr as xz_dzyhppdmx_zrr,xz_dzyhppdmx.pdr as xz_dzyhppdmx_pdr,xz_dzyhppdmx.pdsj as xz_dzyhppdmx_pdsj,xz_dzyhppdmx.bz as xz_dzyhppdmx_bz,sq_dwxx.dwmc as sq_dwxx_dwmc  ";
	ls_sql+=" FROM sq_dwxx,xz_dzyhppdmx  ";
    ls_sql+=" where xz_dzyhppdmx.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Xz_dzyhppdmxList.jsp","SelectXz_dzyhppdmx.jsp","ViewXz_dzyhppdmx.jsp","EditXz_dzyhppdmx.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"pdxh","xz_dzyhppdmx_bh","xz_dzyhppdmx_mc","xz_dzyhppdmx_dw","xz_dzyhppdmx_sl","xz_dzyhppdmx_xhjgg","xz_dzyhppdmx_grsj","xz_dzyhppdmx_gryz","xz_dzyhppdmx_zrr","xz_dzyhppdmx_pdr","xz_dzyhppdmx_pdsj","xz_dzyhppdmx_bz","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"pdxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Xz_dzyhppdmxList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] pdxh = request.getParameterValues("pdxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(pdxh,"pdxh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from xz_dzyhppdmx where "+chooseitem;
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
	<td  width="9%">&nbsp;</td>
	<td  width="4%">盘点序号</td>
	<td  width="3%">编号</td>
	<td  width="6%">名称</td>
	<td  width="2%">单位</td>
	<td  width="3%">数量</td>
	<td  width="6%">型号及规格</td>
	<td  width="6%">购入时间</td>
	<td  width="6%">购入原值</td>
	<td  width="4%">责任人</td>
	<td  width="4%">盘点人</td>
	<td  width="6%">盘点时间</td>
	<td  width="6%">备注</td>
	<td  width="6%">使用单位</td>
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