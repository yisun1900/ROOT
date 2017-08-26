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
	String hd_zyxxtx_txxh=null;
	String hd_zyxxtx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_sjs=null;
	String crm_khxx_hth=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_dwbh=null;
	String hd_zyxxtx_txbt=null;
	String hd_zyxxtx_txfl=null;
	String hd_zyxxtx_khsfyck=null;
	String hd_zyxxtx_khckr=null;
	String hd_zyxxtx_khcksj=null;
	String hd_zyxxtxly_lysfyck=null;
	String hd_zyxxtxly_lyckr=null;
	String hd_zyxxtxly_lycksj=null;
	String hd_zyxxtx_lrr=null;
	String hd_zyxxtx_lrsj=null;
	String hd_zyxxtx_lrbm=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String txdj=null;
	txdj=request.getParameter("txdj");
	if (txdj!=null)
	{
		if (!(txdj.equals("")))	wheresql+=" and (hd_zyxxtx.txdj="+txdj+") ";
	}

	String sfyxkhly=null;
	sfyxkhly=request.getParameter("sfyxkhly");
	if (sfyxkhly!=null)
	{
		if (!(sfyxkhly.equals("")))	wheresql+=" and (hd_zyxxtx.sfyxkhly='"+sfyxkhly+"') ";
	}

	hd_zyxxtx_txxh=request.getParameter("hd_zyxxtx_txxh");
	if (hd_zyxxtx_txxh!=null)
	{
		hd_zyxxtx_txxh=hd_zyxxtx_txxh.trim();
		if (!(hd_zyxxtx_txxh.equals("")))	wheresql+=" and (hd_zyxxtx.txxh='"+hd_zyxxtx_txxh+"') ";
	}
	hd_zyxxtx_khbh=request.getParameter("hd_zyxxtx_khbh");
	if (hd_zyxxtx_khbh!=null)
	{
		hd_zyxxtx_khbh=cf.GB2Uni(hd_zyxxtx_khbh);
		if (!(hd_zyxxtx_khbh.equals("")))	wheresql+=" and  (hd_zyxxtx.khbh='"+hd_zyxxtx_khbh+"')";
	}
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
	hd_zyxxtx_txbt=request.getParameter("hd_zyxxtx_txbt");
	if (hd_zyxxtx_txbt!=null)
	{
		hd_zyxxtx_txbt=cf.GB2Uni(hd_zyxxtx_txbt);
		if (!(hd_zyxxtx_txbt.equals("")))	wheresql+=" and  (hd_zyxxtx.txbt like '%"+hd_zyxxtx_txbt+"5')";
	}
	hd_zyxxtx_txfl=request.getParameter("hd_zyxxtx_txfl");
	if (hd_zyxxtx_txfl!=null)
	{
		hd_zyxxtx_txfl=cf.GB2Uni(hd_zyxxtx_txfl);
		if (!(hd_zyxxtx_txfl.equals("")))	wheresql+=" and  (hd_zyxxtx.txfl='"+hd_zyxxtx_txfl+"')";
	}
	hd_zyxxtx_khsfyck=request.getParameter("hd_zyxxtx_khsfyck");
	if (hd_zyxxtx_khsfyck!=null)
	{
		hd_zyxxtx_khsfyck=cf.GB2Uni(hd_zyxxtx_khsfyck);
		if (!(hd_zyxxtx_khsfyck.equals("")))	wheresql+=" and  (hd_zyxxtx.khsfyck='"+hd_zyxxtx_khsfyck+"')";
	}
	hd_zyxxtx_khckr=request.getParameter("hd_zyxxtx_khckr");
	if (hd_zyxxtx_khckr!=null)
	{
		hd_zyxxtx_khckr=cf.GB2Uni(hd_zyxxtx_khckr);
		if (!(hd_zyxxtx_khckr.equals("")))	wheresql+=" and  (hd_zyxxtx.khckr='"+hd_zyxxtx_khckr+"')";
	}
	hd_zyxxtx_khcksj=request.getParameter("hd_zyxxtx_khcksj");
	if (hd_zyxxtx_khcksj!=null)
	{
		hd_zyxxtx_khcksj=hd_zyxxtx_khcksj.trim();
		if (!(hd_zyxxtx_khcksj.equals("")))	wheresql+="  and (hd_zyxxtx.khcksj>=TO_DATE('"+hd_zyxxtx_khcksj+"','YYYY/MM/DD'))";
	}
	hd_zyxxtx_khcksj=request.getParameter("hd_zyxxtx_khcksj2");
	if (hd_zyxxtx_khcksj!=null)
	{
		hd_zyxxtx_khcksj=hd_zyxxtx_khcksj.trim();
		if (!(hd_zyxxtx_khcksj.equals("")))	wheresql+="  and (hd_zyxxtx.khcksj<=TO_DATE('"+hd_zyxxtx_khcksj+"','YYYY/MM/DD'))";
	}
	hd_zyxxtxly_lysfyck=request.getParameter("hd_zyxxtxly_lysfyck");
	if (hd_zyxxtxly_lysfyck!=null)
	{
		hd_zyxxtxly_lysfyck=cf.GB2Uni(hd_zyxxtxly_lysfyck);
		if (!(hd_zyxxtxly_lysfyck.equals("")))	wheresql+=" and  (hd_zyxxtxly.lysfyck='"+hd_zyxxtxly_lysfyck+"')";
	}
	hd_zyxxtxly_lyckr=request.getParameter("hd_zyxxtxly_lyckr");
	if (hd_zyxxtxly_lyckr!=null)
	{
		hd_zyxxtxly_lyckr=cf.GB2Uni(hd_zyxxtxly_lyckr);
		if (!(hd_zyxxtxly_lyckr.equals("")))	wheresql+=" and  (hd_zyxxtxly.lyckr='"+hd_zyxxtxly_lyckr+"')";
	}
	hd_zyxxtxly_lycksj=request.getParameter("hd_zyxxtxly_lycksj");
	if (hd_zyxxtxly_lycksj!=null)
	{
		hd_zyxxtxly_lycksj=hd_zyxxtxly_lycksj.trim();
		if (!(hd_zyxxtxly_lycksj.equals("")))	wheresql+="  and (hd_zyxxtxly.lycksj>=TO_DATE('"+hd_zyxxtxly_lycksj+"','YYYY/MM/DD'))";
	}
	hd_zyxxtxly_lycksj=request.getParameter("hd_zyxxtxly_lycksj2");
	if (hd_zyxxtxly_lycksj!=null)
	{
		hd_zyxxtxly_lycksj=hd_zyxxtxly_lycksj.trim();
		if (!(hd_zyxxtxly_lycksj.equals("")))	wheresql+="  and (hd_zyxxtxly.lycksj<=TO_DATE('"+hd_zyxxtxly_lycksj+"','YYYY/MM/DD'))";
	}
	hd_zyxxtx_lrr=request.getParameter("hd_zyxxtx_lrr");
	if (hd_zyxxtx_lrr!=null)
	{
		hd_zyxxtx_lrr=cf.GB2Uni(hd_zyxxtx_lrr);
		if (!(hd_zyxxtx_lrr.equals("")))	wheresql+=" and  (hd_zyxxtx.lrr='"+hd_zyxxtx_lrr+"')";
	}
	hd_zyxxtx_lrsj=request.getParameter("hd_zyxxtx_lrsj");
	if (hd_zyxxtx_lrsj!=null)
	{
		hd_zyxxtx_lrsj=hd_zyxxtx_lrsj.trim();
		if (!(hd_zyxxtx_lrsj.equals("")))	wheresql+="  and (hd_zyxxtx.lrsj>=TO_DATE('"+hd_zyxxtx_lrsj+"','YYYY/MM/DD'))";
	}
	hd_zyxxtx_lrsj=request.getParameter("hd_zyxxtx_lrsj2");
	if (hd_zyxxtx_lrsj!=null)
	{
		hd_zyxxtx_lrsj=hd_zyxxtx_lrsj.trim();
		if (!(hd_zyxxtx_lrsj.equals("")))	wheresql+="  and (hd_zyxxtx.lrsj<=TO_DATE('"+hd_zyxxtx_lrsj+"','YYYY/MM/DD'))";
	}
	hd_zyxxtx_lrbm=request.getParameter("hd_zyxxtx_lrbm");
	if (hd_zyxxtx_lrbm!=null)
	{
		hd_zyxxtx_lrbm=cf.GB2Uni(hd_zyxxtx_lrbm);
		if (!(hd_zyxxtx_lrbm.equals("")))	wheresql+=" and  (hd_zyxxtx.lrbm='"+hd_zyxxtx_lrbm+"')";
	}

	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,hd_zyxxtx.txxh,DECODE(hd_zyxxtx.txdj,1,'一般',2,'重要',3,'特别重要') txdj,hd_zyxxtx.txbt,hd_zyxxtx.txnr, DECODE(hd_zyxxtx.txfl,'1','交款提醒','2','工地验收提醒','3','结算提醒','4','集成产品提醒','9','其它提醒') txfl, DECODE(hd_zyxxtx.sfyxkhly,'N','不可以','Y','可以') sfyxkhly,hd_zyxxtx.lrr,hd_zyxxtx.lrsj,a.dwmc lrbm,hd_zyxxtx.bz, DECODE(hd_zyxxtx.khsfyck,'N','未查看','Y','已查看') khsfyck,hd_zyxxtx.khcksj,hd_zyxxtxly.lysj,hd_zyxxtxly.lynr, DECODE(hd_zyxxtxly.lysfyck,'N','未查看','Y','已查看'),hd_zyxxtxly.lyckr,hd_zyxxtxly.lycksj,hd_zyxxtxly.lyhfnr  ";
	ls_sql+=" FROM crm_khxx,hd_zyxxtx,hd_zyxxtxly,sq_dwxx a";
    ls_sql+=" where hd_zyxxtx.lrbm=a.dwbh(+) and hd_zyxxtx.khbh=crm_khxx.khbh ";
    ls_sql+=" and hd_zyxxtx.txxh=hd_zyxxtxly.txxh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_khxx.fgsbh,hd_zyxxtx.txxh,hd_zyxxtxly.lyxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Hd_zyxxtxCxList.jsp","SelectCxHd_zyxxtx.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"txxh","hd_zyxxtx_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_sjs","crm_khxx_hth","crm_khxx_qyrq","crm_khxx_sgd","crm_khxx_zjxm","crm_khxx_dwbh","hd_zyxxtx_txbt","hd_zyxxtx_txnr","hd_zyxxtx_txfl","hd_zyxxtx_sfyxkhly","hd_zyxxtx_khsfyck","hd_zyxxtx_khckr","hd_zyxxtx_khcksj","hd_zyxxtx_khlynr","hd_zyxxtx_lysfyck","hd_zyxxtx_lyckr","hd_zyxxtx_lycksj","hd_zyxxtx_lrr","hd_zyxxtx_lrsj","sq_dwxx_dwmc","hd_zyxxtx_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"txxh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("txxh","1");//列参数对象加入Hash表
	spanColHash.put("txdj","1");//列参数对象加入Hash表
	spanColHash.put("txbt","1");//列参数对象加入Hash表
	spanColHash.put("txnr","1");//列参数对象加入Hash表
	spanColHash.put("txfl","1");//列参数对象加入Hash表
	spanColHash.put("sfyxkhly","1");//列参数对象加入Hash表
	spanColHash.put("lrr","1");//列参数对象加入Hash表
	spanColHash.put("lrsj","1");//列参数对象加入Hash表
	spanColHash.put("lrbm","1");//列参数对象加入Hash表
	spanColHash.put("bz","1");//列参数对象加入Hash表
	spanColHash.put("khsfyck","1");//列参数对象加入Hash表
	spanColHash.put("khcksj","1");//列参数对象加入Hash表
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%" bgcolor="#9999FF">合同号</td>
	<td  width="2%" bgcolor="#9999FF">客户姓名</td>
	<td  width="7%" bgcolor="#9999FF">房屋地址</td>
	<td  width="3%" bgcolor="#CCCCFF">提醒序号</td>
	<td  width="2%" bgcolor="#CCCCFF">提醒等级</td>
	<td  width="8%" bgcolor="#CCCCFF">提醒标题</td>
	<td  width="13%" bgcolor="#CCCCFF">提醒内容</td>
	<td  width="4%" bgcolor="#CCCCFF">提醒分类</td>
	<td  width="2%" bgcolor="#CCCCFF">客户是否可以留言</td>
	<td  width="2%" bgcolor="#CCCCFF">录入人</td>
	<td  width="3%" bgcolor="#CCCCFF">录入时间</td>
	<td  width="5%" bgcolor="#CCCCFF">录入部门</td>
	<td  width="7%" bgcolor="#CCCCFF">提醒备注</td>
	<td  width="2%" bgcolor="#CCFFFF">客户是否已查看</td>
	<td  width="3%" bgcolor="#CCFFFF">最近查看时间</td>
	<td  width="3%" bgcolor="#CCFFFF">留言时间</td>
	<td  width="12%" bgcolor="#CCFFFF">留言内容</td>
	<td  width="2%" bgcolor="#FFCCFF">留言是否已查看</td>
	<td  width="2%" bgcolor="#FFCCFF">留言查看人</td>
	<td  width="3%" bgcolor="#FFCCFF">留言查看时间</td>
	<td  width="12%" bgcolor="#FFCCFF">留言回复内容</td>
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