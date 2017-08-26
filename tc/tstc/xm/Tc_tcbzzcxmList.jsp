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
	String tc_tczcxm_bjbbh=null;
	String tc_tczcxm_dqbm=null;
	String tc_tczcxm_bjjbbm=null;
	String tc_tczcxm_hxbm=null;
	String tc_tczcxm_jgwzbm=null;
	String tc_tczcxm_tccplbbm=null;
	String sfxzsl=null;
	String tc_tczcxm_lrr=null;
	String tc_tczcxm_lrsj=null;

	String sfyqxtpp=null;
	sfyqxtpp=request.getParameter("sfyqxtpp");
	if (sfyqxtpp!=null)
	{
		sfyqxtpp=cf.GB2Uni(sfyqxtpp);
		if (!(sfyqxtpp.equals("")))	wheresql+=" and  (tc_tczcxm.sfyqxtpp='"+sfyqxtpp+"')";
	}

	String tcsjflbm=null;
	tcsjflbm=request.getParameter("tcsjflbm");
	if (tcsjflbm!=null)
	{
		tcsjflbm=cf.GB2Uni(tcsjflbm);
		if (!(tcsjflbm.equals("")))	wheresql+=" and  (tc_tczcxm.tcsjflbm='"+tcsjflbm+"')";
	}

	String sfbxx=null;
	sfbxx=request.getParameter("sfbxx");
	if (sfbxx!=null)
	{
		sfbxx=cf.GB2Uni(sfbxx);
		if (!(sfbxx.equals("")))	wheresql+=" and  (tc_tczcxm.sfbxx='"+sfbxx+"')";
	}
	String sfyxsj=null;
	sfyxsj=request.getParameter("sfyxsj");
	if (sfyxsj!=null)
	{
		sfyxsj=cf.GB2Uni(sfyxsj);
		if (!(sfyxsj.equals("")))	wheresql+=" and  (tc_tczcxm.sfyxsj='"+sfyxsj+"')";
	}
	
	tc_tczcxm_bjbbh=request.getParameter("tc_tczcxm_bjbbh");
	if (tc_tczcxm_bjbbh!=null)
	{
		tc_tczcxm_bjbbh=cf.GB2Uni(tc_tczcxm_bjbbh);
		if (!(tc_tczcxm_bjbbh.equals("")))	wheresql+=" and  (tc_tczcxm.bjbbh='"+tc_tczcxm_bjbbh+"')";
	}
	tc_tczcxm_dqbm=request.getParameter("tc_tczcxm_dqbm");
	if (tc_tczcxm_dqbm!=null)
	{
		tc_tczcxm_dqbm=cf.GB2Uni(tc_tczcxm_dqbm);
		if (!(tc_tczcxm_dqbm.equals("")))	wheresql+=" and  (tc_tczcxm.dqbm='"+tc_tczcxm_dqbm+"')";
	}
	tc_tczcxm_bjjbbm=request.getParameter("tc_tczcxm_bjjbbm");
	if (tc_tczcxm_bjjbbm!=null)
	{
		tc_tczcxm_bjjbbm=cf.GB2Uni(tc_tczcxm_bjjbbm);
		if (!(tc_tczcxm_bjjbbm.equals("")))	wheresql+=" and  (tc_tczcxm.bjjbbm='"+tc_tczcxm_bjjbbm+"')";
	}
	tc_tczcxm_hxbm=request.getParameter("tc_tczcxm_hxbm");
	if (tc_tczcxm_hxbm!=null)
	{
		tc_tczcxm_hxbm=cf.GB2Uni(tc_tczcxm_hxbm);
		if (!(tc_tczcxm_hxbm.equals("")))	wheresql+=" and  (tc_tczcxm.hxbm='"+tc_tczcxm_hxbm+"')";
	}
	tc_tczcxm_jgwzbm=request.getParameter("tc_tczcxm_jgwzbm");
	if (tc_tczcxm_jgwzbm!=null)
	{
		tc_tczcxm_jgwzbm=cf.GB2Uni(tc_tczcxm_jgwzbm);
		if (!(tc_tczcxm_jgwzbm.equals("")))	wheresql+=" and  (tc_tczcxm.jgwzbm='"+tc_tczcxm_jgwzbm+"')";
	}
	tc_tczcxm_tccplbbm=request.getParameter("tc_tczcxm_tccplbbm");
	if (tc_tczcxm_tccplbbm!=null)
	{
		tc_tczcxm_tccplbbm=cf.GB2Uni(tc_tczcxm_tccplbbm);
		if (!(tc_tczcxm_tccplbbm.equals("")))	wheresql+=" and  (tc_tczcxm.tccplbbm='"+tc_tczcxm_tccplbbm+"')";
	}
	sfxzsl=request.getParameter("sfxzsl");
	if (sfxzsl!=null)
	{
		sfxzsl=cf.GB2Uni(sfxzsl);
		if (!(sfxzsl.equals("")))	wheresql+=" and  (tc_tczcxm.sfxzsl='"+sfxzsl+"')";
	}
	tc_tczcxm_lrr=request.getParameter("tc_tczcxm_lrr");
	if (tc_tczcxm_lrr!=null)
	{
		tc_tczcxm_lrr=cf.GB2Uni(tc_tczcxm_lrr);
		if (!(tc_tczcxm_lrr.equals("")))	wheresql+=" and  (tc_tczcxm.lrr='"+tc_tczcxm_lrr+"')";
	}
	tc_tczcxm_lrsj=request.getParameter("tc_tczcxm_lrsj");
	if (tc_tczcxm_lrsj!=null)
	{
		tc_tczcxm_lrsj=tc_tczcxm_lrsj.trim();
		if (!(tc_tczcxm_lrsj.equals("")))	wheresql+="  and (tc_tczcxm.lrsj>=TO_DATE('"+tc_tczcxm_lrsj+"','YYYY/MM/DD'))";
	}
	tc_tczcxm_lrsj=request.getParameter("tc_tczcxm_lrsj2");
	if (tc_tczcxm_lrsj!=null)
	{
		tc_tczcxm_lrsj=tc_tczcxm_lrsj.trim();
		if (!(tc_tczcxm_lrsj.equals("")))	wheresql+="  and (tc_tczcxm.lrsj<=TO_DATE('"+tc_tczcxm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_tczcxm.dqbm,dm_dqbm.dqmc,tc_tczcxm.bjjbbm,bjjbmc,tc_tczcxm.tccpdlbm,jxc_cldlbm.cldlmc,tc_tczcxm.tccplbbm,clxlmc,jldw,tc_tczcxm.bzsl,DECODE(tc_tczcxm.sfxzsl,'1','可增项','2','不可增项','3','不控制') sfxzsl,DECODE(tc_tczcxm.sfbxx,'Y','是','N','否') sfbxx,DECODE(tc_tczcxm.sfyxsj,'Y','是','N','否') sfyxsj,tcsjflmc,DECODE(tc_tczcxm.sfyqxtpp,'Y','是','N','否') sfyqxtpp,tc_tczcxm.lrr,tc_tczcxm.lrsj,DECODE(tc_tczcxm.sfkjm,'1','不可减免','2','可减免') sfkjm,yxjmzdsl,jmdj,DECODE(tc_tczcxm.sfkgh,'1','不可换','2','可换') sfkgh,khzdsl,ghzj ";
	ls_sql+=" FROM tc_tczcxm,dm_dqbm,bdm_bjjbbm,jxc_cldlbm,jxc_clxlbm,bdm_tcsjflbm  ";
    ls_sql+=" where tc_tczcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_tczcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_tczcxm.tccpdlbm=jxc_cldlbm.cldlbm(+)";
    ls_sql+=" and tc_tczcxm.tcsjflbm=bdm_tcsjflbm.tcsjflbm(+)";
    ls_sql+=" and tc_tczcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_tczcxm.dqbm,tc_tczcxm.bjjbbm,tc_tczcxm.tccpdlbm,tc_tczcxm.tcsjflbm,tc_tczcxm.tccplbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tc_tcbzzcxmList.jsp","","","EditTc_tczcxm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列

	String[] disColName={"dqmc","bjjbmc","cldlmc","tcsjflmc","clxlmc","sfxzsl","jldw","bzsl","sfbxx","sfyxsj","sfyqxtpp","sfkjm","yxjmzdsl","jmdj","sfkgh","khzdsl","ghzj","lrr","lrsj"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"dqbm","bjjbbm","tccpdlbm","tccplbbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Tc_tcbzzcxmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);


//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//列参数对象加入Hash表
	spanColHash.put("bjjbmc","1");//列参数对象加入Hash表
	spanColHash.put("cldlmc","1");//列参数对象加入Hash表
	spanColHash.put("tcsjflmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from tc_tczcxm where "+chooseitem;
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
  <B><font size="3">套餐标准主材项目－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">地区</td>
	<td  width="5%">报价级别</td>
	<td  width="7%">产品大类</td>
	<td  width="9%">套餐升级分类</td>
	<td  width="9%">产品小类</td>
	<td  width="5%">是否限制数量</td>
	<td  width="4%">计量单位</td>
	<td  width="6%">标准数量</td>
	<td  width="4%">是否必选项</td>
	<td  width="4%">升级是否收费</td>
	<td  width="4%">是否要求相同品牌</td>
	<td  width="4%">是否可减免</td>
	<td  width="4%">允许减免最大数量</td>
	<td  width="5%">减免单价</td>
	<td  width="3%">是否可更换</td>
	<td  width="4%">可换最大数量</td>
	<td  width="5%">更换折价</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
</tr>
<%
	pageObj.printDate();
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