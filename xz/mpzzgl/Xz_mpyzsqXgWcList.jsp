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
	String xz_mpyzsq_wcsj=null;
	String xz_mpyzsq_sfywc=null;
	String mpbb=null;
	String dj=null;

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
		if (!(xz_mpyzsq_sqrq.equals("")))	wheresql+="  and (xz_mpyzsq.sqrq>=TO_DATE('"+xz_mpyzsq_sqrq+"','YYYY-MM-DD'))";
	}
	xz_mpyzsq_sqrq=request.getParameter("xz_mpyzsq_sqrq2");
	if (xz_mpyzsq_sqrq!=null)
	{
		xz_mpyzsq_sqrq=xz_mpyzsq_sqrq.trim();
		if (!(xz_mpyzsq_sqrq.equals("")))	wheresql+="  and (xz_mpyzsq.sqrq<=TO_DATE('"+xz_mpyzsq_sqrq+"','YYYY-MM-DD'))";
	}
	xz_mpyzsq_wcsj=request.getParameter("xz_mpyzsq_wcsj");
	if (xz_mpyzsq_wcsj!=null)
	{
		xz_mpyzsq_wcsj=xz_mpyzsq_wcsj.trim();
		if (!(xz_mpyzsq_wcsj.equals("")))	wheresql+="  and (xz_mpyzsq.wcsj>=TO_DATE('"+xz_mpyzsq_wcsj+"','YYYY-MM-DD'))";
	}
	xz_mpyzsq_wcsj=request.getParameter("xz_mpyzsq_wcsj2");
	if (xz_mpyzsq_wcsj!=null)
	{
		xz_mpyzsq_wcsj=xz_mpyzsq_wcsj.trim();
		if (!(xz_mpyzsq_wcsj.equals("")))	wheresql+="  and (xz_mpyzsq.wcsj<=TO_DATE('"+xz_mpyzsq_wcsj+"','YYYY-MM-DD'))";
	}
	mpbb=request.getParameter("mpbb");
	if (mpbb!=null)
	{
		mpbb=cf.GB2Uni(mpbb);
		if (!(mpbb.equals("")))	wheresql+=" and  (xz_mpyzsq.mpbb='"+mpbb+"')";
	}
	dj=request.getParameter("dj");
	if (dj!=null)
	{
		dj=cf.GB2Uni(dj);
		if (!(dj.equals("")))	wheresql+=" and  (xz_mpyzsq.dj="+dj+")";
	}

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}

	String myxssl=request.getParameter("myxssl");


	ls_sql="SELECT xz_mpyzsq.sqxh,DECODE(xz_mpyzsq.sfywc,'Y','是','N','否') as sfywc,xz_mpyzsq.sqrq,xz_mpyzsq.yqjfrq,xz_mpyzsq.yqsl,mpbb,wcsj,wcsl,dj,xz_mpyzsq.xm as xz_mpyzsq_xm,xz_mpyzsq.zw as xz_mpyzsq_zw,xz_mpyzsq.dh,xz_mpyzsq.bgdh,xz_mpyzsq.cz as xz_mpyzsq_cz,xz_mpyzsq.yx as xz_mpyzsq_yx,sq_dwxx.dwmc as xz_mpyzsq_dwbh,xz_mpyzsq.sqlrr,xz_mpyzsq.bz as xz_mpyzsq_bz    ";
	ls_sql+=" FROM xz_mpyzsq,sq_dwxx  ";
    ls_sql+=" where xz_mpyzsq.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Xz_mpyzsqXgWcList.jsp","SelectXgWcXz_mpyzsq.jsp","","XgWcXz_mpyzsq.jsp");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"sqxh","xz_mpyzsq_xm","xz_mpyzsq_zw","xz_mpyzsq_sj","xz_mpyzsq_dh","xz_mpyzsq_yx","xz_mpyzsq_bz","xz_mpyzsq_dwbh","xz_mpyzsq_sqrq"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除完成信息"};//按钮的显示名称
	String[] buttonLink={"Xz_mpyzsqXgWcList.jsp?"};//按钮单击调用的网页，可以增加参数
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
		sql[0]="update xz_mpyzsq set wcsj=null,wcsl=null,wclrr=null,dj=null,sfywc='N'   where "+chooseitem;
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
  <B><font size="3">修改完成信息</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">申请序号</td>
	<td  width="3%">是否完成</td>
	<td  width="5%">申请日期</td>
	<td  width="5%">要求交付日期</td>
	<td  width="3%">要求数量</td>
	<td  width="4%">名片版本</td>
	<td  width="5%">完成时间</td>
	<td  width="3%">完成数量</td>
	<td  width="3%">单价</td>
	<td  width="4%">姓名</td>
	<td  width="5%">职务</td>
	<td  width="8%">手机</td>
	<td  width="9%">办公电话</td>
	<td  width="7%">传真</td>
	<td  width="9%">邮箱</td>
	<td  width="6%">申请部门</td>
	<td  width="3%">申请录入人</td>
	<td  width="10%">备注</td>
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
