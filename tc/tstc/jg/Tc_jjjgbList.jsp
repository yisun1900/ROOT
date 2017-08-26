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
	String tc_jjjgb_dqbm=null;
	String tc_jjjgb_bjjbbm=null;
	String tc_jjjgb_tccplbbm=null;
	String tc_jjjgb_tccpdlbm=null;
	String tc_jjjgb_sfyqxtpp=null;
	String tc_jjjgb_jldw=null;
	String tc_jjjgb_sfkjm=null;
	String tc_jjjgb_jmdj=null;
	String tc_jjjgb_sjzj=null;
	String tc_jjjgb_lrr=null;
	String tc_jjjgb_lrsj=null;
	tc_jjjgb_dqbm=request.getParameter("tc_jjjgb_dqbm");
	if (tc_jjjgb_dqbm!=null)
	{
		tc_jjjgb_dqbm=cf.GB2Uni(tc_jjjgb_dqbm);
		if (!(tc_jjjgb_dqbm.equals("")))	wheresql+=" and  (tc_jjjgb.dqbm='"+tc_jjjgb_dqbm+"')";
	}
	tc_jjjgb_bjjbbm=request.getParameter("tc_jjjgb_bjjbbm");
	if (tc_jjjgb_bjjbbm!=null)
	{
		tc_jjjgb_bjjbbm=cf.GB2Uni(tc_jjjgb_bjjbbm);
		if (!(tc_jjjgb_bjjbbm.equals("")))	wheresql+=" and  (tc_jjjgb.bjjbbm='"+tc_jjjgb_bjjbbm+"')";
	}
	tc_jjjgb_tccplbbm=request.getParameter("tc_jjjgb_tccplbbm");
	if (tc_jjjgb_tccplbbm!=null)
	{
		tc_jjjgb_tccplbbm=tc_jjjgb_tccplbbm.trim();
		if (!(tc_jjjgb_tccplbbm.equals("")))	wheresql+=" and (tc_jjjgb.tccplbbm="+tc_jjjgb_tccplbbm+") ";
	}
	tc_jjjgb_tccpdlbm=request.getParameter("tc_jjjgb_tccpdlbm");
	if (tc_jjjgb_tccpdlbm!=null)
	{
		tc_jjjgb_tccpdlbm=tc_jjjgb_tccpdlbm.trim();
		if (!(tc_jjjgb_tccpdlbm.equals("")))	wheresql+=" and (tc_jjjgb.tccpdlbm="+tc_jjjgb_tccpdlbm+") ";
	}
	tc_jjjgb_sfyqxtpp=request.getParameter("tc_jjjgb_sfyqxtpp");
	if (tc_jjjgb_sfyqxtpp!=null)
	{
		tc_jjjgb_sfyqxtpp=cf.GB2Uni(tc_jjjgb_sfyqxtpp);
		if (!(tc_jjjgb_sfyqxtpp.equals("")))	wheresql+=" and  (tc_jjjgb.sfyqxtpp='"+tc_jjjgb_sfyqxtpp+"')";
	}
	tc_jjjgb_jldw=request.getParameter("tc_jjjgb_jldw");
	if (tc_jjjgb_jldw!=null)
	{
		tc_jjjgb_jldw=cf.GB2Uni(tc_jjjgb_jldw);
		if (!(tc_jjjgb_jldw.equals("")))	wheresql+=" and  (tc_jjjgb.jldw='"+tc_jjjgb_jldw+"')";
	}
	tc_jjjgb_sfkjm=request.getParameter("tc_jjjgb_sfkjm");
	if (tc_jjjgb_sfkjm!=null)
	{
		tc_jjjgb_sfkjm=cf.GB2Uni(tc_jjjgb_sfkjm);
		if (!(tc_jjjgb_sfkjm.equals("")))	wheresql+=" and  (tc_jjjgb.sfkjm='"+tc_jjjgb_sfkjm+"')";
	}
	tc_jjjgb_jmdj=request.getParameter("tc_jjjgb_jmdj");
	if (tc_jjjgb_jmdj!=null)
	{
		tc_jjjgb_jmdj=tc_jjjgb_jmdj.trim();
		if (!(tc_jjjgb_jmdj.equals("")))	wheresql+=" and  (tc_jjjgb.jmdj="+tc_jjjgb_jmdj+") ";
	}
	tc_jjjgb_sjzj=request.getParameter("tc_jjjgb_sjzj");
	if (tc_jjjgb_sjzj!=null)
	{
		tc_jjjgb_sjzj=tc_jjjgb_sjzj.trim();
		if (!(tc_jjjgb_sjzj.equals("")))	wheresql+=" and  (tc_jjjgb.sjzj="+tc_jjjgb_sjzj+") ";
	}
	tc_jjjgb_lrr=request.getParameter("tc_jjjgb_lrr");
	if (tc_jjjgb_lrr!=null)
	{
		tc_jjjgb_lrr=cf.GB2Uni(tc_jjjgb_lrr);
		if (!(tc_jjjgb_lrr.equals("")))	wheresql+=" and  (tc_jjjgb.lrr='"+tc_jjjgb_lrr+"')";
	}
	tc_jjjgb_lrsj=request.getParameter("tc_jjjgb_lrsj");
	if (tc_jjjgb_lrsj!=null)
	{
		tc_jjjgb_lrsj=tc_jjjgb_lrsj.trim();
		if (!(tc_jjjgb_lrsj.equals("")))	wheresql+="  and (tc_jjjgb.lrsj=TO_DATE('"+tc_jjjgb_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_jjjgb.dqbm,dm_dqbm.dqmc,tc_jjjgb.bjjbbm,bdm_bjjbbm.bjjbmc,tc_jjjgb.tccplbbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc, DECODE(tc_jjjgb.sfyqxtpp,'Y','是','N','否'),tc_jjjgb.jldw, DECODE(tc_jjjgb.sfkjm,'1','不可减免','2','可减免'),tc_jjjgb.jmdj,tc_jjjgb.sjzj,tc_jjjgb.lrr,tc_jjjgb.lrsj  ";
	ls_sql+=" FROM bdm_bjjbbm,dm_dqbm,tc_jjjgb,jxc_cldlbm,jxc_clxlbm  ";
    ls_sql+=" where tc_jjjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+) and tc_jjjgb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_jjjgb.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_jjjgb.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_jjjgb.dqbm,tc_jjjgb.bjjbbm,tc_jjjgb.tccpdlbm,tc_jjjgb.tccplbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tc_jjjgbList.jsp","","","EditTc_jjjgb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","bdm_bjjbbm_bjjbmc","tccplbbm","tc_jjjgb_tccpdlbm","tc_jjjgb_sfyqxtpp","tc_jjjgb_jldw","tc_jjjgb_sfkjm","tc_jjjgb_jmdj","tc_jjjgb_sjzj","tc_jjjgb_lrr","tc_jjjgb_lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dqbm","bjjbbm","tccplbbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Tc_jjjgbList.jsp?"};//按钮单击调用的网页，可以增加参数
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
		sql[0]="delete from tc_jjjgb where "+chooseitem;
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