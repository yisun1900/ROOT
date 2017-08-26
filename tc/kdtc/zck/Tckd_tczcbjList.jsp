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
	String tckd_tczcbj_dqbm=null;
	String tckd_tczcbj_bjjbbm=null;
	String tckd_tczcbj_cpbm=null;
	String cldlbm=null;
	String clxlbm=null;
	String tckd_tczcbj_cpmc=null;
	String ppmc=null;
	String tckd_tczcbj_xh=null;
	String tckd_tczcbj_xh2=null;
	String tckd_tczcbj_gg=null;
	String tckd_tczcbj_jldw=null;
	String tckd_tczcbj_xuhao=null;
	String tckd_tczcbj_lrr=null;
	String tckd_tczcbj_lrsj=null;


	String kdbm=null;
	kdbm=request.getParameter("kdbm");
	if (kdbm!=null)
	{
		kdbm=cf.GB2Uni(kdbm);
		if (!(kdbm.equals("")))	wheresql+=" and  (tckd_tczcbj.kdbm='"+kdbm+"')";
	}

	String nbbm=null;
	nbbm=request.getParameter("nbbm");
	if (nbbm!=null)
	{
		nbbm=cf.GB2Uni(nbbm);
		if (!(nbbm.equals("")))	wheresql+=" and  (tckd_tczcbj.nbbm='"+nbbm+"')";
	}

	String sfxclxs=null;
	sfxclxs=request.getParameter("sfxclxs");
	if (sfxclxs!=null)
	{
		sfxclxs=cf.GB2Uni(sfxclxs);
		if (!(sfxclxs.equals("")))	wheresql+=" and  (tckd_tczcbj.sfxclxs='"+sfxclxs+"')";
	}

	String gysmc=null;
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (tckd_tczcbj.gysmc='"+gysmc+"')";
	}
	
	
	tckd_tczcbj_dqbm=request.getParameter("tckd_tczcbj_dqbm");
	if (tckd_tczcbj_dqbm!=null)
	{
		tckd_tczcbj_dqbm=cf.GB2Uni(tckd_tczcbj_dqbm);
		if (!(tckd_tczcbj_dqbm.equals("")))	wheresql+=" and  (tckd_tczcbj.dqbm='"+tckd_tczcbj_dqbm+"')";
	}
	tckd_tczcbj_bjjbbm=request.getParameter("tckd_tczcbj_bjjbbm");
	if (tckd_tczcbj_bjjbbm!=null)
	{
		tckd_tczcbj_bjjbbm=cf.GB2Uni(tckd_tczcbj_bjjbbm);
		if (!(tckd_tczcbj_bjjbbm.equals("")))	wheresql+=" and  (tckd_tczcbj.bjjbbm='"+tckd_tczcbj_bjjbbm+"')";
	}
	tckd_tczcbj_cpbm=request.getParameter("tckd_tczcbj_cpbm");
	if (tckd_tczcbj_cpbm!=null)
	{
		tckd_tczcbj_cpbm=cf.GB2Uni(tckd_tczcbj_cpbm);
		if (!(tckd_tczcbj_cpbm.equals("")))	wheresql+=" and  (tckd_tczcbj.cpbm='"+tckd_tczcbj_cpbm+"')";
	}

	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (tckd_tczcbj.tccpdlbm='"+cldlbm+"')";
	}
	clxlbm=request.getParameter("clxlbm");
	if (clxlbm!=null)
	{
		clxlbm=cf.GB2Uni(clxlbm);
		if (!(clxlbm.equals("")))	wheresql+=" and  (tckd_tczcbj.tccplbbm='"+clxlbm+"')";
	}
	tckd_tczcbj_cpmc=request.getParameter("tckd_tczcbj_cpmc");
	if (tckd_tczcbj_cpmc!=null)
	{
		tckd_tczcbj_cpmc=cf.GB2Uni(tckd_tczcbj_cpmc);
		if (!(tckd_tczcbj_cpmc.equals("")))	wheresql+=" and  (tckd_tczcbj.cpmc like '%"+tckd_tczcbj_cpmc+"%')";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (tckd_tczcbj.ppmc='"+ppmc+"')";
	}
	tckd_tczcbj_xh=request.getParameter("tckd_tczcbj_xh");
	if (tckd_tczcbj_xh!=null)
	{
		tckd_tczcbj_xh=cf.GB2Uni(tckd_tczcbj_xh);
		if (!(tckd_tczcbj_xh.equals("")))	wheresql+=" and  (tckd_tczcbj.xh='"+tckd_tczcbj_xh+"')";
	}
	
	tckd_tczcbj_xh2=request.getParameter("tckd_tczcbj_xh2");
	if (tckd_tczcbj_xh2!=null)
	{
		tckd_tczcbj_xh2=cf.GB2Uni(tckd_tczcbj_xh2);
		if (!(tckd_tczcbj_xh2.equals("")))	wheresql+=" and  (tckd_tczcbj.xh like '%"+tckd_tczcbj_xh2+"%')";
	}
	tckd_tczcbj_gg=request.getParameter("tckd_tczcbj_gg");
	if (tckd_tczcbj_gg!=null)
	{
		tckd_tczcbj_gg=cf.GB2Uni(tckd_tczcbj_gg);
		if (!(tckd_tczcbj_gg.equals("")))	wheresql+=" and  (tckd_tczcbj.gg='"+tckd_tczcbj_gg+"')";
	}
	tckd_tczcbj_jldw=request.getParameter("tckd_tczcbj_jldw");
	if (tckd_tczcbj_jldw!=null)
	{
		tckd_tczcbj_jldw=cf.GB2Uni(tckd_tczcbj_jldw);
		if (!(tckd_tczcbj_jldw.equals("")))	wheresql+=" and  (tckd_tczcbj.jldw='"+tckd_tczcbj_jldw+"')";
	}

	tckd_tczcbj_xuhao=request.getParameter("tckd_tczcbj_xuhao");
	if (tckd_tczcbj_xuhao!=null)
	{
		tckd_tczcbj_xuhao=tckd_tczcbj_xuhao.trim();
		if (!(tckd_tczcbj_xuhao.equals("")))	wheresql+=" and (tckd_tczcbj.xuhao="+tckd_tczcbj_xuhao+") ";
	}
	tckd_tczcbj_lrr=request.getParameter("tckd_tczcbj_lrr");
	if (tckd_tczcbj_lrr!=null)
	{
		tckd_tczcbj_lrr=cf.GB2Uni(tckd_tczcbj_lrr);
		if (!(tckd_tczcbj_lrr.equals("")))	wheresql+=" and  (tckd_tczcbj.lrr='"+tckd_tczcbj_lrr+"')";
	}

	tckd_tczcbj_lrsj=request.getParameter("tckd_tczcbj_lrsj");
	if (tckd_tczcbj_lrsj!=null)
	{
		tckd_tczcbj_lrsj=tckd_tczcbj_lrsj.trim();
		if (!(tckd_tczcbj_lrsj.equals("")))	wheresql+="  and (tckd_tczcbj.lrsj>=TO_DATE('"+tckd_tczcbj_lrsj+"','YYYY/MM/DD'))";
	}
	tckd_tczcbj_lrsj=request.getParameter("tckd_tczcbj_lrsj2");
	if (tckd_tczcbj_lrsj!=null)
	{
		tckd_tczcbj_lrsj=tckd_tczcbj_lrsj.trim();
		if (!(tckd_tczcbj_lrsj.equals("")))	wheresql+="  and (tckd_tczcbj.lrsj<=TO_DATE('"+tckd_tczcbj_lrsj+"','YYYY/MM/DD'))";
	}

	String sfyx=null;
	sfyx=request.getParameter("sfyx");
	if (sfyx!=null)
	{
		sfyx=cf.GB2Uni(sfyx);
		if (!(sfyx.equals("")))	wheresql+=" and  (tckd_tczcbj.sfyx='"+sfyx+"')";
	}
	String yxkssj=null;
	yxkssj=request.getParameter("yxkssj");
	if (yxkssj!=null)
	{
		yxkssj=yxkssj.trim();
		if (!(yxkssj.equals("")))	wheresql+="  and (tckd_tczcbj.yxkssj>=TO_DATE('"+yxkssj+"','YYYY/MM/DD'))";
	}
	yxkssj=request.getParameter("yxkssj2");
	if (yxkssj!=null)
	{
		yxkssj=yxkssj.trim();
		if (!(yxkssj.equals("")))	wheresql+="  and (tckd_tczcbj.yxkssj<=TO_DATE('"+yxkssj+"','YYYY/MM/DD'))";
	}
	String yxjzsj=null;
	yxjzsj=request.getParameter("yxjzsj");
	if (yxjzsj!=null)
	{
		yxjzsj=yxjzsj.trim();
		if (!(yxjzsj.equals("")))	wheresql+="  and (tckd_tczcbj.yxjzsj>=TO_DATE('"+yxjzsj+"','YYYY/MM/DD'))";
	}
	yxjzsj=request.getParameter("yxjzsj2");
	if (yxjzsj!=null)
	{
		yxjzsj=yxjzsj.trim();
		if (!(yxjzsj.equals("")))	wheresql+="  and (tckd_tczcbj.yxjzsj<=TO_DATE('"+yxjzsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT tckd_tczcbj.dqbm,dm_dqbm.dqmc,tckd_tczcbj.bjjbbm,bjjbmc,tckd_tczcbj.cpbm,tckd_tczcbj.kdbm,tckd_tczcbj.nbbm,DECODE(tckd_tczcbj.yxthsj,'Y','是','N','否') yxthsj,jxc_cldlbm.cldlmc,clxlmc,tckd_tczcbj.cpmc,tckd_tczcbj.ppmc,tckd_tczcbj.xh,tckd_tczcbj.gg,tckd_tczcbj.jldw,tckd_tczcbj.xdjldw,tckd_tczcbj.xdb,tckd_tczcbj.jsj,tckd_tczcbj.sh||'%' sh, DECODE(tckd_tczcbj.sfxclxs,'1','向上取整','2','向下取整','3','4舍5入','4','不处理') sfxclxs,tckd_tczcbj.xuhao,tckd_tczcbj.gysmc,DECODE(tckd_tczcbj.sfyx,'1','永远有效','2','无效','3','阶段有效') sfyx,tckd_tczcbj.yxkssj,tckd_tczcbj.yxjzsj,tckd_tczcbj.lrr,tckd_tczcbj.lrsj,tckd_tczcbj.bz  ";
	ls_sql+=" FROM tckd_tczcbj,dm_dqbm,jxc_cldlbm,jxc_clxlbm,jdm_bjjbbm  ";
    ls_sql+=" where tckd_tczcbj.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckd_tczcbj.tccpdlbm=jxc_cldlbm.cldlbm(+) and tckd_tczcbj.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tckd_tczcbj.bjjbbm=jdm_bjjbbm.bjjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tckd_tczcbj.dqbm,tckd_tczcbj.bjjbbm,tckd_tczcbj.kdbm,tckd_tczcbj.tccpdlbm,tckd_tczcbj.tccplbbm,tckd_tczcbj.cpbm";
    pageObj.sql=ls_sql;

//	out.println(ls_sql);

//进行对象初始化
	pageObj.initPage("Tckd_tczcbjList.jsp","","","EditTckd_tczcbj.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"dqmc","bjjbmc","cpbm","kdbm","nbbm","yxthsj","cpmc","ppmc","xh","gg","jldw","xdjldw","xdb","sh","sfxclxs","cldlmc","clxlmc","gysmc","sfyx","yxkssj","yxjzsj","xuhao","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息","批量修改【有效标志】"};//按钮的显示名称
	String[] buttonLink={"Tckd_tczcbjList.jsp?","PlUpdateYxbz.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//非第一次进入此页，不需要初始化
{
	String[] cpbm = request.getParameterValues("cpbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cpbm,"cpbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from tckd_tczcbj where "+chooseitem;
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
  <B><font size="3">套餐主材库－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="2%">地区</td>
	<td  width="3%">报价级别</td>
	<td  width="4%">产品编码</td>
	<td  width="4%">阔达编码</td>
	<td  width="4%">内部编码</td>
	<td  width="4%">允许替换升级</td>
	<td  width="6%">产品名称</td>
	<td  width="5%">品牌</td>
	<td  width="6%">型号</td>
	<td  width="5%">规格</td>
	<td  width="2%">报价计量单位</td>
	<td  width="2%">下单计量单位</td>
	<td  width="2%">下单比</td>
	<td  width="2%">损耗</td>
	<td  width="3%">是否需处理小数</td>
	<td  width="5%">产品大类</td>
	<td  width="3%">产品类别</td>
	<td  width="8%">供应商</td>
	<td  width="3%">是否有效</td>
	<td  width="3%">有效开始时间</td>
	<td  width="3%">有效结束时间</td>
	<td  width="2%">排序序号</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="9%">备注</td>
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