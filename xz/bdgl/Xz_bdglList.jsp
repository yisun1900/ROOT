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
	String xz_bdgl_bdbh=null;
	String xz_bdgl_bdmc=null;
	String xz_bdgl_bdfj=null;
	String xz_bdgl_fbsj=null;
	String xz_bdgl_fbbm=null;
	String xz_bdgl_lrr=null;
	String xz_bdgl_lrsj=null;

	String fbr=null;
	fbr=request.getParameter("fbr");
	if (fbr!=null)
	{
		fbr=cf.GB2Uni(fbr);
		if (!(fbr.equals("")))	wheresql+=" and  (xz_bdgl.fbr='"+fbr+"')";
	}

	String fbfgs=null;
	fbfgs=request.getParameter("fbfgs");
	if (fbfgs!=null)
	{
		fbfgs=cf.GB2Uni(fbfgs);
		if (!(fbfgs.equals("")))	wheresql+=" and  (xz_bdgl.fbfgs='"+fbfgs+"')";
	}
	String fbfw=null;
	fbfw=request.getParameter("fbfw");
	if (fbfw!=null)
	{
		fbfw=cf.GB2Uni(fbfw);
		if (!(fbfw.equals("")))	wheresql+=" and  (xz_bdgl.fbfw='"+fbfw+"')";
	}
	
	
	xz_bdgl_bdbh=request.getParameter("xz_bdgl_bdbh");
	if (xz_bdgl_bdbh!=null)
	{
		xz_bdgl_bdbh=cf.GB2Uni(xz_bdgl_bdbh);
		if (!(xz_bdgl_bdbh.equals("")))	wheresql+=" and  (xz_bdgl.bdbh='"+xz_bdgl_bdbh+"')";
	}
	xz_bdgl_bdmc=request.getParameter("xz_bdgl_bdmc");
	if (xz_bdgl_bdmc!=null)
	{
		xz_bdgl_bdmc=cf.GB2Uni(xz_bdgl_bdmc);
		if (!(xz_bdgl_bdmc.equals("")))	wheresql+=" and  (xz_bdgl.bdmc like '%"+xz_bdgl_bdmc+"%')";
	}
	xz_bdgl_bdfj=request.getParameter("xz_bdgl_bdfj");
	if (xz_bdgl_bdfj!=null)
	{
		xz_bdgl_bdfj=cf.GB2Uni(xz_bdgl_bdfj);
		if (!(xz_bdgl_bdfj.equals("")))	wheresql+=" and  (xz_bdgl.bdfj='"+xz_bdgl_bdfj+"')";
	}
	xz_bdgl_fbsj=request.getParameter("xz_bdgl_fbsj");
	if (xz_bdgl_fbsj!=null)
	{
		xz_bdgl_fbsj=xz_bdgl_fbsj.trim();
		if (!(xz_bdgl_fbsj.equals("")))	wheresql+="  and (xz_bdgl.fbsj>=TO_DATE('"+xz_bdgl_fbsj+"','YYYY/MM/DD'))";
	}
	xz_bdgl_fbsj=request.getParameter("xz_bdgl_fbsj2");
	if (xz_bdgl_fbsj!=null)
	{
		xz_bdgl_fbsj=xz_bdgl_fbsj.trim();
		if (!(xz_bdgl_fbsj.equals("")))	wheresql+="  and (xz_bdgl.fbsj<=TO_DATE('"+xz_bdgl_fbsj+"','YYYY/MM/DD'))";
	}
	xz_bdgl_fbbm=request.getParameter("xz_bdgl_fbbm");
	if (xz_bdgl_fbbm!=null)
	{
		xz_bdgl_fbbm=cf.GB2Uni(xz_bdgl_fbbm);
		if (!(xz_bdgl_fbbm.equals("")))	wheresql+=" and  (xz_bdgl.fbbm='"+xz_bdgl_fbbm+"')";
	}
	xz_bdgl_lrr=request.getParameter("xz_bdgl_lrr");
	if (xz_bdgl_lrr!=null)
	{
		xz_bdgl_lrr=cf.GB2Uni(xz_bdgl_lrr);
		if (!(xz_bdgl_lrr.equals("")))	wheresql+=" and  (xz_bdgl.lrr='"+xz_bdgl_lrr+"')";
	}
	xz_bdgl_lrsj=request.getParameter("xz_bdgl_lrsj");
	if (xz_bdgl_lrsj!=null)
	{
		xz_bdgl_lrsj=xz_bdgl_lrsj.trim();
		if (!(xz_bdgl_lrsj.equals("")))	wheresql+="  and (xz_bdgl.lrsj>=TO_DATE('"+xz_bdgl_lrsj+"','YYYY/MM/DD'))";
	}
	xz_bdgl_lrsj=request.getParameter("xz_bdgl_lrsj2");
	if (xz_bdgl_lrsj!=null)
	{
		xz_bdgl_lrsj=xz_bdgl_lrsj.trim();
		if (!(xz_bdgl_lrsj.equals("")))	wheresql+="  and (xz_bdgl.lrsj<=TO_DATE('"+xz_bdgl_lrsj+"','YYYY/MM/DD'))";
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

	ls_sql="SELECT xz_bdgl.bdbh,DECODE(fbfw,'1','本公司','2','集团'),xz_bdgl.bdmc,'<A HREF=\"/xz/bdgl/file/'||xz_bdgl.bdfj||'\" target=\"_blank\">'||xz_bdgl.bdfj||'</A>',xz_bdgl.fbsj,xz_bdgl.fbr,a.dwmc fbbm,b.dwmc fbfgs,xz_bdgl.lrr,xz_bdgl.lrsj  ";
	ls_sql+=" FROM xz_bdgl,sq_dwxx a,sq_dwxx b ";
    ls_sql+="  where xz_bdgl.fbbm=a.dwbh and xz_bdgl.fbfgs=b.dwbh";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Xz_bdglList.jsp","SelectXz_bdgl.jsp","","EditXz_bdgl.jsp");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"bdbh","xz_bdgl_bdmc","xz_bdgl_bdfj","xz_bdgl_fbsj","xz_bdgl_fbr","xz_bdgl_fbbm","xz_bdgl_lrr","xz_bdgl_lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"bdbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Xz_bdglList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] bdbh = request.getParameterValues("bdbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(bdbh,"bdbh"));
//	out.println(chooseitem);
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from xz_bdgl where "+chooseitem;
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
  <B><font size="3">表单维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="8%">表单编号</td>
	<td  width="7%">发布范围</td>
	<td  width="14%">表单名称</td>
	<td  width="15%">表单附件</td>
	<td  width="7%">发布时间</td>
	<td  width="8%">发布人</td>
	<td  width="12%">发布部门</td>
	<td  width="11%">发布分公司</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
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