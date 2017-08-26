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
	String cw_dmkhcz_nian=null;
	String cw_dmkhcz_yue=null;
	String cw_dmkhcz_lrr=null;
	String cw_dmkhcz_lrsj=null;

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		if (!(ssfgs.equals("")))	wheresql+=" and  (sq_dwxx.ssfgs='"+ssfgs+"')";
	}

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (cw_dmkhcz.dwbh='"+dwbh+"')";
	}
	
	cw_dmkhcz_nian=request.getParameter("cw_dmkhcz_nian");
	if (cw_dmkhcz_nian!=null)
	{
		cw_dmkhcz_nian=cf.GB2Uni(cw_dmkhcz_nian);
		if (!(cw_dmkhcz_nian.equals("")))	wheresql+=" and  (cw_dmkhcz.nian='"+cw_dmkhcz_nian+"')";
	}
	cw_dmkhcz_yue=request.getParameter("cw_dmkhcz_yue");
	if (cw_dmkhcz_yue!=null)
	{
		cw_dmkhcz_yue=cf.GB2Uni(cw_dmkhcz_yue);
		if (!(cw_dmkhcz_yue.equals("")))	wheresql+=" and  (cw_dmkhcz.yue='"+cw_dmkhcz_yue+"')";
	}
	cw_dmkhcz_lrr=request.getParameter("cw_dmkhcz_lrr");
	if (cw_dmkhcz_lrr!=null)
	{
		cw_dmkhcz_lrr=cf.GB2Uni(cw_dmkhcz_lrr);
		if (!(cw_dmkhcz_lrr.equals("")))	wheresql+=" and  (cw_dmkhcz.lrr='"+cw_dmkhcz_lrr+"')";
	}
	cw_dmkhcz_lrsj=request.getParameter("cw_dmkhcz_lrsj");
	if (cw_dmkhcz_lrsj!=null)
	{
		cw_dmkhcz_lrsj=cw_dmkhcz_lrsj.trim();
		if (!(cw_dmkhcz_lrsj.equals("")))	wheresql+="  and (cw_dmkhcz.lrsj>=TO_DATE('"+cw_dmkhcz_lrsj+"','YYYY/MM/DD'))";
	}
	cw_dmkhcz_lrsj=request.getParameter("cw_dmkhcz_lrsj2");
	if (cw_dmkhcz_lrsj!=null)
	{
		cw_dmkhcz_lrsj=cw_dmkhcz_lrsj.trim();
		if (!(cw_dmkhcz_lrsj.equals("")))	wheresql+="  and (cw_dmkhcz.lrsj<=TO_DATE('"+cw_dmkhcz_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cw_dmkhcz.dwbh,sq_dwxx.dwmc,dm_dwjb.dwjbmc,dm_dmxs.dmxsmc,dm_ssfw.ssfwmc,sq_dwxx.dwdz,sq_dwxx.dwfzr,sq_dwxx.dwdh,cw_dmkhcz.nian,cw_dmkhcz.yue,cw_dmkhcz.khcz,cw_dmkhcz.mbcz,cw_dmkhcz.lrr,cw_dmkhcz.lrsj  ";
	ls_sql+=" FROM dm_ssfw,dm_dmxs,dm_dwjb,sq_dwxx,cw_dmkhcz  ";
    ls_sql+=" where sq_dwxx.ssfw=dm_ssfw.ssfw(+) and sq_dwxx.dmxs=dm_dmxs.dmxs(+) and sq_dwxx.dwjb=dm_dwjb.dwjb(+) and cw_dmkhcz.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_dmkhcz.dwbh,cw_dmkhcz.nian desc,cw_dmkhcz.yue";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_dmkhczList.jsp","SelectCw_dmkhcz.jsp","","EditCw_dmkhcz.jsp");
	pageObj.setPageRow(15);//设置每页显示记录数
//设置显示列
	String[] disColName={"nian","yue","khcz","mbcz","lrr","lrsj","dwmc","dwjbmc","dmxsmc"};
	pageObj.setDisColName(disColName);

//设置主键
	String[] keyName={"dwbh","nian","yue"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_dmkhczList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("nian","1");//列参数对象加入Hash表
	spanColHash.put("dwmc","1");//列参数对象加入Hash表
	spanColHash.put("dwjbmc","1");//列参数对象加入Hash表
	spanColHash.put("dmxsmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"dwbh","nian","yue"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_dmkhjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("yue",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_dmkhcz where "+chooseitem;
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
	<td  width="8%">&nbsp;</td>
	<td  width="8%">年</td>
	<td  width="7%">月</td>
	<td  width="12%">考核产值</td>
	<td  width="12%">目标产值</td>
	<td  width="8%">录入人</td>
	<td  width="10%">录入时间</td>
	<td  width="17%">单位名称</td>
	<td  width="10%">单位级别</td>
	<td  width="10%">店面形式</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
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