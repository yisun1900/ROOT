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
	String jxc_gysdd_gysddph=null;
	String jxc_gysdd_ssfgs=null;
	String jxc_gysdd_dqbm=null;
	String jxc_gysdd_gysbm=null;
	String jxc_gysdd_gysmc=null;
	String jxc_gysdd_cglb=null;
	String jxc_gysdd_cllb=null;
	String jxc_gysdd_xdr=null;
	String jxc_gysdd_xdrq=null;
	String jxc_gysdd_psfs=null;
	String jxc_gysdd_yqdhsj=null;
	String jxc_gysdd_gysjsr=null;
	String jxc_gysdd_gysjsrq=null;
	String jxc_gysdd_fhsfwc=null;
	String jxc_gysdd_gysfhr=null;
	String jxc_gysdd_gysfhrq=null;
	String jxc_gysdd_sfjs=null;
	String jxc_gysdd_jsr=null;
	String jxc_gysdd_jsrq=null;
	String jxc_gysdd_sgph=null;
	String jxc_gysdd_ddzt=null;
	String jxc_gysdd_lrr=null;
	String jxc_gysdd_lrsj=null;
	String jxc_gysdd_lrbm=null;
	String jxc_gysdd_sfrksgdw=null;
	jxc_gysdd_gysddph=request.getParameter("jxc_gysdd_gysddph");
	if (jxc_gysdd_gysddph!=null)
	{
		jxc_gysdd_gysddph=cf.GB2Uni(jxc_gysdd_gysddph);
		if (!(jxc_gysdd_gysddph.equals("")))	wheresql+=" and  (jxc_gysdd.gysddph='"+jxc_gysdd_gysddph+"')";
	}
	jxc_gysdd_ssfgs=request.getParameter("jxc_gysdd_ssfgs");
	if (jxc_gysdd_ssfgs!=null)
	{
		jxc_gysdd_ssfgs=cf.GB2Uni(jxc_gysdd_ssfgs);
		if (!(jxc_gysdd_ssfgs.equals("")))	wheresql+=" and  (jxc_gysdd.ssfgs='"+jxc_gysdd_ssfgs+"')";
	}
	jxc_gysdd_dqbm=request.getParameter("jxc_gysdd_dqbm");
	if (jxc_gysdd_dqbm!=null)
	{
		jxc_gysdd_dqbm=cf.GB2Uni(jxc_gysdd_dqbm);
		if (!(jxc_gysdd_dqbm.equals("")))	wheresql+=" and  (jxc_gysdd.dqbm='"+jxc_gysdd_dqbm+"')";
	}
	jxc_gysdd_gysbm=request.getParameter("jxc_gysdd_gysbm");
	if (jxc_gysdd_gysbm!=null)
	{
		jxc_gysdd_gysbm=jxc_gysdd_gysbm.trim();
		if (!(jxc_gysdd_gysbm.equals("")))	wheresql+=" and (jxc_gysdd.gysbm="+jxc_gysdd_gysbm+") ";
	}
	jxc_gysdd_gysmc=request.getParameter("jxc_gysdd_gysmc");
	if (jxc_gysdd_gysmc!=null)
	{
		jxc_gysdd_gysmc=cf.GB2Uni(jxc_gysdd_gysmc);
		if (!(jxc_gysdd_gysmc.equals("")))	wheresql+=" and  (jxc_gysdd.gysmc='"+jxc_gysdd_gysmc+"')";
	}
	jxc_gysdd_cglb=request.getParameter("jxc_gysdd_cglb");
	if (jxc_gysdd_cglb!=null)
	{
		jxc_gysdd_cglb=cf.GB2Uni(jxc_gysdd_cglb);
		if (!(jxc_gysdd_cglb.equals("")))	wheresql+=" and  (jxc_gysdd.cglb='"+jxc_gysdd_cglb+"')";
	}
	jxc_gysdd_cllb=request.getParameter("jxc_gysdd_cllb");
	if (jxc_gysdd_cllb!=null)
	{
		jxc_gysdd_cllb=cf.GB2Uni(jxc_gysdd_cllb);
		if (!(jxc_gysdd_cllb.equals("")))	wheresql+=" and  (jxc_gysdd.cllb='"+jxc_gysdd_cllb+"')";
	}
	jxc_gysdd_xdr=request.getParameter("jxc_gysdd_xdr");
	if (jxc_gysdd_xdr!=null)
	{
		jxc_gysdd_xdr=cf.GB2Uni(jxc_gysdd_xdr);
		if (!(jxc_gysdd_xdr.equals("")))	wheresql+=" and  (jxc_gysdd.xdr='"+jxc_gysdd_xdr+"')";
	}
	jxc_gysdd_xdrq=request.getParameter("jxc_gysdd_xdrq");
	if (jxc_gysdd_xdrq!=null)
	{
		jxc_gysdd_xdrq=jxc_gysdd_xdrq.trim();
		if (!(jxc_gysdd_xdrq.equals("")))	wheresql+="  and (jxc_gysdd.xdrq>=TO_DATE('"+jxc_gysdd_xdrq+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_xdrq=request.getParameter("jxc_gysdd_xdrq2");
	if (jxc_gysdd_xdrq!=null)
	{
		jxc_gysdd_xdrq=jxc_gysdd_xdrq.trim();
		if (!(jxc_gysdd_xdrq.equals("")))	wheresql+="  and (jxc_gysdd.xdrq<=TO_DATE('"+jxc_gysdd_xdrq+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_psfs=request.getParameter("jxc_gysdd_psfs");
	if (jxc_gysdd_psfs!=null)
	{
		jxc_gysdd_psfs=cf.GB2Uni(jxc_gysdd_psfs);
		if (!(jxc_gysdd_psfs.equals("")))	wheresql+=" and  (jxc_gysdd.psfs='"+jxc_gysdd_psfs+"')";
	}
	jxc_gysdd_yqdhsj=request.getParameter("jxc_gysdd_yqdhsj");
	if (jxc_gysdd_yqdhsj!=null)
	{
		jxc_gysdd_yqdhsj=jxc_gysdd_yqdhsj.trim();
		if (!(jxc_gysdd_yqdhsj.equals("")))	wheresql+="  and (jxc_gysdd.yqdhsj>=TO_DATE('"+jxc_gysdd_yqdhsj+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_yqdhsj=request.getParameter("jxc_gysdd_yqdhsj2");
	if (jxc_gysdd_yqdhsj!=null)
	{
		jxc_gysdd_yqdhsj=jxc_gysdd_yqdhsj.trim();
		if (!(jxc_gysdd_yqdhsj.equals("")))	wheresql+="  and (jxc_gysdd.yqdhsj<=TO_DATE('"+jxc_gysdd_yqdhsj+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_gysjsr=request.getParameter("jxc_gysdd_gysjsr");
	if (jxc_gysdd_gysjsr!=null)
	{
		jxc_gysdd_gysjsr=cf.GB2Uni(jxc_gysdd_gysjsr);
		if (!(jxc_gysdd_gysjsr.equals("")))	wheresql+=" and  (jxc_gysdd.gysjsr='"+jxc_gysdd_gysjsr+"')";
	}
	jxc_gysdd_gysjsrq=request.getParameter("jxc_gysdd_gysjsrq");
	if (jxc_gysdd_gysjsrq!=null)
	{
		jxc_gysdd_gysjsrq=jxc_gysdd_gysjsrq.trim();
		if (!(jxc_gysdd_gysjsrq.equals("")))	wheresql+="  and (jxc_gysdd.gysjsrq>=TO_DATE('"+jxc_gysdd_gysjsrq+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_gysjsrq=request.getParameter("jxc_gysdd_gysjsrq2");
	if (jxc_gysdd_gysjsrq!=null)
	{
		jxc_gysdd_gysjsrq=jxc_gysdd_gysjsrq.trim();
		if (!(jxc_gysdd_gysjsrq.equals("")))	wheresql+="  and (jxc_gysdd.gysjsrq<=TO_DATE('"+jxc_gysdd_gysjsrq+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_fhsfwc=request.getParameter("jxc_gysdd_fhsfwc");
	if (jxc_gysdd_fhsfwc!=null)
	{
		jxc_gysdd_fhsfwc=cf.GB2Uni(jxc_gysdd_fhsfwc);
		if (!(jxc_gysdd_fhsfwc.equals("")))	wheresql+=" and  (jxc_gysdd.fhsfwc='"+jxc_gysdd_fhsfwc+"')";
	}
	jxc_gysdd_gysfhr=request.getParameter("jxc_gysdd_gysfhr");
	if (jxc_gysdd_gysfhr!=null)
	{
		jxc_gysdd_gysfhr=cf.GB2Uni(jxc_gysdd_gysfhr);
		if (!(jxc_gysdd_gysfhr.equals("")))	wheresql+=" and  (jxc_gysdd.gysfhr='"+jxc_gysdd_gysfhr+"')";
	}
	jxc_gysdd_gysfhrq=request.getParameter("jxc_gysdd_gysfhrq");
	if (jxc_gysdd_gysfhrq!=null)
	{
		jxc_gysdd_gysfhrq=jxc_gysdd_gysfhrq.trim();
		if (!(jxc_gysdd_gysfhrq.equals("")))	wheresql+="  and (jxc_gysdd.gysfhrq>=TO_DATE('"+jxc_gysdd_gysfhrq+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_gysfhrq=request.getParameter("jxc_gysdd_gysfhrq2");
	if (jxc_gysdd_gysfhrq!=null)
	{
		jxc_gysdd_gysfhrq=jxc_gysdd_gysfhrq.trim();
		if (!(jxc_gysdd_gysfhrq.equals("")))	wheresql+="  and (jxc_gysdd.gysfhrq<=TO_DATE('"+jxc_gysdd_gysfhrq+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_sfjs=request.getParameter("jxc_gysdd_sfjs");
	if (jxc_gysdd_sfjs!=null)
	{
		jxc_gysdd_sfjs=cf.GB2Uni(jxc_gysdd_sfjs);
		if (!(jxc_gysdd_sfjs.equals("")))	wheresql+=" and  (jxc_gysdd.sfjs='"+jxc_gysdd_sfjs+"')";
	}
	jxc_gysdd_jsr=request.getParameter("jxc_gysdd_jsr");
	if (jxc_gysdd_jsr!=null)
	{
		jxc_gysdd_jsr=cf.GB2Uni(jxc_gysdd_jsr);
		if (!(jxc_gysdd_jsr.equals("")))	wheresql+=" and  (jxc_gysdd.jsr='"+jxc_gysdd_jsr+"')";
	}
	jxc_gysdd_jsrq=request.getParameter("jxc_gysdd_jsrq");
	if (jxc_gysdd_jsrq!=null)
	{
		jxc_gysdd_jsrq=jxc_gysdd_jsrq.trim();
		if (!(jxc_gysdd_jsrq.equals("")))	wheresql+="  and (jxc_gysdd.jsrq>=TO_DATE('"+jxc_gysdd_jsrq+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_jsrq=request.getParameter("jxc_gysdd_jsrq2");
	if (jxc_gysdd_jsrq!=null)
	{
		jxc_gysdd_jsrq=jxc_gysdd_jsrq.trim();
		if (!(jxc_gysdd_jsrq.equals("")))	wheresql+="  and (jxc_gysdd.jsrq<=TO_DATE('"+jxc_gysdd_jsrq+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_sgph=request.getParameter("jxc_gysdd_sgph");
	if (jxc_gysdd_sgph!=null)
	{
		jxc_gysdd_sgph=cf.GB2Uni(jxc_gysdd_sgph);
		if (!(jxc_gysdd_sgph.equals("")))	wheresql+=" and  (jxc_gysdd.sgph='"+jxc_gysdd_sgph+"')";
	}
	jxc_gysdd_ddzt=request.getParameter("jxc_gysdd_ddzt");
	if (jxc_gysdd_ddzt!=null)
	{
		jxc_gysdd_ddzt=cf.GB2Uni(jxc_gysdd_ddzt);
		if (!(jxc_gysdd_ddzt.equals("")))	wheresql+=" and  (jxc_gysdd.ddzt='"+jxc_gysdd_ddzt+"')";
	}
	jxc_gysdd_lrr=request.getParameter("jxc_gysdd_lrr");
	if (jxc_gysdd_lrr!=null)
	{
		jxc_gysdd_lrr=cf.GB2Uni(jxc_gysdd_lrr);
		if (!(jxc_gysdd_lrr.equals("")))	wheresql+=" and  (jxc_gysdd.lrr='"+jxc_gysdd_lrr+"')";
	}
	jxc_gysdd_lrsj=request.getParameter("jxc_gysdd_lrsj");
	if (jxc_gysdd_lrsj!=null)
	{
		jxc_gysdd_lrsj=jxc_gysdd_lrsj.trim();
		if (!(jxc_gysdd_lrsj.equals("")))	wheresql+="  and (jxc_gysdd.lrsj>=TO_DATE('"+jxc_gysdd_lrsj+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_lrsj=request.getParameter("jxc_gysdd_lrsj2");
	if (jxc_gysdd_lrsj!=null)
	{
		jxc_gysdd_lrsj=jxc_gysdd_lrsj.trim();
		if (!(jxc_gysdd_lrsj.equals("")))	wheresql+="  and (jxc_gysdd.lrsj<=TO_DATE('"+jxc_gysdd_lrsj+"','YYYY/MM/DD'))";
	}
	jxc_gysdd_lrbm=request.getParameter("jxc_gysdd_lrbm");
	if (jxc_gysdd_lrbm!=null)
	{
		jxc_gysdd_lrbm=cf.GB2Uni(jxc_gysdd_lrbm);
		if (!(jxc_gysdd_lrbm.equals("")))	wheresql+=" and  (jxc_gysdd.lrbm='"+jxc_gysdd_lrbm+"')";
	}
	jxc_gysdd_sfrksgdw=request.getParameter("jxc_gysdd_sfrksgdw");
	if (jxc_gysdd_sfrksgdw!=null)
	{
		jxc_gysdd_sfrksgdw=cf.GB2Uni(jxc_gysdd_sfrksgdw);
		if (!(jxc_gysdd_sfrksgdw.equals("")))	wheresql+=" and  (jxc_gysdd.sfrksgdw='"+jxc_gysdd_sfrksgdw+"')";
	}
	ls_sql="SELECT jxc_gysdd.gysddph, DECODE(jxc_gysdd.ddzt,'7','未提交','0','等待下单','1','已下单','2','已接受','3','部分发货','5','已完成发货','4','已入库','6','正在办理入库','9','已结算'), DECODE(jxc_gysdd.sfrksgdw,'Y','直接入库申购单位','N','否'),jxc_gysdd.sgph,a.dwmc xdfgs,dqmc,jxc_gysdd.gysbm,jxc_gysdd.gysmc, DECODE(jxc_gysdd.cglb,'J','集团采购','D','地方采购'), DECODE(jxc_gysdd.cllb,'0','主材','1','辅材'),jxc_gysdd.dhzsl,jxc_gysdd.dhzje,jxc_gysdd.xdr,jxc_gysdd.xdrq, DECODE(jxc_gysdd.psfs,'1','配送','2','自取','3','其他'),jxc_gysdd.yqdhsj,jxc_gysdd.gysjsr,jxc_gysdd.gysjsrq, DECODE(jxc_gysdd.fhsfwc,'N','未发货','Y','已完成','M','部分发货'),jxc_gysdd.gysfhr,jxc_gysdd.gysfhrq, DECODE(jxc_gysdd.sfjs,'Y','已结算','N','未结算'),jxc_gysdd.jsr,jxc_gysdd.jsrq,jxc_gysdd.lrr,jxc_gysdd.lrsj,b.dwmc lrbm,jxc_gysdd.nian,jxc_gysdd.bz  ";
	ls_sql+=" FROM jxc_gysdd,sq_dwxx a,sq_dwxx b,dm_dqbm  ";
    ls_sql+=" where jxc_gysdd.ssfgs=a.dwbh and jxc_gysdd.lrbm=b.dwbh and jxc_gysdd.dqbm=dm_dqbm.dqbm";
    ls_sql+=" and jxc_gysdd.cllb='1'";//0：主材；1：辅材
    ls_sql+=wheresql;
    ls_sql+=" order by lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_gysddList.jsp","","","EditJxc_gysdd.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"gysddph","sq_dwxx_dwmc","jxc_gysdd_dqbm","jxc_gysdd_gysbm","jxc_gysdd_gysmc","jxc_gysdd_cglb","jxc_gysdd_cllb","jxc_gysdd_dhzsl","jxc_gysdd_dhzje","jxc_gysdd_xdr","jxc_gysdd_xdrq","jxc_gysdd_psfs","jxc_gysdd_yqdhsj","jxc_gysdd_gysjsr","jxc_gysdd_gysjsrq","jxc_gysdd_fhsfwc","jxc_gysdd_gysfhr","jxc_gysdd_gysfhrq","jxc_gysdd_sfjs","jxc_gysdd_jsr","jxc_gysdd_jsrq","jxc_gysdd_sgph","jxc_gysdd_ddzt","jxc_gysdd_lrr","jxc_gysdd_lrsj","jxc_gysdd_lrbm","jxc_gysdd_nian","jxc_gysdd_bz","jxc_gysdd_sfrksgdw"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"gysddph"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jxc_gysddList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"gysddph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jxcfc/gysddgl/ViewJxc_gysdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("gysddph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] gysddph = request.getParameterValues("gysddph");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(gysddph,"gysddph"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jxc_gysdd where "+chooseitem;
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
  <B><font size="3">修改订单</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">供应商订单批号</td>
	<td  width="3%">订单状态</td>
	<td  width="3%">直接入库申购单位</td>
	<td  width="4%">申购批号</td>
	<td  width="4%">下单公司</td>
	<td  width="2%">地区</td>
	<td  width="3%">供应商编码</td>
	<td  width="8%">供应商名称</td>
	<td  width="3%">采购类别</td>
	<td  width="3%">材料类别</td>
	<td  width="4%">订货总数量</td>
	<td  width="4%">订货总金额</td>
	<td  width="2%">下单人</td>
	<td  width="3%">下单日期</td>
	<td  width="2%">配送方式</td>
	<td  width="3%">要求到货时间</td>
	<td  width="2%">供应商接收人</td>
	<td  width="3%">供应商接收日期</td>
	<td  width="2%">是否发货</td>
	<td  width="2%">供应商发货人</td>
	<td  width="3%">供应商发货日期</td>
	<td  width="3%">是否结算</td>
	<td  width="2%">结算人</td>
	<td  width="3%">结算日期</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="2%">年</td>
	<td  width="11%">备注</td>
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