<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String dm_sgdjscsb_fgsbh=null;
	String dm_sgdjscsb_bfcs=null;
	String bfjs=null;
	String dm_sgdjscsb_bfbl=null;
	String dm_sgdjscsb_sdlbfbl=null;
	String dm_sgdjscsb_kzbjjs=null;
	String dm_sgdjscsb_sfwgjs=null;
	String dm_sgdjscsb_sdljsfs=null;
	String dm_sgdjscsb_sfkclk=null;
	String dm_sgdjscsb_sfkgdyp=null;
	String dm_sgdjscsb_sfkyfgf=null;
	String dm_sgdjscsb_sfkzbj=null;
	dm_sgdjscsb_fgsbh=request.getParameter("dm_sgdjscsb_fgsbh");
	if (dm_sgdjscsb_fgsbh!=null)
	{
		dm_sgdjscsb_fgsbh=cf.GB2Uni(dm_sgdjscsb_fgsbh);
		if (!(dm_sgdjscsb_fgsbh.equals("")))	wheresql+=" and  (dm_sgdjscsb.fgsbh='"+dm_sgdjscsb_fgsbh+"')";
	}
	dm_sgdjscsb_bfcs=request.getParameter("dm_sgdjscsb_bfcs");
	if (dm_sgdjscsb_bfcs!=null)
	{
		dm_sgdjscsb_bfcs=dm_sgdjscsb_bfcs.trim();
		if (!(dm_sgdjscsb_bfcs.equals("")))	wheresql+=" and (dm_sgdjscsb.bfcs="+dm_sgdjscsb_bfcs+") ";
	}
	bfjs=request.getParameter("bfjs");
	if (bfjs!=null)
	{
		bfjs=cf.GB2Uni(bfjs);
		if (!(bfjs.equals("")))	wheresql+=" and  (dm_sgdjscsb.bfjs='"+bfjs+"')";
	}
	dm_sgdjscsb_bfbl=request.getParameter("dm_sgdjscsb_bfbl");
	if (dm_sgdjscsb_bfbl!=null)
	{
		dm_sgdjscsb_bfbl=dm_sgdjscsb_bfbl.trim();
		if (!(dm_sgdjscsb_bfbl.equals("")))	wheresql+=" and  (dm_sgdjscsb.bfbl="+dm_sgdjscsb_bfbl+") ";
	}
	dm_sgdjscsb_sdlbfbl=request.getParameter("dm_sgdjscsb_sdlbfbl");
	if (dm_sgdjscsb_sdlbfbl!=null)
	{
		dm_sgdjscsb_sdlbfbl=dm_sgdjscsb_sdlbfbl.trim();
		if (!(dm_sgdjscsb_sdlbfbl.equals("")))	wheresql+=" and  (dm_sgdjscsb.sdlbfbl="+dm_sgdjscsb_sdlbfbl+") ";
	}
	dm_sgdjscsb_kzbjjs=request.getParameter("dm_sgdjscsb_kzbjjs");
	if (dm_sgdjscsb_kzbjjs!=null)
	{
		dm_sgdjscsb_kzbjjs=cf.GB2Uni(dm_sgdjscsb_kzbjjs);
		if (!(dm_sgdjscsb_kzbjjs.equals("")))	wheresql+=" and  (dm_sgdjscsb.kzbjjs='"+dm_sgdjscsb_kzbjjs+"')";
	}
	dm_sgdjscsb_sfwgjs=request.getParameter("dm_sgdjscsb_sfwgjs");
	if (dm_sgdjscsb_sfwgjs!=null)
	{
		dm_sgdjscsb_sfwgjs=cf.GB2Uni(dm_sgdjscsb_sfwgjs);
		if (!(dm_sgdjscsb_sfwgjs.equals("")))	wheresql+=" and  (dm_sgdjscsb.sfwgjs='"+dm_sgdjscsb_sfwgjs+"')";
	}
	dm_sgdjscsb_sdljsfs=request.getParameter("dm_sgdjscsb_sdljsfs");
	if (dm_sgdjscsb_sdljsfs!=null)
	{
		dm_sgdjscsb_sdljsfs=cf.GB2Uni(dm_sgdjscsb_sdljsfs);
		if (!(dm_sgdjscsb_sdljsfs.equals("")))	wheresql+=" and  (dm_sgdjscsb.sdljsfs='"+dm_sgdjscsb_sdljsfs+"')";
	}
	dm_sgdjscsb_sfkclk=request.getParameter("dm_sgdjscsb_sfkclk");
	if (dm_sgdjscsb_sfkclk!=null)
	{
		dm_sgdjscsb_sfkclk=cf.GB2Uni(dm_sgdjscsb_sfkclk);
		if (!(dm_sgdjscsb_sfkclk.equals("")))	wheresql+=" and  (dm_sgdjscsb.sfkclk='"+dm_sgdjscsb_sfkclk+"')";
	}
	dm_sgdjscsb_sfkgdyp=request.getParameter("dm_sgdjscsb_sfkgdyp");
	if (dm_sgdjscsb_sfkgdyp!=null)
	{
		dm_sgdjscsb_sfkgdyp=cf.GB2Uni(dm_sgdjscsb_sfkgdyp);
		if (!(dm_sgdjscsb_sfkgdyp.equals("")))	wheresql+=" and  (dm_sgdjscsb.sfkgdyp='"+dm_sgdjscsb_sfkgdyp+"')";
	}
	dm_sgdjscsb_sfkyfgf=request.getParameter("dm_sgdjscsb_sfkyfgf");
	if (dm_sgdjscsb_sfkyfgf!=null)
	{
		dm_sgdjscsb_sfkyfgf=cf.GB2Uni(dm_sgdjscsb_sfkyfgf);
		if (!(dm_sgdjscsb_sfkyfgf.equals("")))	wheresql+=" and  (dm_sgdjscsb.sfkyfgf='"+dm_sgdjscsb_sfkyfgf+"')";
	}
	dm_sgdjscsb_sfkzbj=request.getParameter("dm_sgdjscsb_sfkzbj");
	if (dm_sgdjscsb_sfkzbj!=null)
	{
		dm_sgdjscsb_sfkzbj=cf.GB2Uni(dm_sgdjscsb_sfkzbj);
		if (!(dm_sgdjscsb_sfkzbj.equals("")))	wheresql+=" and  (dm_sgdjscsb.sfkzbj='"+dm_sgdjscsb_sfkzbj+"')";
	}
	ls_sql="SELECT dm_sgdjscsb.fgsbh,sq_dwxx.dwmc,dm_sgdjscsb.bfcs, DECODE(dm_sgdjscsb.bfcs,'1','第一次','2','第二次','3','第三次','4','第四次','5','第五次','6','第六次','7','第七次','8','第八次','9','完工结算') bfcsmc,jsjsmc bfjs,dm_sgdjscsb.bfbl||'%' bfbl, DECODE(dm_sgdjscsb.sdljsfs,'1','不独立结算','2','独立比例不可改','3','独立比例可改','4','手工录入结算金额') sdljsfs,DECODE(dm_sgdjscsb.sdlqz ,'1','折前','2','折后','3','施工成本价') sdlqz,dm_sgdjscsb.sdlbfbl||'%' sdlbfbl,DECODE(dm_sgdjscsb.zjxjffs,'1','不奖罚','2','累计折后增减项金额','3','累计增减项施工成本','4','折后增项金额减项金额','5','增项施工成本减项施工成本','6','增项施工成本折后减项金额','7','折后增项金额减项施工成本') zjxjffs,dm_sgdjscsb.ljzjxxs,dm_sgdjscsb.zxxs,dm_sgdjscsb.jxxs,DECODE(dm_sgdjscsb.zjxbhfw,'1','工程','2','其它费','3','工程＋其它费','4','工程(含水电)','5','工程＋其它费(含水电)') zjxbhfw,DECODE(dm_sgdjscsb.zjxsjd,'1','全部','2','开工前','3','开工后') zjxsjd,DECODE(dm_sgdjscsb.sfkyqpc,'Y','自动获取','S','人工录入','N','否') sfkyqpc,DECODE(dm_sgdjscsb.zcsfjs,'1','不结算','2','按比例结算','3','人工录入') zcsfjs,DECODE(dm_sgdjscsb.zcjehqfs,'1','自动获取','2','人工录入') zcjehqfs,DECODE(dm_sgdjscsb.zcjsblkg,'1','可修改','2','不可修改') zcjsblkg,dm_sgdjscsb.zcjsbl, DECODE(dm_sgdjscsb.sfkzbj,'Y','扣质保金比例不可改','M','扣质保金比例可改','N','不扣质保金') sfkzbj, DECODE(dm_sgdjscsb.kzbjjs,'1','结算基数','2','结算总额') kzbjjs,dm_sgdjscsb.kzbjbl||'%' kzbjbl, DECODE(dm_sgdjscsb.sfwgjs,'Y','是','N','否') sfwgjs, DECODE(dm_sgdjscsb.sfkclk,'Y','是','N','否') sfkclk, DECODE(dm_sgdjscsb.sfkgdyp,'Y','是','N','否') sfkgdyp, DECODE(dm_sgdjscsb.sfkyfgf,'Y','是','N','否') sfkyfgf, DECODE(dm_sgdjscsb.sgdjbxg,'Y','是','N','否') sgdjbxg         ,DECODE(dm_sgdjscsb.sfkclfk,'Y','自动获取','S','人工录入','N','否') sfkclfk,DECODE(dm_sgdjscsb.sfkclyf,'Y','自动获取','S','人工录入','N','否') sfkclyf,DECODE(dm_sgdjscsb.sfkzckk,'Y','自动获取','S','人工录入','N','否') sfkzckk,DECODE(dm_sgdjscsb.sfjzcjl,'Y','自动获取','S','人工录入','N','否') sfjzcjl,DECODE(dm_sgdjscsb.sfkfkje,'Y','自动获取','S','人工录入','N','否') sfkfkje,DECODE(dm_sgdjscsb.sfjjlje,'Y','自动获取','S','人工录入','N','否') sfjjlje,DECODE(dm_sgdjscsb.sfjqtje,'Y','自动获取','S','人工录入','N','否') sfjqtje,dm_sgdjscsb.lkhjbfb||'%' lkhjbfb,dm_sgdjscsb.fkbl,DECODE(dm_sgdjscsb.sksh,'Y','需审核','N','不需审核') sksh,dm_sgdjscsb.gcjdmc";
	ls_sql+=" FROM dm_sgdjscsb,sq_dwxx,dm_jsjsbm  ";
    ls_sql+=" where dm_sgdjscsb.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=" and dm_sgdjscsb.bfjs=dm_jsjsbm.jsjsbm(+)";
 	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and dm_sgdjscsb.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and dm_sgdjscsb.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by dm_sgdjscsb.fgsbh,dm_sgdjscsb.bfcs";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_sgdjscsbCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"dwmc","bfcsmc","bfjs","bfbl","sgdjbxg","sdljsfs","sdlqz","sdlbfbl","zjxjffs","ljzjxxs","zxxs","jxxs","zjxbhfw","zjxsjd","sfkyqpc","zcsfjs","zcjehqfs","zcjsblkg","zcjsbl","sfkzbj","kzbjjs","kzbjbl","sfkclk","sfkgdyp","sfkyfgf","sfkclfk","sfkclyf","sfkzckk","sfjzcjl","sfkfkje","sfjjlje","sfjqtje","sfwgjs","lkhjbfb","fkbl","sksh","gcjdmc"};
	pageObj.setDisColName(disColName);

//设置主键
	String[] keyName={"fgsbh","bfcs"};
	pageObj.setKey(keyName);
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
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">分公司</td>
	<td  width="2%">拨付次数</td>
	<td  width="6%">拨付基数</td>
	<td  width="2%">拨付比例</td>
	<td  width="2%">与施工队级别相关</td>
	<td  width="3%">水电路结算方式</td>
	<td  width="2%">水电路取值</td>
	<td  width="2%">水电路拨付比例</td>

	<td  width="4%">增减项奖罚方式</td>
	<td  width="2%">累计增减项系数</td>
	<td  width="2%">增项系数</td>
	<td  width="2%">减项系数</td>
	<td  width="4%">增减项包含范围</td>
	<td  width="2%">增减项时间点</td>

	<td  width="3%">是否扣延期费赔偿款</td>
	<td  width="2%">主材是否结算</td>
	<td  width="3%">主材金额获取方式</td>
	<td  width="2%">结算比例可改</td>
	<td  width="2%">主材结算比例</td>

	<td  width="5%">是否扣质保金</td>
	<td  width="3%">扣质保金基数</td>
	<td  width="2%">扣质保金比例</td>

	<td  width="2%">是否扣材料款</td>
	<td  width="2%">是否扣工地用品</td>
	<td  width="2%">是否扣已付工费</td>

	<td  width="3%">是否扣辅材罚款</td>
	<td  width="3%">是否扣材料运费</td>
	<td  width="3%">是否扣主材扣款</td>
	<td  width="3%">是否加主材奖励</td>
	<td  width="3%">是否扣罚款金额</td>
	<td  width="3%">是否加奖励金额</td>
	<td  width="3%">是否加其它金额</td>

	<td  width="2%">是否完工结算</td>
	<td  width="2%">最大领款合计百分比</td>
	<td  width="2%">要求付款比例</td>
	<td  width="2%">付款是否需财务审核</td>
	<td  width="4%">要求工程进度</td>
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