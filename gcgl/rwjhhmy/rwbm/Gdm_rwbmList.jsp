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

	String rwbm=null;
	String rwmc=null;
	String rwflbm=null;
	String rwdx=null;

	String sfsjysxm=null;
	String gcysxmbm=null;
	String sfsjzcxm=null;
	String zcdlbm=null;
	String sjzcjd=null;
	String bjjbbm=null;
	String bjsj=null;
	String sfyxhxgq=null;
	String zdjkrw=null;

	rwbm=request.getParameter("rwbm");
	if (rwbm!=null)
	{
		rwbm=cf.GB2Uni(rwbm);
		if (!(rwbm.equals("")))	wheresql+=" and  (gdm_rwbm.rwbm='"+rwbm+"')";
	}
	rwmc=request.getParameter("rwmc");
	if (rwmc!=null)
	{
		rwmc=cf.GB2Uni(rwmc);
		if (!(rwmc.equals("")))	wheresql+=" and  (gdm_rwbm.rwmc like '%"+rwmc+"%')";
	}
	rwflbm=request.getParameter("rwflbm");
	if (rwflbm!=null)
	{
		rwflbm=cf.GB2Uni(rwflbm);
		if (!(rwflbm.equals("")))	wheresql+=" and  (gdm_rwbm.rwflbm='"+rwflbm+"')";
	}
	rwdx=request.getParameter("rwdx");
	if (rwdx!=null)
	{
		rwdx=cf.GB2Uni(rwdx);
		if (!(rwdx.equals("")))	wheresql+=" and  (gdm_rwbm.rwdx='"+rwdx+"')";
	}


	sfsjysxm=request.getParameter("sfsjysxm");
	if (sfsjysxm!=null)
	{
		sfsjysxm=cf.GB2Uni(sfsjysxm);
		if (!(sfsjysxm.equals("")))	wheresql+=" and  (gdm_rwbm.sfsjysxm='"+sfsjysxm+"')";
	}
	gcysxmbm=request.getParameter("gcysxmbm");
	if (gcysxmbm!=null)
	{
		gcysxmbm=cf.GB2Uni(gcysxmbm);
		if (!(gcysxmbm.equals("")))	wheresql+=" and  (gdm_rwbm.gcysxmbm='"+gcysxmbm+"')";
	}
	sfsjzcxm=request.getParameter("sfsjzcxm");
	if (sfsjzcxm!=null)
	{
		sfsjzcxm=sfsjzcxm.trim();
		if (!(sfsjzcxm.equals("")))	wheresql+=" and  (gdm_rwbm.sfsjzcxm='"+sfsjzcxm+"')";
	}
	zcdlbm=request.getParameter("zcdlbm");
	if (zcdlbm!=null)
	{
		zcdlbm=cf.GB2Uni(zcdlbm);
		if (!(zcdlbm.equals("")))	wheresql+=" and  (gdm_rwbm.zcdlbm='"+zcdlbm+"')";
	}


	sjzcjd=request.getParameter("sjzcjd");
	if (sjzcjd!=null)
	{
		sjzcjd=cf.GB2Uni(sjzcjd);
		if (!(sjzcjd.equals("")))	wheresql+=" and  (gdm_rwbm.sjzcjd='"+sjzcjd+"')";
	}
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (gdm_rwbm.bjjbbm='"+bjjbbm+"')";
	}
	bjsj=request.getParameter("bjsj");
	if (bjsj!=null)
	{
		bjsj=cf.GB2Uni(bjsj);
		if (!(bjsj.equals("")))	wheresql+=" and  (gdm_rwbm.bjsj='"+bjsj+"')";
	}
	sfyxhxgq=request.getParameter("sfyxhxgq");
	if (sfyxhxgq!=null)
	{
		sfyxhxgq=cf.GB2Uni(sfyxhxgq);
		if (!(sfyxhxgq.equals("")))	wheresql+=" and  (gdm_rwbm.sfyxhxgq='"+sfyxhxgq+"')";
	}
	zdjkrw=request.getParameter("zdjkrw");
	if (zdjkrw!=null)
	{
		zdjkrw=cf.GB2Uni(zdjkrw);
		if (!(zdjkrw.equals("")))	wheresql+=" and  (gdm_rwbm.zdjkrw='"+zdjkrw+"')";
	}
	ls_sql="SELECT gdm_rwbm.rwbm,gdm_rwbm.rwmc,gdm_rwflbm.rwflmc, DECODE(sfsjysxm,'Y','是','N','否'),gcysxmmc, DECODE(sfsjzcxm,'Y','是','N','否'),zcdlbm,DECODE(sjzcjd,'03','测量通知','05','已测量','25','复尺通知','26','复尺','09','合同已完成','11','合同已确认','13','工厂已接收','15','确定送货时间','17','已通知送货','19','送货安装完成' ), DECODE(gdm_rwbm.sfyxhxgq,'Y','是','N','否'),DECODE(gdm_rwbm.zdjkrw,'Y','重点','N','非重点'),DECODE(gdm_rwbm.bjsj,'1','事前报警','2','事后提醒','3','事前事后都提醒','9','不报警'),bjjbmc,gdm_rwbm.sqbjnr,gdm_rwbm.sqbjts,gdm_rwbm.shbjnr,gdm_rwbm.shbjts,hxrw,gdm_rwbm.rwxh,gdm_rwbm.bz  ";
	ls_sql+=" FROM gdm_rwflbm,gdm_rwbm,gdm_bjjbbm,dm_gcysxm  ";
    ls_sql+=" where gdm_rwbm.rwflbm=gdm_rwflbm.rwflbm(+) ";
    ls_sql+=" and gdm_rwbm.bjjbbm=gdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and gdm_rwbm.gcysxmbm=dm_gcysxm.gcysxmbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by gdm_rwbm.rwbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Gdm_rwbmList.jsp","","","EditGdm_rwbm.jsp");
	pageObj.setPageRow(20);//设置每页显示记录数


//设置主键
	String[] keyName={"rwbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Gdm_rwbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"rwbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewGdm_rwbm.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("rwbm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

}
else//非第一次进入此页，不需要初始化
{
	String[] rwbm = request.getParameterValues("rwbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(rwbm,"rwbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from gdm_rwbm where "+chooseitem;
		sql[1]="delete from gdm_rwljgx where "+chooseitem;
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
	pageObj.printPageLink(270);
%>


<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="2%">任务编码</td>
	<td  width="11%">任务名称</td>
	<td  width="3%">任务分类</td>
	<td  width="2%">是否涉及验收项目</td>
	<td  width="7%">验收项目</td>
	<td  width="2%">是否涉及主材项目</td>
	<td  width="5%">涉及主材大类</td>
	<td  width="5%">涉及主材节点</td>
	<td  width="2%">是否影响后续工期</td>
	<td  width="2%">重点监控任务</td>

	<td  width="3%">报警时间</td>
	<td  width="3%">报警级别</td>
	<td  width="12%">事前报警内容</td>
	<td  width="2%">事前报警天数</td>
	<td  width="12%">事后报警内容</td>
	<td  width="2%">事后报警天数</td>
	<td  width="10%">后续任务</td>
	<td  width="2%">任务序号</td>
	<td  width="10%">任务备注</td>
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