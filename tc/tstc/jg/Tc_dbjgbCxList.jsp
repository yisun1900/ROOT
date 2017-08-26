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
	String tc_dbjgb_dqbm=null;
	String tc_dbjgb_bjjbbm=null;
	String tc_dbjgb_tccplbbm=null;
	String tc_dbjgb_tccpdlbm=null;
	String tc_dbjgb_sfyqxtpp=null;
	String tc_dbjgb_jldw=null;
	String tc_dbjgb_sfkjm=null;
	String tc_dbjgb_jmdj=null;
	String tc_dbjgb_sjzj=null;
	String tc_dbjgb_lrr=null;
	String tc_dbjgb_lrsj=null;
	tc_dbjgb_dqbm=request.getParameter("tc_dbjgb_dqbm");
	if (tc_dbjgb_dqbm!=null)
	{
		tc_dbjgb_dqbm=cf.GB2Uni(tc_dbjgb_dqbm);
		if (!(tc_dbjgb_dqbm.equals("")))	wheresql+=" and  (tc_dbjgb.dqbm='"+tc_dbjgb_dqbm+"')";
	}
	tc_dbjgb_bjjbbm=request.getParameter("tc_dbjgb_bjjbbm");
	if (tc_dbjgb_bjjbbm!=null)
	{
		tc_dbjgb_bjjbbm=cf.GB2Uni(tc_dbjgb_bjjbbm);
		if (!(tc_dbjgb_bjjbbm.equals("")))	wheresql+=" and  (tc_dbjgb.bjjbbm='"+tc_dbjgb_bjjbbm+"')";
	}
	tc_dbjgb_tccplbbm=request.getParameter("tc_dbjgb_tccplbbm");
	if (tc_dbjgb_tccplbbm!=null)
	{
		tc_dbjgb_tccplbbm=tc_dbjgb_tccplbbm.trim();
		if (!(tc_dbjgb_tccplbbm.equals("")))	wheresql+=" and (tc_dbjgb.tccplbbm="+tc_dbjgb_tccplbbm+") ";
	}
	tc_dbjgb_tccpdlbm=request.getParameter("tc_dbjgb_tccpdlbm");
	if (tc_dbjgb_tccpdlbm!=null)
	{
		tc_dbjgb_tccpdlbm=tc_dbjgb_tccpdlbm.trim();
		if (!(tc_dbjgb_tccpdlbm.equals("")))	wheresql+=" and (tc_dbjgb.tccpdlbm="+tc_dbjgb_tccpdlbm+") ";
	}
	tc_dbjgb_sfyqxtpp=request.getParameter("tc_dbjgb_sfyqxtpp");
	if (tc_dbjgb_sfyqxtpp!=null)
	{
		tc_dbjgb_sfyqxtpp=cf.GB2Uni(tc_dbjgb_sfyqxtpp);
		if (!(tc_dbjgb_sfyqxtpp.equals("")))	wheresql+=" and  (tc_dbjgb.sfyqxtpp='"+tc_dbjgb_sfyqxtpp+"')";
	}
	tc_dbjgb_jldw=request.getParameter("tc_dbjgb_jldw");
	if (tc_dbjgb_jldw!=null)
	{
		tc_dbjgb_jldw=cf.GB2Uni(tc_dbjgb_jldw);
		if (!(tc_dbjgb_jldw.equals("")))	wheresql+=" and  (tc_dbjgb.jldw='"+tc_dbjgb_jldw+"')";
	}
	tc_dbjgb_sfkjm=request.getParameter("tc_dbjgb_sfkjm");
	if (tc_dbjgb_sfkjm!=null)
	{
		tc_dbjgb_sfkjm=cf.GB2Uni(tc_dbjgb_sfkjm);
		if (!(tc_dbjgb_sfkjm.equals("")))	wheresql+=" and  (tc_dbjgb.sfkjm='"+tc_dbjgb_sfkjm+"')";
	}
	tc_dbjgb_jmdj=request.getParameter("tc_dbjgb_jmdj");
	if (tc_dbjgb_jmdj!=null)
	{
		tc_dbjgb_jmdj=tc_dbjgb_jmdj.trim();
		if (!(tc_dbjgb_jmdj.equals("")))	wheresql+=" and  (tc_dbjgb.jmdj="+tc_dbjgb_jmdj+") ";
	}
	tc_dbjgb_sjzj=request.getParameter("tc_dbjgb_sjzj");
	if (tc_dbjgb_sjzj!=null)
	{
		tc_dbjgb_sjzj=tc_dbjgb_sjzj.trim();
		if (!(tc_dbjgb_sjzj.equals("")))	wheresql+=" and  (tc_dbjgb.sjzj="+tc_dbjgb_sjzj+") ";
	}
	tc_dbjgb_lrr=request.getParameter("tc_dbjgb_lrr");
	if (tc_dbjgb_lrr!=null)
	{
		tc_dbjgb_lrr=cf.GB2Uni(tc_dbjgb_lrr);
		if (!(tc_dbjgb_lrr.equals("")))	wheresql+=" and  (tc_dbjgb.lrr='"+tc_dbjgb_lrr+"')";
	}
	tc_dbjgb_lrsj=request.getParameter("tc_dbjgb_lrsj");
	if (tc_dbjgb_lrsj!=null)
	{
		tc_dbjgb_lrsj=tc_dbjgb_lrsj.trim();
		if (!(tc_dbjgb_lrsj.equals("")))	wheresql+="  and (tc_dbjgb.lrsj=TO_DATE('"+tc_dbjgb_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_dbjgb.dqbm,dm_dqbm.dqmc,tc_dbjgb.bjjbbm,bdm_bjjbbm.bjjbmc,tc_dbjgb.tccplbbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc, DECODE(tc_dbjgb.sfyqxtpp,'Y','是','N','否'),tc_dbjgb.jldw, DECODE(tc_dbjgb.sfkjm,'1','不可减免','2','可减免'),tc_dbjgb.jmdj,tc_dbjgb.sjzj,tc_dbjgb.lrr,tc_dbjgb.lrsj  ";
	ls_sql+=" FROM bdm_bjjbbm,dm_dqbm,tc_dbjgb,jxc_cldlbm,jxc_clxlbm  ";
    ls_sql+=" where tc_dbjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+) and tc_dbjgb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_dbjgb.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_dbjgb.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_dbjgb.dqbm,tc_dbjgb.bjjbbm,tc_dbjgb.tccpdlbm,tc_dbjgb.tccplbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("tc_dbjgbCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","bdm_bjjbbm_bjjbmc","tccplbbm","tc_dbjgb_tccpdlbm","tc_dbjgb_sfyqxtpp","tc_dbjgb_jldw","tc_dbjgb_sfkjm","tc_dbjgb_jmdj","tc_dbjgb_sjzj","tc_dbjgb_lrr","tc_dbjgb_lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dqbm","bjjbbm","tccplbbm"};
	pageObj.setKey(keyName);
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