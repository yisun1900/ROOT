<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");//获取登录名
String yhjs=(String)session.getAttribute("yhjs");//获取用户角色

//String yhmc=(String)session.getAttribute("yhmc");
//System.out.println(lrr);
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String xz_ggbgl_ggbh=null;
	String xz_ggbgl_ggmc=null;
	String xz_ggbgl_fbsj=null;
	String xz_ggbgl_fbr=null;
	String xz_ggbgl_fbbm=null;
	String xz_ggbgl_lrr=null;
	String xz_ggbgl_lrsj=null;

	String fbfgs=null;
	fbfgs=request.getParameter("fbfgs");
	if (fbfgs!=null)
	{
		fbfgs=cf.GB2Uni(fbfgs);
		if (!(fbfgs.equals("")))	wheresql+=" and  (xz_ggbgl.fbfgs='"+fbfgs+"')";
	}

	xz_ggbgl_ggbh=request.getParameter("xz_ggbgl_ggbh");
	if (xz_ggbgl_ggbh!=null)
	{
		xz_ggbgl_ggbh=cf.GB2Uni(xz_ggbgl_ggbh);
		if (!(xz_ggbgl_ggbh.equals("")))	wheresql+=" and  (xz_ggbgl.ggbh='"+xz_ggbgl_ggbh+"')";
	}
	xz_ggbgl_ggmc=request.getParameter("xz_ggbgl_ggmc");
	if (xz_ggbgl_ggmc!=null)
	{
		xz_ggbgl_ggmc=cf.GB2Uni(xz_ggbgl_ggmc);
		if (!(xz_ggbgl_ggmc.equals("")))	wheresql+=" and  (xz_ggbgl.ggmc='"+xz_ggbgl_ggmc+"')";
	}
	xz_ggbgl_fbsj=request.getParameter("xz_ggbgl_fbsj");
	if (xz_ggbgl_fbsj!=null)
	{
		xz_ggbgl_fbsj=xz_ggbgl_fbsj.trim();
		if (!(xz_ggbgl_fbsj.equals("")))	wheresql+="  and (xz_ggbgl.fbsj>=TO_DATE('"+xz_ggbgl_fbsj+"','YYYY/MM/DD'))";
	}
	xz_ggbgl_fbsj=request.getParameter("xz_ggbgl_fbsj2");
	if (xz_ggbgl_fbsj!=null)
	{
		xz_ggbgl_fbsj=xz_ggbgl_fbsj.trim();
		if (!(xz_ggbgl_fbsj.equals("")))	wheresql+="  and (xz_ggbgl.fbsj<=TO_DATE('"+xz_ggbgl_fbsj+"','YYYY/MM/DD'))";
	}
	xz_ggbgl_fbr=request.getParameter("xz_ggbgl_fbr");
	if (xz_ggbgl_fbr!=null)
	{
		xz_ggbgl_fbr=cf.GB2Uni(xz_ggbgl_fbr);
		if (!(xz_ggbgl_fbr.equals("")))	wheresql+=" and  (xz_ggbgl.fbr='"+xz_ggbgl_fbr+"')";
	}
	xz_ggbgl_fbbm=request.getParameter("xz_ggbgl_fbbm");
	if (xz_ggbgl_fbbm!=null)
	{
		xz_ggbgl_fbbm=cf.GB2Uni(xz_ggbgl_fbbm);
		if (!(xz_ggbgl_fbbm.equals("")))	wheresql+=" and  (xz_ggbgl.fbbm='"+xz_ggbgl_fbbm+"')";
	}
	xz_ggbgl_lrr=request.getParameter("xz_ggbgl_lrr");
	if (xz_ggbgl_lrr!=null)
	{
		xz_ggbgl_lrr=cf.GB2Uni(xz_ggbgl_lrr);
		if (!(xz_ggbgl_lrr.equals("")))	wheresql+=" and  (xz_ggbgl.lrr='"+xz_ggbgl_lrr+"')";
	}
	xz_ggbgl_lrsj=request.getParameter("xz_ggbgl_lrsj");
	if (xz_ggbgl_lrsj!=null)
	{
		xz_ggbgl_lrsj=xz_ggbgl_lrsj.trim();
		if (!(xz_ggbgl_lrsj.equals("")))	wheresql+="  and (xz_ggbgl.lrsj>=TO_DATE('"+xz_ggbgl_lrsj+"','YYYY/MM/DD'))";
	}
	xz_ggbgl_lrsj=request.getParameter("xz_ggbgl_lrsj2");
	if (xz_ggbgl_lrsj!=null)
	{
		xz_ggbgl_lrsj=xz_ggbgl_lrsj.trim();
		if (!(xz_ggbgl_lrsj.equals("")))	wheresql+="  and (xz_ggbgl.lrsj<=TO_DATE('"+xz_ggbgl_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT xz_ggbgl.ggbh,xz_ggbgl.ggmc,'<A HREF=\"/xz/ggbgl/file/'||xz_ggbgl.fj||'\" target=\"_blank\">'||xz_ggbgl.fj||'</A>',xz_ggbgl.fbsj,xz_ggbgl.fbr,a.dwmc fbbm,b.dwmc fbfgs,xz_ggbgl.lrr,xz_ggbgl.lrsj";
	ls_sql+=" FROM sq_dwxx a,sq_dwxx b,xz_ggbgl  ";
	ls_sql+=" where xz_ggbgl.fbbm=a.dwbh and xz_ggbgl.fbfgs=b.dwbh ";
	ls_sql+=wheresql;
	ls_sql+=" order by xz_ggbgl.fbsj desc,xz_ggbgl.ggbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Xz_ggbglList.jsp","","","EditXz_ggbglMain.jsp");

//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ggbh","xz_ggbgl_ggmc","xz_ggbgl_ggnr","xz_ggbgl_fbsj","xz_ggbgl_fbr","xz_ggbgl_fbbm","xz_ggbgl_bz","xz_ggbgl_lrr","xz_ggbgl_lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ggbh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Xz_ggbglList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ggbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewXz_ggbgl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ggbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] ggbh = request.getParameterValues("ggbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(ggbh,"ggbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[6];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from xz_ggdx where "+chooseitem;
		sql[1]="delete from xz_ggckjl where "+chooseitem;
		sql[2]="delete from xz_ggbgl where "+chooseitem;
		sql[3]="delete from xz_ggfgs where "+chooseitem;
		sql[4]="delete from xz_ggbm where "+chooseitem;
		sql[5]="delete from xz_ggyhz where "+chooseitem;

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
  <B><font size="3">公告板维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="8%">公告编号</td>
	<td  width="24%">标题</td>
	<td  width="20%">附件</td>
	<td  width="7%">发布时间</td>
	<td  width="5%">发布人</td>
	<td  width="10%">发布部门</td>
	<td  width="9%">发布公司</td>
	<td  width="4%">录入人</td>
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