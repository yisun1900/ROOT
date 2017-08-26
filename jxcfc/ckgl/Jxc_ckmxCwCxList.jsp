<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";


	String jxc_ckd_ckph=null;
	String jxc_ckd_dqbm=null;
	String jxc_ckd_fgsbh=null;
	String jxc_ckd_ckbh=null;
	String jxc_ckd_ckcllx=null;
	String jxc_ckd_cklx=null;
	String jxc_ckd_ckdzt=null;
	jxc_ckd_ckph=request.getParameter("jxc_ckd_ckph");
	if (jxc_ckd_ckph!=null)
	{
		jxc_ckd_ckph=cf.GB2Uni(jxc_ckd_ckph);
		if (!(jxc_ckd_ckph.equals("")))	wheresql+=" and  (jxc_ckd.ckph='"+jxc_ckd_ckph+"')";
	}
	jxc_ckd_dqbm=request.getParameter("jxc_ckd_dqbm");
	if (jxc_ckd_dqbm!=null)
	{
		jxc_ckd_dqbm=cf.GB2Uni(jxc_ckd_dqbm);
		if (!(jxc_ckd_dqbm.equals("")))	wheresql+=" and  (jxc_ckd.dqbm='"+jxc_ckd_dqbm+"')";
	}
	jxc_ckd_fgsbh=request.getParameter("jxc_ckd_fgsbh");
	if (jxc_ckd_fgsbh!=null)
	{
		jxc_ckd_fgsbh=cf.GB2Uni(jxc_ckd_fgsbh);
		if (!(jxc_ckd_fgsbh.equals("")))	wheresql+=" and  (jxc_ckd.fgsbh='"+jxc_ckd_fgsbh+"')";
	}
	jxc_ckd_ckbh=request.getParameter("jxc_ckd_ckbh");
	if (jxc_ckd_ckbh!=null)
	{
		jxc_ckd_ckbh=cf.GB2Uni(jxc_ckd_ckbh);
		if (!(jxc_ckd_ckbh.equals("")))	wheresql+=" and  (jxc_ckd.ckbh='"+jxc_ckd_ckbh+"')";
	}
	jxc_ckd_ckcllx=request.getParameter("jxc_ckd_ckcllx");
	if (jxc_ckd_ckcllx!=null)
	{
		jxc_ckd_ckcllx=cf.GB2Uni(jxc_ckd_ckcllx);
		if (!(jxc_ckd_ckcllx.equals("")))	wheresql+=" and  (jxc_ckd.ckcllx='"+jxc_ckd_ckcllx+"')";
	}
	jxc_ckd_cklx=request.getParameter("jxc_ckd_cklx");
	if (jxc_ckd_cklx!=null)
	{
		jxc_ckd_cklx=cf.GB2Uni(jxc_ckd_cklx);
		if (!(jxc_ckd_cklx.equals("")))	wheresql+=" and  (jxc_ckd.cklx='"+jxc_ckd_cklx+"')";
	}

	jxc_ckd_ckdzt=request.getParameter("jxc_ckd_ckdzt");
	if (jxc_ckd_ckdzt!=null)
	{
		jxc_ckd_ckdzt=cf.GB2Uni(jxc_ckd_ckdzt);
		if (!(jxc_ckd_ckdzt.equals("")))	wheresql+=" and  (jxc_ckd.ckdzt='"+jxc_ckd_ckdzt+"')";
	}


	String jxc_ckd_lrsj=null;
	String jxc_ckd_cksj=null;
	String lydh=null;
	String jxc_ckd_lrr=null;
	String jxc_ckd_jhshsj=null;



	jxc_ckd_lrsj=request.getParameter("jxc_ckd_lrsj");
	if (jxc_ckd_lrsj!=null)
	{
		jxc_ckd_lrsj=jxc_ckd_lrsj.trim();
		if (!(jxc_ckd_lrsj.equals("")))	wheresql+="  and (jxc_ckd.lrsj>=TO_DATE('"+jxc_ckd_lrsj+"','YYYY/MM/DD'))";
	}
	jxc_ckd_lrsj=request.getParameter("jxc_ckd_lrsj2");
	if (jxc_ckd_lrsj!=null)
	{
		jxc_ckd_lrsj=jxc_ckd_lrsj.trim();
		if (!(jxc_ckd_lrsj.equals("")))	wheresql+="  and (jxc_ckd.lrsj<=TO_DATE('"+jxc_ckd_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	jxc_ckd_cksj=request.getParameter("jxc_ckd_cksj");
	if (jxc_ckd_cksj!=null)
	{
		jxc_ckd_cksj=jxc_ckd_cksj.trim();
		if (!(jxc_ckd_cksj.equals("")))	wheresql+="  and (jxc_ckd.cksj>=TO_DATE('"+jxc_ckd_cksj+"','YYYY/MM/DD'))";
	}
	jxc_ckd_cksj=request.getParameter("jxc_ckd_cksj2");
	if (jxc_ckd_cksj!=null)
	{
		jxc_ckd_cksj=jxc_ckd_cksj.trim();
		if (!(jxc_ckd_cksj.equals("")))	wheresql+="  and (jxc_ckd.cksj<=TO_DATE('"+jxc_ckd_cksj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	lydh=request.getParameter("lydh");
	if (lydh!=null)
	{
		lydh=lydh.trim();
		if (!(lydh.equals("")))	wheresql+=" and  (jxc_ckd.lydh='"+lydh+"')";
	}
	jxc_ckd_lrr=request.getParameter("jxc_ckd_lrr");
	if (jxc_ckd_lrr!=null)
	{
		jxc_ckd_lrr=cf.GB2Uni(jxc_ckd_lrr);
		if (!(jxc_ckd_lrr.equals("")))	wheresql+=" and  (jxc_ckd.lrr='"+jxc_ckd_lrr+"')";
	}
	jxc_ckd_jhshsj=request.getParameter("jxc_ckd_jhshsj");
	if (jxc_ckd_jhshsj!=null)
	{
		jxc_ckd_jhshsj=jxc_ckd_jhshsj.trim();
		if (!(jxc_ckd_jhshsj.equals("")))	wheresql+="  and (jxc_ckd.jhshsj>=TO_DATE('"+jxc_ckd_jhshsj+"','YYYY/MM/DD'))";
	}
	jxc_ckd_jhshsj=request.getParameter("jxc_ckd_jhshsj2");
	if (jxc_ckd_jhshsj!=null)
	{
		jxc_ckd_jhshsj=jxc_ckd_jhshsj.trim();
		if (!(jxc_ckd_jhshsj.equals("")))	wheresql+="  and (jxc_ckd.jhshsj<=TO_DATE('"+jxc_ckd_jhshsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}


	String cldlbm=null;
	String clxlbm=null;
	String jxc_ckmx_clbm=null;
	String jxc_ckmx_clmc=null;
	String jxc_ckmx_clmc2=null;
	String jxc_ckmx_xh=null;
	String jxc_ckmx_gg=null;
	String jxc_ckmx_nbbm=null;
	String jxc_ckmx_ppmc=null;
	String jxc_ckmx_gysmc=null;
	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (jxc_ckmx.cldlbm='"+cldlbm+"')";
	}
	clxlbm=request.getParameter("clxlbm");
	if (clxlbm!=null)
	{
		clxlbm=cf.GB2Uni(clxlbm);
		if (!(clxlbm.equals("")))	wheresql+=" and  (jxc_ckmx.clxlbm='"+clxlbm+"')";
	}
	jxc_ckmx_clbm=request.getParameter("jxc_ckmx_clbm");
	if (jxc_ckmx_clbm!=null)
	{
		jxc_ckmx_clbm=cf.GB2Uni(jxc_ckmx_clbm);
		if (!(jxc_ckmx_clbm.equals("")))	wheresql+=" and  (jxc_ckmx.clbm='"+jxc_ckmx_clbm+"')";
	}
	jxc_ckmx_clmc=request.getParameter("jxc_ckmx_clmc");
	if (jxc_ckmx_clmc!=null)
	{
		jxc_ckmx_clmc=cf.GB2Uni(jxc_ckmx_clmc);
		if (!(jxc_ckmx_clmc.equals("")))	wheresql+=" and  (jxc_ckmx.clmc='"+jxc_ckmx_clmc+"')";
	}
	jxc_ckmx_clmc2=request.getParameter("jxc_ckmx_clmc2");
	if (jxc_ckmx_clmc2!=null)
	{
		jxc_ckmx_clmc2=cf.GB2Uni(jxc_ckmx_clmc2);
		if (!(jxc_ckmx_clmc2.equals("")))	wheresql+=" and  (jxc_ckmx.clmc like '%"+jxc_ckmx_clmc2+"%')";
	}
	jxc_ckmx_xh=request.getParameter("jxc_ckmx_xh");
	if (jxc_ckmx_xh!=null)
	{
		jxc_ckmx_xh=cf.GB2Uni(jxc_ckmx_xh);
		if (!(jxc_ckmx_xh.equals("")))	wheresql+=" and  (jxc_ckmx.xh like '%"+jxc_ckmx_xh+"%')";
	}
	jxc_ckmx_gg=request.getParameter("jxc_ckmx_gg");
	if (jxc_ckmx_gg!=null)
	{
		jxc_ckmx_gg=cf.GB2Uni(jxc_ckmx_gg);
		if (!(jxc_ckmx_gg.equals("")))	wheresql+=" and  (jxc_ckmx.gg like '%"+jxc_ckmx_gg+"%')";
	}
	jxc_ckmx_nbbm=request.getParameter("jxc_ckmx_nbbm");
	if (jxc_ckmx_nbbm!=null)
	{
		jxc_ckmx_nbbm=cf.GB2Uni(jxc_ckmx_nbbm);
		if (!(jxc_ckmx_nbbm.equals("")))	wheresql+=" and  (jxc_ckmx.nbbm='"+jxc_ckmx_nbbm+"')";
	}
	jxc_ckmx_ppmc=request.getParameter("jxc_ckmx_ppmc");
	if (jxc_ckmx_ppmc!=null)
	{
		jxc_ckmx_ppmc=cf.GB2Uni(jxc_ckmx_ppmc);
		if (!(jxc_ckmx_ppmc.equals("")))	wheresql+=" and  (jxc_ckmx.ppmc='"+jxc_ckmx_ppmc+"')";
	}
	jxc_ckmx_gysmc=request.getParameter("jxc_ckmx_gysmc");
	if (jxc_ckmx_gysmc!=null)
	{
		jxc_ckmx_gysmc=cf.GB2Uni(jxc_ckmx_gysmc);
		if (!(jxc_ckmx_gysmc.equals("")))	wheresql+=" and  (jxc_ckmx.gysmc='"+jxc_ckmx_gysmc+"')";
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

	ls_sql="SELECT jxc_ckmx.nbbm,jxc_ckmx.clmc,jxc_ckmx.xh,jxc_ckmx.gg,jxc_ckmx.jldwbm,jxc_ckmx.cksl,TO_CHAR(jxc_ckmx.cbdj),jxc_ckmx.cbje,TO_CHAR(jxc_ckmx.ckdj),jxc_ckmx.ckje,TO_CHAR(jxc_ckmx.ckxh),jxc_ckd.khbh,jxc_ckmx.ckph,jxc_ckmx.clbm,jxc_ckmx.cldlbm,jxc_ckmx.clxlbm,jxc_ckmx.ppmc,jxc_ckmx.gysmc,ckmc,hjmc,DECODE(jxc_ckd.ckdzt,'0','未提交','1','等待报废审核','2','等待退货审核','3','等待调拨入库','4','已结算','5','退货审核通过','6','报废审核未通过','7','退货审核未通过','8','审核通过','9','提交'),jxc_ckd.lrsj,jxc_ckd.cksj,jxc_ckd.jhshsj,jxc_ckd.lydh ";
	ls_sql+=" FROM jxc_ckd,jxc_ckmx,jxc_ckmc,jxc_hjmc  ";
    ls_sql+=" where jxc_ckmx.ckph=jxc_ckd.ckph(+)  ";
    ls_sql+=" and jxc_ckmx.ckbh=jxc_ckmc.ckbh(+)";
    ls_sql+=" and jxc_ckmx.hjbh=jxc_hjmc.hjbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and jxc_ckd.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jxc_ckd.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_ckmxCwCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ckph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJxc_ckd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ckph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("nbbm","1");//列参数对象加入Hash表
	spanColHash.put("clmc","1");//列参数对象加入Hash表
	spanColHash.put("xh","1");//列参数对象加入Hash表
	spanColHash.put("gg","1");//列参数对象加入Hash表
	spanColHash.put("clbm","1");//列参数对象加入Hash表
	spanColHash.put("cldlbm","1");//列参数对象加入Hash表
	spanColHash.put("clxlbm","1");//列参数对象加入Hash表
	spanColHash.put("jldwbm","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
  <B><font size="3">出库单明细－财务查询 </font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(260);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">内部编码</td>
	<td  width="6%">材料名称</td>
	<td  width="5%">型号</td>
	<td  width="6%">规格</td>
	<td  width="2%">计量单位</td>
	<td  width="3%">出库数量</td>
	<td  width="3%">成本单价</td>
	<td  width="5%">成本金额</td>
	<td  width="3%">单价</td>
	<td  width="5%">出库金额</td>
	<td  width="2%">序号</td>
	<td  width="3%">客户编号</td>
	<td  width="4%">出库批号</td>
	<td  width="5%">材料编码</td>
	<td  width="4%">材料大类</td>
	<td  width="4%">材料小类</td>
	<td  width="5%">品牌</td>
	<td  width="8%">供应商</td>
	<td  width="4%">出库仓库</td>
	<td  width="4%">出库货架</td>
	<td  width="3%">出库单状态</td>
	<td  width="4%">录入日期</td>
	<td  width="4%">出库时间</td>
	<td  width="4%">计划送货时间</td>
	<td  width="63%">来源单号</td>
</tr>
<%
	pageObj.printDateSum();
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