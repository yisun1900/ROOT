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
	String tckd_tcfgzcxmxj_dqbm=null;
	String tckd_tcfgzcxmxj_bjjbbm=null;
	String tckd_tcfgzcxmxj_hxbm=null;
	String tckd_tcfgzcxmxj_jgwzbm=null;
	String tckd_tcfgzcxmxj_tccplbbm=null;
	String sfxzsl=null;
	String tckd_tcfgzcxmxj_lrr=null;
	String tckd_tcfgzcxmxj_lrsj=null;

	String sjjjfs=null;
	sjjjfs=request.getParameter("sjjjfs");
	if (sjjjfs!=null)
	{
		sjjjfs=cf.GB2Uni(sjjjfs);
		if (!(sjjjfs.equals("")))	wheresql+=" and  (tckd_tcfgzcxmxj.sjjjfs='"+sjjjfs+"')";
	}

	String sfkjm=null;
	sfkjm=request.getParameter("sfkjm");
	if (sfkjm!=null)
	{
		sfkjm=cf.GB2Uni(sfkjm);
		if (!(sfkjm.equals("")))	wheresql+=" and  (tckd_tcfgzcxmxj.sfkjm='"+sfkjm+"')";
	}
	String jmfl=null;
	jmfl=request.getParameter("jmfl");
	if (jmfl!=null)
	{
		jmfl=cf.GB2Uni(jmfl);
		if (!(jmfl.equals("")))	wheresql+=" and  (tckd_tcfgzcxmxj.jmfl='"+jmfl+"')";
	}

	String yxjmzdsl=null;
	yxjmzdsl=request.getParameter("yxjmzdsl");
	if (yxjmzdsl!=null)
	{
		yxjmzdsl=cf.GB2Uni(yxjmzdsl);
		if (!(yxjmzdsl.equals("")))	wheresql+=" and  (tckd_tcfgzcxmxj.yxjmzdsl>="+yxjmzdsl+")";
	}
	yxjmzdsl=request.getParameter("yxjmzdsl2");
	if (yxjmzdsl!=null)
	{
		yxjmzdsl=cf.GB2Uni(yxjmzdsl);
		if (!(yxjmzdsl.equals("")))	wheresql+=" and  (tckd_tcfgzcxmxj.yxjmzdsl<="+yxjmzdsl+")";
	}


	String sfyqxtpp=null;
	sfyqxtpp=request.getParameter("sfyqxtpp");
	if (sfyqxtpp!=null)
	{
		sfyqxtpp=cf.GB2Uni(sfyqxtpp);
		if (!(sfyqxtpp.equals("")))	wheresql+=" and  (tckd_tcfgzcxmxj.sfyqxtpp='"+sfyqxtpp+"')";
	}

	String sjfl=null;
	sjfl=request.getParameter("sjfl");
	if (sjfl!=null)
	{
		sjfl=cf.GB2Uni(sjfl);
		if (!(sjfl.equals("")))	wheresql+=" and  (tckd_tcfgzcxmxj.sjfl='"+sjfl+"')";
	}

	String sfbxx=null;
	sfbxx=request.getParameter("sfbxx");
	if (sfbxx!=null)
	{
		sfbxx=cf.GB2Uni(sfbxx);
		if (!(sfbxx.equals("")))	wheresql+=" and  (tckd_tcfgzcxmxj.sfbxx='"+sfbxx+"')";
	}
	String sfyxsj=null;
	sfyxsj=request.getParameter("sfyxsj");
	if (sfyxsj!=null)
	{
		sfyxsj=cf.GB2Uni(sfyxsj);
		if (!(sfyxsj.equals("")))	wheresql+=" and  (tckd_tcfgzcxmxj.sfyxsj='"+sfyxsj+"')";
	}
	
	tckd_tcfgzcxmxj_dqbm=request.getParameter("tckd_tcfgzcxmxj_dqbm");
	if (tckd_tcfgzcxmxj_dqbm!=null)
	{
		tckd_tcfgzcxmxj_dqbm=cf.GB2Uni(tckd_tcfgzcxmxj_dqbm);
		if (!(tckd_tcfgzcxmxj_dqbm.equals("")))	wheresql+=" and  (tckd_tcfgzcxmxj.dqbm='"+tckd_tcfgzcxmxj_dqbm+"')";
	}
	tckd_tcfgzcxmxj_bjjbbm=request.getParameter("tckd_tcfgzcxmxj_bjjbbm");
	if (tckd_tcfgzcxmxj_bjjbbm!=null)
	{
		tckd_tcfgzcxmxj_bjjbbm=cf.GB2Uni(tckd_tcfgzcxmxj_bjjbbm);
		if (!(tckd_tcfgzcxmxj_bjjbbm.equals("")))	wheresql+=" and  (tckd_tcfgzcxmxj.bjjbbm='"+tckd_tcfgzcxmxj_bjjbbm+"')";
	}
	tckd_tcfgzcxmxj_hxbm=request.getParameter("tckd_tcfgzcxmxj_hxbm");
	if (tckd_tcfgzcxmxj_hxbm!=null)
	{
		tckd_tcfgzcxmxj_hxbm=cf.GB2Uni(tckd_tcfgzcxmxj_hxbm);
		if (!(tckd_tcfgzcxmxj_hxbm.equals("")))	wheresql+=" and  (tckd_tcfgzcxmxj.hxbm='"+tckd_tcfgzcxmxj_hxbm+"')";
	}
	tckd_tcfgzcxmxj_jgwzbm=request.getParameter("tckd_tcfgzcxmxj_jgwzbm");
	if (tckd_tcfgzcxmxj_jgwzbm!=null)
	{
		tckd_tcfgzcxmxj_jgwzbm=cf.GB2Uni(tckd_tcfgzcxmxj_jgwzbm);
		if (!(tckd_tcfgzcxmxj_jgwzbm.equals("")))	wheresql+=" and  (tckd_tcfgzcxmxj.jgwzbm='"+tckd_tcfgzcxmxj_jgwzbm+"')";
	}
	tckd_tcfgzcxmxj_tccplbbm=request.getParameter("tckd_tcfgzcxmxj_tccplbbm");
	if (tckd_tcfgzcxmxj_tccplbbm!=null)
	{
		tckd_tcfgzcxmxj_tccplbbm=cf.GB2Uni(tckd_tcfgzcxmxj_tccplbbm);
		if (!(tckd_tcfgzcxmxj_tccplbbm.equals("")))	wheresql+=" and  (tckd_tcfgzcxmxj.tccplbbm='"+tckd_tcfgzcxmxj_tccplbbm+"')";
	}
	sfxzsl=request.getParameter("sfxzsl");
	if (sfxzsl!=null)
	{
		sfxzsl=cf.GB2Uni(sfxzsl);
		if (!(sfxzsl.equals("")))	wheresql+=" and  (tckd_tcfgzcxmxj.sfxzsl='"+sfxzsl+"')";
	}
	tckd_tcfgzcxmxj_lrr=request.getParameter("tckd_tcfgzcxmxj_lrr");
	if (tckd_tcfgzcxmxj_lrr!=null)
	{
		tckd_tcfgzcxmxj_lrr=cf.GB2Uni(tckd_tcfgzcxmxj_lrr);
		if (!(tckd_tcfgzcxmxj_lrr.equals("")))	wheresql+=" and  (tckd_tcfgzcxmxj.lrr='"+tckd_tcfgzcxmxj_lrr+"')";
	}
	tckd_tcfgzcxmxj_lrsj=request.getParameter("tckd_tcfgzcxmxj_lrsj");
	if (tckd_tcfgzcxmxj_lrsj!=null)
	{
		tckd_tcfgzcxmxj_lrsj=tckd_tcfgzcxmxj_lrsj.trim();
		if (!(tckd_tcfgzcxmxj_lrsj.equals("")))	wheresql+="  and (tckd_tcfgzcxmxj.lrsj>=TO_DATE('"+tckd_tcfgzcxmxj_lrsj+"','YYYY/MM/DD'))";
	}
	tckd_tcfgzcxmxj_lrsj=request.getParameter("tckd_tcfgzcxmxj_lrsj2");
	if (tckd_tcfgzcxmxj_lrsj!=null)
	{
		tckd_tcfgzcxmxj_lrsj=tckd_tcfgzcxmxj_lrsj.trim();
		if (!(tckd_tcfgzcxmxj_lrsj.equals("")))	wheresql+="  and (tckd_tcfgzcxmxj.lrsj<=TO_DATE('"+tckd_tcfgzcxmxj_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tckd_tcfgzcxmxj.dqbm,dm_dqbm.dqmc,tckd_tcfgzcxmxj.bjjbbm,bjjbmc,tckd_tcfgzcxmxj.fgmc,tckd_tcfgzcxmxj.hxbm,hxmc,tckd_tcfgzcxmxj.jgwzbm,tckd_tcfgzcxmxj.tccplbbm,clxlmc,tckd_tcfgzcxmxj.jldw,tckd_tcfgzcxmxj.bzsl,DECODE(tckd_tcfgzcxmxj.sfxzsl,'1','超量需加价','2','不可超量','3','无数量限制') sfxzsl,DECODE(tckd_tcfgzcxmxj.sfbxx,'Y','选项','N','否') sfbxx,DECODE(tckd_tcfgzcxmxj.sfyxsj,'Y','收费','N','否') sfyxsj,sjfl,DECODE(tckd_tcfgzcxmxj.sjjjfs,'1','按套','2','按数量') sjjjfs,DECODE(tckd_tcfgzcxmxj.sfyqxtpp,'Y','要求','N','否') sfyqxtpp,DECODE(tckd_tcfgzcxmxj.sfkjm,'1','不可减免','2','可减免') sfkjm,jmfl,jmjldw,tckd_tcfgzcxmxj.yxjmzdsl,jmdj,tckd_tcfgzcxmxj.lrr,tckd_tcfgzcxmxj.lrsj  ";
	ls_sql+=" FROM tckd_tcfgzcxmxj,dm_dqbm,bdm_bjjbbm,dm_hxbm,jxc_clxlbm  ";
    ls_sql+=" where tckd_tcfgzcxmxj.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckd_tcfgzcxmxj.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckd_tcfgzcxmxj.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and tckd_tcfgzcxmxj.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tckd_tcfgzcxmxj.dqbm,tckd_tcfgzcxmxj.bjjbbm,tckd_tcfgzcxmxj.fgmc,tckd_tcfgzcxmxj.hxbm,tckd_tcfgzcxmxj.jgwzbm,tckd_tcfgzcxmxj.tccplbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tckd_tcfgzcxmxjList.jsp","","","EditTckd_tcfgzcxmxj.jsp");
	pageObj.setPageRow(19);//设置每页显示记录数

//设置显示列
	String[] disColName={"dqmc","bjjbmc","fgmc","hxmc","jgwzbm","clxlmc","jldw","sfxzsl","bzsl","sfbxx","sfyxsj","sjfl","sjjjfs","sfyqxtpp","sfkjm","jmfl","jmjldw","yxjmzdsl","jmdj","lrr","lrsj"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"dqbm","bjjbbm","fgmc","hxbm","jgwzbm","tccplbbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息","批量改升级分类","批量改[减免]"};//按钮的显示名称
	String[] buttonLink={"Tckd_tcfgzcxmxjList.jsp?","plsj.jsp","pljm.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0,1,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from tckd_tcfgzcxmxj where "+chooseitem;
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
  <B><font size="3">套餐风格主材项目小计－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">地区</td>
	<td  width="4%">报价级别</td>
	<td  width="4%">风格名称</td>
	<td  width="7%">户型</td>
	<td  width="7%">结构位置</td>
	<td  width="7%">产品类别</td>
	<td  width="4%">计量单位</td>
	<td  width="5%">是否限制数量</td>
	<td  width="4%">标准数量</td>
	<td  width="3%">是否必选项</td>
	<td  width="3%">升级是否收费</td>
	<td  width="6%">套餐升级分类</td>
	<td  width="3%">升级计价方式</td>
	<td  width="4%">是否要求相同品牌</td>
	<td  width="4%">是否可减免</td>
	<td  width="6%">减免分类</td>
	<td  width="4%">减免计量单位</td>
	<td  width="4%">允许减免最大数量</td>
	<td  width="4%">减免单价</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
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