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
	String qh_gwgl_gwbh=null;
	String qh_gwgl_gwmc=null;
	String qh_gwgl_gwfj=null;
	String qh_gwgl_fbsj=null;
	String qh_gwgl_fbbm=null;
	String qh_gwgl_lrsj=null;
	String qh_gwgl_lrr=null;
	String fbr=null;
	fbr=request.getParameter("fbr");
	if (fbr!=null)
	{
		fbr=cf.GB2Uni(fbr);
		if (!(fbr.equals("")))	wheresql+=" and  (qh_gwgl.fbr='"+fbr+"')";
	}
	
	String bt=null;
	bt=request.getParameter("bt");
	if (bt!=null)
	{
		bt=cf.GB2Uni(bt);
		if (!(bt.equals("")))	wheresql+=" and  (qh_gwgl.bt like '%"+bt+"%')";
	}
	String fl=null;
	fl=request.getParameter("fl");
	if (fl!=null)
	{
		fl=cf.GB2Uni(fl);
		if (!(fl.equals("")))	wheresql+=" and  (qh_gwgl.fl like '%"+fl+"%')";
	}

	String fbfgs=null;
	fbfgs=request.getParameter("fbfgs");
	if (fbfgs!=null)
	{
		fbfgs=cf.GB2Uni(fbfgs);
		if (!(fbfgs.equals("")))	wheresql+=" and  (qh_gwgl.fbfgs='"+fbfgs+"')";
	}
	String fbfw=null;
	fbfw=request.getParameter("fbfw");
	if (fbfw!=null)
	{
		fbfw=cf.GB2Uni(fbfw);
		if (!(fbfw.equals("")))	wheresql+=" and  (qh_gwgl.fbfw='"+fbfw+"')";
	}
	
	
	qh_gwgl_gwbh=request.getParameter("qh_gwgl_gwbh");
	if (qh_gwgl_gwbh!=null)
	{
		qh_gwgl_gwbh=cf.GB2Uni(qh_gwgl_gwbh);
		if (!(qh_gwgl_gwbh.equals("")))	wheresql+=" and  (qh_gwgl.gwbh='"+qh_gwgl_gwbh+"')";
	}
	qh_gwgl_gwmc=request.getParameter("qh_gwgl_gwmc");
	if (qh_gwgl_gwmc!=null)
	{
		qh_gwgl_gwmc=cf.GB2Uni(qh_gwgl_gwmc);
		if (!(qh_gwgl_gwmc.equals("")))	wheresql+=" and  (qh_gwgl.gwmc like '%"+qh_gwgl_gwmc+"%')";
	}
	qh_gwgl_gwfj=request.getParameter("qh_gwgl_gwfj");
	if (qh_gwgl_gwfj!=null)
	{
		qh_gwgl_gwfj=cf.GB2Uni(qh_gwgl_gwfj);
		if (!(qh_gwgl_gwfj.equals("")))	wheresql+=" and  (qh_gwgl.gwfj like '%"+qh_gwgl_gwfj+"%')";
	}
	qh_gwgl_fbsj=request.getParameter("qh_gwgl_fbsj");
	if (qh_gwgl_fbsj!=null)
	{
		qh_gwgl_fbsj=qh_gwgl_fbsj.trim();
		if (!(qh_gwgl_fbsj.equals("")))	wheresql+="  and (qh_gwgl.fbsj>=TO_DATE('"+qh_gwgl_fbsj+"','YYYY/MM/DD'))";
	}
	qh_gwgl_fbsj=request.getParameter("qh_gwgl_fbsj2");
	if (qh_gwgl_fbsj!=null)
	{
		qh_gwgl_fbsj=qh_gwgl_fbsj.trim();
		if (!(qh_gwgl_fbsj.equals("")))	wheresql+="  and (qh_gwgl.fbsj<=TO_DATE('"+qh_gwgl_fbsj+"','YYYY/MM/DD'))";
	}
	qh_gwgl_fbbm=request.getParameter("fbbm");
	if (qh_gwgl_fbbm!=null)
	{
		qh_gwgl_fbbm=cf.GB2Uni(qh_gwgl_fbbm);
		if (!(qh_gwgl_fbbm.equals("")))	wheresql+=" and  (qh_gwgl.fbbm='"+qh_gwgl_fbbm+"')";
	}
	qh_gwgl_lrsj=request.getParameter("qh_gwgl_lrsj");
	if (qh_gwgl_lrsj!=null)
	{
		qh_gwgl_lrsj=qh_gwgl_lrsj.trim();
		if (!(qh_gwgl_lrsj.equals("")))	wheresql+="  and (qh_gwgl.lrsj>=TO_DATE('"+qh_gwgl_lrsj+"','YYYY/MM/DD'))";
	}
	qh_gwgl_lrsj=request.getParameter("qh_gwgl_lrsj2");
	if (qh_gwgl_lrsj!=null)
	{
		qh_gwgl_lrsj=qh_gwgl_lrsj.trim();
		if (!(qh_gwgl_lrsj.equals("")))	wheresql+="  and (qh_gwgl.lrsj<=TO_DATE('"+qh_gwgl_lrsj+"','YYYY/MM/DD'))";
	}
	qh_gwgl_lrr=request.getParameter("qh_gwgl_lrr");
	if (qh_gwgl_lrr!=null)
	{
		qh_gwgl_lrr=cf.GB2Uni(qh_gwgl_lrr);
		if (!(qh_gwgl_lrr.equals("")))	wheresql+=" and  (qh_gwgl.lrr='"+qh_gwgl_lrr+"')";
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

	ls_sql="SELECT qh_gwgl.gwbh,DECODE(fbfw,'1','本公司','2','集团'),qh_gwgl.gwmc,qh_gwgl.bt,qh_gwgl.fl,'<A HREF=\"/qh/wjgl/file/'||qh_gwgl.gwfj||'\" target=\"_blank\">'||qh_gwgl.gwfj||'</A>',qh_gwgl.fbsj,qh_gwgl.fbr,a.dwmc fbbm,b.dwmc fbfgs,qh_gwgl.lrsj,qh_gwgl.lrr  ";
	ls_sql+=" FROM qh_gwgl,sq_dwxx a,sq_dwxx b ";
    ls_sql+="  where qh_gwgl.fbbm=a.dwbh and qh_gwgl.fbfgs=b.dwbh";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Qh_gwglList.jsp","SelectQh_gwgl.jsp","","EditQh_gwgl.jsp");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"gwbh","qh_gwgl_gwmc","qh_gwgl_gwfj","qh_gwgl_fbsj","qh_gwgl_fbr","qh_gwgl_fbbm","qh_gwgl_lrsj","qh_gwgl_lrr"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"gwbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Qh_gwglList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"gwbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewQh_gwgl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("gwbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] gwbh = request.getParameterValues("gwbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(gwbh,"gwbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from qh_gwgl where "+chooseitem;
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
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="7%">公文编号</td>
	<td  width="4%">发布范围</td>
	<td  width="13%">公文名称</td>
	<td  width="12%">标题</td>
	<td  width="9%">分类</td>
	<td  width="16%">公文附件</td>
	<td  width="5%">发布时间</td>
	<td  width="4%">发布人</td>
	<td  width="9%">发布部门</td>
	<td  width="8%">发布分公司</td>
	<td  width="5%">录入时间</td>
	<td  width="4%">录入人</td>
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