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
	String tc_lkbjgb_dqbm=null;
	String tc_lkbjgb_bjjbbm=null;
	String tc_lkbjgb_tccplbbm=null;
	String tc_lkbjgb_tccpdlbm=null;
	String tc_lkbjgb_sfyqxtpp=null;
	String tc_lkbjgb_jldw=null;
	String tc_lkbjgb_sfkjm=null;
	String tc_lkbjgb_jmdj=null;
	String tc_lkbjgb_sjzj=null;
	String tc_lkbjgb_lrr=null;
	String tc_lkbjgb_lrsj=null;
	tc_lkbjgb_dqbm=request.getParameter("tc_lkbjgb_dqbm");
	if (tc_lkbjgb_dqbm!=null)
	{
		tc_lkbjgb_dqbm=cf.GB2Uni(tc_lkbjgb_dqbm);
		if (!(tc_lkbjgb_dqbm.equals("")))	wheresql+=" and  (tc_lkbjgb.dqbm='"+tc_lkbjgb_dqbm+"')";
	}
	tc_lkbjgb_bjjbbm=request.getParameter("tc_lkbjgb_bjjbbm");
	if (tc_lkbjgb_bjjbbm!=null)
	{
		tc_lkbjgb_bjjbbm=cf.GB2Uni(tc_lkbjgb_bjjbbm);
		if (!(tc_lkbjgb_bjjbbm.equals("")))	wheresql+=" and  (tc_lkbjgb.bjjbbm='"+tc_lkbjgb_bjjbbm+"')";
	}
	tc_lkbjgb_tccplbbm=request.getParameter("tc_lkbjgb_tccplbbm");
	if (tc_lkbjgb_tccplbbm!=null)
	{
		tc_lkbjgb_tccplbbm=tc_lkbjgb_tccplbbm.trim();
		if (!(tc_lkbjgb_tccplbbm.equals("")))	wheresql+=" and (tc_lkbjgb.tccplbbm="+tc_lkbjgb_tccplbbm+") ";
	}
	tc_lkbjgb_tccpdlbm=request.getParameter("tc_lkbjgb_tccpdlbm");
	if (tc_lkbjgb_tccpdlbm!=null)
	{
		tc_lkbjgb_tccpdlbm=tc_lkbjgb_tccpdlbm.trim();
		if (!(tc_lkbjgb_tccpdlbm.equals("")))	wheresql+=" and (tc_lkbjgb.tccpdlbm="+tc_lkbjgb_tccpdlbm+") ";
	}
	tc_lkbjgb_sfyqxtpp=request.getParameter("tc_lkbjgb_sfyqxtpp");
	if (tc_lkbjgb_sfyqxtpp!=null)
	{
		tc_lkbjgb_sfyqxtpp=cf.GB2Uni(tc_lkbjgb_sfyqxtpp);
		if (!(tc_lkbjgb_sfyqxtpp.equals("")))	wheresql+=" and  (tc_lkbjgb.sfyqxtpp='"+tc_lkbjgb_sfyqxtpp+"')";
	}
	tc_lkbjgb_jldw=request.getParameter("tc_lkbjgb_jldw");
	if (tc_lkbjgb_jldw!=null)
	{
		tc_lkbjgb_jldw=cf.GB2Uni(tc_lkbjgb_jldw);
		if (!(tc_lkbjgb_jldw.equals("")))	wheresql+=" and  (tc_lkbjgb.jldw='"+tc_lkbjgb_jldw+"')";
	}
	tc_lkbjgb_sfkjm=request.getParameter("tc_lkbjgb_sfkjm");
	if (tc_lkbjgb_sfkjm!=null)
	{
		tc_lkbjgb_sfkjm=cf.GB2Uni(tc_lkbjgb_sfkjm);
		if (!(tc_lkbjgb_sfkjm.equals("")))	wheresql+=" and  (tc_lkbjgb.sfkjm='"+tc_lkbjgb_sfkjm+"')";
	}
	tc_lkbjgb_jmdj=request.getParameter("tc_lkbjgb_jmdj");
	if (tc_lkbjgb_jmdj!=null)
	{
		tc_lkbjgb_jmdj=tc_lkbjgb_jmdj.trim();
		if (!(tc_lkbjgb_jmdj.equals("")))	wheresql+=" and  (tc_lkbjgb.jmdj="+tc_lkbjgb_jmdj+") ";
	}
	tc_lkbjgb_sjzj=request.getParameter("tc_lkbjgb_sjzj");
	if (tc_lkbjgb_sjzj!=null)
	{
		tc_lkbjgb_sjzj=tc_lkbjgb_sjzj.trim();
		if (!(tc_lkbjgb_sjzj.equals("")))	wheresql+=" and  (tc_lkbjgb.sjzj="+tc_lkbjgb_sjzj+") ";
	}
	tc_lkbjgb_lrr=request.getParameter("tc_lkbjgb_lrr");
	if (tc_lkbjgb_lrr!=null)
	{
		tc_lkbjgb_lrr=cf.GB2Uni(tc_lkbjgb_lrr);
		if (!(tc_lkbjgb_lrr.equals("")))	wheresql+=" and  (tc_lkbjgb.lrr='"+tc_lkbjgb_lrr+"')";
	}
	tc_lkbjgb_lrsj=request.getParameter("tc_lkbjgb_lrsj");
	if (tc_lkbjgb_lrsj!=null)
	{
		tc_lkbjgb_lrsj=tc_lkbjgb_lrsj.trim();
		if (!(tc_lkbjgb_lrsj.equals("")))	wheresql+="  and (tc_lkbjgb.lrsj=TO_DATE('"+tc_lkbjgb_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_lkbjgb.dqbm,dm_dqbm.dqmc,tc_lkbjgb.bjjbbm,bdm_bjjbbm.bjjbmc,tc_lkbjgb.tccplbbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc, DECODE(tc_lkbjgb.sfyqxtpp,'Y','是','N','否'),tc_lkbjgb.jldw, DECODE(tc_lkbjgb.sfkjm,'1','不可减免','2','可减免'),tc_lkbjgb.jmdj,tc_lkbjgb.sjzj,tc_lkbjgb.lrr,tc_lkbjgb.lrsj  ";
	ls_sql+=" FROM bdm_bjjbbm,dm_dqbm,tc_lkbjgb,jxc_cldlbm,jxc_clxlbm  ";
    ls_sql+=" where tc_lkbjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+) and tc_lkbjgb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_lkbjgb.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_lkbjgb.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_lkbjgb.dqbm,tc_lkbjgb.bjjbbm,tc_lkbjgb.tccpdlbm,tc_lkbjgb.tccplbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tc_lkbjgbList.jsp","","","EditTc_lkbjgb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","bdm_bjjbbm_bjjbmc","tccplbbm","tc_lkbjgb_tccpdlbm","tc_lkbjgb_sfyqxtpp","tc_lkbjgb_jldw","tc_lkbjgb_sfkjm","tc_lkbjgb_jmdj","tc_lkbjgb_sjzj","tc_lkbjgb_lrr","tc_lkbjgb_lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dqbm","bjjbbm","tccplbbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Tc_lkbjgbList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from tc_lkbjgb where "+chooseitem;
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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="6%">地区</td>
	<td  width="6%">地区</td>
	<td  width="6%">报价级别</td>
	<td  width="8%">报价级别</td>
	<td  width="6%">产品小类</td>
	<td  width="9%">产品小类</td>
	<td  width="9%">产品大类</td>
	<td  width="6%">是否要求相同品牌</td>
	<td  width="6%">计量单位</td>
	<td  width="6%">是否可减免</td>
	<td  width="6%">减免单价</td>
	<td  width="6%">升级折价</td>
	<td  width="6%">录入人</td>
	<td  width="7%">录入时间</td>
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