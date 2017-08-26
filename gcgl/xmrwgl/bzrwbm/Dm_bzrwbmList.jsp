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
	String dm_bzrwbm_rwbm=null;
	String dm_bzrwbm_rwmc=null;
	String dm_bzrwbm_rwflbm=null;
	String dm_bzrwbm_zdjkrw=null;
	String dm_bzrwbm_bjlb=null;
	String dm_bzrwbm_sqtxts=null;
	String dm_bzrwbm_shtxts=null;
	String dm_bzrwbm_sfyxhxgq=null;
	String dm_bzrwbm_sfyxfc=null;
	String dm_bzrwbm_sfxys=null;

	String sjcpxx=null;
	sjcpxx=request.getParameter("sjcpxx");
	if (sjcpxx!=null)
	{
		sjcpxx=cf.GB2Uni(sjcpxx);
		if (!(sjcpxx.equals("")))	wheresql+=" and  (dm_bzrwbm.sjcpxx='"+sjcpxx+"')";
	}

	String zyrwbm=null;
	zyrwbm=request.getParameter("zyrwbm");
	if (zyrwbm!=null)
	{
		zyrwbm=cf.GB2Uni(zyrwbm);
		if (!(zyrwbm.equals("")))	wheresql+=" and  (dm_bzrwbm.zyrwbm='"+zyrwbm+"')";
	}
	String sfwlcb=null;
	sfwlcb=request.getParameter("sfwlcb");
	if (sfwlcb!=null)
	{
		sfwlcb=cf.GB2Uni(sfwlcb);
		if (!(sfwlcb.equals("")))	wheresql+=" and  (dm_bzrwbm.sfwlcb='"+sfwlcb+"')";
	}
	String rwxh=null;
	rwxh=request.getParameter("rwxh");
	if (rwxh!=null)
	{
		rwxh=cf.GB2Uni(rwxh);
		if (!(rwxh.equals("")))	wheresql+=" and  (dm_bzrwbm.rwxh="+rwxh+")";
	}
	
	dm_bzrwbm_rwbm=request.getParameter("dm_bzrwbm_rwbm");
	if (dm_bzrwbm_rwbm!=null)
	{
		dm_bzrwbm_rwbm=cf.GB2Uni(dm_bzrwbm_rwbm);
		if (!(dm_bzrwbm_rwbm.equals("")))	wheresql+=" and  (dm_bzrwbm.rwbm='"+dm_bzrwbm_rwbm+"')";
	}
	dm_bzrwbm_rwmc=request.getParameter("dm_bzrwbm_rwmc");
	if (dm_bzrwbm_rwmc!=null)
	{
		dm_bzrwbm_rwmc=cf.GB2Uni(dm_bzrwbm_rwmc);
		if (!(dm_bzrwbm_rwmc.equals("")))	wheresql+=" and  (dm_bzrwbm.rwmc='"+dm_bzrwbm_rwmc+"')";
	}
	dm_bzrwbm_rwflbm=request.getParameter("dm_bzrwbm_rwflbm");
	if (dm_bzrwbm_rwflbm!=null)
	{
		dm_bzrwbm_rwflbm=cf.GB2Uni(dm_bzrwbm_rwflbm);
		if (!(dm_bzrwbm_rwflbm.equals("")))	wheresql+=" and  (dm_bzrwbm.rwflbm='"+dm_bzrwbm_rwflbm+"')";
	}
	dm_bzrwbm_zdjkrw=request.getParameter("dm_bzrwbm_zdjkrw");
	if (dm_bzrwbm_zdjkrw!=null)
	{
		dm_bzrwbm_zdjkrw=cf.GB2Uni(dm_bzrwbm_zdjkrw);
		if (!(dm_bzrwbm_zdjkrw.equals("")))	wheresql+=" and  (dm_bzrwbm.zdjkrw='"+dm_bzrwbm_zdjkrw+"')";
	}
	dm_bzrwbm_bjlb=request.getParameter("dm_bzrwbm_bjlb");
	if (dm_bzrwbm_bjlb!=null)
	{
		dm_bzrwbm_bjlb=cf.GB2Uni(dm_bzrwbm_bjlb);
		if (!(dm_bzrwbm_bjlb.equals("")))	wheresql+=" and  (dm_bzrwbm.bjlb='"+dm_bzrwbm_bjlb+"')";
	}
	dm_bzrwbm_sqtxts=request.getParameter("dm_bzrwbm_sqtxts");
	if (dm_bzrwbm_sqtxts!=null)
	{
		dm_bzrwbm_sqtxts=dm_bzrwbm_sqtxts.trim();
		if (!(dm_bzrwbm_sqtxts.equals("")))	wheresql+=" and (dm_bzrwbm.sqtxts>="+dm_bzrwbm_sqtxts+") ";
	}
	dm_bzrwbm_sqtxts=request.getParameter("dm_bzrwbm_sqtxts2");
	if (dm_bzrwbm_sqtxts!=null)
	{
		dm_bzrwbm_sqtxts=dm_bzrwbm_sqtxts.trim();
		if (!(dm_bzrwbm_sqtxts.equals("")))	wheresql+=" and (dm_bzrwbm.sqtxts<="+dm_bzrwbm_sqtxts+") ";
	}
	dm_bzrwbm_shtxts=request.getParameter("dm_bzrwbm_shtxts");
	if (dm_bzrwbm_shtxts!=null)
	{
		dm_bzrwbm_shtxts=dm_bzrwbm_shtxts.trim();
		if (!(dm_bzrwbm_shtxts.equals("")))	wheresql+=" and (dm_bzrwbm.shtxts>="+dm_bzrwbm_shtxts+") ";
	}
	dm_bzrwbm_shtxts=request.getParameter("dm_bzrwbm_shtxts2");
	if (dm_bzrwbm_shtxts!=null)
	{
		dm_bzrwbm_shtxts=dm_bzrwbm_shtxts.trim();
		if (!(dm_bzrwbm_shtxts.equals("")))	wheresql+=" and (dm_bzrwbm.shtxts<="+dm_bzrwbm_shtxts+") ";
	}
	dm_bzrwbm_sfyxhxgq=request.getParameter("dm_bzrwbm_sfyxhxgq");
	if (dm_bzrwbm_sfyxhxgq!=null)
	{
		dm_bzrwbm_sfyxhxgq=cf.GB2Uni(dm_bzrwbm_sfyxhxgq);
		if (!(dm_bzrwbm_sfyxhxgq.equals("")))	wheresql+=" and  (dm_bzrwbm.sfyxhxgq='"+dm_bzrwbm_sfyxhxgq+"')";
	}
	dm_bzrwbm_sfyxfc=request.getParameter("dm_bzrwbm_sfyxfc");
	if (dm_bzrwbm_sfyxfc!=null)
	{
		dm_bzrwbm_sfyxfc=cf.GB2Uni(dm_bzrwbm_sfyxfc);
		if (!(dm_bzrwbm_sfyxfc.equals("")))	wheresql+=" and  (dm_bzrwbm.sfyxfc='"+dm_bzrwbm_sfyxfc+"')";
	}
	dm_bzrwbm_sfxys=request.getParameter("dm_bzrwbm_sfxys");
	if (dm_bzrwbm_sfxys!=null)
	{
		dm_bzrwbm_sfxys=cf.GB2Uni(dm_bzrwbm_sfxys);
		if (!(dm_bzrwbm_sfxys.equals("")))	wheresql+=" and  (dm_bzrwbm.sfxys='"+dm_bzrwbm_sfxys+"')";
	}
	ls_sql="SELECT dm_bzrwbm.rwxh,dm_bzrwbm.rwbm,dm_bzrwbm.rwmc,dm_zyrwbm.zyrwmc,DECODE(dm_bzrwbm.sfwlcb,'Y','是','N','否'),dm_rwflbm.rwflmc, DECODE(dm_bzrwbm.zdjkrw,'1','重点','2','非重点'), DECODE(xgytg,'Y','是','N','否'),gytgts, DECODE(sjcpxx,'Y','是','N','否'),sjcpfl,bjjbmc, DECODE(dm_bzrwbm.bjlb,'1','事前报警','2','事后提醒','3','事前事后都提醒','9','一般记录'),dm_bzrwbm.sqtxnr,dm_bzrwbm.sqtxts,dm_bzrwbm.shtxnr,dm_bzrwbm.shtxts, DECODE(dm_bzrwbm.sfyxhxgq,'Y','是','N','否'), DECODE(dm_bzrwbm.sfyxfc,'Y','是','N','否'), DECODE(dm_bzrwbm.sfxys,'Y','是','N','否'),dm_bzrwbm.ysxm,dm_bzrwbm.gznr,dm_bzrwbm.bz  ";
	ls_sql+=" FROM dm_rwflbm,dm_bzrwbm,dm_zyrwbm,dm_bjjbbm  ";
    ls_sql+=" where dm_bzrwbm.rwflbm=dm_rwflbm.rwflbm(+) and dm_bzrwbm.zyrwbm=dm_zyrwbm.zyrwbm(+)";
    ls_sql+=" and dm_bzrwbm.bjjbbm=dm_bjjbbm.bjjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_bzrwbm.rwxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_bzrwbmList.jsp","","","EditDm_bzrwbm.jsp");
	pageObj.setPageRow(20);//设置每页显示记录数


//设置主键
	String[] keyName={"rwbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_bzrwbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"rwbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewDm_bzrwbm.jsp";//为列参数：coluParm.link设置超级链接
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
		String[] sql=new String[4];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from dm_bzrwljgx where "+chooseitem;
		sql[1]="delete from dm_bzrwcpfl where "+chooseitem;
		sql[2]="delete from dm_bzrwysxm where "+chooseitem;
		sql[3]="delete from dm_bzrwbm where "+chooseitem;
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
	pageObj.printPageLink(330);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="2%">任务序号</td>
	<td  width="2%">任务编码</td>
	<td  width="8%">任务名称</td>
	<td  width="4%">摘要任务</td>
	<td  width="2%">是否为里程碑</td>
	<td  width="3%">任务分类</td>
	<td  width="2%">重点监控任务</td>
	<td  width="2%">需工艺停工</td>
	<td  width="2%">工艺停工天数</td>
	<td  width="2%">涉及产品信息</td>
	<td  width="5%">涉及产品分类</td>
	<td  width="2%">报警级别</td>
	<td  width="3%">报警类别</td>
	<td  width="11%">事前提醒内容</td>
	<td  width="2%">事前提醒天数</td>
	<td  width="11%">事后提醒内容</td>
	<td  width="2%">事后提醒天数</td>
	<td  width="2%">影响后续工期</td>
	<td  width="2%">是否影响复尺</td>
	<td  width="2%">是否需验收</td>
	<td  width="6%">验收项目</td>
	<td  width="12%">关注内容</td>
	<td  width="8%">任务备注</td>
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