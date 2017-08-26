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


	String jxc_rkd_rklx=null;
	String jxc_rkd_rkdzt=null;
	String jxc_rkd_dqbm=null;
	String jxc_rkd_ckbh=null;
	jxc_rkd_rklx=request.getParameter("jxc_rkd_rklx");
	if (jxc_rkd_rklx!=null)
	{
		jxc_rkd_rklx=cf.GB2Uni(jxc_rkd_rklx);
		if (!(jxc_rkd_rklx.equals("")))	wheresql+=" and  (jxc_rkd.rklx='"+jxc_rkd_rklx+"')";
	}
	jxc_rkd_rkdzt=request.getParameter("jxc_rkd_rkdzt");
	if (jxc_rkd_rkdzt!=null)
	{
		jxc_rkd_rkdzt=cf.GB2Uni(jxc_rkd_rkdzt);
		if (!(jxc_rkd_rkdzt.equals("")))	wheresql+=" and  (jxc_rkd.rkdzt='"+jxc_rkd_rkdzt+"')";
	}
	jxc_rkd_dqbm=request.getParameter("jxc_rkd_dqbm");
	if (jxc_rkd_dqbm!=null)
	{
		jxc_rkd_dqbm=cf.GB2Uni(jxc_rkd_dqbm);
		if (!(jxc_rkd_dqbm.equals("")))	wheresql+=" and  (jxc_rkd.dqbm='"+jxc_rkd_dqbm+"')";
	}
	jxc_rkd_ckbh=request.getParameter("jxc_rkd_ckbh");
	if (jxc_rkd_ckbh!=null)
	{
		jxc_rkd_ckbh=cf.GB2Uni(jxc_rkd_ckbh);
		if (!(jxc_rkd_ckbh.equals("")))	wheresql+=" and  (jxc_rkd.ckbh='"+jxc_rkd_ckbh+"')";
	}


	String jxc_rkd_lydh=null;
	String jxc_rkd_gysmc=null;
	String jxc_rkd_gysmc2=null;
	String jxc_rkd_rkr=null;
	String rkrssbm=null;
	String jxc_rkd_rksj=null;


	jxc_rkd_lydh=request.getParameter("jxc_rkd_lydh");
	if (jxc_rkd_lydh!=null)
	{
		jxc_rkd_lydh=cf.GB2Uni(jxc_rkd_lydh);
		if (!(jxc_rkd_lydh.equals("")))	wheresql+=" and  (jxc_rkd.lydh='"+jxc_rkd_lydh+"')";
	}
	jxc_rkd_rkr=request.getParameter("jxc_rkd_rkr");
	if (jxc_rkd_rkr!=null)
	{
		jxc_rkd_rkr=cf.GB2Uni(jxc_rkd_rkr);
		if (!(jxc_rkd_rkr.equals("")))	wheresql+=" and  (jxc_rkd.rkr='"+jxc_rkd_rkr+"')";
	}
	rkrssbm=request.getParameter("rkrssbm");
	if (rkrssbm!=null)
	{
		rkrssbm=cf.GB2Uni(rkrssbm);
		if (!(rkrssbm.equals("")))	wheresql+=" and  (jxc_rkd.rkrssbm='"+rkrssbm+"')";
	}
	jxc_rkd_rksj=request.getParameter("jxc_rkd_rksj");
	if (jxc_rkd_rksj!=null)
	{
		jxc_rkd_rksj=jxc_rkd_rksj.trim();
		if (!(jxc_rkd_rksj.equals("")))	wheresql+="  and (jxc_rkd.rksj>=TO_DATE('"+jxc_rkd_rksj+"','YYYY/MM/DD'))";
	}
	jxc_rkd_rksj=request.getParameter("jxc_rkd_rksj2");
	if (jxc_rkd_rksj!=null)
	{
		jxc_rkd_rksj=jxc_rkd_rksj.trim();
		if (!(jxc_rkd_rksj.equals("")))	wheresql+="  and (jxc_rkd.rksj<=TO_DATE('"+jxc_rkd_rksj+"','YYYY/MM/DD'))";
	}
	jxc_rkd_gysmc=request.getParameter("jxc_rkd_gysmc");
	if (jxc_rkd_gysmc!=null)
	{
		jxc_rkd_gysmc=cf.GB2Uni(jxc_rkd_gysmc);
		if (!(jxc_rkd_gysmc.equals("")))	wheresql+=" and  (jxc_rkd.gysmc='"+jxc_rkd_gysmc+"')";
	}
	jxc_rkd_gysmc2=request.getParameter("jxc_rkd_gysmc2");
	if (jxc_rkd_gysmc2!=null)
	{
		jxc_rkd_gysmc2=cf.GB2Uni(jxc_rkd_gysmc2);
		if (!(jxc_rkd_gysmc2.equals("")))	wheresql+=" and  (jxc_rkd.gysmc like '%"+jxc_rkd_gysmc2+"%')";
	}


	String jxc_rkmx_rkph=null;
	String jxc_rkmx_rkxh=null;
	String jxc_rkmx_clbm=null;
	String jxc_clbm_clmc=null;
	String jxc_clbm_ppmc=null;
	String jxc_clbm_xh=null;
	String jxc_clbm_gg=null;
	String jxc_clbm_nbbm=null;
	String jxc_rkmx_scrq=null;
	String jxc_rkmx_scph=null;
	String jxc_rkmx_hjbh=null;
	String jxc_rkmx_hwbh=null;
	jxc_rkmx_rkph=request.getParameter("jxc_rkmx_rkph");
	if (jxc_rkmx_rkph!=null)
	{
		jxc_rkmx_rkph=cf.GB2Uni(jxc_rkmx_rkph);
		if (!(jxc_rkmx_rkph.equals("")))	wheresql+=" and  (jxc_rkmx.rkph='"+jxc_rkmx_rkph+"')";
	}
	jxc_rkmx_rkxh=request.getParameter("jxc_rkmx_rkxh");
	if (jxc_rkmx_rkxh!=null)
	{
		jxc_rkmx_rkxh=jxc_rkmx_rkxh.trim();
		if (!(jxc_rkmx_rkxh.equals("")))	wheresql+=" and (jxc_rkmx.rkxh="+jxc_rkmx_rkxh+") ";
	}
	jxc_rkmx_clbm=request.getParameter("jxc_rkmx_clbm");
	if (jxc_rkmx_clbm!=null)
	{
		jxc_rkmx_clbm=cf.GB2Uni(jxc_rkmx_clbm);
		if (!(jxc_rkmx_clbm.equals("")))	wheresql+=" and  (jxc_rkmx.clbm='"+jxc_rkmx_clbm+"')";
	}
	jxc_clbm_clmc=request.getParameter("jxc_clbm_clmc");
	if (jxc_clbm_clmc!=null)
	{
		jxc_clbm_clmc=cf.GB2Uni(jxc_clbm_clmc);
		if (!(jxc_clbm_clmc.equals("")))	wheresql+=" and  (jxc_clbm.clmc like '%"+jxc_clbm_clmc+"%')";
	}
	jxc_clbm_ppmc=request.getParameter("jxc_clbm_ppmc");
	if (jxc_clbm_ppmc!=null)
	{
		jxc_clbm_ppmc=cf.GB2Uni(jxc_clbm_ppmc);
		if (!(jxc_clbm_ppmc.equals("")))	wheresql+=" and  (jxc_clbm.ppmc like '%"+jxc_clbm_ppmc+"%')";
	}
	jxc_clbm_xh=request.getParameter("jxc_clbm_xh");
	if (jxc_clbm_xh!=null)
	{
		jxc_clbm_xh=cf.GB2Uni(jxc_clbm_xh);
		if (!(jxc_clbm_xh.equals("")))	wheresql+=" and  (jxc_clbm.xh like '%"+jxc_clbm_xh+"%')";
	}
	jxc_clbm_gg=request.getParameter("jxc_clbm_gg");
	if (jxc_clbm_gg!=null)
	{
		jxc_clbm_gg=cf.GB2Uni(jxc_clbm_gg);
		if (!(jxc_clbm_gg.equals("")))	wheresql+=" and  (jxc_clbm.gg like '%"+jxc_clbm_gg+"%')";
	}
	jxc_clbm_nbbm=request.getParameter("jxc_clbm_nbbm");
	if (jxc_clbm_nbbm!=null)
	{
		jxc_clbm_nbbm=cf.GB2Uni(jxc_clbm_nbbm);
		if (!(jxc_clbm_nbbm.equals("")))	wheresql+=" and  (jxc_clbm.nbbm='"+jxc_clbm_nbbm+"')";
	}
	jxc_rkmx_scrq=request.getParameter("jxc_rkmx_scrq");
	if (jxc_rkmx_scrq!=null)
	{
		jxc_rkmx_scrq=jxc_rkmx_scrq.trim();
		if (!(jxc_rkmx_scrq.equals("")))	wheresql+="  and (jxc_rkmx.scrq>=TO_DATE('"+jxc_rkmx_scrq+"','YYYY/MM/DD'))";
	}
	jxc_rkmx_scrq=request.getParameter("jxc_rkmx_scrq2");
	if (jxc_rkmx_scrq!=null)
	{
		jxc_rkmx_scrq=jxc_rkmx_scrq.trim();
		if (!(jxc_rkmx_scrq.equals("")))	wheresql+="  and (jxc_rkmx.scrq<=TO_DATE('"+jxc_rkmx_scrq+"','YYYY/MM/DD'))";
	}
	jxc_rkmx_scph=request.getParameter("jxc_rkmx_scph");
	if (jxc_rkmx_scph!=null)
	{
		jxc_rkmx_scph=cf.GB2Uni(jxc_rkmx_scph);
		if (!(jxc_rkmx_scph.equals("")))	wheresql+=" and  (jxc_rkmx.scph='"+jxc_rkmx_scph+"')";
	}
	jxc_rkmx_hjbh=request.getParameter("jxc_rkmx_hjbh");
	if (jxc_rkmx_hjbh!=null)
	{
		jxc_rkmx_hjbh=cf.GB2Uni(jxc_rkmx_hjbh);
		if (!(jxc_rkmx_hjbh.equals("")))	wheresql+=" and  (jxc_rkmx.hjbh='"+jxc_rkmx_hjbh+"')";
	}
	jxc_rkmx_hwbh=request.getParameter("jxc_rkmx_hwbh");
	if (jxc_rkmx_hwbh!=null)
	{
		jxc_rkmx_hwbh=cf.GB2Uni(jxc_rkmx_hwbh);
		if (!(jxc_rkmx_hwbh.equals("")))	wheresql+=" and  (jxc_rkmx.hwbh='"+jxc_rkmx_hwbh+"')";
	}
	ls_sql="SELECT jxc_rkmx.rkph,DECODE(jxc_rkd.rkdzt,'0','未提交','1','等待审核','2','等待入库','3','已入库','4','已结算','6','等待总部审核'),DECODE(jxc_rkd.rklx,'C','采购入库','T','退货入库','R','调拨入库','S','申购入库','J','代金券退货入库','D','主材订单退货','P','直接入库') rklx,jxc_ckmc.ckmc,jxc_rkd.rksj,jxc_rkd.gysmc,jxc_rkmx.clbm,jxc_clbm.clmc,jxc_clbm.ppmc,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.nbbm,jxc_rkmx.rksl,jxc_rkmx.rkj,jxc_rkmx.yfrkj,jxc_rkmx.rkje,jxc_rkmx.scrq,jxc_rkmx.scph,jxc_rkmx.ccpzkl,hjmc,hwmc,jxc_rkd.rkr,jxc_rkd.lydh,TO_CHAR(jxc_rkmx.rkxh),dm_dqbm.dqmc  ";
	ls_sql+=" FROM jxc_clbm,jxc_rkmx,jxc_rkd,jxc_ckmc,jxc_hjmc,jxc_hwmc,dm_dqbm  ";
    ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm(+)";
    ls_sql+=" and jxc_rkmx.rkph=jxc_rkd.rkph(+)";
    ls_sql+=" and jxc_rkmx.hjbh=jxc_hjmc.hjbh(+)";
    ls_sql+=" and jxc_rkmx.hwbh=jxc_hwmc.hwbh(+)";
    ls_sql+=" and jxc_rkd.ckbh=jxc_ckmc.ckbh and jxc_rkd.dqbm=dm_dqbm.dqbm ";
    ls_sql+=" and jxc_rkd.rkcllx='0'";//0：主材；1：辅材
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_rkmx.rkph,jxc_clbm.clmc,jxc_rkmx.clbm";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_rkmxCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"rkph","rkxh","jxc_rkmx_clbm","jxc_clbm_clmc","jxc_clbm_ppmc","jxc_clbm_xh","jxc_clbm_gg","jxc_clbm_nbbm","jxc_rkmx_rksl","jxc_rkmx_rkj","jxc_rkmx_rkje","jxc_rkmx_zcpsl","jxc_rkmx_ccpsl","jxc_rkmx_thpsl","jxc_rkmx_wldssl","jxc_rkmx_bfpsl","jxc_rkmx_scrq","jxc_rkmx_scph","jxc_rkmx_ccpzkl","jxc_rkmx_hjbh","jxc_rkmx_hwbh"};
	pageObj.setDisColName(disColName);
*/



//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"rkph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jxczc/rkgl/ViewJxc_rkd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("rkph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
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
  <B><font size="3">入库明细－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">入库批号</td>
	<td  width="2%">入库单状态</td>
	<td  width="3%">入库类型</td>
	<td  width="4%">入库仓库</td>
	<td  width="3%">入库时间</td>
	<td  width="7%">供货单位</td>
	<td  width="3%">材料编码</td>
	<td  width="6%">材料名称</td>
	<td  width="5%">品牌</td>
	<td  width="5%">型号</td>
	<td  width="4%">规格</td>
	<td  width="4%">内部编码</td>
	<td  width="3%">入库数量</td>
	<td  width="3%">入库价</td>
	<td  width="3%">含运费入库价</td>
	<td  width="4%">入库金额</td>
	<td  width="3%">生产日期</td>
	<td  width="4%">生产批号</td>
	<td  width="2%">残次品折扣率</td>
	<td  width="4%">入库货架</td>
	<td  width="4%">入库货位</td>
	<td  width="2%">入库人</td>
	<td  width="3%">来源单号</td>
	<td  width="2%">入库序号</td>
	<td  width="2%">地区</td>
</tr>
<%
//	pageObj.printDateSum();
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