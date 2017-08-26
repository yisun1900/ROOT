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
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qye=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_dwbh=null;
	String jc_jjdd_khbh=null;
	String jc_jjdd_clgw=null;
	String jc_jjdd_ztjjgw=null;
	String jc_jjdd_xmzy=null;
	String jc_jjdd_jjsjs=null;
	String jc_jjdd_qhtsj=null;
	String jc_jjdd_pdgc=null;
	String jc_jjdd_xcmgc=null;
	String jc_jjdd_lrsj=null;
	String jc_jjdd_khlx=null;
	String jc_jjgtmx_ddbh=null;
	String jc_jjgtmx_gtmc=null;
	String jc_jjgtmx_jjazwz=null;
	String jc_jjgtmx_guige=null;
	String jc_jjgtmx_jjlx=null;
	String jc_jjgtmx_bcpp=null;
	String jc_jjgtmx_bclx=null;
	String jc_jjgtmx_bcys=null;


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	
	
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_qye=request.getParameter("crm_khxx_qye");
	if (crm_khxx_qye!=null)
	{
		crm_khxx_qye=crm_khxx_qye.trim();
		if (!(crm_khxx_qye.equals("")))	wheresql+=" and  (crm_khxx.qye>="+crm_khxx_qye+") ";
	}
	crm_khxx_qye=request.getParameter("crm_khxx_qye2");
	if (crm_khxx_qye!=null)
	{
		crm_khxx_qye=crm_khxx_qye.trim();
		if (!(crm_khxx_qye.equals("")))	wheresql+=" and  (crm_khxx.qye<="+crm_khxx_qye+") ";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	jc_jjdd_khbh=request.getParameter("jc_jjdd_khbh");
	if (jc_jjdd_khbh!=null)
	{
		jc_jjdd_khbh=cf.GB2Uni(jc_jjdd_khbh);
		if (!(jc_jjdd_khbh.equals("")))	wheresql+=" and  (jc_jjdd.khbh='"+jc_jjdd_khbh+"')";
	}
	jc_jjdd_clgw=request.getParameter("jc_jjdd_clgw");
	if (jc_jjdd_clgw!=null)
	{
		jc_jjdd_clgw=cf.GB2Uni(jc_jjdd_clgw);
		if (!(jc_jjdd_clgw.equals("")))	wheresql+=" and  (jc_jjdd.clgw='"+jc_jjdd_clgw+"')";
	}
	jc_jjdd_ztjjgw=request.getParameter("jc_jjdd_ztjjgw");
	if (jc_jjdd_ztjjgw!=null)
	{
		jc_jjdd_ztjjgw=cf.GB2Uni(jc_jjdd_ztjjgw);
		if (!(jc_jjdd_ztjjgw.equals("")))	wheresql+=" and  (jc_jjdd.ztjjgw='"+jc_jjdd_ztjjgw+"')";
	}
	jc_jjdd_xmzy=request.getParameter("jc_jjdd_xmzy");
	if (jc_jjdd_xmzy!=null)
	{
		jc_jjdd_xmzy=cf.GB2Uni(jc_jjdd_xmzy);
		if (!(jc_jjdd_xmzy.equals("")))	wheresql+=" and  (jc_jjdd.xmzy='"+jc_jjdd_xmzy+"')";
	}
	jc_jjdd_jjsjs=request.getParameter("jc_jjdd_jjsjs");
	if (jc_jjdd_jjsjs!=null)
	{
		jc_jjdd_jjsjs=cf.GB2Uni(jc_jjdd_jjsjs);
		if (!(jc_jjdd_jjsjs.equals("")))	wheresql+=" and  (jc_jjdd.jjsjs='"+jc_jjdd_jjsjs+"')";
	}
	jc_jjdd_qhtsj=request.getParameter("jc_jjdd_qhtsj");
	if (jc_jjdd_qhtsj!=null)
	{
		jc_jjdd_qhtsj=jc_jjdd_qhtsj.trim();
		if (!(jc_jjdd_qhtsj.equals("")))	wheresql+="  and (jc_jjdd.qhtsj>=TO_DATE('"+jc_jjdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_qhtsj=request.getParameter("jc_jjdd_qhtsj2");
	if (jc_jjdd_qhtsj!=null)
	{
		jc_jjdd_qhtsj=jc_jjdd_qhtsj.trim();
		if (!(jc_jjdd_qhtsj.equals("")))	wheresql+="  and (jc_jjdd.qhtsj<=TO_DATE('"+jc_jjdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_pdgc=request.getParameter("jc_jjdd_pdgc");
	if (jc_jjdd_pdgc!=null)
	{
		jc_jjdd_pdgc=cf.GB2Uni(jc_jjdd_pdgc);
		if (!(jc_jjdd_pdgc.equals("")))	wheresql+=" and  (jc_jjdd.pdgc='"+jc_jjdd_pdgc+"')";
	}
	jc_jjdd_xcmgc=request.getParameter("jc_jjdd_xcmgc");
	if (jc_jjdd_xcmgc!=null)
	{
		jc_jjdd_xcmgc=cf.GB2Uni(jc_jjdd_xcmgc);
		if (!(jc_jjdd_xcmgc.equals("")))	wheresql+=" and  (jc_jjdd.xcmgc='"+jc_jjdd_xcmgc+"')";
	}
	jc_jjdd_lrsj=request.getParameter("jc_jjdd_lrsj");
	if (jc_jjdd_lrsj!=null)
	{
		jc_jjdd_lrsj=jc_jjdd_lrsj.trim();
		if (!(jc_jjdd_lrsj.equals("")))	wheresql+="  and (jc_jjdd.lrsj>=TO_DATE('"+jc_jjdd_lrsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_lrsj=request.getParameter("jc_jjdd_lrsj2");
	if (jc_jjdd_lrsj!=null)
	{
		jc_jjdd_lrsj=jc_jjdd_lrsj.trim();
		if (!(jc_jjdd_lrsj.equals("")))	wheresql+="  and (jc_jjdd.lrsj<=TO_DATE('"+jc_jjdd_lrsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_khlx=request.getParameter("jc_jjdd_khlx");
	if (jc_jjdd_khlx!=null)
	{
		jc_jjdd_khlx=cf.GB2Uni(jc_jjdd_khlx);
		if (!(jc_jjdd_khlx.equals("")))	wheresql+=" and  (jc_jjdd.khlx='"+jc_jjdd_khlx+"')";
	}
	jc_jjgtmx_ddbh=request.getParameter("jc_jjgtmx_ddbh");
	if (jc_jjgtmx_ddbh!=null)
	{
		jc_jjgtmx_ddbh=cf.GB2Uni(jc_jjgtmx_ddbh);
		if (!(jc_jjgtmx_ddbh.equals("")))	wheresql+=" and  (jc_jjgtmx.ddbh='"+jc_jjgtmx_ddbh+"')";
	}
	jc_jjgtmx_gtmc=request.getParameter("jc_jjgtmx_gtmc");
	if (jc_jjgtmx_gtmc!=null)
	{
		jc_jjgtmx_gtmc=cf.GB2Uni(jc_jjgtmx_gtmc);
		if (!(jc_jjgtmx_gtmc.equals("")))	wheresql+=" and  (jc_jjgtmx.gtmc='"+jc_jjgtmx_gtmc+"')";
	}
	jc_jjgtmx_jjazwz=request.getParameter("jc_jjgtmx_jjazwz");
	if (jc_jjgtmx_jjazwz!=null)
	{
		jc_jjgtmx_jjazwz=cf.GB2Uni(jc_jjgtmx_jjazwz);
		if (!(jc_jjgtmx_jjazwz.equals("")))	wheresql+=" and  (jc_jjgtmx.jjazwz='"+jc_jjgtmx_jjazwz+"')";
	}
	jc_jjgtmx_guige=request.getParameter("jc_jjgtmx_guige");
	if (jc_jjgtmx_guige!=null)
	{
		jc_jjgtmx_guige=cf.GB2Uni(jc_jjgtmx_guige);
		if (!(jc_jjgtmx_guige.equals("")))	wheresql+=" and  (jc_jjgtmx.guige='"+jc_jjgtmx_guige+"')";
	}
	jc_jjgtmx_jjlx=request.getParameter("jc_jjgtmx_jjlx");
	if (jc_jjgtmx_jjlx!=null)
	{
		jc_jjgtmx_jjlx=cf.GB2Uni(jc_jjgtmx_jjlx);
		if (!(jc_jjgtmx_jjlx.equals("")))	wheresql+=" and  (jc_jjgtmx.jjlx='"+jc_jjgtmx_jjlx+"')";
	}
	jc_jjgtmx_bcpp=request.getParameter("jc_jjgtmx_bcpp");
	if (jc_jjgtmx_bcpp!=null)
	{
		jc_jjgtmx_bcpp=cf.GB2Uni(jc_jjgtmx_bcpp);
		if (!(jc_jjgtmx_bcpp.equals("")))	wheresql+=" and  (jc_jjgtmx.bcpp='"+jc_jjgtmx_bcpp+"')";
	}
	jc_jjgtmx_bclx=request.getParameter("jc_jjgtmx_bclx");
	if (jc_jjgtmx_bclx!=null)
	{
		jc_jjgtmx_bclx=cf.GB2Uni(jc_jjgtmx_bclx);
		if (!(jc_jjgtmx_bclx.equals("")))	wheresql+=" and  (jc_jjgtmx.bclx='"+jc_jjgtmx_bclx+"')";
	}
	jc_jjgtmx_bcys=request.getParameter("jc_jjgtmx_bcys");
	if (jc_jjgtmx_bcys!=null)
	{
		jc_jjgtmx_bcys=cf.GB2Uni(jc_jjgtmx_bcys);
		if (!(jc_jjgtmx_bcys.equals("")))	wheresql+=" and  (jc_jjgtmx.bcys='"+jc_jjgtmx_bcys+"')";
	}

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String jgpx4=cf.GB2Uni(request.getParameter("jgpx4"));
	String jgpx5=cf.GB2Uni(request.getParameter("jgpx5"));
	String jgpx6=cf.GB2Uni(request.getParameter("jgpx6"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}
	if (!jgpx4.equals(""))
	{
		ordersql+=","+jgpx4;
	}
	if (!jgpx5.equals(""))
	{
		ordersql+=","+jgpx5;
	}
	if (!jgpx6.equals(""))
	{
		ordersql+=","+jgpx6;
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT crm_khxx.khxm,crm_khxx.hth,jc_jjgtmx.ddbh,jc_jjdd.lrsj,jc_jjdd.qhtsj,jc_jjdd.jjsjs,a.gysmc pdgc,b.gysmc xcmgc,jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.xmzy,jc_jjgtmx.gtmc,jc_jjgtmx.jjazwz,jc_jjgtmx.guige,jc_jjgtmx.jjlx,jc_jjgtmx.bcpp,jc_jjgtmx.bclx,jc_jjgtmx.bcys,jc_jjgtmx.bcbfje,jc_jjgtmx.pjbfje,jc_jjgtmx.zj,jc_jjgtmx.sl,jc_jjgtmx.zjhsl,jc_jjgtmx.bz  ";
	ls_sql+=" FROM crm_khxx,jc_jjdd,jc_jjgtmx,sq_dwxx,sq_gysxx a,sq_gysxx b ";
    ls_sql+=" where jc_jjgtmx.ddbh=jc_jjdd.ddbh and jc_jjdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh";
	ls_sql+=" and jc_jjdd.pdgc=a.gysbh(+) and jc_jjdd.xcmgc=b.gysbh(+)  ";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_jjgtmxCxList.jsp","SelectCxJc_jjgtmx.jsp","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"khxm","crm_khxx_hth","jc_jjdd_clgw","jc_jjdd_ztjjgw","jc_jjdd_xmzy","jc_jjdd_jjsjs","jc_jjdd_qhtsj","jc_jjdd_pdgc","jc_jjdd_xcmgc","jc_jjdd_lrsj","jc_jjgtmx_ddbh","jc_jjgtmx_gtmc","jc_jjgtmx_jjazwz","jc_jjgtmx_guige","jc_jjgtmx_jjlx","jc_jjgtmx_bcpp","jc_jjgtmx_bclx","jc_jjgtmx_bcys","jc_jjgtmx_bcbfje","jc_jjgtmx_pjbfje","jc_jjgtmx_zj","jc_jjgtmx_sl","jc_jjgtmx_zjhsl","jc_jjgtmx_bz"};
	pageObj.setDisColName(disColName);
*/

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
	pageObj.printPageLink(240);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">客户姓名</td>
	<td  width="3%">合同号</td>
	<td  width="3%">订单编号</td>
	<td  width="4%">录入时间</td>
	<td  width="4%">签合同时间</td>
	<td  width="3%">家具设计师</td>
	<td  width="5%">家具工厂</td>
	<td  width="5%">型材门工厂</td>
	<td  width="3%">驻店家居顾问</td>
	<td  width="3%">展厅家居顾问</td>
	<td  width="3%">项目专员</td>
	<td  width="4%">柜体名称</td>
	<td  width="4%">安装位置</td>
	<td  width="4%">规格</td>
	<td  width="5%">家具系列</td>
	<td  width="5%">板材品牌</td>
	<td  width="6%">板材类型</td>
	<td  width="3%">板材颜色</td>
	<td  width="4%">板材部分金额</td>
	<td  width="4%">配件部分金额</td>
	<td  width="4%">柜体单价</td>
	<td  width="3%">柜体合同数量</td>
	<td  width="3%">柜体增减后数量</td>
	<td  width="4%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
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