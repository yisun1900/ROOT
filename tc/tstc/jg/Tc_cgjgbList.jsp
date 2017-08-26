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
	String tc_cgjgb_dqbm=null;
	String tc_cgjgb_bjjbbm=null;
	String tc_cgjgb_tccplbbm=null;
	String tc_cgjgb_tccpdlbm=null;
	String tc_cgjgb_sfyqxtpp=null;
	String tc_cgjgb_jldw=null;
	String tc_cgjgb_bzsl=null;
	String tc_cgjgb_bzmj=null;
	String tc_cgjgb_ccbfjj=null;
	String tc_cgjgb_sfkjm=null;
	String tc_cgjgb_jmdj=null;
	String tc_cgjgb_sjzj=null;
	String tc_cgjgb_lrr=null;
	String tc_cgjgb_lrsj=null;
	tc_cgjgb_dqbm=request.getParameter("tc_cgjgb_dqbm");
	if (tc_cgjgb_dqbm!=null)
	{
		tc_cgjgb_dqbm=cf.GB2Uni(tc_cgjgb_dqbm);
		if (!(tc_cgjgb_dqbm.equals("")))	wheresql+=" and  (tc_cgjgb.dqbm='"+tc_cgjgb_dqbm+"')";
	}
	tc_cgjgb_bjjbbm=request.getParameter("tc_cgjgb_bjjbbm");
	if (tc_cgjgb_bjjbbm!=null)
	{
		tc_cgjgb_bjjbbm=cf.GB2Uni(tc_cgjgb_bjjbbm);
		if (!(tc_cgjgb_bjjbbm.equals("")))	wheresql+=" and  (tc_cgjgb.bjjbbm='"+tc_cgjgb_bjjbbm+"')";
	}
	tc_cgjgb_tccplbbm=request.getParameter("tc_cgjgb_tccplbbm");
	if (tc_cgjgb_tccplbbm!=null)
	{
		tc_cgjgb_tccplbbm=tc_cgjgb_tccplbbm.trim();
		if (!(tc_cgjgb_tccplbbm.equals("")))	wheresql+=" and (tc_cgjgb.tccplbbm="+tc_cgjgb_tccplbbm+") ";
	}
	tc_cgjgb_tccpdlbm=request.getParameter("tc_cgjgb_tccpdlbm");
	if (tc_cgjgb_tccpdlbm!=null)
	{
		tc_cgjgb_tccpdlbm=tc_cgjgb_tccpdlbm.trim();
		if (!(tc_cgjgb_tccpdlbm.equals("")))	wheresql+=" and (tc_cgjgb.tccpdlbm="+tc_cgjgb_tccpdlbm+") ";
	}
	tc_cgjgb_sfyqxtpp=request.getParameter("tc_cgjgb_sfyqxtpp");
	if (tc_cgjgb_sfyqxtpp!=null)
	{
		tc_cgjgb_sfyqxtpp=cf.GB2Uni(tc_cgjgb_sfyqxtpp);
		if (!(tc_cgjgb_sfyqxtpp.equals("")))	wheresql+=" and  (tc_cgjgb.sfyqxtpp='"+tc_cgjgb_sfyqxtpp+"')";
	}
	tc_cgjgb_jldw=request.getParameter("tc_cgjgb_jldw");
	if (tc_cgjgb_jldw!=null)
	{
		tc_cgjgb_jldw=cf.GB2Uni(tc_cgjgb_jldw);
		if (!(tc_cgjgb_jldw.equals("")))	wheresql+=" and  (tc_cgjgb.jldw='"+tc_cgjgb_jldw+"')";
	}
	tc_cgjgb_bzsl=request.getParameter("tc_cgjgb_bzsl");
	if (tc_cgjgb_bzsl!=null)
	{
		tc_cgjgb_bzsl=tc_cgjgb_bzsl.trim();
		if (!(tc_cgjgb_bzsl.equals("")))	wheresql+=" and  (tc_cgjgb.bzsl="+tc_cgjgb_bzsl+") ";
	}
	tc_cgjgb_bzmj=request.getParameter("tc_cgjgb_bzmj");
	if (tc_cgjgb_bzmj!=null)
	{
		tc_cgjgb_bzmj=tc_cgjgb_bzmj.trim();
		if (!(tc_cgjgb_bzmj.equals("")))	wheresql+=" and  (tc_cgjgb.bzmj="+tc_cgjgb_bzmj+") ";
	}
	tc_cgjgb_ccbfjj=request.getParameter("tc_cgjgb_ccbfjj");
	if (tc_cgjgb_ccbfjj!=null)
	{
		tc_cgjgb_ccbfjj=tc_cgjgb_ccbfjj.trim();
		if (!(tc_cgjgb_ccbfjj.equals("")))	wheresql+=" and  (tc_cgjgb.ccbfjj="+tc_cgjgb_ccbfjj+") ";
	}
	tc_cgjgb_sfkjm=request.getParameter("tc_cgjgb_sfkjm");
	if (tc_cgjgb_sfkjm!=null)
	{
		tc_cgjgb_sfkjm=cf.GB2Uni(tc_cgjgb_sfkjm);
		if (!(tc_cgjgb_sfkjm.equals("")))	wheresql+=" and  (tc_cgjgb.sfkjm='"+tc_cgjgb_sfkjm+"')";
	}
	tc_cgjgb_jmdj=request.getParameter("tc_cgjgb_jmdj");
	if (tc_cgjgb_jmdj!=null)
	{
		tc_cgjgb_jmdj=tc_cgjgb_jmdj.trim();
		if (!(tc_cgjgb_jmdj.equals("")))	wheresql+=" and  (tc_cgjgb.jmdj="+tc_cgjgb_jmdj+") ";
	}
	tc_cgjgb_sjzj=request.getParameter("tc_cgjgb_sjzj");
	if (tc_cgjgb_sjzj!=null)
	{
		tc_cgjgb_sjzj=tc_cgjgb_sjzj.trim();
		if (!(tc_cgjgb_sjzj.equals("")))	wheresql+=" and  (tc_cgjgb.sjzj="+tc_cgjgb_sjzj+") ";
	}
	tc_cgjgb_lrr=request.getParameter("tc_cgjgb_lrr");
	if (tc_cgjgb_lrr!=null)
	{
		tc_cgjgb_lrr=cf.GB2Uni(tc_cgjgb_lrr);
		if (!(tc_cgjgb_lrr.equals("")))	wheresql+=" and  (tc_cgjgb.lrr='"+tc_cgjgb_lrr+"')";
	}
	tc_cgjgb_lrsj=request.getParameter("tc_cgjgb_lrsj");
	if (tc_cgjgb_lrsj!=null)
	{
		tc_cgjgb_lrsj=tc_cgjgb_lrsj.trim();
		if (!(tc_cgjgb_lrsj.equals("")))	wheresql+="  and (tc_cgjgb.lrsj=TO_DATE('"+tc_cgjgb_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_cgjgb.dqbm,dm_dqbm.dqmc,tc_cgjgb.bjjbbm,bdm_bjjbbm.bjjbmc,tc_cgjgb.tccplbbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc, DECODE(tc_cgjgb.sfyqxtpp,'Y','是','N','否'),tc_cgjgb.jldw,tc_cgjgb.bzsl,tc_cgjgb.bzmj,tc_cgjgb.ccbfjj, DECODE(tc_cgjgb.sfkjm,'1','不可减免','2','可减免'),tc_cgjgb.jmdj,tc_cgjgb.sjzj,tc_cgjgb.lrr,tc_cgjgb.lrsj  ";
	ls_sql+=" FROM bdm_bjjbbm,dm_dqbm,tc_cgjgb,jxc_cldlbm,jxc_clxlbm  ";
    ls_sql+=" where tc_cgjgb.dqbm=dm_dqbm.dqbm(+) and tc_cgjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_cgjgb.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_cgjgb.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_cgjgb.dqbm,tc_cgjgb.bjjbbm,tc_cgjgb.tccpdlbm,tc_cgjgb.tccplbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tc_cgjgbList.jsp","","","EditTc_cgjgb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","bdm_bjjbbm_bjjbmc","tccplbbm","tc_cgjgb_tccpdlbm","tc_cgjgb_sfyqxtpp","tc_cgjgb_jldw","tc_cgjgb_bzsl","tc_cgjgb_bzmj","tc_cgjgb_ccbfjj","tc_cgjgb_sfkjm","tc_cgjgb_jmdj","tc_cgjgb_sjzj","tc_cgjgb_lrr","tc_cgjgb_lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dqbm","bjjbbm","tccplbbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Tc_cgjgbList.jsp?"};//按钮单击调用的网页，可以增加参数
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
		sql[0]="delete from tc_cgjgb where "+chooseitem;
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
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">地区</td>
	<td  width="5%">地区名称</td>
	<td  width="5%">报价级别</td>
	<td  width="7%">报价级别名称</td>
	<td  width="5%">产品小类编码</td>
	<td  width="8%">产品小类</td>
	<td  width="8%">产品大类</td>
	<td  width="5%">是否要求相同品牌</td>
	<td  width="5%">计量单位</td>
	<td  width="5%">标准数量</td>
	<td  width="5%">标准面积</td>
	<td  width="5%">超出部分加价</td>
	<td  width="5%">是否可减免</td>
	<td  width="5%">减免单价</td>
	<td  width="5%">升级折价</td>
	<td  width="5%">录入人</td>
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