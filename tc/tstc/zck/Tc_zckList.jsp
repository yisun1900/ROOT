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
	String tc_zck_cpbm=null;
	String tc_zck_dqbm=null;
	String tc_zck_bjjbbm=null;
	String tc_zck_nbbm=null;
	String cldl=null;
	String clxl=null;
	String tc_zck_cpmc=null;
	String tc_zck_xh=null;
	String tc_zck_gg=null;
	String tc_zck_ppmc=null;
	String tc_zck_gysmc=null;
	String tc_zck_jldw=null;
	String tc_zck_xdjldw=null;
	String tc_zck_sfxclxs=null;
	String tc_zck_lx=null;
	String tc_zck_lbxmbm=null;
	String tc_zck_cxxmbm=null;
	String tc_zck_sfyx=null;
	String tc_zck_yxkssj=null;
	String tc_zck_yxjzsj=null;
	String tc_zck_lrr=null;
	String tc_zck_lrsj=null;
	tc_zck_cpbm=request.getParameter("tc_zck_cpbm");
	if (tc_zck_cpbm!=null)
	{
		tc_zck_cpbm=cf.GB2Uni(tc_zck_cpbm);
		if (!(tc_zck_cpbm.equals("")))	wheresql+=" and  (tc_zck.cpbm='"+tc_zck_cpbm+"')";
	}
	tc_zck_dqbm=request.getParameter("tc_zck_dqbm");
	if (tc_zck_dqbm!=null)
	{
		tc_zck_dqbm=cf.GB2Uni(tc_zck_dqbm);
		if (!(tc_zck_dqbm.equals("")))	wheresql+=" and  (tc_zck.dqbm='"+tc_zck_dqbm+"')";
	}
	tc_zck_bjjbbm=request.getParameter("tc_zck_bjjbbm");
	if (tc_zck_bjjbbm!=null)
	{
		tc_zck_bjjbbm=cf.GB2Uni(tc_zck_bjjbbm);
		if (!(tc_zck_bjjbbm.equals("")))	wheresql+=" and  (tc_zck.bjjbbm='"+tc_zck_bjjbbm+"')";
	}
	tc_zck_nbbm=request.getParameter("tc_zck_nbbm");
	if (tc_zck_nbbm!=null)
	{
		tc_zck_nbbm=cf.GB2Uni(tc_zck_nbbm);
		if (!(tc_zck_nbbm.equals("")))	wheresql+=" and  (tc_zck.nbbm='"+tc_zck_nbbm+"')";
	}
	cldl=request.getParameter("cldl");
	if (cldl!=null)
	{
		cldl=cf.GB2Uni(cldl);
		if (!(cldl.equals("")))	wheresql+=" and  (tc_zck.cldl='"+cldl+"')";
	}
	clxl=request.getParameter("clxl");
	if (clxl!=null)
	{
		clxl=cf.GB2Uni(clxl);
		if (!(clxl.equals("")))	wheresql+=" and  (tc_zck.clxl='"+clxl+"')";
	}
	tc_zck_cpmc=request.getParameter("tc_zck_cpmc");
	if (tc_zck_cpmc!=null)
	{
		tc_zck_cpmc=cf.GB2Uni(tc_zck_cpmc);
		if (!(tc_zck_cpmc.equals("")))	wheresql+=" and  (tc_zck.cpmc like '%"+tc_zck_cpmc+"%')";
	}
	tc_zck_xh=request.getParameter("tc_zck_xh");
	if (tc_zck_xh!=null)
	{
		tc_zck_xh=cf.GB2Uni(tc_zck_xh);
		if (!(tc_zck_xh.equals("")))	wheresql+=" and  (tc_zck.xh like '%"+tc_zck_xh+"%')";
	}
	tc_zck_gg=request.getParameter("tc_zck_gg");
	if (tc_zck_gg!=null)
	{
		tc_zck_gg=cf.GB2Uni(tc_zck_gg);
		if (!(tc_zck_gg.equals("")))	wheresql+=" and  (tc_zck.gg='"+tc_zck_gg+"')";
	}
	tc_zck_ppmc=request.getParameter("tc_zck_ppmc");
	if (tc_zck_ppmc!=null)
	{
		tc_zck_ppmc=cf.GB2Uni(tc_zck_ppmc);
		if (!(tc_zck_ppmc.equals("")))	wheresql+=" and  (tc_zck.ppmc='"+tc_zck_ppmc+"')";
	}
	tc_zck_gysmc=request.getParameter("tc_zck_gysmc");
	if (tc_zck_gysmc!=null)
	{
		tc_zck_gysmc=cf.GB2Uni(tc_zck_gysmc);
		if (!(tc_zck_gysmc.equals("")))	wheresql+=" and  (tc_zck.gysmc='"+tc_zck_gysmc+"')";
	}
	tc_zck_jldw=request.getParameter("tc_zck_jldw");
	if (tc_zck_jldw!=null)
	{
		tc_zck_jldw=cf.GB2Uni(tc_zck_jldw);
		if (!(tc_zck_jldw.equals("")))	wheresql+=" and  (tc_zck.jldw='"+tc_zck_jldw+"')";
	}
	tc_zck_xdjldw=request.getParameter("tc_zck_xdjldw");
	if (tc_zck_xdjldw!=null)
	{
		tc_zck_xdjldw=cf.GB2Uni(tc_zck_xdjldw);
		if (!(tc_zck_xdjldw.equals("")))	wheresql+=" and  (tc_zck.xdjldw='"+tc_zck_xdjldw+"')";
	}
	tc_zck_sfxclxs=request.getParameter("tc_zck_sfxclxs");
	if (tc_zck_sfxclxs!=null)
	{
		tc_zck_sfxclxs=cf.GB2Uni(tc_zck_sfxclxs);
		if (!(tc_zck_sfxclxs.equals("")))	wheresql+=" and  (tc_zck.sfxclxs='"+tc_zck_sfxclxs+"')";
	}
	tc_zck_lx=request.getParameter("tc_zck_lx");
	if (tc_zck_lx!=null)
	{
		tc_zck_lx=cf.GB2Uni(tc_zck_lx);
		if (!(tc_zck_lx.equals("")))	wheresql+=" and  (tc_zck.lx='"+tc_zck_lx+"')";
	}
	tc_zck_lbxmbm=request.getParameter("tc_zck_lbxmbm");
	if (tc_zck_lbxmbm!=null)
	{
		tc_zck_lbxmbm=cf.GB2Uni(tc_zck_lbxmbm);
		if (!(tc_zck_lbxmbm.equals("")))	wheresql+=" and  (tc_zck.lbxmbm='"+tc_zck_lbxmbm+"')";
	}
	tc_zck_cxxmbm=request.getParameter("tc_zck_cxxmbm");
	if (tc_zck_cxxmbm!=null)
	{
		tc_zck_cxxmbm=cf.GB2Uni(tc_zck_cxxmbm);
		if (!(tc_zck_cxxmbm.equals("")))	wheresql+=" and  (tc_zck.cxxmbm='"+tc_zck_cxxmbm+"')";
	}
	tc_zck_sfyx=request.getParameter("tc_zck_sfyx");
	if (tc_zck_sfyx!=null)
	{
		tc_zck_sfyx=cf.GB2Uni(tc_zck_sfyx);
		if (!(tc_zck_sfyx.equals("")))	wheresql+=" and  (tc_zck.sfyx='"+tc_zck_sfyx+"')";
	}
	tc_zck_yxkssj=request.getParameter("tc_zck_yxkssj");
	if (tc_zck_yxkssj!=null)
	{
		tc_zck_yxkssj=tc_zck_yxkssj.trim();
		if (!(tc_zck_yxkssj.equals("")))	wheresql+="  and (tc_zck.yxkssj>=TO_DATE('"+tc_zck_yxkssj+"','YYYY/MM/DD'))";
	}
	tc_zck_yxkssj=request.getParameter("tc_zck_yxkssj2");
	if (tc_zck_yxkssj!=null)
	{
		tc_zck_yxkssj=tc_zck_yxkssj.trim();
		if (!(tc_zck_yxkssj.equals("")))	wheresql+="  and (tc_zck.yxkssj<=TO_DATE('"+tc_zck_yxkssj+"','YYYY/MM/DD'))";
	}
	tc_zck_yxjzsj=request.getParameter("tc_zck_yxjzsj");
	if (tc_zck_yxjzsj!=null)
	{
		tc_zck_yxjzsj=tc_zck_yxjzsj.trim();
		if (!(tc_zck_yxjzsj.equals("")))	wheresql+="  and (tc_zck.yxjzsj>=TO_DATE('"+tc_zck_yxjzsj+"','YYYY/MM/DD'))";
	}
	tc_zck_yxjzsj=request.getParameter("tc_zck_yxjzsj2");
	if (tc_zck_yxjzsj!=null)
	{
		tc_zck_yxjzsj=tc_zck_yxjzsj.trim();
		if (!(tc_zck_yxjzsj.equals("")))	wheresql+="  and (tc_zck.yxjzsj<=TO_DATE('"+tc_zck_yxjzsj+"','YYYY/MM/DD'))";
	}
	tc_zck_lrr=request.getParameter("tc_zck_lrr");
	if (tc_zck_lrr!=null)
	{
		tc_zck_lrr=cf.GB2Uni(tc_zck_lrr);
		if (!(tc_zck_lrr.equals("")))	wheresql+=" and  (tc_zck.lrr='"+tc_zck_lrr+"')";
	}
	tc_zck_lrsj=request.getParameter("tc_zck_lrsj");
	if (tc_zck_lrsj!=null)
	{
		tc_zck_lrsj=tc_zck_lrsj.trim();
		if (!(tc_zck_lrsj.equals("")))	wheresql+="  and (tc_zck.lrsj>=TO_DATE('"+tc_zck_lrsj+"','YYYY/MM/DD'))";
	}
	tc_zck_lrsj=request.getParameter("tc_zck_lrsj2");
	if (tc_zck_lrsj!=null)
	{
		tc_zck_lrsj=tc_zck_lrsj.trim();
		if (!(tc_zck_lrsj.equals("")))	wheresql+="  and (tc_zck.lrsj<=TO_DATE('"+tc_zck_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_zck.cpbm,dm_dqbm.dqmc,bdm_bjjbbm.bjjbmc,tc_zck.nbbm,tc_zck.cldl,tc_zck.clxl,tc_zck.cpmc,tc_zck.xh,tc_zck.gg,tc_zck.ppmc,tc_zck.gysmc,tc_zck.jldw,tc_zck.xdjldw,tc_zck.xdb,tc_zck.sh, DECODE(tc_zck.sfxclxs,'1','向上取整','2','向下取整','3','4舍5入','4','不处理'),tc_zck.jsj,tc_zck.khxsdj,tc_zck.sgddj, DECODE(tc_zck.lx,'1','套餐项','2','促销项','3','礼包项','4','套餐外'),tc_zck.lbxmbm,tc_zck.cxxmbm, DECODE(tc_zck.sfyx,'1','正在销售','2','停止销售','3','阶段销售','4','售前核实'),tc_zck.yxkssj,tc_zck.yxjzsj,tc_zck.xuhao,tc_zck.lrr,tc_zck.lrsj,tc_zck.bz,tc_zck.sjj1,tc_zck.sjj2,tc_zck.sjj3,tc_zck.sjj4,tc_zck.sjj5  ";
	ls_sql+=" FROM bdm_bjjbbm,dm_dqbm,tc_zck  ";
    ls_sql+=" where tc_zck.dqbm=dm_dqbm.dqbm(+) and tc_zck.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_zck.dqbm,tc_zck.bjjbbm,tc_zck.cldl,tc_zck.clxl";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tc_zckList.jsp","","","EditTc_zck.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"cpbm","dm_dqbm_dqmc","bdm_bjjbbm_bjjbmc","tc_zck_nbbm","cldl","clxl","tc_zck_cpmc","tc_zck_xh","tc_zck_gg","tc_zck_ppmc","tc_zck_gysmc","tc_zck_jldw","tc_zck_xdjldw","tc_zck_xdb","tc_zck_sh","tc_zck_sfxclxs","tc_zck_jsj","tc_zck_khxsdj","tc_zck_sgddj","tc_zck_lx","tc_zck_lbxmbm","tc_zck_cxxmbm","tc_zck_sfyx","tc_zck_yxkssj","tc_zck_yxjzsj","tc_zck_xuhao","tc_zck_lrr","tc_zck_lrsj","tc_zck_bz","tc_zck_sjj1","tc_zck_sjj2","tc_zck_sjj3","tc_zck_sjj4","tc_zck_sjj5"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Tc_zckList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] cpbm = request.getParameterValues("cpbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cpbm,"cpbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from tc_zck where "+chooseitem;
		sql[1]="delete from tc_zcsjj where "+chooseitem;
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
	pageObj.printPageLink(420);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">产品编码</td>
	<td  width="2%">地区</td>
	<td  width="2%">报价级别</td>
	<td  width="2%">内部编码</td>
	<td  width="3%">产品大类</td>
	<td  width="3%">产品小类</td>
	<td  width="7%">产品名称</td>
	<td  width="6%">型号</td>
	<td  width="4%">规格</td>
	<td  width="4%">品牌</td>
	<td  width="6%">供应商</td>
	<td  width="2%">计量单位</td>
	<td  width="2%">下单计量单位</td>
	<td  width="2%">下单比</td>
	<td  width="2%">损耗</td>
	<td  width="2%">是否需处理小数</td>
	<td  width="2%">结算价</td>
	<td  width="2%">客户销售单价</td>
	<td  width="2%">施工队单价</td>
	<td  width="2%">类型</td>
	<td  width="3%">礼包项目编码</td>
	<td  width="3%">促销项目编码</td>
	<td  width="3%">是否有效</td>
	<td  width="3%">有效开始时间</td>
	<td  width="3%">有效结束时间</td>
	<td  width="2%">排序序号</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="6%">备注</td>
	<td  width="2%">升级价1</td>
	<td  width="2%">升级价2</td>
	<td  width="2%">升级价3</td>
	<td  width="2%">升级价4</td>
	<td  width="32%">升级价5</td>
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