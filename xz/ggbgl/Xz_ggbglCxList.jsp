<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");//获取登录名
String yhjs=(String)session.getAttribute("yhjs");//获取用户角色
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
	if (yhjs.equals("A0"))
	{
		ls_sql="SELECT xz_ggbgl.ggbh,xz_ggbgl.ggmc,'<A HREF=\"/xz/ggbgl/file/'||xz_ggbgl.fj||'\" target=\"_blank\">'||xz_ggbgl.fj||'</A>',xz_ggbgl.fbsj,xz_ggbgl.fbr,dwmc";
		ls_sql+=" FROM sq_dwxx,xz_ggbgl  ";
		ls_sql+=" where xz_ggbgl.fbbm=sq_dwxx.dwbh";
		ls_sql+=wheresql;
		ls_sql+=" order by xz_ggbgl.fbsj desc,xz_ggbgl.ggbh";
	}
	else
	{
		ls_sql="SELECT xz_ggbgl.ggbh,xz_ggbgl.ggmc,'<A HREF=\"/xz/ggbgl/file/'||xz_ggbgl.fj||'\" target=\"_blank\">'||xz_ggbgl.fj||'</A>',xz_ggbgl.fbsj,xz_ggbgl.fbr,dwmc";
		ls_sql+=" FROM sq_dwxx,xz_ggbgl,xz_ggdx  ";
		ls_sql+=" where xz_ggbgl.fbbm=sq_dwxx.dwbh and xz_ggdx.ggbh=xz_ggbgl.ggbh and xz_ggdx.yhdlm='"+yhdlm+"'";
		ls_sql+=wheresql;
		ls_sql+=" order by xz_ggbgl.fbsj desc,xz_ggbgl.ggbh";
	}
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Xz_ggbglCxList.jsp","","","");
	pageObj.setViewBolt("");
	pageObj.setPageRow(60);//设置每页显示记录数


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
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查看公告板</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">公告编号</td>
	<td  width="39%">标题</td>
	<td  width="20%">附件</td>
	<td  width="10%">发布时间</td>
	<td  width="7%">发布人</td>
	<td  width="13%">发布部门</td>
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