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

	String cw_zqkzjxdj_yqkje=null;
	String cw_zqkzjxdj_eqksj=null;
	String cw_zqkzjxdj_eqkje=null;
	String cw_zqkzjxdj_sjysje=null;
	String cw_zqkzjxdj_lrr=null;
	String cw_zqkzjxdj_lrsj=null;
	String cw_zqkzjxdj_lrbm=null;

	String lxfs=null;
	String khbh=null;
	String hth=null;

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}
	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs.trim()+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm.trim()+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh.trim()+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth.trim()+"')";
	}

	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs.trim()+"%')";
	}

	
	cw_zqkzjxdj_yqkje=request.getParameter("cw_zqkzjxdj_yqkje");
	if (cw_zqkzjxdj_yqkje!=null)
	{
		cw_zqkzjxdj_yqkje=cw_zqkzjxdj_yqkje.trim();
		if (!(cw_zqkzjxdj_yqkje.equals("")))	wheresql+=" and  (cw_zqkzjxdj.yqkje="+cw_zqkzjxdj_yqkje+") ";
	}
	cw_zqkzjxdj_eqksj=request.getParameter("cw_zqkzjxdj_eqksj");
	if (cw_zqkzjxdj_eqksj!=null)
	{
		cw_zqkzjxdj_eqksj=cw_zqkzjxdj_eqksj.trim();
		if (!(cw_zqkzjxdj_eqksj.equals("")))	wheresql+="  and (cw_zqkzjxdj.eqksj>=TO_DATE('"+cw_zqkzjxdj_eqksj+"','YYYY/MM/DD'))";
	}
	cw_zqkzjxdj_eqksj=request.getParameter("cw_zqkzjxdj_eqksj2");
	if (cw_zqkzjxdj_eqksj!=null)
	{
		cw_zqkzjxdj_eqksj=cw_zqkzjxdj_eqksj.trim();
		if (!(cw_zqkzjxdj_eqksj.equals("")))	wheresql+="  and (cw_zqkzjxdj.eqksj<=TO_DATE('"+cw_zqkzjxdj_eqksj+"','YYYY/MM/DD'))";
	}
	cw_zqkzjxdj_eqkje=request.getParameter("cw_zqkzjxdj_eqkje");
	if (cw_zqkzjxdj_eqkje!=null)
	{
		cw_zqkzjxdj_eqkje=cw_zqkzjxdj_eqkje.trim();
		if (!(cw_zqkzjxdj_eqkje.equals("")))	wheresql+=" and  (cw_zqkzjxdj.eqkje="+cw_zqkzjxdj_eqkje+") ";
	}
	cw_zqkzjxdj_sjysje=request.getParameter("cw_zqkzjxdj_sjysje");
	if (cw_zqkzjxdj_sjysje!=null)
	{
		cw_zqkzjxdj_sjysje=cw_zqkzjxdj_sjysje.trim();
		if (!(cw_zqkzjxdj_sjysje.equals("")))	wheresql+=" and  (cw_zqkzjxdj.sjysje="+cw_zqkzjxdj_sjysje+") ";
	}
	cw_zqkzjxdj_lrr=request.getParameter("cw_zqkzjxdj_lrr");
	if (cw_zqkzjxdj_lrr!=null)
	{
		cw_zqkzjxdj_lrr=cf.GB2Uni(cw_zqkzjxdj_lrr);
		if (!(cw_zqkzjxdj_lrr.equals("")))	wheresql+=" and  (cw_zqkzjxdj.lrr='"+cw_zqkzjxdj_lrr+"')";
	}
	cw_zqkzjxdj_lrsj=request.getParameter("cw_zqkzjxdj_lrsj");
	if (cw_zqkzjxdj_lrsj!=null)
	{
		cw_zqkzjxdj_lrsj=cw_zqkzjxdj_lrsj.trim();
		if (!(cw_zqkzjxdj_lrsj.equals("")))	wheresql+="  and (cw_zqkzjxdj.lrsj>=TO_DATE('"+cw_zqkzjxdj_lrsj+"','YYYY/MM/DD'))";
	}
	cw_zqkzjxdj_lrsj=request.getParameter("cw_zqkzjxdj_lrsj2");
	if (cw_zqkzjxdj_lrsj!=null)
	{
		cw_zqkzjxdj_lrsj=cw_zqkzjxdj_lrsj.trim();
		if (!(cw_zqkzjxdj_lrsj.equals("")))	wheresql+="  and (cw_zqkzjxdj.lrsj<=TO_DATE('"+cw_zqkzjxdj_lrsj+"','YYYY/MM/DD'))";
	}
	cw_zqkzjxdj_lrbm=request.getParameter("cw_zqkzjxdj_lrbm");
	if (cw_zqkzjxdj_lrbm!=null)
	{
		cw_zqkzjxdj_lrbm=cf.GB2Uni(cw_zqkzjxdj_lrbm);
		if (!(cw_zqkzjxdj_lrbm.equals("")))	wheresql+=" and  (cw_zqkzjxdj.lrbm='"+cw_zqkzjxdj_lrbm+"')";
	}
	ls_sql="SELECT cw_zqkzjxdj.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,cw_zqkzjxdj.yqkje,cw_zqkzjxdj.eqksj,cw_zqkzjxdj.eqkje,cw_zqkzjxdj.sjysje,cw_zqkzjxdj.lrr,cw_zqkzjxdj.lrsj,dwmc lrbm,cw_zqkzjxdj.bz  ";
	ls_sql+=" FROM crm_khxx,cw_zqkzjxdj,sq_dwxx  ";
    ls_sql+=" where cw_zqkzjxdj.khbh=crm_khxx.khbh(+) and cw_zqkzjxdj.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_zqkzjxdj.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_zqkzjxdjCxList.jsp","SelectCxCw_zqkzjxdj.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","cw_zqkzjxdj_yqkje","cw_zqkzjxdj_eqksj","cw_zqkzjxdj_eqkje","cw_zqkzjxdj_sjysje","cw_zqkzjxdj_lrr","cw_zqkzjxdj_lrsj","cw_zqkzjxdj_lrbm","cw_zqkzjxdj_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_zqkzjxdj.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
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
  <B><font size="3">中期款增减项登记-查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">客户编号</td>
	<td  width="5%">客户姓名</td>
	<td  width="15%">房屋地址</td>
	<td  width="6%">合同号</td>
	<td  width="7%">一期款实收金额</td>
	<td  width="6%">二期款应收时间</td>
	<td  width="7%">二期款应收金额</td>
	<td  width="7%">实际应收金额</td>
	<td  width="5%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="10%">录入部门</td>
	<td  width="20%">备注</td>
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