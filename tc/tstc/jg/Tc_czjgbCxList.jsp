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
	String tc_czjgb_dqbm=null;
	String tc_czjgb_bjjbbm=null;
	String tc_czjgb_tccplbbm=null;
	String tc_czjgb_tccpdlbm=null;
	String tc_czjgb_sfyqxtpp=null;
	String tc_czjgb_jldw=null;
	String tc_czjgb_sfkjm=null;
	String tc_czjgb_jmdj=null;
	String tc_czjgb_sjzj=null;
	String tc_czjgb_lrr=null;
	String tc_czjgb_lrsj=null;
	tc_czjgb_dqbm=request.getParameter("tc_czjgb_dqbm");
	if (tc_czjgb_dqbm!=null)
	{
		tc_czjgb_dqbm=cf.GB2Uni(tc_czjgb_dqbm);
		if (!(tc_czjgb_dqbm.equals("")))	wheresql+=" and  (tc_czjgb.dqbm='"+tc_czjgb_dqbm+"')";
	}
	tc_czjgb_bjjbbm=request.getParameter("tc_czjgb_bjjbbm");
	if (tc_czjgb_bjjbbm!=null)
	{
		tc_czjgb_bjjbbm=cf.GB2Uni(tc_czjgb_bjjbbm);
		if (!(tc_czjgb_bjjbbm.equals("")))	wheresql+=" and  (tc_czjgb.bjjbbm='"+tc_czjgb_bjjbbm+"')";
	}
	tc_czjgb_tccplbbm=request.getParameter("tc_czjgb_tccplbbm");
	if (tc_czjgb_tccplbbm!=null)
	{
		tc_czjgb_tccplbbm=tc_czjgb_tccplbbm.trim();
		if (!(tc_czjgb_tccplbbm.equals("")))	wheresql+=" and (tc_czjgb.tccplbbm="+tc_czjgb_tccplbbm+") ";
	}
	tc_czjgb_tccpdlbm=request.getParameter("tc_czjgb_tccpdlbm");
	if (tc_czjgb_tccpdlbm!=null)
	{
		tc_czjgb_tccpdlbm=tc_czjgb_tccpdlbm.trim();
		if (!(tc_czjgb_tccpdlbm.equals("")))	wheresql+=" and (tc_czjgb.tccpdlbm="+tc_czjgb_tccpdlbm+") ";
	}
	tc_czjgb_sfyqxtpp=request.getParameter("tc_czjgb_sfyqxtpp");
	if (tc_czjgb_sfyqxtpp!=null)
	{
		tc_czjgb_sfyqxtpp=cf.GB2Uni(tc_czjgb_sfyqxtpp);
		if (!(tc_czjgb_sfyqxtpp.equals("")))	wheresql+=" and  (tc_czjgb.sfyqxtpp='"+tc_czjgb_sfyqxtpp+"')";
	}
	tc_czjgb_jldw=request.getParameter("tc_czjgb_jldw");
	if (tc_czjgb_jldw!=null)
	{
		tc_czjgb_jldw=cf.GB2Uni(tc_czjgb_jldw);
		if (!(tc_czjgb_jldw.equals("")))	wheresql+=" and  (tc_czjgb.jldw='"+tc_czjgb_jldw+"')";
	}
	tc_czjgb_sfkjm=request.getParameter("tc_czjgb_sfkjm");
	if (tc_czjgb_sfkjm!=null)
	{
		tc_czjgb_sfkjm=cf.GB2Uni(tc_czjgb_sfkjm);
		if (!(tc_czjgb_sfkjm.equals("")))	wheresql+=" and  (tc_czjgb.sfkjm='"+tc_czjgb_sfkjm+"')";
	}
	tc_czjgb_jmdj=request.getParameter("tc_czjgb_jmdj");
	if (tc_czjgb_jmdj!=null)
	{
		tc_czjgb_jmdj=tc_czjgb_jmdj.trim();
		if (!(tc_czjgb_jmdj.equals("")))	wheresql+=" and  (tc_czjgb.jmdj="+tc_czjgb_jmdj+") ";
	}
	tc_czjgb_sjzj=request.getParameter("tc_czjgb_sjzj");
	if (tc_czjgb_sjzj!=null)
	{
		tc_czjgb_sjzj=tc_czjgb_sjzj.trim();
		if (!(tc_czjgb_sjzj.equals("")))	wheresql+=" and  (tc_czjgb.sjzj="+tc_czjgb_sjzj+") ";
	}
	tc_czjgb_lrr=request.getParameter("tc_czjgb_lrr");
	if (tc_czjgb_lrr!=null)
	{
		tc_czjgb_lrr=cf.GB2Uni(tc_czjgb_lrr);
		if (!(tc_czjgb_lrr.equals("")))	wheresql+=" and  (tc_czjgb.lrr='"+tc_czjgb_lrr+"')";
	}
	tc_czjgb_lrsj=request.getParameter("tc_czjgb_lrsj");
	if (tc_czjgb_lrsj!=null)
	{
		tc_czjgb_lrsj=tc_czjgb_lrsj.trim();
		if (!(tc_czjgb_lrsj.equals("")))	wheresql+="  and (tc_czjgb.lrsj=TO_DATE('"+tc_czjgb_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_czjgb.dqbm,dm_dqbm.dqmc,tc_czjgb.bjjbbm,bdm_bjjbbm.bjjbmc,tc_czjgb.tccplbbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc, DECODE(tc_czjgb.sfyqxtpp,'Y','是','N','否'),tc_czjgb.jldw, DECODE(tc_czjgb.sfkjm,'1','不可减免','2','可减免'),tc_czjgb.jmdj,tc_czjgb.sjzj,DECODE(tc_czjgb.lx,'1','套餐内','2','套餐外'),tc_czjgb.lrr,tc_czjgb.lrsj  ";
	ls_sql+=" FROM bdm_bjjbbm,dm_dqbm,tc_czjgb,jxc_cldlbm,jxc_clxlbm  ";
    ls_sql+=" where tc_czjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+) and tc_czjgb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_czjgb.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_czjgb.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_czjgb.dqbm,tc_czjgb.bjjbbm,tc_czjgb.tccpdlbm,tc_czjgb.tccplbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("tc_czjgbCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","bdm_bjjbbm_bjjbmc","tccplbbm","tc_czjgb_tccpdlbm","tc_czjgb_sfyqxtpp","tc_czjgb_jldw","tc_czjgb_sfkjm","tc_czjgb_jmdj","tc_czjgb_sjzj","tc_czjgb_lrr","tc_czjgb_lrsj"};
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
	<td  width="6%">类型</td>
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