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
	String hy_khhdpt_khbh=null;
	String hy_khhdpt_gmrq=null;
	String hy_khhdpt_lrr=null;
	String hy_khhdpt_lrsj=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_sjs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sgd=null;
	String jc_zcjgb_zcmc=null;
	String crm_khxx_dwbh=null;
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	hy_khhdpt_khbh=request.getParameter("hy_khhdpt_khbh");
	if (hy_khhdpt_khbh!=null)
	{
		hy_khhdpt_khbh=cf.GB2Uni(hy_khhdpt_khbh);
		if (!(hy_khhdpt_khbh.equals("")))	wheresql+=" and  (hy_khhdpt.khbh='"+hy_khhdpt_khbh+"')";
	}
	hy_khhdpt_gmrq=request.getParameter("hy_khhdpt_gmrq");
	if (hy_khhdpt_gmrq!=null)
	{
		hy_khhdpt_gmrq=hy_khhdpt_gmrq.trim();
		if (!(hy_khhdpt_gmrq.equals("")))	wheresql+="  and (hy_khhdpt.gmrq=TO_DATE('"+hy_khhdpt_gmrq+"','YYYY/MM/DD'))";
	}
	hy_khhdpt_lrr=request.getParameter("hy_khhdpt_lrr");
	if (hy_khhdpt_lrr!=null)
	{
		hy_khhdpt_lrr=cf.GB2Uni(hy_khhdpt_lrr);
		if (!(hy_khhdpt_lrr.equals("")))	wheresql+=" and  (hy_khhdpt.lrr='"+hy_khhdpt_lrr+"')";
	}
	hy_khhdpt_lrsj=request.getParameter("hy_khhdpt_lrsj");
	if (hy_khhdpt_lrsj!=null)
	{
		hy_khhdpt_lrsj=hy_khhdpt_lrsj.trim();
		if (!(hy_khhdpt_lrsj.equals("")))	wheresql+="  and (hy_khhdpt.lrsj=TO_DATE('"+hy_khhdpt_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	jc_zcjgb_zcmc=request.getParameter("jc_zcjgb_zcmc");
	if (jc_zcjgb_zcmc!=null)
	{
		jc_zcjgb_zcmc=cf.GB2Uni(jc_zcjgb_zcmc);
		if (!(jc_zcjgb_zcmc.equals("")))	wheresql+=" and  (jc_zcjgb.zcmc='"+jc_zcjgb_zcmc+"')";
	}
	ls_sql="SELECT hy_khhdpt.khbh,crm_khxx.khxm,jc_zcjgb.zcmc,jc_zcjgb.dwbh ,hy_khhdpt.gmrq,hy_khhdpt.gmsl,hy_khhdpt.gmje,decode(hy_khhdpt.khwjbz,'N','正在购物','已完结') XX ,decode(hy_khhdpt.gswjbz,'Y','未完结','已完结') SS,hy_khhdpt.lrr,hy_khhdpt.lrsj,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.sjs,crm_khxx.hth,sgdmc";
	ls_sql+=" FROM jc_zcjgb,hy_khhdpt,crm_khxx,sq_sgd ";
    ls_sql+=" where hy_khhdpt.zcbm=jc_zcjgb.zcbm and hy_khhdpt.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
		 ls_sql+=" order by crm_khxx.khxm ";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Hy_khhdptCxList.jsp","SelectCxHy_khhdpt.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
//设置显示列
	String[] disColName={"khbh","hy_khhdpt_gmrq","hy_khhdpt_gmsl","hy_khhdpt_gmje","hy_khhdpt_khwjbz","hy_khhdpt_gswjbz","hy_khhdpt_lrr","hy_khhdpt_lrsj","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_sjs","crm_khxx_hth","crm_khxx_sgd","jc_zcjgb_zcmc","jc_zcjgb_dwbh"};
	pageObj.setDisColName(disColName);
*/
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khbh","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("zcmc","1");//列参数对象加入Hash表
	spanColHash.put("dwbh","1");//列参数对象加入Hash表
	spanColHash.put("lxfs","1");//列参数对象加入Hash表
	spanColHash.put("sgdmc","1");//列参数对象加入Hash表
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
//设置主键
/*
	String[] keyName={};
	pageObj.setKey(keyName);
*/
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
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	
	<td  width="4%">客户编号</td>
	<td  width="5%">客户姓名</td>
	<td  width="13%">主材名称</td>
	<td  width="13%">品牌</td>
	<td  width="5%">购买日期</td>
	<td  width="4%">购买数量</td>
	<td  width="4%">购买金额</td>
	<td  width="5%">客户完结标志</td>
	<td  width="5%">公司完结标志</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	
	<td  width="13%">房屋地址</td>
	<td  width="5%">联系方式</td>
	<td  width="5%">设计师</td>
	<td  width="5%">合同号</td>
	<td  width="5%">施工队</td>

	
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