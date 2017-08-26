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
	String jxc_clsgd_sgph=null;
	String jxc_clsgd_sglb=null;
	String jxc_clsgd_ssfgs=null;
	String sq_dwxx_dwmc=null;
	String jxc_clsgd_sgr=null;
	String jxc_clsgd_sgrq=null;
	String jxc_clsgd_sgzsl=null;
	String jxc_clsgd_sgzje=null;
	String jxc_clsgd_psfs=null;
	String jxc_clsgd_jhshsj=null;
	String jxc_clsgd_shr=null;
	String jxc_clsgd_shrq=null;
	String jxc_clsgd_sfsk=null;
	String jxc_clsgd_skqrr=null;
	String jxc_clsgd_skqrsj=null;
	String jxc_clsgd_sfzcgd=null;
	String jxc_clsgd_ckph=null;
	String jxc_clsgd_rkph=null;
	String jxc_clsgd_sgdzt=null;
	String jxc_clsgd_lrr=null;
	String jxc_clsgd_lrsj=null;
	jxc_clsgd_sgph=request.getParameter("jxc_clsgd_sgph");
	if (jxc_clsgd_sgph!=null)
	{
		jxc_clsgd_sgph=cf.GB2Uni(jxc_clsgd_sgph);
		if (!(jxc_clsgd_sgph.equals("")))	wheresql+=" and  (jxc_clsgd.sgph='"+jxc_clsgd_sgph+"')";
	}
	jxc_clsgd_sglb=request.getParameter("jxc_clsgd_sglb");
	if (jxc_clsgd_sglb!=null)
	{
		jxc_clsgd_sglb=cf.GB2Uni(jxc_clsgd_sglb);
		if (!(jxc_clsgd_sglb.equals("")))	wheresql+=" and  (jxc_clsgd.sglb='"+jxc_clsgd_sglb+"')";
	}
	jxc_clsgd_ssfgs=request.getParameter("jxc_clsgd_ssfgs");
	if (jxc_clsgd_ssfgs!=null)
	{
		jxc_clsgd_ssfgs=cf.GB2Uni(jxc_clsgd_ssfgs);
		if (!(jxc_clsgd_ssfgs.equals("")))	wheresql+=" and  (jxc_clsgd.ssfgs='"+jxc_clsgd_ssfgs+"')";
	}
	sq_dwxx_dwmc=request.getParameter("sq_dwxx_dwmc");
	if (sq_dwxx_dwmc!=null)
	{
		sq_dwxx_dwmc=cf.GB2Uni(sq_dwxx_dwmc);
		if (!(sq_dwxx_dwmc.equals("")))	wheresql+=" and  (sq_dwxx.dwmc='"+sq_dwxx_dwmc+"')";
	}
	jxc_clsgd_sgr=request.getParameter("jxc_clsgd_sgr");
	if (jxc_clsgd_sgr!=null)
	{
		jxc_clsgd_sgr=cf.GB2Uni(jxc_clsgd_sgr);
		if (!(jxc_clsgd_sgr.equals("")))	wheresql+=" and  (jxc_clsgd.sgr='"+jxc_clsgd_sgr+"')";
	}
	jxc_clsgd_sgrq=request.getParameter("jxc_clsgd_sgrq");
	if (jxc_clsgd_sgrq!=null)
	{
		jxc_clsgd_sgrq=jxc_clsgd_sgrq.trim();
		if (!(jxc_clsgd_sgrq.equals("")))	wheresql+="  and (jxc_clsgd.sgrq>=TO_DATE('"+jxc_clsgd_sgrq+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_sgrq=request.getParameter("jxc_clsgd_sgrq2");
	if (jxc_clsgd_sgrq!=null)
	{
		jxc_clsgd_sgrq=jxc_clsgd_sgrq.trim();
		if (!(jxc_clsgd_sgrq.equals("")))	wheresql+="  and (jxc_clsgd.sgrq<=TO_DATE('"+jxc_clsgd_sgrq+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_sgzsl=request.getParameter("jxc_clsgd_sgzsl");
	if (jxc_clsgd_sgzsl!=null)
	{
		jxc_clsgd_sgzsl=jxc_clsgd_sgzsl.trim();
		if (!(jxc_clsgd_sgzsl.equals("")))	wheresql+=" and  (jxc_clsgd.sgzsl="+jxc_clsgd_sgzsl+") ";
	}
	jxc_clsgd_sgzje=request.getParameter("jxc_clsgd_sgzje");
	if (jxc_clsgd_sgzje!=null)
	{
		jxc_clsgd_sgzje=jxc_clsgd_sgzje.trim();
		if (!(jxc_clsgd_sgzje.equals("")))	wheresql+=" and  (jxc_clsgd.sgzje="+jxc_clsgd_sgzje+") ";
	}
	jxc_clsgd_psfs=request.getParameter("jxc_clsgd_psfs");
	if (jxc_clsgd_psfs!=null)
	{
		jxc_clsgd_psfs=cf.GB2Uni(jxc_clsgd_psfs);
		if (!(jxc_clsgd_psfs.equals("")))	wheresql+=" and  (jxc_clsgd.psfs='"+jxc_clsgd_psfs+"')";
	}
	jxc_clsgd_jhshsj=request.getParameter("jxc_clsgd_jhshsj");
	if (jxc_clsgd_jhshsj!=null)
	{
		jxc_clsgd_jhshsj=jxc_clsgd_jhshsj.trim();
		if (!(jxc_clsgd_jhshsj.equals("")))	wheresql+="  and (jxc_clsgd.jhshsj>=TO_DATE('"+jxc_clsgd_jhshsj+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_jhshsj=request.getParameter("jxc_clsgd_jhshsj2");
	if (jxc_clsgd_jhshsj!=null)
	{
		jxc_clsgd_jhshsj=jxc_clsgd_jhshsj.trim();
		if (!(jxc_clsgd_jhshsj.equals("")))	wheresql+="  and (jxc_clsgd.jhshsj<=TO_DATE('"+jxc_clsgd_jhshsj+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_shr=request.getParameter("jxc_clsgd_shr");
	if (jxc_clsgd_shr!=null)
	{
		jxc_clsgd_shr=cf.GB2Uni(jxc_clsgd_shr);
		if (!(jxc_clsgd_shr.equals("")))	wheresql+=" and  (jxc_clsgd.shr='"+jxc_clsgd_shr+"')";
	}
	jxc_clsgd_shrq=request.getParameter("jxc_clsgd_shrq");
	if (jxc_clsgd_shrq!=null)
	{
		jxc_clsgd_shrq=jxc_clsgd_shrq.trim();
		if (!(jxc_clsgd_shrq.equals("")))	wheresql+="  and (jxc_clsgd.shrq>=TO_DATE('"+jxc_clsgd_shrq+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_shrq=request.getParameter("jxc_clsgd_shrq2");
	if (jxc_clsgd_shrq!=null)
	{
		jxc_clsgd_shrq=jxc_clsgd_shrq.trim();
		if (!(jxc_clsgd_shrq.equals("")))	wheresql+="  and (jxc_clsgd.shrq<=TO_DATE('"+jxc_clsgd_shrq+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_sfsk=request.getParameter("jxc_clsgd_sfsk");
	if (jxc_clsgd_sfsk!=null)
	{
		jxc_clsgd_sfsk=cf.GB2Uni(jxc_clsgd_sfsk);
		if (!(jxc_clsgd_sfsk.equals("")))	wheresql+=" and  (jxc_clsgd.sfsk='"+jxc_clsgd_sfsk+"')";
	}
	jxc_clsgd_skqrr=request.getParameter("jxc_clsgd_skqrr");
	if (jxc_clsgd_skqrr!=null)
	{
		jxc_clsgd_skqrr=cf.GB2Uni(jxc_clsgd_skqrr);
		if (!(jxc_clsgd_skqrr.equals("")))	wheresql+=" and  (jxc_clsgd.skqrr='"+jxc_clsgd_skqrr+"')";
	}
	jxc_clsgd_skqrsj=request.getParameter("jxc_clsgd_skqrsj");
	if (jxc_clsgd_skqrsj!=null)
	{
		jxc_clsgd_skqrsj=jxc_clsgd_skqrsj.trim();
		if (!(jxc_clsgd_skqrsj.equals("")))	wheresql+="  and (jxc_clsgd.skqrsj>=TO_DATE('"+jxc_clsgd_skqrsj+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_skqrsj=request.getParameter("jxc_clsgd_skqrsj2");
	if (jxc_clsgd_skqrsj!=null)
	{
		jxc_clsgd_skqrsj=jxc_clsgd_skqrsj.trim();
		if (!(jxc_clsgd_skqrsj.equals("")))	wheresql+="  and (jxc_clsgd.skqrsj<=TO_DATE('"+jxc_clsgd_skqrsj+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_sfzcgd=request.getParameter("jxc_clsgd_sfzcgd");
	if (jxc_clsgd_sfzcgd!=null)
	{
		jxc_clsgd_sfzcgd=cf.GB2Uni(jxc_clsgd_sfzcgd);
		if (!(jxc_clsgd_sfzcgd.equals("")))	wheresql+=" and  (jxc_clsgd.sfzcgd='"+jxc_clsgd_sfzcgd+"')";
	}
	jxc_clsgd_ckph=request.getParameter("jxc_clsgd_ckph");
	if (jxc_clsgd_ckph!=null)
	{
		jxc_clsgd_ckph=cf.GB2Uni(jxc_clsgd_ckph);
		if (!(jxc_clsgd_ckph.equals("")))	wheresql+=" and  (jxc_clsgd.ckph='"+jxc_clsgd_ckph+"')";
	}
	jxc_clsgd_rkph=request.getParameter("jxc_clsgd_rkph");
	if (jxc_clsgd_rkph!=null)
	{
		jxc_clsgd_rkph=cf.GB2Uni(jxc_clsgd_rkph);
		if (!(jxc_clsgd_rkph.equals("")))	wheresql+=" and  (jxc_clsgd.rkph='"+jxc_clsgd_rkph+"')";
	}
	jxc_clsgd_sgdzt=request.getParameter("jxc_clsgd_sgdzt");
	if (jxc_clsgd_sgdzt!=null)
	{
		jxc_clsgd_sgdzt=cf.GB2Uni(jxc_clsgd_sgdzt);
		if (!(jxc_clsgd_sgdzt.equals("")))	wheresql+=" and  (jxc_clsgd.sgdzt='"+jxc_clsgd_sgdzt+"')";
	}
	jxc_clsgd_lrr=request.getParameter("jxc_clsgd_lrr");
	if (jxc_clsgd_lrr!=null)
	{
		jxc_clsgd_lrr=cf.GB2Uni(jxc_clsgd_lrr);
		if (!(jxc_clsgd_lrr.equals("")))	wheresql+=" and  (jxc_clsgd.lrr='"+jxc_clsgd_lrr+"')";
	}
	jxc_clsgd_lrsj=request.getParameter("jxc_clsgd_lrsj");
	if (jxc_clsgd_lrsj!=null)
	{
		jxc_clsgd_lrsj=jxc_clsgd_lrsj.trim();
		if (!(jxc_clsgd_lrsj.equals("")))	wheresql+="  and (jxc_clsgd.lrsj>=TO_DATE('"+jxc_clsgd_lrsj+"','YYYY/MM/DD'))";
	}
	jxc_clsgd_lrsj=request.getParameter("jxc_clsgd_lrsj2");
	if (jxc_clsgd_lrsj!=null)
	{
		jxc_clsgd_lrsj=jxc_clsgd_lrsj.trim();
		if (!(jxc_clsgd_lrsj.equals("")))	wheresql+="  and (jxc_clsgd.lrsj<=TO_DATE('"+jxc_clsgd_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT jxc_clsgd.sgph, DECODE(jxc_clsgd.sgdzt,'0','未提交','1','已提交','2','审核通过','5','部分出库','3','已出库','4','已入库','6','审核未通过'),DECODE(jxc_clsgd.sglb,'0','主材','1','辅材'),a.dwmc fgs,jxc_clsgd.sgr,jxc_clsgd.sgrq,jxc_clsgd.sgzsl,jxc_clsgd.sgzje, DECODE(jxc_clsgd.psfs,'1','配送','2','自取','9','其他'),jxc_clsgd.jhshsj,jxc_clsgd.shr,jxc_clsgd.shrq,jxc_clsgd.shyj, DECODE(jxc_clsgd.sfsk,'Y','已收款','N','未收款'),jxc_clsgd.skqrr,jxc_clsgd.skqrsj, DECODE(jxc_clsgd.sfzcgd,'Y','转为采购计划','N','未转','M','转为供应商订单'),jxc_clsgd.lrr,jxc_clsgd.lrsj,b.dwmc ssbm,jxc_clsgd.bz  ";
	ls_sql+=" FROM jxc_clsgd,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where jxc_clsgd.ssfgs=a.dwbh and jxc_clsgd.ssbm=b.dwbh";
    ls_sql+=" and jxc_clsgd.sglb='1'";//0：主材；1：辅材
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and jxc_clsgd.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jxc_clsgd.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_clsgd.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_clsgdFjList.jsp","","","InsertJxc_gysdd.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"sgph"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("生成订单");

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sgph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jxcfc/sgdgl/ViewJxc_clsgd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("sgph",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">申购单－生成订单</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(260);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">申购批号</td>
	<td  width="4%">申购单状态</td>
	<td  width="3%">申购类别</td>
	<td  width="5%">申购公司</td>
	<td  width="3%">申购人</td>
	<td  width="4%">申购日期</td>
	<td  width="4%">申购总数量</td>
	<td  width="4%">申购总金额</td>
	<td  width="3%">配送方式</td>
	<td  width="4%">计划送货时间</td>
	<td  width="3%">审核人</td>
	<td  width="4%">审核日期</td>
	<td  width="4%">审核意见</td>
	<td  width="4%">是否收款</td>
	<td  width="3%">收款确认人</td>
	<td  width="4%">收款确认时间</td>
	<td  width="4%">是否转为订单</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="6%">录入部门</td>
	<td  width="19%">备注</td>
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