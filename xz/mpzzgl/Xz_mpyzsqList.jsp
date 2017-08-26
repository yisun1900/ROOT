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
	String xz_mpyzsq_sqxh=null;
	String xz_mpyzsq_xm=null;
	String xz_mpyzsq_zw=null;
	String xz_mpyzsq_dwbh=null;
	String xz_mpyzsq_sqrq=null;
	String xz_mpyzsq_sfywc=null;

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		if (!(ssfgs.equals("")))	wheresql+=" and  (xz_mpyzsq.ssfgs='"+ssfgs+"')";
	}

	xz_mpyzsq_sqxh=request.getParameter("xz_mpyzsq_sqxh");
	if (xz_mpyzsq_sqxh!=null)
	{
		xz_mpyzsq_sqxh=cf.GB2Uni(xz_mpyzsq_sqxh);
		if (!(xz_mpyzsq_sqxh.equals("")))	wheresql+=" and  (xz_mpyzsq.sqxh='"+xz_mpyzsq_sqxh+"')";
	}
	xz_mpyzsq_sfywc=request.getParameter("xz_mpyzsq_sfywc");
	if (xz_mpyzsq_sfywc!=null)
	{
		xz_mpyzsq_sfywc=cf.GB2Uni(xz_mpyzsq_sfywc);
		if (!(xz_mpyzsq_sfywc.equals("")))	wheresql+=" and  (xz_mpyzsq.sfywc='"+xz_mpyzsq_sfywc+"')";
	}

	xz_mpyzsq_xm=request.getParameter("xz_mpyzsq_xm");
	if (xz_mpyzsq_xm!=null)
	{
		xz_mpyzsq_xm=cf.GB2Uni(xz_mpyzsq_xm);
		if (!(xz_mpyzsq_xm.equals("")))	wheresql+=" and  (xz_mpyzsq.xm like '%"+xz_mpyzsq_xm+"%')";
	}
	xz_mpyzsq_zw=request.getParameter("xz_mpyzsq_zw");
	if (xz_mpyzsq_zw!=null)
	{
		xz_mpyzsq_zw=cf.GB2Uni(xz_mpyzsq_zw);
		if (!(xz_mpyzsq_zw.equals("")))	wheresql+=" and  (xz_mpyzsq.zw like '%"+xz_mpyzsq_zw+"%')";
	}
	xz_mpyzsq_dwbh=request.getParameter("xz_mpyzsq_dwbh");
	if (xz_mpyzsq_dwbh!=null)
	{
		xz_mpyzsq_dwbh=cf.GB2Uni(xz_mpyzsq_dwbh);
		if (!(xz_mpyzsq_dwbh.equals("")))	wheresql+=" and  (xz_mpyzsq.dwbh='"+xz_mpyzsq_dwbh+"')";
	}
	xz_mpyzsq_sqrq=request.getParameter("xz_mpyzsq_sqrq");
	if (xz_mpyzsq_sqrq!=null)
	{
		xz_mpyzsq_sqrq=xz_mpyzsq_sqrq.trim();
		if (!(xz_mpyzsq_sqrq.equals("")))	wheresql+="  and (xz_mpyzsq.sqrq>=TO_DATE('"+xz_mpyzsq_sqrq+"','YYYY/MM/DD'))";
	}
	xz_mpyzsq_sqrq=request.getParameter("xz_mpyzsq_sqrq2");
	if (xz_mpyzsq_sqrq!=null)
	{
		xz_mpyzsq_sqrq=xz_mpyzsq_sqrq.trim();
		if (!(xz_mpyzsq_sqrq.equals("")))	wheresql+="  and (xz_mpyzsq.sqrq<=TO_DATE('"+xz_mpyzsq_sqrq+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT xz_mpyzsq.sqxh,DECODE(xz_mpyzsq.sfywc,'Y','是','N','否') as sfywc,xz_mpyzsq.sqrq,xz_mpyzsq.yqjfrq,mpbb,xz_mpyzsq.yqsl,xz_mpyzsq.xm as xz_mpyzsq_xm,xz_mpyzsq.zw as xz_mpyzsq_zw,xz_mpyzsq.dh as xz_mpyzsq_dh,xz_mpyzsq.cz as xz_mpyzsq_cz,xz_mpyzsq.yx as xz_mpyzsq_yx,sq_dwxx.dwmc as xz_mpyzsq_dwbh,xz_mpyzsq.sqlrr,xz_mpyzsq.bz as xz_mpyzsq_bz    ";
	ls_sql+=" FROM xz_mpyzsq,sq_dwxx  ";
    ls_sql+=" where xz_mpyzsq.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
	ls_sql+=" order by  xz_mpyzsq.sqrq desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Xz_mpyzsqList.jsp","SelectXz_mpyzsq.jsp","","EditXz_mpyzsq.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sqxh","xz_mpyzsq_xm","xz_mpyzsq_zw","xz_mpyzsq_sj","xz_mpyzsq_dh","xz_mpyzsq_yx","xz_mpyzsq_bz","xz_mpyzsq_dwbh","xz_mpyzsq_sqrq"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Xz_mpyzsqList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//非第一次进入此页，不需要初始化
{
	String[] sqxh = request.getParameterValues("sqxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(sqxh,"sqxh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from xz_mpyzsq where "+chooseitem;
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
  <B><font size="3">名片制作申请维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="4%">申请序号</td>
	<td  width="4%">是否完成</td>
	<td  width="6%">申请日期</td>
	<td  width="6%">要求交付日期</td>
	<td  width="5%">版本</td>
	<td  width="4%">要求数量</td>
	<td  width="4%">姓名</td>
	<td  width="7%">职务</td>
	<td  width="12%">电话</td>
	<td  width="9%">传真</td>
	<td  width="11%">邮箱</td>
	<td  width="8%">申请部门</td>
	<td  width="4%">申请录入人</td>
	<td  width="11%">备注</td>
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
